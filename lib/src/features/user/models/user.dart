import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tennaxia_geolocation/src/features/role/models/role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

typedef UserId = String;

@freezed
class User with _$User {
  const factory User({
    required UserId id,
    String? firstName,
    String? lastName,
    Role? role,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String get fullName => '$firstName $lastName';

  /// Determines if the current user instance represents an anonymous user.
  bool get isAnonymous => this == anonymous;

  /// Determines if the current user instance represents an authenticated user.
  bool get isAuthenticated => !isAnonymous;

  /// A predefined instance representing an unauthenticated or anonymous user.
  static const anonymous = User(id: '00000000-0000-0000-0000-000000000000');
}
