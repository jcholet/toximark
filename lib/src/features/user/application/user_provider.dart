import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tennaxia_geolocation/src/app/routes/app_router.dart';
import 'package:tennaxia_geolocation/src/features/authentication/authentication.dart';
import 'package:tennaxia_geolocation/src/features/user/user.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<User> userFuture(Ref ref) {
  final authState = ref.watch(authStateStreamProvider).value;
  final userId = authState?.session?.user.id;
  if (userId != null) {
    final user = ref.read(userRepositoryProvider).fetchUser(userId);
    return user;
  } else {
    return User.anonymous;
  }
}
