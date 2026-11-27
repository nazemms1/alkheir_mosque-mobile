// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthTokenModelImpl _$$AuthTokenModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthTokenModelImpl(
      token: jsonStringLenient(json['token']),
      tokenType: jsonStringLenient(json['token_type']),
      user: json['user'] == null
          ? null
          : AuthUserModel.fromJson(json['user'] as Map<String, dynamic>),
      abilities: jsonStringListLenient(json['abilities']),
    );

Map<String, dynamic> _$$AuthTokenModelImplToJson(
        _$AuthTokenModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'user': instance.user,
      'abilities': instance.abilities,
    };

_$AuthUserModelImpl _$$AuthUserModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringLenient(json['name']),
      username: jsonStringLenient(json['username']),
      roles: jsonStringListLenient(json['roles']),
      permissions: jsonStringListLenient(json['permissions']),
      teacherId: jsonIntLenient(json['teacher_id']),
    );

Map<String, dynamic> _$$AuthUserModelImplToJson(_$AuthUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'roles': instance.roles,
      'permissions': instance.permissions,
      'teacher_id': instance.teacherId,
    };
