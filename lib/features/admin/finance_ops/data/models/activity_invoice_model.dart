// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/models/quran_test_model.dart';

part 'activity_invoice_model.freezed.dart';
part 'activity_invoice_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.
String? _nameOf(Object? json) => jsonStringOrNull(jsonMap(json)?['name']);
String? _parentNameOf(Object? parent) =>
    parent is Map ? jsonStringOrNull(parent['name']) : jsonStringOrNull(parent);

Object? _activitySummaryGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = jsonMap(json['group']);
  return jsonStringOrNull(group?['name']);
}

String? _activitySummaryGroupNameValue(Object? v) => v as String?;

Object? _activitySummaryCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = jsonMap(json['group']);
  return jsonStringOrNull(group?['course_name']);
}

String? _activitySummaryCourseNameValue(Object? v) => v as String?;

Object? _activityDetailSummary(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonMap(json);
}

Object? _activityRegistrationStudentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = jsonMap(json['student']);
  return jsonIntOrNull(student?['id']);
}

int? _activityRegistrationStudentIdValue(Object? v) => v as int?;

Object? _activityRegistrationStudentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = jsonMap(json['student']);
  return jsonString(student?['name']);
}

String? _activityRegistrationStudentNameValue(Object? v) => v as String?;

Object? _activityPaymentStudentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonString(jsonMap(json['student'])?['name']);
}

String? _activityPaymentStudentNameValue(Object? v) => v as String?;

Object? _activityPaymentPaymentMethodName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['payment_method']);
}

String? _activityPaymentPaymentMethodNameValue(Object? v) => v as String?;

Object? _activityExpenseCategoryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final category = jsonMap(json['expense_category']);
  return jsonIntOrNull(category?['id']);
}

int? _activityExpenseCategoryIdValue(Object? v) => v as int?;

Object? _activityExpenseCategoryName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final category = jsonMap(json['expense_category']);
  return jsonStringOrNull(category?['name']);
}

String? _activityExpenseCategoryNameValue(Object? v) => v as String?;

Object? _invoiceSummaryParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'];
  return parent is Map
      ? jsonStringOrNull(parent['name'])
      : jsonStringOrNull(parent);
}

String? _invoiceSummaryParentNameValue(Object? v) => v as String?;

Object? _invoiceItemRecordStudentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['student'])?['name']);
}

String? _invoiceItemRecordStudentNameValue(Object? v) => v as String?;

Object? _invoicePaymentRecordInvoiceNo(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final invoice = jsonMap(json['invoice']);
  return jsonStringOrNull(invoice?['invoice_no']);
}

String? _invoicePaymentRecordInvoiceNoValue(Object? v) => v as String?;

Object? _invoicePaymentRecordParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final invoice = jsonMap(json['invoice']);
  return jsonStringOrNull(invoice?['parent_name']);
}

String? _invoicePaymentRecordParentNameValue(Object? v) => v as String?;

Object? _invoicePaymentRecordPaymentMethodName(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _nameOf(json['payment_method']);
}

String? _invoicePaymentRecordPaymentMethodNameValue(Object? v) => v as String?;

Object? _invoiceDetailParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return _parentNameOf(json['parent']);
}

String? _invoiceDetailParentNameValue(Object? v) => v as String?;

@Freezed(toJson: false)
class ActivitySummaryModel with _$ActivitySummaryModel {
  const factory ActivitySummaryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? title,
    @JsonKey(fromJson: jsonStringLenient) String? description,
    @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
    String? activityDate,
    @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient) double? feeAmount,
    @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
    double? expectedRevenue,
    @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
    double? collectedRevenue,
    @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
    double? expenseTotal,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(
        readValue: _activitySummaryGroupName,
        fromJson: _activitySummaryGroupNameValue)
    String? groupName,
    @JsonKey(
        readValue: _activitySummaryCourseName,
        fromJson: _activitySummaryCourseNameValue)
    String? courseName,
  }) = _ActivitySummaryModel;

  factory ActivitySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ActivitySummaryModelFromJson(json);
}

@Freezed(toJson: false)
class ActivityDetailModel with _$ActivityDetailModel {
  const factory ActivityDetailModel({
    @JsonKey(readValue: _activityDetailSummary) ActivitySummaryModel? summary,
    @JsonKey(fromJson: jsonStringLenient) String? status,
    @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
    String? audienceScope,
    @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
    int? registrationsCount,
    @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
    int? paymentsCount,
    @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
    int? expensesCount,
    @JsonKey(name: 'target_groups', readValue: readJsonList)
    List<NamedRefModel>? targetGroups,
  }) = _ActivityDetailModel;

  factory ActivityDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailModelFromJson(json);
}

@Freezed(toJson: false)
class ActivityRegistrationModel with _$ActivityRegistrationModel {
  const factory ActivityRegistrationModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(
        readValue: _activityRegistrationStudentId,
        fromJson: _activityRegistrationStudentIdValue)
    int? studentId,
    @JsonKey(
        readValue: _activityRegistrationStudentName,
        fromJson: _activityRegistrationStudentNameValue)
    String? studentName,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(name: 'group_name', fromJson: jsonStringLenient) String? groupName,
    @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient) double? feeAmount,
    @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient) double? paidTotal,
    @JsonKey(fromJson: jsonDoubleLenient) double? balance,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
  }) = _ActivityRegistrationModel;

  factory ActivityRegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityRegistrationModelFromJson(json);
}

