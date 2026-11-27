// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'quran_test_model.freezed.dart';
part 'quran_test_model.g.dart';

@Freezed(toJson: false)
class QuranJuzModel with _$QuranJuzModel {
  const factory QuranJuzModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'juz_number', fromJson: jsonIntLenient) int? juzNumber,
    @JsonKey(name: 'from_page', fromJson: jsonIntLenient) int? fromPage,
    @JsonKey(name: 'to_page', fromJson: jsonIntLenient) int? toPage,
  }) = _QuranJuzModel;

  factory QuranJuzModel.fromJson(Map<String, dynamic> json) =>
      _$QuranJuzModelFromJson(json);
}

@Freezed(toJson: false)
class QuranTestGroupModel with _$QuranTestGroupModel {
  const factory QuranTestGroupModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
    String? courseName,
  }) = _QuranTestGroupModel;

  factory QuranTestGroupModel.fromJson(Map<String, dynamic> json) =>
      _$QuranTestGroupModelFromJson(json);
}

@Freezed(toJson: false)
class NamedRefModel with _$NamedRefModel {
  const factory NamedRefModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
  }) = _NamedRefModel;

  factory NamedRefModel.fromJson(Map<String, dynamic> json) =>
      _$NamedRefModelFromJson(json);
}

@Freezed(toJson: false)
class QuranPartialAttemptModel with _$QuranPartialAttemptModel {
  const factory QuranPartialAttemptModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
    @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient) int? mistakeCount,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) String? testedOn,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(readValue: readJsonMap) NamedRefModel? teacher,
  }) = _QuranPartialAttemptModel;

  factory QuranPartialAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$QuranPartialAttemptModelFromJson(json);
}

@Freezed(toJson: false)
class QuranPartialPartModel with _$QuranPartialPartModel {
  const factory QuranPartialPartModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'part_number', fromJson: jsonIntLenient) int? partNumber,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
    @JsonKey(readValue: readJsonList) List<QuranPartialAttemptModel>? attempts,
  }) = _QuranPartialPartModel;

  factory QuranPartialPartModel.fromJson(Map<String, dynamic> json) =>
      _$QuranPartialPartModelFromJson(json);
}

@Freezed(toJson: false)
class QuranPartialCycleModel with _$QuranPartialCycleModel {
  const factory QuranPartialCycleModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
    @JsonKey(readValue: readJsonMap) QuranJuzModel? juz,
    @JsonKey(readValue: readJsonMap) NamedRefModel? student,
    @JsonKey(readValue: readJsonMap) QuranTestGroupModel? group,
    @JsonKey(readValue: readJsonList) List<QuranPartialPartModel>? parts,
  }) = _QuranPartialCycleModel;

  factory QuranPartialCycleModel.fromJson(Map<String, dynamic> json) =>
      _$QuranPartialCycleModelFromJson(json);
}

@Freezed(toJson: false)
class QuranFinalAttemptModel with _$QuranFinalAttemptModel {
  const factory QuranFinalAttemptModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
    @JsonKey(fromJson: jsonDoubleLenient) double? score,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) String? testedOn,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(readValue: readJsonMap) NamedRefModel? teacher,
  }) = _QuranFinalAttemptModel;

  factory QuranFinalAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$QuranFinalAttemptModelFromJson(json);
}

@Freezed(toJson: false)
class QuranFinalCycleModel with _$QuranFinalCycleModel {
  const factory QuranFinalCycleModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
    @JsonKey(readValue: readJsonMap) QuranJuzModel? juz,
    @JsonKey(readValue: readJsonMap) NamedRefModel? student,
    @JsonKey(readValue: readJsonMap) QuranTestGroupModel? group,
    @JsonKey(readValue: readJsonList) List<QuranFinalAttemptModel>? attempts,
  }) = _QuranFinalCycleModel;

  factory QuranFinalCycleModel.fromJson(Map<String, dynamic> json) =>
      _$QuranFinalCycleModelFromJson(json);
}
