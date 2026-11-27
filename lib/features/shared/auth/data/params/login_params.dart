// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_params.freezed.dart';
part 'login_params.g.dart';

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    String? login,
    String? password,
    bool? remember,
    @JsonKey(name: 'device_name') String? deviceName,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
