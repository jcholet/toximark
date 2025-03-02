import 'package:health_pitstop/src/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

sealed class AuthenticationException extends AppException {
  /// {@macro auth_exception}
  AuthenticationException(super.code, super.message);
}

class EmailNotAuthorizedError extends AuthenticationException {
  EmailNotAuthorizedError()
      : super(
          'email_not_authorized',
          'This email is not authorized to sign up.',
        );
}

class UserNotSignedInError extends AuthenticationException {
  UserNotSignedInError()
      : super('user_not_signed_in', 'The user is not signed in.');
}

extension UserX on User {
  /// Returns whether the user's profile is complete.
  bool get isComplete => (userMetadata?['profile_complete'] as bool?) ?? false;
}

class AuthRepository {
  AuthRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Stream<AuthState> get onAuthStateChange =>
      _supabaseClient.auth.onAuthStateChange;

  User? get currentUser => _supabaseClient.auth.currentUser;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      // Vérifier si l'email est dans la whitelist
      final isWhitelisted = await _isEmailWhitelisted(email);
      if (!isWhitelisted) {
        throw EmailNotAuthorizedError();
      }

      // Procéder à l'inscription si l'email est autorisé
      await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      await _supabaseClient.from('white_list').update({
        'signed_up_at': 'now()',
      }).eq('email', email);
    } catch (error, stackTrace) {
      print('Error during sign up: $error');
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<void> refreshSession() async {
    try {
      await _supabaseClient.auth.refreshSession();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<bool> _isEmailWhitelisted(String email) async {
    try {
      final response = await _supabaseClient
          .from('white_list')
          .select()
          .eq('email', email)
          .maybeSingle();

      return response != null;
    } catch (e) {
      // En cas d'erreur, on considère que l'email n'est pas dans la whitelist
      return false;
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    supabaseClient: Supabase.instance.client,
  );
}

@Riverpod(keepAlive: true)
Stream<AuthState> authStateStream(Ref ref) {
  return ref.watch(authRepositoryProvider).onAuthStateChange;
}
