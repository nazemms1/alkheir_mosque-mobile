// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'management_model.freezed.dart';
part 'management_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.

Object? _teacherItemCourseId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final course = jsonMap(json['course']);
  return jsonIntOrNull(course?['id']);
}

int? _teacherItemCourseIdValue(Object? v) => v as int?;

Object? _teacherItemCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final course = jsonMap(json['course']);
  return jsonStringOrNull(course?['name']);
}

String? _teacherItemCourseNameValue(Object? v) => v as String?;

Object? _groupScheduleSlotTimeSlot(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final slot = jsonString(json['time_slot']);
  return slot;
}

String? _groupScheduleSlotTimeSlotValue(Object? v) => v as String?;

Object? _groupScheduleSlotTimeSlotLabel(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final slot = jsonString(json['time_slot']);
  return jsonStringOrNull(json['time_slot_label']) ?? slot;
}

String? _groupScheduleSlotTimeSlotLabelValue(Object? v) => v as String?;

Object? _refItemIsActive(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['is_active'] == null ? true : jsonBool(json['is_active']);
}

bool? _refItemIsActiveValue(Object? v) => v as bool?;

@Freezed(toJson: false)
class ParentItemModel with _$ParentItemModel {
  const factory ParentItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
    String? parentNumber,
    @JsonKey(name: 'father_name', fromJson: jsonStringValue) String? fatherName,
    @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
    String? fatherWork,
    @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
    String? fatherPhone,
    @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
    String? motherName,
    @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
    String? motherPhone,
    @JsonKey(name: 'home_phone', fromJson: jsonStringLenient) String? homePhone,
    @JsonKey(fromJson: jsonStringLenient) String? address,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
    int? studentsCount,
  }) = _ParentItemModel;

  factory ParentItemModel.fromJson(Map<String, dynamic> json) =>
      _$ParentItemModelFromJson(json);
}

@Freezed(toJson: false)
class TeacherItemModel with _$TeacherItemModel {
  const factory TeacherItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
    @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
    @JsonKey(fromJson: jsonStringValue) String? phone,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient) bool? isHelping,
    @JsonKey(name: 'hired_at', fromJson: jsonStringLenient) String? hiredAt,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(name: 'job_title', fromJson: jsonStringLenient) String? jobTitle,
    @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
    int? teacherJobTitleId,
    @JsonKey(
        readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
    int? courseId,
    @JsonKey(
        readValue: _teacherItemCourseName,
        fromJson: _teacherItemCourseNameValue)
    String? courseName,
    @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
    int? assignedGroupsCount,
    @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
    int? assistedGroupsCount,
  }) = _TeacherItemModel;

  factory TeacherItemModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherItemModelFromJson(json);
}

@Freezed(toJson: false)
class CourseItemModel with _$CourseItemModel {
  const factory CourseItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
    String? academicYear,
    @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
    int? academicYearId,
    @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) String? startsOn,
    @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) String? endsOn,
    @JsonKey(fromJson: jsonStringLenient) String? description,
    @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
    bool? awardsPoints,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(name: 'is_default', fromJson: jsonBoolLenient) bool? isDefault,
    @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
    String? finishedAt,
    @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
    @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
    int? enrollmentsCount,
  }) = _CourseItemModel;

  factory CourseItemModel.fromJson(Map<String, dynamic> json) =>
      _$CourseItemModelFromJson(json);
}

@Freezed(toJson: false)
class GroupScheduleSlotModel with _$GroupScheduleSlotModel {
  const factory GroupScheduleSlotModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient) int? dayOfWeek,
    @JsonKey(
        readValue: _groupScheduleSlotTimeSlot,
        fromJson: _groupScheduleSlotTimeSlotValue)
    String? timeSlot,
    @JsonKey(
        readValue: _groupScheduleSlotTimeSlotLabel,
        fromJson: _groupScheduleSlotTimeSlotLabelValue)
    String? timeSlotLabel,
    @JsonKey(name: 'starts_at', fromJson: jsonStringValue) String? startsAt,
    @JsonKey(name: 'ends_at', fromJson: jsonStringValue) String? endsAt,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
  }) = _GroupScheduleSlotModel;

  factory GroupScheduleSlotModel.fromJson(Map<String, dynamic> json) =>
      _$GroupScheduleSlotModelFromJson(json);
}

@Freezed(toJson: false)
class RefItemModel with _$RefItemModel {
  const factory RefItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(fromJson: jsonStringLenient) String? code,
    @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
    bool? isActive,
    @JsonKey(name: 'is_current', fromJson: jsonBoolLenient) bool? isCurrent,
  }) = _RefItemModel;

  factory RefItemModel.fromJson(Map<String, dynamic> json) =>
      _$RefItemModelFromJson(json);
}
