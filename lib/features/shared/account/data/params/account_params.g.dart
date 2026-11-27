// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateUsernameParamsImpl _$$UpdateUsernameParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUsernameParamsImpl(
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$UpdateUsernameParamsImplToJson(
        _$UpdateUsernameParamsImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
    };

_$ChangePasswordParamsImpl _$$ChangePasswordParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordParamsImpl(
      currentPassword: json['current_password'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$$ChangePasswordParamsImplToJson(
        _$ChangePasswordParamsImpl instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
