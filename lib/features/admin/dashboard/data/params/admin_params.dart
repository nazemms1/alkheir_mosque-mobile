// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_params.freezed.dart';
part 'admin_params.g.dart';

@freezed
class CreateGroupParams with _$CreateGroupParams {
  @JsonSerializable(includeIfNull: false)
  const factory CreateGroupParams({
    @JsonKey(includeIfNull: true) String? name,
    @JsonKey(name: 'academic_year_id', includeIfNull: true) int? academicYearId,
    @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
    @JsonKey(name: 'teacher_id', includeIfNull: true) int? teacherId,
    @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
    int? assistantTeacherId,
    @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
    @JsonKey(includeIfNull: true) int? capacity,
    @JsonKey(name: 'monthly_fee', includeIfNull: true) int? monthlyFee,
    @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
    @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
    @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive,
  }) = _CreateGroupParams;

  factory CreateGroupParams.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupParamsFromJson(json);
}

@freezed
class OpenStudentAttendanceDayParams with _$OpenStudentAttendanceDayParams {
  @JsonSerializable(includeIfNull: false)
  const factory OpenStudentAttendanceDayParams({
    @JsonKey(name: 'group_id', includeIfNull: true) int? groupId,
    @JsonKey(name: 'attendance_date', includeIfNull: true)
    String? attendanceDate,
  }) = _OpenStudentAttendanceDayParams;

  factory OpenStudentAttendanceDayParams.fromJson(Map<String, dynamic> json) =>
      _$OpenStudentAttendanceDayParamsFromJson(json);
}

@freezed
class QuickScanStudentAttendanceParams with _$QuickScanStudentAttendanceParams {
  @JsonSerializable(includeIfNull: false)
  const factory QuickScanStudentAttendanceParams({
    @JsonKey(name: 'scan_value', includeIfNull: true) String? scanValue,
    @JsonKey(name: 'attendance_status_id', includeIfNull: true)
    int? attendanceStatusId,
  }) = _QuickScanStudentAttendanceParams;

  factory QuickScanStudentAttendanceParams.fromJson(
          Map<String, dynamic> json) =>
      _$QuickScanStudentAttendanceParamsFromJson(json);
}

@freezed
class RecordGroupAttendanceParams with _$RecordGroupAttendanceParams {
  @JsonSerializable(includeIfNull: false)
  const factory RecordGroupAttendanceParams({
    @JsonKey(name: 'attendance_date', includeIfNull: true)
    String? attendanceDate,
    @JsonKey(includeIfNull: true) String? notes,
    @JsonKey(includeIfNull: true) Object? records,
  }) = _RecordGroupAttendanceParams;

  factory RecordGroupAttendanceParams.fromJson(Map<String, dynamic> json) =>
      _$RecordGroupAttendanceParamsFromJson(json);
}

@freezed
class RecordMemorizationParams with _$RecordMemorizationParams {
  @JsonSerializable(includeIfNull: false)
  const factory RecordMemorizationParams({
    @JsonKey(name: 'entry_type', includeIfNull: true) String? entryType,
    @JsonKey(name: 'from_page', includeIfNull: true) int? fromPage,
    @JsonKey(name: 'to_page', includeIfNull: true) int? toPage,
    @JsonKey(name: 'recorded_on', includeIfNull: true) String? recordedOn,
    @JsonKey(name: 'teacher_id', includeIfNull: true) String? teacherId,
    @JsonKey(includeIfNull: true) String? notes,
  }) = _RecordMemorizationParams;

  factory RecordMemorizationParams.fromJson(Map<String, dynamic> json) =>
      _$RecordMemorizationParamsFromJson(json);
}

@freezed
class ScanStudentAttendanceParams with _$ScanStudentAttendanceParams {
  @JsonSerializable(includeIfNull: false)
  const factory ScanStudentAttendanceParams({
    @JsonKey(name: 'scan_value', includeIfNull: true) String? scanValue,
    @JsonKey(name: 'attendance_status_id', includeIfNull: true)
    int? attendanceStatusId,
  }) = _ScanStudentAttendanceParams;

  factory ScanStudentAttendanceParams.fromJson(Map<String, dynamic> json) =>
      _$ScanStudentAttendanceParamsFromJson(json);
}

@freezed
class UpdateGroupParams with _$UpdateGroupParams {
  @JsonSerializable(includeIfNull: false)
  const factory UpdateGroupParams({
    @JsonKey(includeIfNull: true) String? name,
    @JsonKey(name: 'academic_year_id', includeIfNull: true) int? academicYearId,
    @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
    @JsonKey(name: 'teacher_id', includeIfNull: true) int? teacherId,
    @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
    int? assistantTeacherId,
    @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
    @JsonKey(includeIfNull: true) int? capacity,
    @JsonKey(name: 'monthly_fee', includeIfNull: true) int? monthlyFee,
    @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
    @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
    @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive,
  }) = _UpdateGroupParams;

  factory UpdateGroupParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupParamsFromJson(json);
}