@Freezed(toJson: false)
class ActivityPaymentModel with _$ActivityPaymentModel {
  const factory ActivityPaymentModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
    int? registrationId,
    @JsonKey(
        readValue: _activityPaymentStudentName,
        fromJson: _activityPaymentStudentNameValue)
    String? studentName,
    @JsonKey(fromJson: jsonDoubleLenient) double? amount,
    @JsonKey(name: 'paid_at', fromJson: jsonStringValue) String? paidAt,
    @JsonKey(
        readValue: _activityPaymentPaymentMethodName,
        fromJson: _activityPaymentPaymentMethodNameValue)
    String? paymentMethodName,
    @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
    String? referenceNo,
    @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) String? voidedAt,
  }) = _ActivityPaymentModel;

  factory ActivityPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityPaymentModelFromJson(json);
}

@Freezed(toJson: false)
class ActivityExpenseModel with _$ActivityExpenseModel {
  const factory ActivityExpenseModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonDoubleLenient) double? amount,
    @JsonKey(fromJson: jsonStringValue) String? description,
    @JsonKey(
        readValue: _activityExpenseCategoryId,
        fromJson: _activityExpenseCategoryIdValue)
    int? categoryId,
    @JsonKey(
        readValue: _activityExpenseCategoryName,
        fromJson: _activityExpenseCategoryNameValue)
    String? categoryName,
    @JsonKey(name: 'spent_on', fromJson: jsonStringValue) String? spentOn,
  }) = _ActivityExpenseModel;

  factory ActivityExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityExpenseModelFromJson(json);
}

@Freezed(toJson: false)
class InvoiceSummaryModel with _$InvoiceSummaryModel {
  const factory InvoiceSummaryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) String? invoiceNo,
    @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
    String? invoiceType,
    @JsonKey(name: 'issue_date', fromJson: jsonStringValue) String? issueDate,
    @JsonKey(name: 'due_date', fromJson: jsonStringLenient) String? dueDate,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonDoubleLenient) double? total,
    @JsonKey(fromJson: jsonDoubleLenient) double? discount,
    @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient) double? paidTotal,
    @JsonKey(fromJson: jsonDoubleLenient) double? balance,
    @JsonKey(name: 'items_count', fromJson: jsonIntLenient) int? itemsCount,
    @JsonKey(
        readValue: _invoiceSummaryParentName,
        fromJson: _invoiceSummaryParentNameValue)
    String? parentName,
  }) = _InvoiceSummaryModel;

  factory InvoiceSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSummaryModelFromJson(json);
}

@Freezed(toJson: false)
class InvoiceItemRecordModel with _$InvoiceItemRecordModel {
  const factory InvoiceItemRecordModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? description,
    @JsonKey(fromJson: jsonDoubleLenient) double? quantity,
    @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient) double? unitPrice,
    @JsonKey(fromJson: jsonDoubleLenient) double? amount,
    @JsonKey(
        readValue: _invoiceItemRecordStudentName,
        fromJson: _invoiceItemRecordStudentNameValue)
    String? studentName,
    @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient) int? enrollmentId,
    @JsonKey(name: 'activity_id', fromJson: jsonIntLenient) int? activityId,
    @JsonKey(name: 'group_name', fromJson: jsonStringLenient) String? groupName,
  }) = _InvoiceItemRecordModel;

  factory InvoiceItemRecordModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemRecordModelFromJson(json);
}

@Freezed(toJson: false)
class InvoicePaymentRecordModel with _$InvoicePaymentRecordModel {
  const factory InvoicePaymentRecordModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient) int? invoiceId,
    @JsonKey(
        readValue: _invoicePaymentRecordInvoiceNo,
        fromJson: _invoicePaymentRecordInvoiceNoValue)
    String? invoiceNo,
    @JsonKey(
        readValue: _invoicePaymentRecordParentName,
        fromJson: _invoicePaymentRecordParentNameValue)
    String? parentName,
    @JsonKey(fromJson: jsonDoubleLenient) double? amount,
    @JsonKey(name: 'paid_at', fromJson: jsonStringValue) String? paidAt,
    @JsonKey(
        readValue: _invoicePaymentRecordPaymentMethodName,
        fromJson: _invoicePaymentRecordPaymentMethodNameValue)
    String? paymentMethodName,
    @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
    String? referenceNo,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) String? voidedAt,
    @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
    String? voidReason,
  }) = _InvoicePaymentRecordModel;

  factory InvoicePaymentRecordModel.fromJson(Map<String, dynamic> json) =>
      _$InvoicePaymentRecordModelFromJson(json);
}

@Freezed(toJson: false)
class InvoiceDetailModel with _$InvoiceDetailModel {
  const factory InvoiceDetailModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) String? invoiceNo,
    @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
    String? invoiceType,
    @JsonKey(name: 'issue_date', fromJson: jsonStringValue) String? issueDate,
    @JsonKey(name: 'due_date', fromJson: jsonStringLenient) String? dueDate,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(fromJson: jsonDoubleLenient) double? subtotal,
    @JsonKey(fromJson: jsonDoubleLenient) double? discount,
    @JsonKey(fromJson: jsonDoubleLenient) double? total,
    @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient) double? paidTotal,
    @JsonKey(fromJson: jsonDoubleLenient) double? balance,
    @JsonKey(
        readValue: _invoiceDetailParentName,
        fromJson: _invoiceDetailParentNameValue)
    String? parentName,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(readValue: readJsonList) List<InvoiceItemRecordModel>? items,
    @JsonKey(readValue: readJsonList) List<InvoicePaymentRecordModel>? payments,
  }) = _InvoiceDetailModel;

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);
}
