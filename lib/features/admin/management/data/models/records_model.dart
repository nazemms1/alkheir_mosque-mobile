// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'records_model.freezed.dart';
part 'records_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.

Object? _studentRecordStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonString(json['status']).isEmpty
      ? 'active'
      : jsonString(json['status']);
}

String? _studentRecordStatusValue(Object? v) => v as String?;

Object? _studentRecordParentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parentMap = jsonMap(json['parent']);
  final parentId = jsonIntOrNull(json['parent_id']) ??
      (parentMap != null ? jsonIntOrNull(parentMap['id']) : null);
  return parentId;
}

int? _studentRecordParentIdValue(Object? v) => v as int?;

Object? _studentRecordParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parentMap = jsonMap(json['parent']);
  String? parentName;
  if (parentMap != null) {
    parentName = jsonStringOrNull(parentMap['father_name']) ??
        jsonStringOrNull(parentMap['name']) ??
        jsonStringOrNull(parentMap['full_name']) ??
        jsonStringOrNull(json['parent_name']) ??
        jsonStringOrNull(json['father_name']);
  } else if (json['parent'] is String) {
    parentName = jsonStringOrNull(json['parent']);
  } else {
    parentName = jsonStringOrNull(json['parent_name']) ??
        jsonStringOrNull(json['father_name']);
  }
  return parentName;
}

String? _studentRecordParentNameValue(Object? v) => v as String?;

Object? _studentRecordGradeLevelId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final gradeMap = jsonMap(json['grade_level']);
  final gradeLevelId = jsonIntOrNull(json['grade_level_id']) ??
      (gradeMap != null ? jsonIntOrNull(gradeMap['id']) : null);
  return gradeLevelId;
}

int? _studentRecordGradeLevelIdValue(Object? v) => v as int?;

Object? _studentRecordGradeLevelName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final gradeMap = jsonMap(json['grade_level']);
  String? gradeLevelName;
  if (gradeMap != null) {
    gradeLevelName = jsonStringOrNull(gradeMap['name']) ??
        jsonStringOrNull(json['grade_level_name']);
  } else if (json['grade_level'] is String) {
    gradeLevelName = jsonStringOrNull(json['grade_level']);
  } else {
    gradeLevelName = jsonStringOrNull(json['grade_level_name']);
  }
  return gradeLevelName;
}

String? _studentRecordGradeLevelNameValue(Object? v) => v as String?;

Object? _studentRecordQuranCurrentJuzId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final juzMap =
      jsonMap(json['quran_current_juz']) ?? jsonMap(json['current_juz']);
  final quranCurrentJuzId = jsonIntOrNull(json['quran_current_juz_id']) ??
      (juzMap != null ? jsonIntOrNull(juzMap['id']) : null);
  return quranCurrentJuzId;
}

int? _studentRecordQuranCurrentJuzIdValue(Object? v) => v as int?;

Object? _studentRecordQuranCurrentJuz(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final juzMap =
      jsonMap(json['quran_current_juz']) ?? jsonMap(json['current_juz']);
  final quranCurrentJuz = jsonIntOrNull(json['quran_current_juz']) ??
      jsonIntOrNull(json['current_juz']) ??
      (juzMap != null
          ? (jsonIntOrNull(juzMap['juz']) ??
              jsonIntOrNull(juzMap['juz_number']) ??
              jsonIntOrNull(juzMap['number']))
          : null);
  return quranCurrentJuz;
}

int? _studentRecordQuranCurrentJuzValue(Object? v) => v as int?;

Object? _studentRecordHasPhoto(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(json['photo_path']) != null ||
      jsonStringOrNull(json['photo_endpoint']) != null;
}

bool? _studentRecordHasPhotoValue(Object? v) => v as bool?;

Object? _enrollmentRecordGroupId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = jsonMap(json['group']);
  return jsonInt(group?['id']);
}

int? _enrollmentRecordGroupIdValue(Object? v) => v as int?;

Object? _enrollmentRecordGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = jsonMap(json['group']);
  return jsonStringOrNull(group?['name']);
}

String? _enrollmentRecordGroupNameValue(Object? v) => v as String?;

Object? _enrollmentRecordCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = jsonMap(json['group']);
  return jsonStringOrNull(group?['course_name']);
}

String? _enrollmentRecordCourseNameValue(Object? v) => v as String?;

Object? _enrollmentRecordStudentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = jsonMap(json['student']);
  return jsonInt(student?['id']);
}

