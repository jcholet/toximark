import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:tennaxia_geolocation/src/features/user/models/user.dart';

part 'user_repository.g.dart';

class UserRepository {
  UserRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<User> fetchUser(UserId id) async {
    try {
      final data = await _supabaseClient
          .from('users')
          .select(
            '*, role:roles(*)',
          )
          .eq('id', id)
          .maybeSingle();

      if (data == null) return User.anonymous;

      return User.fromJson(data);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return UserRepository(supabaseClient: Supabase.instance.client);
}
