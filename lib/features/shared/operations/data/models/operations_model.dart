// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/models/quran_test_model.dart';

part 'operations_model.freezed.dart';
part 'operations_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.
String? _nameOf(Object? json) => jsonStringOrNull(jsonMap(json)?['name']);

Object? _attendanceDaySummaryCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['course']);
}

String? _attendanceDaySummaryCourseNameValue(Object? v) => v as String?;

Object? _attendanceDaySummaryCourseId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonIntOrNull(json['course_id'] ?? jsonMap(json['course'])?['id']);
}

int? _attendanceDaySummaryCourseIdValue(Object? v) => v as int?;

Object? _attendanceDaySummaryCourseFinished(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(json['course_finished_at']) != null;
}

bool? _attendanceDaySummaryCourseFinishedValue(Object? v) => v as bool?;

Object? _attendanceRecordItemStudentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonString(jsonMap(json['student'])?['name']);
}

String? _attendanceRecordItemStudentNameValue(Object? v) => v as String?;

Object? _attendanceRecordItemStatusName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final status = jsonMap(json['attendance_status']);
  return jsonString(status?['name']);
}

String? _attendanceRecordItemStatusNameValue(Object? v) => v as String?;

Object? _attendanceRecordItemStatusCode(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final status = jsonMap(json['attendance_status']);
  return jsonString(status?['code']);
}

String? _attendanceRecordItemStatusCodeValue(Object? v) => v as String?;

Object? _attendanceDayDetailCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['course']);
}

String? _attendanceDayDetailCourseNameValue(Object? v) => v as String?;

Object? _attendanceDayDetailCourseFinished(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(json['course_finished_at']) != null;
}

bool? _attendanceDayDetailCourseFinishedValue(Object? v) => v as bool?;

Object? _attendanceGroupDayGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonString(jsonMap(json['group'])?['name']);
}

String? _attendanceGroupDayGroupNameValue(Object? v) => v as String?;

Object? _teacherAttendanceRecordTeacherId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = jsonMap(json['teacher']);
  return jsonIntOrNull(json['teacher_id']) ??
      (teacher != null ? jsonIntOrNull(teacher['id']) : null);
}

int? _teacherAttendanceRecordTeacherIdValue(Object? v) => v as int?;

Object? _teacherAttendanceRecordTeacherName(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = jsonMap(json['teacher']);
  return jsonString(teacher?['name'] ?? json['teacher_name']);
}

String? _teacherAttendanceRecordTeacherNameValue(Object? v) => v as String?;

Object? _teacherAttendanceRecordStatusId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final status = jsonMap(json['attendance_status']);
  return jsonIntOrNull(json['attendance_status_id']) ??
      (status != null ? jsonIntOrNull(status['id']) : null);
}

int? _teacherAttendanceRecordStatusIdValue(Object? v) => v as int?;

Object? _teacherAttendanceRecordStatusName(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final status = jsonMap(json['attendance_status']);
  return jsonString(status?['name'] ?? json['status_name']);
}

String? _teacherAttendanceRecordStatusNameValue(Object? v) => v as String?;

Object? _teacherAttendanceRecordStatusCode(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final status = jsonMap(json['attendance_status']);
  return jsonString(status?['code'] ?? json['status_code']);
}

String? _teacherAttendanceRecordStatusCodeValue(Object? v) => v as String?;

Object? _teacherAttendanceDayCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['course']);
}

String? _teacherAttendanceDayCourseNameValue(Object? v) => v as String?;

Object? _teacherAttendanceDayCourseId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonIntOrNull(json['course_id'] ?? jsonMap(json['course'])?['id']);
}

int? _teacherAttendanceDayCourseIdValue(Object? v) => v as int?;

Object? _teacherAttendanceDayRecordsCount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonInt(json['records_count'] ?? 0);
}

int? _teacherAttendanceDayRecordsCountValue(Object? v) => v as int?;

Object? _awqafTestTypeName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['type']);
}

String? _awqafTestTypeNameValue(Object? v) => v as String?;

Object? _pointEntryPointTypeName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final type = jsonMap(json['point_type']);
  return jsonStringOrNull(type?['name']);
}

String? _pointEntryPointTypeNameValue(Object? v) => v as String?;

Object? _pointEntryPointTypeId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final type = jsonMap(json['point_type']);
  return jsonIntOrNull(type?['id']);
}

int? _pointEntryPointTypeIdValue(Object? v) => v as int?;

Object? _assessmentSummaryTypeName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final rawType = json['type'];
  return rawType is Map
      ? jsonStringOrNull(rawType['name'])
      : jsonStringOrNull(rawType);
}

