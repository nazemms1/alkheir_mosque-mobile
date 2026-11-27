// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quran_tests_params.freezed.dart';
part 'quran_tests_params.g.dart';

@freezed
class RecordFinalAttemptParams with _$RecordFinalAttemptParams {
  @JsonSerializable(includeIfNull: false)
  const factory RecordFinalAttemptParams({
    @JsonKey(includeIfNull: true) double? score,
    @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
    String? notes,
    @JsonKey(name: 'teacher_id') int? teacherId,
  }) = _RecordFinalAttemptParams;

  factory RecordFinalAttemptParams.fromJson(Map<String, dynamic> json) =>
      _$RecordFinalAttemptParamsFromJson(json);
}

@freezed
class RecordPartialAttemptParams with _$RecordPartialAttemptParams {
  @JsonSerializable(includeIfNull: false)
  const factory RecordPartialAttemptParams({
    @JsonKey(name: 'mistake_count', includeIfNull: true) int? mistakeCount,
    @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
    String? notes,
    @JsonKey(name: 'teacher_id') int? teacherId,
  }) = _RecordPartialAttemptParams;

  factory RecordPartialAttemptParams.fromJson(Map<String, dynamic> json) =>
      _$RecordPartialAttemptParamsFromJson(json);
}

@freezed
class StartFinalParams with _$StartFinalParams {
  @JsonSerializable(includeIfNull: false)
  const factory StartFinalParams({
    @JsonKey(name: 'juz_id', includeIfNull: true) int? juzId,
  }) = _StartFinalParams;

  factory StartFinalParams.fromJson(Map<String, dynamic> json) =>
      _$StartFinalParamsFromJson(json);
}

@freezed
class StartPartialParams with _$StartPartialParams {
  @JsonSerializable(includeIfNull: false)
  const factory StartPartialParams({
    @JsonKey(name: 'juz_id', includeIfNull: true) int? juzId,
    @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
    bool? allowParallelCycle,
  }) = _StartPartialParams;

  factory StartPartialParams.fromJson(Map<String, dynamic> json) =>
      _$StartPartialParamsFromJson(json);
}
