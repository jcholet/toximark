import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';
part 'role.g.dart';

@freezed
class Role with _$Role {
  const factory Role({
    required int id,
    required String roleDescription,
  }) = _Role;

  const Role._();

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
