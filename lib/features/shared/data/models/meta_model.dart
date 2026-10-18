// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_model.freezed.dart';
part 'meta_model.g.dart';

@freezed
class MetaModel with _$MetaModel {
  const factory MetaModel({
    int? total,
    int? limit,
    int? offset,
    @JsonKey(name: 'has_more') bool? hasMore,
  }) = _MetaModel;

  factory MetaModel.fromJson(Map<String, dynamic> json) => _$MetaModelFromJson(json);
}