int? _enrollmentRecordStudentIdValue(Object? v) => v as int?;

Object? _enrollmentRecordStudentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = jsonMap(json['student']);
  return jsonString(student?['full_name']);
}

String? _enrollmentRecordStudentNameValue(Object? v) => v as String?;

Object? _enrollmentRecordParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = jsonMap(json['student']);
  return jsonStringOrNull(student?['parent_name']);
}

String? _enrollmentRecordParentNameValue(Object? v) => v as String?;

@Freezed(toJson: false)
class StudentRecordModel with _$StudentRecordModel {
  const factory StudentRecordModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
    @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
    @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
    String? studentNumber,
    @JsonKey(name: 'birth_date', fromJson: jsonStringLenient) String? birthDate,
    @JsonKey(fromJson: jsonStringLenient) String? gender,
    @JsonKey(
        readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
    String? status,
    @JsonKey(
        readValue: _studentRecordParentId,
        fromJson: _studentRecordParentIdValue)
    int? parentId,
    @JsonKey(
        readValue: _studentRecordParentName,
        fromJson: _studentRecordParentNameValue)
    String? parentName,
    @JsonKey(
        readValue: _studentRecordGradeLevelId,
        fromJson: _studentRecordGradeLevelIdValue)
    int? gradeLevelId,
    @JsonKey(
        readValue: _studentRecordGradeLevelName,
        fromJson: _studentRecordGradeLevelNameValue)
    String? gradeLevelName,
    @JsonKey(name: 'joined_at', fromJson: jsonStringLenient) String? joinedAt,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(
        readValue: _studentRecordQuranCurrentJuzId,
        fromJson: _studentRecordQuranCurrentJuzIdValue)
    int? quranCurrentJuzId,
    @JsonKey(
        readValue: _studentRecordQuranCurrentJuz,
        fromJson: _studentRecordQuranCurrentJuzValue)
    int? quranCurrentJuz,
    @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
    String? schoolName,
    @JsonKey(
        readValue: _studentRecordHasPhoto,
        fromJson: _studentRecordHasPhotoValue)
    bool? hasPhoto,
  }) = _StudentRecordModel;

  factory StudentRecordModel.fromJson(Map<String, dynamic> json) =>
      _$StudentRecordModelFromJson(json);
}

@Freezed(toJson: false)
class EnrollmentRecordModel with _$EnrollmentRecordModel {
  const factory EnrollmentRecordModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
    String? enrolledAt,
    @JsonKey(name: 'left_at', fromJson: jsonStringLenient) String? leftAt,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(name: 'final_points', fromJson: jsonIntLenient) int? finalPoints,
    @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
    int? memorizedPages,
    @JsonKey(
        readValue: _enrollmentRecordGroupId,
        fromJson: _enrollmentRecordGroupIdValue)
    int? groupId,
    @JsonKey(
        readValue: _enrollmentRecordGroupName,
        fromJson: _enrollmentRecordGroupNameValue)
    String? groupName,
    @JsonKey(
        readValue: _enrollmentRecordCourseName,
        fromJson: _enrollmentRecordCourseNameValue)
    String? courseName,
    @JsonKey(
        readValue: _enrollmentRecordStudentId,
        fromJson: _enrollmentRecordStudentIdValue)
    int? studentId,
    @JsonKey(
        readValue: _enrollmentRecordStudentName,
        fromJson: _enrollmentRecordStudentNameValue)
    String? studentName,
    @JsonKey(
        readValue: _enrollmentRecordParentName,
        fromJson: _enrollmentRecordParentNameValue)
    String? parentName,
  }) = _EnrollmentRecordModel;

  factory EnrollmentRecordModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentRecordModelFromJson(json);
}

@Freezed(toJson: false)
class GroupRecordModel with _$GroupRecordModel {
  const factory GroupRecordModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
    int? academicYearId,
    @JsonKey(name: 'course_id', fromJson: jsonIntLenient) int? courseId,
    @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId,
    @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
    int? assistantTeacherId,
    @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
    int? gradeLevelId,
    @JsonKey(fromJson: jsonIntLenient) int? capacity,
    @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
    double? monthlyFee,
    @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) String? startsOn,
    @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) String? endsOn,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
  }) = _GroupRecordModel;

  factory GroupRecordModel.fromJson(Map<String, dynamic> json) =>
      _$GroupRecordModelFromJson(json);
}
