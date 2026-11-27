// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'group_student_model.freezed.dart';
part 'group_student_model.g.dart';

@Freezed(toJson: false)
class GroupItemModel with _$GroupItemModel {
  const factory GroupItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(name: 'course', fromJson: jsonStringLenient) String? courseName,
    @JsonKey(name: 'teacher', fromJson: jsonStringLenient) String? teacherName,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
    int? enrollmentsCount,
  }) = _GroupItemModel;

  factory GroupItemModel.fromJson(Map<String, dynamic> json) =>
      _$GroupItemModelFromJson(json);
}

@Freezed(toJson: false)
class StudentListItemModel with _$StudentListItemModel {
  const factory StudentListItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
    @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
    @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
    String? studentNumber,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'parent', fromJson: jsonStringLenient) String? parentName,
    @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
    String? gradeLevel,
  }) = _StudentListItemModel;

  factory StudentListItemModel.fromJson(Map<String, dynamic> json) =>
      _$StudentListItemModelFromJson(json);
}
