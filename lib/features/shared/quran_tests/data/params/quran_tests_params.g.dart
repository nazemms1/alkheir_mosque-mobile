// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_tests_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordFinalAttemptParamsImpl _$$RecordFinalAttemptParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordFinalAttemptParamsImpl(
      score: (json['score'] as num?)?.toDouble(),
      testedOn: json['tested_on'] as String?,
      notes: json['notes'] as String?,
      teacherId: (json['teacher_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RecordFinalAttemptParamsImplToJson(
        _$RecordFinalAttemptParamsImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'tested_on': instance.testedOn,
      if (instance.notes case final value?) 'notes': value,
      if (instance.teacherId case final value?) 'teacher_id': value,
    };

_$RecordPartialAttemptParamsImpl _$$RecordPartialAttemptParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordPartialAttemptParamsImpl(
      mistakeCount: (json['mistake_count'] as num?)?.toInt(),
      testedOn: json['tested_on'] as String?,
      notes: json['notes'] as String?,
      teacherId: (json['teacher_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RecordPartialAttemptParamsImplToJson(
        _$RecordPartialAttemptParamsImpl instance) =>
    <String, dynamic>{
      'mistake_count': instance.mistakeCount,
      'tested_on': instance.testedOn,
      if (instance.notes case final value?) 'notes': value,
      if (instance.teacherId case final value?) 'teacher_id': value,
    };

_$StartFinalParamsImpl _$$StartFinalParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$StartFinalParamsImpl(
      juzId: (json['juz_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StartFinalParamsImplToJson(
        _$StartFinalParamsImpl instance) =>
    <String, dynamic>{
      'juz_id': instance.juzId,
    };

_$StartPartialParamsImpl _$$StartPartialParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$StartPartialParamsImpl(
      juzId: (json['juz_id'] as num?)?.toInt(),
      allowParallelCycle: json['allow_parallel_cycle'] as bool?,
    );

Map<String, dynamic> _$$StartPartialParamsImplToJson(
        _$StartPartialParamsImpl instance) =>
    <String, dynamic>{
      'juz_id': instance.juzId,
      'allow_parallel_cycle': instance.allowParallelCycle,
    };
