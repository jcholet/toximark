// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      username: json['username'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      isOnboardingComplete: json['isOnboardingComplete'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate.toIso8601String(),
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'isOnboardingComplete': instance.isOnboardingComplete,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$OnboardingStateImpl _$$OnboardingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$OnboardingStateImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      currentStep: (json['currentStep'] as num?)?.toInt() ?? 1,
      totalSteps: (json['totalSteps'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$OnboardingStateImplToJson(
        _$OnboardingStateImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate?.toIso8601String(),
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'currentStep': instance.currentStep,
      'totalSteps': instance.totalSteps,
    };
