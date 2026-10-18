import 'package:json_annotation/json_annotation.dart';
import 'meta_model.dart';

part 'base_api_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseApiModel<T> {
  final T? data;
  final bool? success;
  final String? message;
  final int? code;
  final MetaModel? meta;

  BaseApiModel({
    this.data,
    this.success,
    this.message,
    this.code,
    this.meta,
  });

  factory BaseApiModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseApiModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJson) =>
      _$BaseApiModelToJson(this, toJson);
}
