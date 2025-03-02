import 'package:health_pitstop/src/features/authentication/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build() {
    // Nothing to do
  }

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () => authRepository.signUp(
        email: email,
        password: password,
      ),
    );

    return state.hasError == false;
  }
}