String? _assessmentSummaryTypeNameValue(Object? v) => v as String?;

Object? _assessmentSummaryGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = jsonMap(json['group']);
  return jsonStringOrNull(group?['name']);
}

String? _assessmentSummaryGroupNameValue(Object? v) => v as String?;

Object? _assessmentSummaryCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = jsonMap(json['group']);
  return jsonStringOrNull(group?['course_name']);
}

String? _assessmentSummaryCourseNameValue(Object? v) => v as String?;

Object? _assessmentDetailSummary(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonMap(json);
}

Object? _curriculumResourceDownloadable(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(json['download_endpoint']) != null;
}

bool? _curriculumResourceDownloadableValue(Object? v) => v as bool?;

Object? _curriculumSummaryCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['course']);
}

String? _curriculumSummaryCourseNameValue(Object? v) => v as String?;

Object? _curriculumSummaryGradeLevelName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['grade_level']);
}

String? _curriculumSummaryGradeLevelNameValue(Object? v) => v as String?;

Object? _curriculumDetailSummary(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonMap(json);
}

Object? _groupCurriculumCurriculumName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['curriculum'])?['name']);
}

String? _groupCurriculumCurriculumNameValue(Object? v) => v as String?;

Object? _groupCurriculumGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonString(jsonMap(json['group'])?['name']);
}

String? _groupCurriculumGroupNameValue(Object? v) => v as String?;

Object? _groupCurriculumPercentage(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final summary = jsonMap(json['summary']) ?? const <String, dynamic>{};
  return jsonDouble(summary['percentage']);
}

double? _groupCurriculumPercentageValue(Object? v) => (v as num?)?.toDouble();

Object? _groupCurriculumTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final summary = jsonMap(json['summary']) ?? const <String, dynamic>{};
  return jsonInt(summary['total']);
}

int? _groupCurriculumTotalValue(Object? v) => v as int?;

Object? _groupCurriculumCompleted(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final summary = jsonMap(json['summary']) ?? const <String, dynamic>{};
  return jsonDouble(summary['completed']);
}

double? _groupCurriculumCompletedValue(Object? v) => (v as num?)?.toDouble();

@Freezed(toJson: false)
class AttendanceDaySummaryModel with _$AttendanceDaySummaryModel {
  const factory AttendanceDaySummaryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
    String? attendanceDate,
    @JsonKey(
        readValue: _attendanceDaySummaryCourseName,
        fromJson: _attendanceDaySummaryCourseNameValue)
    String? courseName,
    @JsonKey(
        readValue: _attendanceDaySummaryCourseId,
        fromJson: _attendanceDaySummaryCourseIdValue)
    int? courseId,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
    @JsonKey(name: 'records_count', fromJson: jsonIntLenient) int? recordsCount,
    @JsonKey(
        readValue: _attendanceDaySummaryCourseFinished,
        fromJson: _attendanceDaySummaryCourseFinishedValue)
    bool? courseFinished,
  }) = _AttendanceDaySummaryModel;

  factory AttendanceDaySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDaySummaryModelFromJson(json);
}

@Freezed(toJson: false)
class AttendanceRecordItemModel with _$AttendanceRecordItemModel {
  const factory AttendanceRecordItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(
        readValue: _attendanceRecordItemStudentName,
        fromJson: _attendanceRecordItemStudentNameValue)
    String? studentName,
    @JsonKey(
        readValue: _attendanceRecordItemStatusName,
        fromJson: _attendanceRecordItemStatusNameValue)
    String? statusName,
    @JsonKey(
        readValue: _attendanceRecordItemStatusCode,
        fromJson: _attendanceRecordItemStatusCodeValue)
    String? statusCode,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
  }) = _AttendanceRecordItemModel;

  factory AttendanceRecordItemModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordItemModelFromJson(json);
}

@Freezed(toJson: false)
class AttendanceDayDetailModel with _$AttendanceDayDetailModel {
  const factory AttendanceDayDetailModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
    String? attendanceDate,
    @JsonKey(
        readValue: _attendanceDayDetailCourseName,
        fromJson: _attendanceDayDetailCourseNameValue)
    String? courseName,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(
        readValue: _attendanceDayDetailCourseFinished,
        fromJson: _attendanceDayDetailCourseFinishedValue)
    bool? courseFinished,
    @JsonKey(readValue: readJsonList) List<AttendanceGroupDayModel>? groups,
  }) = _AttendanceDayDetailModel;

  factory AttendanceDayDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDayDetailModelFromJson(json);
}

