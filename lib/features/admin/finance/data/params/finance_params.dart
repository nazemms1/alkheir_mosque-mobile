// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finance_params.freezed.dart';
part 'finance_params.g.dart';

@freezed
class AdjustmentParams with _$AdjustmentParams {
  @JsonSerializable(includeIfNull: false)
  const factory AdjustmentParams({
    @JsonKey(name: 'cash_box_id') int? cashBoxId,
    @JsonKey(name: 'currency_id') int? currencyId,
    String? direction,
    double? amount,
    String? description,
    @JsonKey(name: 'transaction_date') String? transactionDate,
  }) = _AdjustmentParams;

  factory AdjustmentParams.fromJson(Map<String, dynamic> json) =>
      _$AdjustmentParamsFromJson(json);
}

@freezed
class TransferParams with _$TransferParams {
  @JsonSerializable(includeIfNull: false)
  const factory TransferParams({
    @JsonKey(name: 'from_cash_box_id') int? fromCashBoxId,
    @JsonKey(name: 'to_cash_box_id') int? toCashBoxId,
    @JsonKey(name: 'currency_id') int? currencyId,
    double? amount,
    @JsonKey(name: 'transfer_date') String? transferDate,
    String? notes,
  }) = _TransferParams;

  factory TransferParams.fromJson(Map<String, dynamic> json) =>
      _$TransferParamsFromJson(json);
}

@freezed
class ExchangeParams with _$ExchangeParams {
  @JsonSerializable(includeIfNull: false)
  const factory ExchangeParams({
    @JsonKey(name: 'from_cash_box_id') int? fromCashBoxId,
    @JsonKey(name: 'to_cash_box_id') int? toCashBoxId,
    @JsonKey(name: 'from_currency_id') int? fromCurrencyId,
    @JsonKey(name: 'to_currency_id') int? toCurrencyId,
    @JsonKey(name: 'from_amount') double? fromAmount,
    @JsonKey(name: 'exchange_date') String? exchangeDate,
    @JsonKey(name: 'to_amount') double? toAmount,
    String? notes,
  }) = _ExchangeParams;

  factory ExchangeParams.fromJson(Map<String, dynamic> json) =>
      _$ExchangeParamsFromJson(json);
}
