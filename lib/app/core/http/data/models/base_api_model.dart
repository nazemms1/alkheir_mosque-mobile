import 'package:json_annotation/json_annotation.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/app/core/http/data/models/meta_model.dart';

part 'base_api_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseApiModel<T> {
  final T? data;
  final bool? success;
  final String? message;
  final int? code;
  final MetaModel? meta;

  /// ورقة صفحات Laravel غير المغلّفة (`current_page`, `last_page`, `total`).
  @JsonKey(name: 'current_page', fromJson: jsonIntLenient)
  final int? currentPage;
  @JsonKey(name: 'last_page', fromJson: jsonIntLenient)
  final int? lastPage;
  @JsonKey(fromJson: jsonIntLenient)
  final int? total;

  BaseApiModel({
    this.data,
    this.success,
    this.message,
    this.code,
    this.meta,
    this.currentPage,
    this.lastPage,
    this.total,
  });

  factory BaseApiModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseApiModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJson) =>
      _$BaseApiModelToJson(this, toJson);
}
