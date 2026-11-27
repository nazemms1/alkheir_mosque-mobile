// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operations_params.freezed.dart';
part 'operations_params.g.dart';

@freezed
class AddManualPointsParams with _$AddManualPointsParams {
  @JsonSerializable(includeIfNull: false)
  const factory AddManualPointsParams({
    @JsonKey(name: 'point_type_id', includeIfNull: true) int? pointTypeId,
    @JsonKey(includeIfNull: true) int? points,
    String? notes,
  }) = _AddManualPointsParams;

  factory AddManualPointsParams.fromJson(Map<String, dynamic> json) =>
      _$AddManualPointsParamsFromJson(json);
}

@freezed
class CreateStudentNoteParams with _$CreateStudentNoteParams {
  @JsonSerializable(includeIfNull: false)
  const factory CreateStudentNoteParams({
    @JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
    @JsonKey(includeIfNull: true) String? body,
    @JsonKey(name: 'noted_at', includeIfNull: true) String? notedAt,
    @JsonKey(includeIfNull: true) String? source,
    @JsonKey(includeIfNull: true) String? visibility,
    @JsonKey(name: 'enrollment_id') int? enrollmentId,
  }) = _CreateStudentNoteParams;

  factory CreateStudentNoteParams.fromJson(Map<String, dynamic> json) =>
      _$CreateStudentNoteParamsFromJson(json);
}

@freezed
class RecordAwqafTestParams with _$RecordAwqafTestParams {
  @JsonSerializable(includeIfNull: false)
  const factory RecordAwqafTestParams({
    @JsonKey(name: 'juz_id', includeIfNull: true) int? juzId,
    @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
    int? quranTestTypeId,
    @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
    @JsonKey(includeIfNull: true) String? status,
    double? score,
    @JsonKey(name: 'teacher_id') int? teacherId,
    String? notes,
  }) = _RecordAwqafTestParams;

  factory RecordAwqafTestParams.fromJson(Map<String, dynamic> json) =>
      _$RecordAwqafTestParamsFromJson(json);
}

@freezed
class RecordMemorizationParams with _$RecordMemorizationParams {
  @JsonSerializable(includeIfNull: false)
  const factory RecordMemorizationParams({
    @JsonKey(name: 'entry_type', includeIfNull: true) String? entryType,
    @JsonKey(name: 'from_page', includeIfNull: true) int? fromPage,
    @JsonKey(name: 'to_page', includeIfNull: true) int? toPage,
    @JsonKey(name: 'recorded_on', includeIfNull: true) String? recordedOn,
    @JsonKey(name: 'teacher_id') int? teacherId,
    String? notes,
  }) = _RecordMemorizationParams;

  factory RecordMemorizationParams.fromJson(Map<String, dynamic> json) =>
      _$RecordMemorizationParamsFromJson(json);
}

@freezed
class RecordTeacherAttendanceParams with _$RecordTeacherAttendanceParams {
  @JsonSerializable(includeIfNull: false)
  const factory RecordTeacherAttendanceParams({
    @JsonKey(name: 'attendance_date', includeIfNull: true)
    String? attendanceDate,
    @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
    @JsonKey(includeIfNull: true) Object? records,
    String? notes,
  }) = _RecordTeacherAttendanceParams;

  factory RecordTeacherAttendanceParams.fromJson(Map<String, dynamic> json) =>
      _$RecordTeacherAttendanceParamsFromJson(json);
}

@freezed
class SaveAssessmentResultsParams with _$SaveAssessmentResultsParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveAssessmentResultsParams({
    @JsonKey(includeIfNull: true) Object? results,
  }) = _SaveAssessmentResultsParams;

  factory SaveAssessmentResultsParams.fromJson(Map<String, dynamic> json) =>
      _$SaveAssessmentResultsParamsFromJson(json);
}

@freezed
class SaveEnrollmentParams with _$SaveEnrollmentParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveEnrollmentParams({
    @JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
    @JsonKey(name: 'group_id', includeIfNull: true) int? groupId,
    @JsonKey(name: 'enrolled_at', includeIfNull: true) String? enrolledAt,
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(name: 'left_at', includeIfNull: true) String? leftAt,
    @JsonKey(includeIfNull: true) String? notes,
  }) = _SaveEnrollmentParams;

  factory SaveEnrollmentParams.fromJson(Map<String, dynamic> json) =>
      _$SaveEnrollmentParamsFromJson(json);
}

