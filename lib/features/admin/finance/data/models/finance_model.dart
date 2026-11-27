// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'finance_model.freezed.dart';
part 'finance_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.

Object? _financeSummaryPendingRequests(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final pendingRaw = json['pending_requests'];
  final pending = <String, int>{};
  if (pendingRaw is Map) {
    pendingRaw.forEach((key, value) => pending['$key'] = jsonInt(value));
  }
  return pending;
}

Map<String, int>? _financeSummaryPendingRequestsValue(Object? v) =>
    v as Map<String, int>?;

Object? _ledgerEntryCategoryName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['category'])?['name']);
}

String? _ledgerEntryCategoryNameValue(Object? v) => v as String?;

Object? _ledgerEntryEnteredByName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['entered_by'])?['name']);
}

String? _ledgerEntryEnteredByNameValue(Object? v) => v as String?;

Object? _cashBoxTransferEnteredByName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['entered_by'])?['name']);
}

String? _cashBoxTransferEnteredByNameValue(Object? v) => v as String?;

Object? _currencyExchangeEnteredByName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['entered_by'])?['name']);
}

String? _currencyExchangeEnteredByNameValue(Object? v) => v as String?;

Object? _financeRequestItemCashBoxName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['cash_box'])?['name']);
}

String? _financeRequestItemCashBoxNameValue(Object? v) => v as String?;

Object? _financeRequestItemCategoryName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['category'])?['name']);
}

String? _financeRequestItemCategoryNameValue(Object? v) => v as String?;

Object? _financeRequestItemRequestedByName(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['requested_by'])?['name']);
}

String? _financeRequestItemRequestedByNameValue(Object? v) => v as String?;

Object? _financeRequestItemReviewedByName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return jsonStringOrNull(jsonMap(json['reviewed_by'])?['name']);
}

String? _financeRequestItemReviewedByNameValue(Object? v) => v as String?;

@Freezed(toJson: false)
class FinanceCurrencyModel with _$FinanceCurrencyModel {
  const factory FinanceCurrencyModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? code,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(fromJson: jsonStringValue) String? symbol,
  }) = _FinanceCurrencyModel;

  factory FinanceCurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$FinanceCurrencyModelFromJson(json);
}

@Freezed(toJson: false)
class CashBoxRefModel with _$CashBoxRefModel {
  const factory CashBoxRefModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(fromJson: jsonStringValue) String? code,
  }) = _CashBoxRefModel;

  factory CashBoxRefModel.fromJson(Map<String, dynamic> json) =>
      _$CashBoxRefModelFromJson(json);
}

@Freezed(toJson: false)
class CashBoxCurrencyBalanceModel with _$CashBoxCurrencyBalanceModel {
  const factory CashBoxCurrencyBalanceModel({
    @JsonKey(fromJson: jsonDoubleLenient) double? balance,
    @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
    double? localEquivalent,
    @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
  }) = _CashBoxCurrencyBalanceModel;

  factory CashBoxCurrencyBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$CashBoxCurrencyBalanceModelFromJson(json);
}

@Freezed(toJson: false)
class CashBoxBalanceModel with _$CashBoxBalanceModel {
  const factory CashBoxBalanceModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringValue) String? name,
    @JsonKey(fromJson: jsonStringValue) String? code,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
    double? localTotal,
    @JsonKey(readValue: readJsonList)
    List<CashBoxCurrencyBalanceModel>? currencies,
  }) = _CashBoxBalanceModel;

  factory CashBoxBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$CashBoxBalanceModelFromJson(json);
}

@Freezed(toJson: false)
class CurrencyTotalModel with _$CurrencyTotalModel {
  const factory CurrencyTotalModel({
    @JsonKey(fromJson: jsonDoubleLenient) double? balance,
    @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
  }) = _CurrencyTotalModel;

  factory CurrencyTotalModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyTotalModelFromJson(json);
}

@Freezed(toJson: false)
class FinanceSummaryModel with _$FinanceSummaryModel {
  const factory FinanceSummaryModel({
    @JsonKey(name: 'cash_boxes', readValue: readJsonList)
    List<CashBoxBalanceModel>? cashBoxes,
    @JsonKey(
        readValue: _financeSummaryPendingRequests,
        fromJson: _financeSummaryPendingRequestsValue)
    Map<String, int>? pendingRequests,
    @JsonKey(readValue: readJsonList) List<CurrencyTotalModel>? totals,
  }) = _FinanceSummaryModel;

  factory FinanceSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$FinanceSummaryModelFromJson(json);
}

