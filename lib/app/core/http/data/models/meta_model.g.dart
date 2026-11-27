// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaModelImpl _$$MetaModelImplFromJson(Map<String, dynamic> json) =>
    _$MetaModelImpl(
      total: jsonIntLenient(json['total']),
      limit: jsonIntLenient(json['limit']),
      offset: jsonIntLenient(json['offset']),
      hasMore: jsonBoolLenient(json['has_more']),
      currentPage: jsonIntLenient(json['current_page']),
      lastPage: jsonIntLenient(json['last_page']),
      perPage: jsonIntLenient(json['per_page']),
    );

Map<String, dynamic> _$$MetaModelImplToJson(_$MetaModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      'has_more': instance.hasMore,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
    };