@freezed
class SaveGroupParams with _$SaveGroupParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveGroupParams({
    @JsonKey(includeIfNull: true) String? name,
    @JsonKey(name: 'academic_year_id', includeIfNull: true) int? academicYearId,
    @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
    @JsonKey(name: 'teacher_id', includeIfNull: true) int? teacherId,
    @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
    int? assistantTeacherId,
    @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
    @JsonKey(includeIfNull: true) Object? capacity,
    @JsonKey(name: 'monthly_fee', includeIfNull: true) double? monthlyFee,
    @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
    @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
    @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive,
  }) = _SaveGroupParams;

  factory SaveGroupParams.fromJson(Map<String, dynamic> json) =>
      _$SaveGroupParamsFromJson(json);
}

@freezed
class SaveStudentParams with _$SaveStudentParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveStudentParams({
    @JsonKey(name: 'first_name', includeIfNull: true) String? firstName,
    @JsonKey(name: 'last_name', includeIfNull: true) String? lastName,
    @JsonKey(name: 'birth_date', includeIfNull: true) String? birthDate,
    @JsonKey(name: 'parent_id', includeIfNull: true) int? parentId,
    @JsonKey(includeIfNull: true) String? gender,
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
    @JsonKey(name: 'joined_at', includeIfNull: true) String? joinedAt,
    @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
    int? quranCurrentJuzId,
    @JsonKey(name: 'school_name', includeIfNull: true) String? schoolName,
    @JsonKey(includeIfNull: true) String? notes,
  }) = _SaveStudentParams;

  factory SaveStudentParams.fromJson(Map<String, dynamic> json) =>
      _$SaveStudentParamsFromJson(json);
}

@freezed
class SetStudentAttendanceDayStatusParams
    with _$SetStudentAttendanceDayStatusParams {
  @JsonSerializable(includeIfNull: false)
  const factory SetStudentAttendanceDayStatusParams({
    @JsonKey(includeIfNull: true) String? status,
  }) = _SetStudentAttendanceDayStatusParams;

  factory SetStudentAttendanceDayStatusParams.fromJson(
          Map<String, dynamic> json) =>
      _$SetStudentAttendanceDayStatusParamsFromJson(json);
}

@freezed
class TakeGroupAttendanceParams with _$TakeGroupAttendanceParams {
  @JsonSerializable(includeIfNull: false)
  const factory TakeGroupAttendanceParams({
    @JsonKey(name: 'attendance_date', includeIfNull: true)
    String? attendanceDate,
    @JsonKey(includeIfNull: true) Object? records,
    String? notes,
  }) = _TakeGroupAttendanceParams;

  factory TakeGroupAttendanceParams.fromJson(Map<String, dynamic> json) =>
      _$TakeGroupAttendanceParamsFromJson(json);
}

@freezed
class UpdateLessonTaughtParams with _$UpdateLessonTaughtParams {
  @JsonSerializable(includeIfNull: false)
  const factory UpdateLessonTaughtParams({
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(name: 'is_taught', includeIfNull: true) bool? isTaught,
  }) = _UpdateLessonTaughtParams;

  factory UpdateLessonTaughtParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateLessonTaughtParamsFromJson(json);
}

@freezed
class UpdateStudentNoteParams with _$UpdateStudentNoteParams {
  @JsonSerializable(includeIfNull: false)
  const factory UpdateStudentNoteParams({
    @JsonKey(includeIfNull: true) String? body,
    @JsonKey(name: 'noted_at', includeIfNull: true) String? notedAt,
    @JsonKey(includeIfNull: true) String? source,
    @JsonKey(includeIfNull: true) String? visibility,
  }) = _UpdateStudentNoteParams;

  factory UpdateStudentNoteParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateStudentNoteParamsFromJson(json);
}

@freezed
class PatchLessonTaughtParams with _$PatchLessonTaughtParams {
  @JsonSerializable(includeIfNull: false)
  const factory PatchLessonTaughtParams({
    @JsonKey(includeIfNull: true) String? status,
  }) = _PatchLessonTaughtParams;

  factory PatchLessonTaughtParams.fromJson(Map<String, dynamic> json) =>
      _$PatchLessonTaughtParamsFromJson(json);
}
