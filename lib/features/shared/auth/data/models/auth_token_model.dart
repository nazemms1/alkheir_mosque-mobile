// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'auth_token_model.freezed.dart';
part 'auth_token_model.g.dart';

/// استجابة `POST /auth/token` (غير مغلّفة بـ `data`)، وهي نفس البنية المحفوظة محلياً.
@freezed
class AuthTokenModel with _$AuthTokenModel {
  const factory AuthTokenModel({
    @JsonKey(fromJson: jsonStringLenient) String? token,
    @JsonKey(name: 'token_type', fromJson: jsonStringLenient) String? tokenType,
    AuthUserModel? user,
    @JsonKey(fromJson: jsonStringListLenient) List<String>? abilities,
  }) = _AuthTokenModel;

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);
}

@freezed
class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringLenient) String? name,
    @JsonKey(fromJson: jsonStringLenient) String? username,
    @JsonKey(fromJson: jsonStringListLenient) List<String>? roles,
    @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
    @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}
