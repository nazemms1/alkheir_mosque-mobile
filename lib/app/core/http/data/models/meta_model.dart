// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'meta_model.freezed.dart';
part 'meta_model.g.dart';

@freezed
class MetaModel with _$MetaModel {
  const factory MetaModel({
    @JsonKey(fromJson: jsonIntLenient) int? total,
    @JsonKey(fromJson: jsonIntLenient) int? limit,
    @JsonKey(fromJson: jsonIntLenient) int? offset,
    @JsonKey(name: 'has_more', fromJson: jsonBoolLenient) bool? hasMore,
    @JsonKey(name: 'current_page', fromJson: jsonIntLenient) int? currentPage,
    @JsonKey(name: 'last_page', fromJson: jsonIntLenient) int? lastPage,
    @JsonKey(name: 'per_page', fromJson: jsonIntLenient) int? perPage,
  }) = _MetaModel;

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
}
