// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RespondToActivityParamsImpl _$$RespondToActivityParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RespondToActivityParamsImpl(
      studentId: (json['student_id'] as num?)?.toInt(),
      response: json['response'] as String?,
    );

Map<String, dynamic> _$$RespondToActivityParamsImplToJson(
        _$RespondToActivityParamsImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'response': instance.response,
    };