@Freezed(toJson: false)
class LedgerEntryModel with _$LedgerEntryModel {
  const factory LedgerEntryModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
    String? transactionNo,
    @JsonKey(fromJson: jsonStringValue) String? type,
    @JsonKey(fromJson: jsonStringValue) String? direction,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
    String? transactionDate,
    @JsonKey(fromJson: jsonDoubleLenient) double? amount,
    @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
    double? signedAmount,
    @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
    double? localAmount,
    @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
    @JsonKey(name: 'cash_box', readValue: readJsonMap) CashBoxRefModel? cashBox,
    @JsonKey(
        readValue: _ledgerEntryCategoryName,
        fromJson: _ledgerEntryCategoryNameValue)
    String? categoryName,
    @JsonKey(fromJson: jsonStringLenient) String? description,
    @JsonKey(
        readValue: _ledgerEntryEnteredByName,
        fromJson: _ledgerEntryEnteredByNameValue)
    String? enteredByName,
    @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
    int? financeRequestId,
  }) = _LedgerEntryModel;

  factory LedgerEntryModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerEntryModelFromJson(json);
}

@Freezed(toJson: false)
class CashBoxTransferModel with _$CashBoxTransferModel {
  const factory CashBoxTransferModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'transfer_no', fromJson: jsonStringValue) String? transferNo,
    @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
    String? transferDate,
    @JsonKey(fromJson: jsonDoubleLenient) double? amount,
    @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
    @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
    CashBoxRefModel? fromCashBox,
    @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
    CashBoxRefModel? toCashBox,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(
        readValue: _cashBoxTransferEnteredByName,
        fromJson: _cashBoxTransferEnteredByNameValue)
    String? enteredByName,
  }) = _CashBoxTransferModel;

  factory CashBoxTransferModel.fromJson(Map<String, dynamic> json) =>
      _$CashBoxTransferModelFromJson(json);
}

@Freezed(toJson: false)
class CurrencyExchangeModel with _$CurrencyExchangeModel {
  const factory CurrencyExchangeModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'exchange_no', fromJson: jsonStringValue) String? exchangeNo,
    @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
    String? exchangeDate,
    @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
    double? fromAmount,
    @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient) double? toAmount,
    @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
    double? localAmount,
    @JsonKey(name: 'from_currency', readValue: readJsonMap)
    FinanceCurrencyModel? fromCurrency,
    @JsonKey(name: 'to_currency', readValue: readJsonMap)
    FinanceCurrencyModel? toCurrency,
    @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
    CashBoxRefModel? fromCashBox,
    @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
    CashBoxRefModel? toCashBox,
    @JsonKey(fromJson: jsonStringLenient) String? notes,
    @JsonKey(
        readValue: _currencyExchangeEnteredByName,
        fromJson: _currencyExchangeEnteredByNameValue)
    String? enteredByName,
  }) = _CurrencyExchangeModel;

  factory CurrencyExchangeModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyExchangeModelFromJson(json);
}

@Freezed(toJson: false)
class FinanceRequestItemModel with _$FinanceRequestItemModel {
  const factory FinanceRequestItemModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(name: 'request_no', fromJson: jsonStringValue) String? requestNo,
    @JsonKey(fromJson: jsonStringValue) String? type,
    @JsonKey(fromJson: jsonStringValue) String? status,
    @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
    double? requestedAmount,
    @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
    int? requestedCount,
    @JsonKey(name: 'requested_currency', readValue: readJsonMap)
    FinanceCurrencyModel? requestedCurrency,
    @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
    double? acceptedAmount,
    @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
    FinanceCurrencyModel? acceptedCurrency,
    @JsonKey(
        readValue: _financeRequestItemCashBoxName,
        fromJson: _financeRequestItemCashBoxNameValue)
    String? cashBoxName,
    @JsonKey(
        readValue: _financeRequestItemCategoryName,
        fromJson: _financeRequestItemCategoryNameValue)
    String? categoryName,
    @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
    String? counterpartyName,
    @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
    String? requestedReason,
    @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
    String? reviewNotes,
    @JsonKey(
        readValue: _financeRequestItemRequestedByName,
        fromJson: _financeRequestItemRequestedByNameValue)
    String? requestedByName,
    @JsonKey(
        readValue: _financeRequestItemReviewedByName,
        fromJson: _financeRequestItemReviewedByNameValue)
    String? reviewedByName,
  }) = _FinanceRequestItemModel;

  factory FinanceRequestItemModel.fromJson(Map<String, dynamic> json) =>
      _$FinanceRequestItemModelFromJson(json);
}
