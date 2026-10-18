// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseApiModel<T> _$BaseApiModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseApiModel<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      meta: json['meta'] == null
          ? null
          : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseApiModelToJson<T>(
  BaseApiModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
      'meta': instance.meta,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
