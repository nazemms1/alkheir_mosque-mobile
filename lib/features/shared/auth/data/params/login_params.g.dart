// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginParamsImpl _$$LoginParamsImplFromJson(Map<String, dynamic> json) =>
    _$LoginParamsImpl(
      login: json['login'] as String?,
      password: json['password'] as String?,
      remember: json['remember'] as bool?,
      deviceName: json['device_name'] as String?,
    );

Map<String, dynamic> _$$LoginParamsImplToJson(_$LoginParamsImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'remember': instance.remember,
      'device_name': instance.deviceName,
    };
