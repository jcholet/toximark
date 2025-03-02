import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    required String username,
    String? avatarUrl,
    @Default(false) bool isOnboardingComplete,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// État du processus d'onboarding
@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    String? username,
    String? avatarUrl,
    @Default(1) int currentStep,
    @Default(5) int totalSteps,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);
}
