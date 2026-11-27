// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuranJuzModelImpl _$$QuranJuzModelImplFromJson(Map<String, dynamic> json) =>
    _$QuranJuzModelImpl(
      id: jsonIntLenient(json['id']),
      juzNumber: jsonIntLenient(json['juz_number']),
      fromPage: jsonIntLenient(json['from_page']),
      toPage: jsonIntLenient(json['to_page']),
    );

_$QuranTestGroupModelImpl _$$QuranTestGroupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranTestGroupModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      courseName: jsonStringLenient(json['course_name']),
    );

_$NamedRefModelImpl _$$NamedRefModelImplFromJson(Map<String, dynamic> json) =>
    _$NamedRefModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
    );

_$QuranPartialAttemptModelImpl _$$QuranPartialAttemptModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranPartialAttemptModelImpl(
      id: jsonIntLenient(json['id']),
      attemptNo: jsonIntLenient(json['attempt_no']),
      mistakeCount: jsonIntLenient(json['mistake_count']),
      status: jsonStringValue(json['status']),
      testedOn: jsonStringLenient(json['tested_on']),
      notes: jsonStringLenient(json['notes']),
      teacher: readJsonMap(json, 'teacher') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'teacher') as Map<String, dynamic>),
    );

_$QuranPartialPartModelImpl _$$QuranPartialPartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranPartialPartModelImpl(
      id: jsonIntLenient(json['id']),
      partNumber: jsonIntLenient(json['part_number']),
      status: jsonStringValue(json['status']),
      passedOn: jsonStringLenient(json['passed_on']),
      attempts: (readJsonList(json, 'attempts') as List<dynamic>?)
          ?.map((e) =>
              QuranPartialAttemptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$QuranPartialCycleModelImpl _$$QuranPartialCycleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranPartialCycleModelImpl(
      id: jsonIntLenient(json['id']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      status: jsonStringValue(json['status']),
      passedOn: jsonStringLenient(json['passed_on']),
      juz: readJsonMap(json, 'juz') == null
          ? null
          : QuranJuzModel.fromJson(
              readJsonMap(json, 'juz') as Map<String, dynamic>),
      student: readJsonMap(json, 'student') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'student') as Map<String, dynamic>),
      group: readJsonMap(json, 'group') == null
          ? null
          : QuranTestGroupModel.fromJson(
              readJsonMap(json, 'group') as Map<String, dynamic>),
      parts: (readJsonList(json, 'parts') as List<dynamic>?)
          ?.map(
              (e) => QuranPartialPartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$QuranFinalAttemptModelImpl _$$QuranFinalAttemptModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranFinalAttemptModelImpl(
      id: jsonIntLenient(json['id']),
      attemptNo: jsonIntLenient(json['attempt_no']),
      score: jsonDoubleLenient(json['score']),
      status: jsonStringValue(json['status']),
      testedOn: jsonStringLenient(json['tested_on']),
      notes: jsonStringLenient(json['notes']),
      teacher: readJsonMap(json, 'teacher') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'teacher') as Map<String, dynamic>),
    );

_$QuranFinalCycleModelImpl _$$QuranFinalCycleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranFinalCycleModelImpl(
      id: jsonIntLenient(json['id']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      status: jsonStringValue(json['status']),
      passedOn: jsonStringLenient(json['passed_on']),
      juz: readJsonMap(json, 'juz') == null
          ? null
          : QuranJuzModel.fromJson(
              readJsonMap(json, 'juz') as Map<String, dynamic>),
      student: readJsonMap(json, 'student') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'student') as Map<String, dynamic>),
      group: readJsonMap(json, 'group') == null
          ? null
          : QuranTestGroupModel.fromJson(
              readJsonMap(json, 'group') as Map<String, dynamic>),
      attempts: (readJsonList(json, 'attempts') as List<dynamic>?)
          ?.map(
              (e) => QuranFinalAttemptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