@Freezed(toJson: false)
class AttendanceGroupDayModel with _$AttendanceGroupDayModel {
  const factory AttendanceGroupDayModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(
        readValue: _attendanceGroupDayGroupName,
        fromJson: _attendanceGroupDayGroupNameValue)
    String? groupName,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(readValue: readJsonList) List<AttendanceRecordItemModel>? records,
  }) = _AttendanceGroupDayModel;

  factory AttendanceGroupDayModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceGroupDayModelFromJson(json);
}

@Freezed(toJson: false)
class TeacherAttendanceRecordModel with _$TeacherAttendanceRecordModel {
  const factory TeacherAttendanceRecordModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(
        readValue: _teacherAttendanceRecordTeacherId,
        fromJson: _teacherAttendanceRecordTeacherIdValue)
    int? teacherId,
    @JsonKey(
        readValue: _teacherAttendanceRecordTeacherName,
        fromJson: _teacherAttendanceRecordTeacherNameValue)
    String? teacherName,
    @JsonKey(
        readValue: _teacherAttendanceRecordStatusId,
        fromJson: _teacherAttendanceRecordStatusIdValue)
    int? statusId,
    @JsonKey(
        readValue: _teacherAttendanceRecordStatusName,
        fromJson: _teacherAttendanceRecordStatusNameValue)
    String? statusName,
    @JsonKey(
        readValue: _teacherAttendanceRecordStatusCode,
        fromJson: _teacherAttendanceRecordStatusCodeValue)
    String? statusCode,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
  }) = _TeacherAttendanceRecordModel;

  factory TeacherAttendanceRecordModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherAttendanceRecordModelFromJson(json);
}

@Freezed(toJson: false)
class TeacherAttendanceDayModel with _$TeacherAttendanceDayModel {
  const factory TeacherAttendanceDayModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
    String? attendanceDate,
    @JsonKey(
        readValue: _teacherAttendanceDayCourseName,
        fromJson: _teacherAttendanceDayCourseNameValue)
    String? courseName,
    @JsonKey(
        readValue: _teacherAttendanceDayCourseId,
        fromJson: _teacherAttendanceDayCourseIdValue)
    int? courseId,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(
        readValue: _teacherAttendanceDayRecordsCount,
        fromJson: _teacherAttendanceDayRecordsCountValue)
    int? recordsCount,
    @JsonKey(readValue: readJsonList)
    List<TeacherAttendanceRecordModel>? records,
  }) = _TeacherAttendanceDayModel;

  factory TeacherAttendanceDayModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherAttendanceDayModelFromJson(json);
}

@Freezed(toJson: false)
class MemorizationEntryModel with _$MemorizationEntryModel {
  const factory MemorizationEntryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(name: 'entry_type', fromJson: jsonStringValue) String? entryType,
    @JsonKey(name: 'from_page', fromJson: jsonIntLenient) int? fromPage,
    @JsonKey(name: 'to_page', fromJson: jsonIntLenient) int? toPage,
    @JsonKey(name: 'pages_count', fromJson: jsonIntLenient) int? pagesCount,
    @JsonKey(name: 'recorded_on', fromJson: jsonStringValue) String? recordedOn,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(readValue: readJsonMap) NamedRefModel? student,
    @JsonKey(name: 'group_name', fromJson: jsonStringLenient) String? groupName,
    @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
    String? courseName,
    @JsonKey(readValue: readJsonMap) NamedRefModel? teacher,
  }) = _MemorizationEntryModel;

  factory MemorizationEntryModel.fromJson(Map<String, dynamic> json) =>
      _$MemorizationEntryModelFromJson(json);
}

@Freezed(toJson: false)
class AwqafTestModel with _$AwqafTestModel {
  const factory AwqafTestModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonDoubleLenient) double? score,
    @JsonKey(name: 'tested_on', fromJson: jsonStringValue) String? testedOn,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
    String? typeName,
    @JsonKey(readValue: readJsonMap) NamedRefModel? student,
    @JsonKey(name: 'group_name', fromJson: jsonStringLenient) String? groupName,
    @JsonKey(readValue: readJsonMap) NamedRefModel? teacher,
    @JsonKey(readValue: readJsonMap) Map<String, dynamic>? juz,
  }) = _AwqafTestModel;

  factory AwqafTestModel.fromJson(Map<String, dynamic> json) =>
      _$AwqafTestModelFromJson(json);
}

