// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'management_params.freezed.dart';
part 'management_params.g.dart';

@freezed
class SaveCourseParams with _$SaveCourseParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveCourseParams({
    @JsonKey(includeIfNull: true) String? name,
    @JsonKey(name: 'academic_year_id', includeIfNull: true) int? academicYearId,
    @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
    @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
    @JsonKey(includeIfNull: true) String? description,
    @JsonKey(name: 'awards_points', includeIfNull: true) bool? awardsPoints,
    @JsonKey(name: 'is_default', includeIfNull: true) bool? isDefault,
  }) = _SaveCourseParams;

  factory SaveCourseParams.fromJson(Map<String, dynamic> json) =>
      _$SaveCourseParamsFromJson(json);
}

@freezed
class SaveParentParams with _$SaveParentParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveParentParams({
    @JsonKey(name: 'father_name', includeIfNull: true) String? fatherName,
    @JsonKey(name: 'father_work', includeIfNull: true) String? fatherWork,
    @JsonKey(name: 'father_phone', includeIfNull: true) String? fatherPhone,
    @JsonKey(name: 'mother_name', includeIfNull: true) String? motherName,
    @JsonKey(name: 'mother_phone', includeIfNull: true) String? motherPhone,
    @JsonKey(name: 'home_phone', includeIfNull: true) String? homePhone,
    @JsonKey(includeIfNull: true) String? address,
    @JsonKey(includeIfNull: true) String? notes,
    @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive,
  }) = _SaveParentParams;

  factory SaveParentParams.fromJson(Map<String, dynamic> json) =>
      _$SaveParentParamsFromJson(json);
}

@freezed
class SaveScheduleParams with _$SaveScheduleParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveScheduleParams({
    @JsonKey(name: 'day_of_week', includeIfNull: true) int? dayOfWeek,
    @JsonKey(name: 'time_slot', includeIfNull: true) String? timeSlot,
  }) = _SaveScheduleParams;

  factory SaveScheduleParams.fromJson(Map<String, dynamic> json) =>
      _$SaveScheduleParamsFromJson(json);
}

@freezed
class SaveTeacherParams with _$SaveTeacherParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveTeacherParams({
    @JsonKey(name: 'first_name', includeIfNull: true) String? firstName,
    @JsonKey(name: 'last_name', includeIfNull: true) String? lastName,
    @JsonKey(includeIfNull: true) String? phone,
    @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
    @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
    int? teacherJobTitleId,
    @JsonKey(name: 'hired_at', includeIfNull: true) String? hiredAt,
    @JsonKey(name: 'is_helping', includeIfNull: true) bool? isHelping,
    @JsonKey(includeIfNull: true) String? notes,
    @JsonKey(name: 'account_username', includeIfNull: true)
    String? accountUsername,
    @JsonKey(name: 'account_password') Object? accountPassword,
    @JsonKey(name: 'account_is_active', includeIfNull: true)
    bool? accountIsActive,
  }) = _SaveTeacherParams;

  factory SaveTeacherParams.fromJson(Map<String, dynamic> json) =>
      _$SaveTeacherParamsFromJson(json);
}
