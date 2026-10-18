// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetaModelImpl _$$MetaModelImplFromJson(Map<String, dynamic> json) =>
    _$MetaModelImpl(
      total: (json['total'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      hasMore: json['has_more'] as bool?,
    );

Map<String, dynamic> _$$MetaModelImplToJson(_$MetaModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      'has_more': instance.hasMore,
    };
