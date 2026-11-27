// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_params.freezed.dart';
part 'account_params.g.dart';

@freezed
class UpdateUsernameParams with _$UpdateUsernameParams {
  const factory UpdateUsernameParams({String? username}) =
      _UpdateUsernameParams;

  factory UpdateUsernameParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateUsernameParamsFromJson(json);
}

@freezed
class ChangePasswordParams with _$ChangePasswordParams {
  const factory ChangePasswordParams({
    @JsonKey(name: 'current_password') String? currentPassword,
    String? password,
    @JsonKey(name: 'password_confirmation') String? passwordConfirmation,
  }) = _ChangePasswordParams;

  factory ChangePasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordParamsFromJson(json);
}
