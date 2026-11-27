// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentProfileInfoModelImpl _$$StudentProfileInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentProfileInfoModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      studentNumber: jsonStringLenient(json['student_number']),
      status: jsonStringValue(json['status']),
      birthDate: jsonStringLenient(json['birth_date']),
      gradeLevel: readJsonMap(json, 'grade_level') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'grade_level') as Map<String, dynamic>),
      parent: readJsonMap(json, 'parent') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'parent') as Map<String, dynamic>),
      quranCurrentJuz: jsonIntLenient(json['quran_current_juz']),
      hasPhoto: _studentProfileInfoHasPhotoValue(
          _studentProfileInfoHasPhoto(json, 'hasPhoto')),
    );

_$StudentEnrollmentInfoModelImpl _$$StudentEnrollmentInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentEnrollmentInfoModelImpl(
      id: jsonIntLenient(json['id']),
      status: jsonStringValue(json['status']),
      enrolledAt: jsonStringLenient(json['enrolled_at']),
      leftAt: jsonStringLenient(json['left_at']),
      group: readJsonMap(json, 'group') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'group') as Map<String, dynamic>),
      course: readJsonMap(json, 'course') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'course') as Map<String, dynamic>),
      teacher: readJsonMap(json, 'teacher') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'teacher') as Map<String, dynamic>),
    );

_$StudentProgressStatsModelImpl _$$StudentProgressStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentProgressStatsModelImpl(
      assessmentAverage: jsonDoubleLenient(json['assessment_average']),
      attendanceDays: jsonIntLenient(json['attendance_days']),
      files: jsonIntLenient(json['files']),
      memorizedPages: jsonIntLenient(json['memorized_pages']),
      notes: jsonIntLenient(json['notes']),
      passedFinalTests: jsonIntLenient(json['passed_final_tests']),
      passedPartialTests: jsonIntLenient(json['passed_partial_tests']),
      points: jsonIntLenient(json['points']),
    );

_$StudentProgressModelImpl _$$StudentProgressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentProgressModelImpl(
      profile: readJsonMap(json, 'profile') == null
          ? null
          : StudentProfileInfoModel.fromJson(
              readJsonMap(json, 'profile') as Map<String, dynamic>),
      enrollments: (readJsonList(json, 'enrollments') as List<dynamic>?)
          ?.map((e) =>
              StudentEnrollmentInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: readJsonMap(json, 'stats') == null
          ? null
          : StudentProgressStatsModel.fromJson(
              readJsonMap(json, 'stats') as Map<String, dynamic>),
    );

_$StudentFileItemModelImpl _$$StudentFileItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentFileItemModelImpl(
      id: jsonIntLenient(json['id']),
      fileType: jsonStringValue(json['file_type']),
      originalName: jsonStringValue(json['original_name']),
      uploadedAt: jsonStringLenient(json['uploaded_at']),
      uploadedByName: _studentFileItemUploadedByNameValue(
          _studentFileItemUploadedByName(json, 'uploadedByName')),
    );
