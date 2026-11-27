// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/models/quran_test_model.dart';

part 'student_progress_model.freezed.dart';
part 'student_progress_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.

Object? _studentProfileInfoHasPhoto(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(json['photo_endpoint']) != null;
}

bool? _studentProfileInfoHasPhotoValue(Object? v) => v as bool?;

Object? _studentFileItemUploadedByName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['uploaded_by'])?['name']);
}

String? _studentFileItemUploadedByNameValue(Object? v) => v as String?;

@Freezed(toJson: false)
class StudentProfileInfoModel with _$StudentProfileInfoModel {
  const factory StudentProfileInfoModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
    String? studentNumber,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'birth_date', fromJson: jsonStringLenient) String? birthDate,
    @JsonKey(name: 'grade_level', readValue: readJsonMap)
    NamedRefModel? gradeLevel,
    @JsonKey(readValue: readJsonMap) NamedRefModel? parent,
    @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
    int? quranCurrentJuz,
    @JsonKey(
        readValue: _studentProfileInfoHasPhoto,
        fromJson: _studentProfileInfoHasPhotoValue)
    bool? hasPhoto,
  }) = _StudentProfileInfoModel;

  factory StudentProfileInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileInfoModelFromJson(json);
}

@Freezed(toJson: false)
class StudentEnrollmentInfoModel with _$StudentEnrollmentInfoModel {
  const factory StudentEnrollmentInfoModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
    String? enrolledAt,
    @JsonKey(name: 'left_at', fromJson: jsonStringLenient) String? leftAt,
    @JsonKey(readValue: readJsonMap) NamedRefModel? group,
    @JsonKey(readValue: readJsonMap) NamedRefModel? course,
    @JsonKey(readValue: readJsonMap) NamedRefModel? teacher,
  }) = _StudentEnrollmentInfoModel;

  factory StudentEnrollmentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StudentEnrollmentInfoModelFromJson(json);
}

@Freezed(toJson: false)
class StudentProgressStatsModel with _$StudentProgressStatsModel {
  const factory StudentProgressStatsModel({
    @JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
    double? assessmentAverage,
    @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
    int? attendanceDays,
    @JsonKey(fromJson: jsonIntLenient) int? files,
    @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
    int? memorizedPages,
    @JsonKey(fromJson: jsonIntLenient) int? notes,
    @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
    int? passedFinalTests,
    @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
    int? passedPartialTests,
    @JsonKey(fromJson: jsonIntLenient) int? points,
  }) = _StudentProgressStatsModel;

  factory StudentProgressStatsModel.fromJson(Map<String, dynamic> json) =>
      _$StudentProgressStatsModelFromJson(json);
}

@Freezed(toJson: false)
class StudentProgressModel with _$StudentProgressModel {
  const factory StudentProgressModel({
    @JsonKey(readValue: readJsonMap) StudentProfileInfoModel? profile,
    @JsonKey(readValue: readJsonList)
    List<StudentEnrollmentInfoModel>? enrollments,
    @JsonKey(readValue: readJsonMap) StudentProgressStatsModel? stats,
  }) = _StudentProgressModel;

  factory StudentProgressModel.fromJson(Map<String, dynamic> json) =>
      _$StudentProgressModelFromJson(json);
}

@Freezed(toJson: false)
class StudentFileItemModel with _$StudentFileItemModel {
  const factory StudentFileItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'file_type', fromJson: jsonStringValue) String? fileType,
    @JsonKey(name: 'original_name', fromJson: jsonStringValue)
    String? originalName,
    @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
    String? uploadedAt,
    @JsonKey(
        readValue: _studentFileItemUploadedByName,
        fromJson: _studentFileItemUploadedByNameValue)
    String? uploadedByName,
  }) = _StudentFileItemModel;

  factory StudentFileItemModel.fromJson(Map<String, dynamic> json) =>
      _$StudentFileItemModelFromJson(json);
}
