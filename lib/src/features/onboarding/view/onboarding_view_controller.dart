import 'dart:io';

import 'package:health_pitstop/src/features/authentication/authentication.dart';
import 'package:health_pitstop/src/features/profile/profile.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_view_controller.g.dart';

@riverpod
class OnboardingViewController extends _$OnboardingViewController
    with NotifierMounted {
  @override
  FutureOr<void> build() {
    ref.onDispose(setUnmounted);
  }

  Future<bool> createUser({
    required String? firstName,
    required String? lastName,
    required DateTime? birthdate,
    required File? avatar,
    required String? username,
  }) async {
    final profileService = ref.read(profileServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => profileService.createUserProfile(
        firstName: firstName!,
        lastName: lastName!,
        birthDate: DateFormat('yyyy-MM-dd').format(birthdate!),
        avatar: avatar,
        username: username!,
      ),
    );
    return state.hasError == false;
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    final newState = await AsyncValue.guard(authRepository.signOut);
    if (mounted) {
      state = newState;
    }
  }
}
