import 'package:health_pitstop/src/features/authentication/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {
    // Nothing to do
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => authRepository.signIn(
        email: email,
        password: password,
      ),
    );
    return state.hasError == false;
  }
}