@Freezed(toJson: false)
class PointEntryModel with _$PointEntryModel {
  const factory PointEntryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(fromJson: jsonIntLenient) int? points,
    @JsonKey(
        readValue: _pointEntryPointTypeName,
        fromJson: _pointEntryPointTypeNameValue)
    String? pointTypeName,
    @JsonKey(
        readValue: _pointEntryPointTypeId,
        fromJson: _pointEntryPointTypeIdValue)
    int? pointTypeId,
    @JsonKey(name: 'entered_at', fromJson: jsonStringValue) String? enteredAt,
    @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
    String? effectiveState,
    @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) String? voidedAt,
    @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
    String? voidReason,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(name: 'source_type', fromJson: jsonStringValue) String? sourceType,
    @JsonKey(readValue: readJsonMap) NamedRefModel? student,
    @JsonKey(name: 'group_name', fromJson: jsonStringLenient) String? groupName,
  }) = _PointEntryModel;

  factory PointEntryModel.fromJson(Map<String, dynamic> json) =>
      _$PointEntryModelFromJson(json);
}

@Freezed(toJson: false)
class AssessmentSummaryModel with _$AssessmentSummaryModel {
  const factory AssessmentSummaryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? title,
    @JsonKey(
        readValue: _assessmentSummaryTypeName,
        fromJson: _assessmentSummaryTypeNameValue)
    String? typeName,
    @JsonKey(
        readValue: _assessmentSummaryGroupName,
        fromJson: _assessmentSummaryGroupNameValue)
    String? groupName,
    @JsonKey(
        readValue: _assessmentSummaryCourseName,
        fromJson: _assessmentSummaryCourseNameValue)
    String? courseName,
    @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
    String? scheduledAt,
    @JsonKey(name: 'due_at', fromJson: jsonStringLenient) String? dueAt,
    @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient) double? totalMark,
    @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient) double? passMark,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(name: 'results_count', fromJson: jsonIntLenient) int? resultsCount,
  }) = _AssessmentSummaryModel;

  factory AssessmentSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentSummaryModelFromJson(json);
}

@Freezed(toJson: false)
class AssessmentResultItemModel with _$AssessmentResultItemModel {
  const factory AssessmentResultItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(name: 'student_id', fromJson: jsonIntLenient) int? studentId,
    @JsonKey(name: 'student_name', fromJson: jsonStringValue)
    String? studentName,
    @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
    @JsonKey(fromJson: jsonDoubleLenient) double? score,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
    String? teacherName,
  }) = _AssessmentResultItemModel;

  factory AssessmentResultItemModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentResultItemModelFromJson(json);
}

@Freezed(toJson: false)
class AssessmentDetailModel with _$AssessmentDetailModel {
  const factory AssessmentDetailModel({
    @JsonKey(readValue: _assessmentDetailSummary)
    AssessmentSummaryModel? summary,
    @JsonKey(fromJson: jsonStringLenient) String? description,
    @JsonKey(readValue: readJsonList) List<NamedRefModel>? groups,
    @JsonKey(readValue: readJsonList) List<AssessmentResultItemModel>? results,
  }) = _AssessmentDetailModel;

  factory AssessmentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AssessmentDetailModelFromJson(json);
}

@Freezed(toJson: false)
class StudentNoteItemModel with _$StudentNoteItemModel {
  const factory StudentNoteItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? body,
    @JsonKey(name: 'noted_at', fromJson: jsonStringValue) String? notedAt,
    @JsonKey(fromJson: jsonStringValue) String? source,
    @JsonKey(fromJson: jsonStringValue) String? visibility,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(name: 'group_name', fromJson: jsonStringLenient) String? groupName,
    @JsonKey(readValue: readJsonMap) NamedRefModel? student,
    @JsonKey(readValue: readJsonMap) NamedRefModel? author,
  }) = _StudentNoteItemModel;

  factory StudentNoteItemModel.fromJson(Map<String, dynamic> json) =>
      _$StudentNoteItemModelFromJson(json);
}

@Freezed(toJson: false)
class CurriculumResourceModel with _$CurriculumResourceModel {
  const factory CurriculumResourceModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'book_name', fromJson: jsonStringValue) String? bookName,
    @JsonKey(fromJson: jsonStringLenient) String? author,
    @JsonKey(fromJson: jsonStringLenient) String? publisher,
    @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
    String? editionNumber,
    @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
    String? publishedOn,
    @JsonKey(
        readValue: _curriculumResourceDownloadable,
        fromJson: _curriculumResourceDownloadableValue)
    bool? downloadable,
  }) = _CurriculumResourceModel;

  factory CurriculumResourceModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumResourceModelFromJson(json);
}

