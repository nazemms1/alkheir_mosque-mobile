// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_params.freezed.dart';
part 'student_params.g.dart';

@freezed
class RespondToActivityParams with _$RespondToActivityParams {
  @JsonSerializable(includeIfNull: false)
  const factory RespondToActivityParams({
    @JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
    @JsonKey(includeIfNull: true) String? response,
  }) = _RespondToActivityParams;

  factory RespondToActivityParams.fromJson(Map<String, dynamic> json) =>
      _$RespondToActivityParamsFromJson(json);
}
