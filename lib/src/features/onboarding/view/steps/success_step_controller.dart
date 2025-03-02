import 'package:health_pitstop/src/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'success_step_controller.g.dart';

@riverpod
class SuccessStepController extends _$SuccessStepController {
  @override
  FutureOr<void> build() {
    // Nothing to do
  }

  Future<void> refreshSession() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(authRepository.refreshSession);
  }
}
