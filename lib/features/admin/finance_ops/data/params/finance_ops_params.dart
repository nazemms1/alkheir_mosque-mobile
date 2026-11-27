// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finance_ops_params.freezed.dart';
part 'finance_ops_params.g.dart';

@freezed
class AddActivityPaymentParams with _$AddActivityPaymentParams {
  @JsonSerializable(includeIfNull: false)
  const factory AddActivityPaymentParams({
    @JsonKey(name: 'activity_registration_id', includeIfNull: true)
    int? activityRegistrationId,
    @JsonKey(includeIfNull: true) double? amount,
    @JsonKey(name: 'paid_at', includeIfNull: true) String? paidAt,
    @JsonKey(name: 'payment_method_id', includeIfNull: true)
    int? paymentMethodId,
    @JsonKey(name: 'reference_no') String? referenceNo,
    String? notes,
  }) = _AddActivityPaymentParams;

  factory AddActivityPaymentParams.fromJson(Map<String, dynamic> json) =>
      _$AddActivityPaymentParamsFromJson(json);
}

@freezed
class AddInvoiceItemParams with _$AddInvoiceItemParams {
  @JsonSerializable(includeIfNull: false)
  const factory AddInvoiceItemParams({
    @JsonKey(includeIfNull: true) String? description,
    @JsonKey(includeIfNull: true) double? quantity,
    @JsonKey(name: 'unit_price', includeIfNull: true) double? unitPrice,
    @JsonKey(name: 'student_id') int? studentId,
    @JsonKey(name: 'enrollment_id') int? enrollmentId,
    @JsonKey(name: 'activity_id') int? activityId,
  }) = _AddInvoiceItemParams;

  factory AddInvoiceItemParams.fromJson(Map<String, dynamic> json) =>
      _$AddInvoiceItemParamsFromJson(json);
}

@freezed
class AddInvoicePaymentParams with _$AddInvoicePaymentParams {
  @JsonSerializable(includeIfNull: false)
  const factory AddInvoicePaymentParams({
    @JsonKey(includeIfNull: true) double? amount,
    @JsonKey(name: 'paid_at', includeIfNull: true) String? paidAt,
    @JsonKey(name: 'payment_method_id', includeIfNull: true)
    int? paymentMethodId,
    @JsonKey(name: 'reference_no') String? referenceNo,
    String? notes,
  }) = _AddInvoicePaymentParams;

  factory AddInvoicePaymentParams.fromJson(Map<String, dynamic> json) =>
      _$AddInvoicePaymentParamsFromJson(json);
}

@freezed
class SaveActivityExpenseParams with _$SaveActivityExpenseParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveActivityExpenseParams({
    @JsonKey(includeIfNull: true) double? amount,
    @JsonKey(includeIfNull: true) String? description,
    @JsonKey(name: 'expense_category_id', includeIfNull: true)
    int? expenseCategoryId,
    @JsonKey(name: 'spent_on', includeIfNull: true) String? spentOn,
  }) = _SaveActivityExpenseParams;

  factory SaveActivityExpenseParams.fromJson(Map<String, dynamic> json) =>
      _$SaveActivityExpenseParamsFromJson(json);
}

@freezed
class SaveRegistrationParams with _$SaveRegistrationParams {
  @JsonSerializable(includeIfNull: false)
  const factory SaveRegistrationParams({
    @JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
    @JsonKey(name: 'fee_amount', includeIfNull: true) double? feeAmount,
    @JsonKey(includeIfNull: true) String? status,
    @JsonKey(name: 'enrollment_id') int? enrollmentId,
    String? notes,
  }) = _SaveRegistrationParams;

  factory SaveRegistrationParams.fromJson(Map<String, dynamic> json) =>
      _$SaveRegistrationParamsFromJson(json);
}