@Freezed(toJson: false)
class CurriculumSummaryModel with _$CurriculumSummaryModel {
  const factory CurriculumSummaryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(
        readValue: _curriculumSummaryCourseName,
        fromJson: _curriculumSummaryCourseNameValue)
    String? courseName,
    @JsonKey(
        readValue: _curriculumSummaryGradeLevelName,
        fromJson: _curriculumSummaryGradeLevelNameValue)
    String? gradeLevelName,
    @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
    @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
    int? subjectsCount,
  }) = _CurriculumSummaryModel;

  factory CurriculumSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumSummaryModelFromJson(json);
}

@Freezed(toJson: false)
class CurriculumLessonModel with _$CurriculumLessonModel {
  const factory CurriculumLessonModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
    int? chapterNumber,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(fromJson: jsonStringValue) String? importance,
    @JsonKey(name: 'page_count', fromJson: jsonIntLenient) int? pageCount,
    @JsonKey(readValue: readJsonList) List<NamedRefModel>? topics,
    @JsonKey(readValue: readJsonMap) CurriculumResourceModel? resource,
  }) = _CurriculumLessonModel;

  factory CurriculumLessonModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumLessonModelFromJson(json);
}

@Freezed(toJson: false)
class CurriculumSubjectModel with _$CurriculumSubjectModel {
  const factory CurriculumSubjectModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(readValue: readJsonList) List<CurriculumLessonModel>? lessons,
  }) = _CurriculumSubjectModel;

  factory CurriculumSubjectModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumSubjectModelFromJson(json);
}

@Freezed(toJson: false)
class CurriculumDetailModel with _$CurriculumDetailModel {
  const factory CurriculumDetailModel({
    @JsonKey(readValue: _curriculumDetailSummary)
    CurriculumSummaryModel? summary,
    @JsonKey(name: 'standalone_resources', readValue: readJsonList)
    List<CurriculumResourceModel>? standaloneResources,
    @JsonKey(readValue: readJsonList) List<CurriculumSubjectModel>? subjects,
  }) = _CurriculumDetailModel;

  factory CurriculumDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CurriculumDetailModelFromJson(json);
}

@Freezed(toJson: false)
class GroupCurriculumLessonModel with _$GroupCurriculumLessonModel {
  const factory GroupCurriculumLessonModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'taught_on', fromJson: jsonStringLenient) String? taughtOn,
    @JsonKey(fromJson: jsonStringLenient) String? teacher,
    @JsonKey(name: 'page_count', fromJson: jsonIntLenient) int? pageCount,
  }) = _GroupCurriculumLessonModel;

  factory GroupCurriculumLessonModel.fromJson(Map<String, dynamic> json) =>
      _$GroupCurriculumLessonModelFromJson(json);
}

@Freezed(toJson: false)
class GroupCurriculumSubjectModel with _$GroupCurriculumSubjectModel {
  const factory GroupCurriculumSubjectModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(fromJson: jsonDoubleLenient) double? percentage,
    @JsonKey(readValue: readJsonList) List<GroupCurriculumLessonModel>? lessons,
  }) = _GroupCurriculumSubjectModel;

  factory GroupCurriculumSubjectModel.fromJson(Map<String, dynamic> json) =>
      _$GroupCurriculumSubjectModelFromJson(json);
}

@Freezed(toJson: false)
class GroupCurriculumModel with _$GroupCurriculumModel {
  const factory GroupCurriculumModel({
    @JsonKey(
        readValue: _groupCurriculumCurriculumName,
        fromJson: _groupCurriculumCurriculumNameValue)
    String? curriculumName,
    @JsonKey(
        readValue: _groupCurriculumGroupName,
        fromJson: _groupCurriculumGroupNameValue)
    String? groupName,
    @JsonKey(
        readValue: _groupCurriculumPercentage,
        fromJson: _groupCurriculumPercentageValue)
    double? percentage,
    @JsonKey(
        readValue: _groupCurriculumTotal, fromJson: _groupCurriculumTotalValue)
    int? total,
    @JsonKey(
        readValue: _groupCurriculumCompleted,
        fromJson: _groupCurriculumCompletedValue)
    double? completed,
    @JsonKey(readValue: readJsonList)
    List<GroupCurriculumSubjectModel>? subjects,
  }) = _GroupCurriculumModel;

  factory GroupCurriculumModel.fromJson(Map<String, dynamic> json) =>
      _$GroupCurriculumModelFromJson(json);
}
