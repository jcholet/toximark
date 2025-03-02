import 'dart:async';
import 'dart:io';

import 'package:health_pitstop/src/features/authentication/authentication.dart';
import 'package:health_pitstop/src/features/profile/data/profile_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_service.g.dart';

class ProfileService {
  ProfileService(this.ref);

  final Ref ref;

  AuthRepository get authRepository => ref.read(authRepositoryProvider);
  ProfileRepository get profileRepository =>
      ref.read(profileRepositoryProvider);

  Future<void> createUserProfile({
    required String firstName,
    required String lastName,
    required String birthDate,
    required File? avatar,
    required String username,
  }) async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw UserNotSignedInError();
    }

    return profileRepository.createUserProfile(
      id: user.id,
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
      avatar: avatar,
      username: username,
    );
  }
}

@Riverpod(keepAlive: true)
ProfileService profileService(Ref ref) {
  return ProfileService(ref);
}
