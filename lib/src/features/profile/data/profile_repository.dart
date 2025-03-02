import 'dart:io';

import 'package:health_pitstop/src/features/profile/models/user_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  /// Récupère le profil complet de l'utilisateur actuel
  ///  (données des tables users et profiles)
  Future<UserProfile?> getCurrentUserProfile() async {
    try {
      final user = _supabaseClient.auth.currentUser;
      if (user == null) return null;

      // Récupérer les données de la table users
      final userData = await _supabaseClient
          .from('users')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (userData == null) return null;

      // Récupérer les données de la table profiles
      final profileData = await _supabaseClient
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      // Combiner les données
      final combinedData = {
        'id': user.id,
        'email': user.email ?? '',
        'first_name': userData['first_name'] ?? '',
        'last_name': userData['last_name'] ?? '',
        'birth_date':
            userData['birth_date'] ?? DateTime.now().toIso8601String(),
        'username': profileData?['username'] ?? '',
        'avatar_url': profileData?['avatar_url'],
        'is_onboarding_complete':
            profileData?['is_onboarding_complete'] ?? false,
        'created_at':
            profileData?['created_at'] ?? DateTime.now().toIso8601String(),
        'updated_at':
            profileData?['updated_at'] ?? DateTime.now().toIso8601String(),
      };

      return UserProfile.fromJson(combinedData);
    } catch (e) {
      print('Error getting user profile: $e');
      return null;
    }
  }

  /// Met à jour le profil de l'utilisateur dans les deux tables
  Future<void> updateUserProfile(UserProfile profile) async {
    try {
      // Mettre à jour la table users
      await _supabaseClient.from('users').upsert(
        {
          'id': profile.id,
          'first_name': profile.firstName,
          'last_name': profile.lastName,
          'birth_date': profile.birthDate.toIso8601String(),
        },
        onConflict: 'id',
      );

      // Mettre à jour la table profiles
      await _supabaseClient.from('profiles').upsert(
        {
          'id': profile.id,
          'username': profile.username,
          'avatar_url': profile.avatarUrl,
          'is_onboarding_complete': profile.isOnboardingComplete,
          'updated_at': DateTime.now().toIso8601String(),
        },
        onConflict: 'id',
      );
    } catch (e) {
      print('Error updating user profile: $e');
      rethrow;
    }
  }

  Future<void> createUserProfile({
    required String id,
    required String firstName,
    required String lastName,
    required String birthDate,
    required String username,
    required File? avatar,
  }) async {
    try {
      await _supabaseClient.from('users').insert({
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'birthdate': birthDate,
      });

      String? avatarUrl;

      if (avatar != null) {
        avatarUrl = await uploadAvatar(id, avatar, 'avatar.png');
      }

      await _supabaseClient.from('profiles').insert({
        'id': id,
        'username': username,
        'avatar_url': avatarUrl,
      });
    } catch (e) {
      print('Error creating user profile: $e');
      rethrow;
    }
  }

  /// Vérifie si un nom d'utilisateur est disponible
  Future<bool> isUsernameAvailable(String username) async {
    try {
      final result = await _supabaseClient
          .from('profiles')
          .select('username')
          .eq('username', username)
          .maybeSingle();

      return result == null;
    } catch (e) {
      print('Error checking username availability: $e');
      return false;
    }
  }

  /// Télécharge un avatar et retourne l'URL
  Future<String?> uploadAvatar(
    String userId,
    File file,
    String fileName,
  ) async {
    try {
      final filePath = '$userId/$fileName';

      await _supabaseClient.storage.from('avatars').upload(
            filePath,
            file,
          );

      final publicUrl =
          _supabaseClient.storage.from('avatars').getPublicUrl(filePath);
      return publicUrl;
    } catch (e) {
      print('Error uploading avatar: $e');
      return null;
    }
  }
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(
    supabaseClient: Supabase.instance.client,
  );
}
