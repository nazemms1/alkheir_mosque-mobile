// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdjustmentParamsImpl _$$AdjustmentParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AdjustmentParamsImpl(
      cashBoxId: (json['cash_box_id'] as num?)?.toInt(),
      currencyId: (json['currency_id'] as num?)?.toInt(),
      direction: json['direction'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      transactionDate: json['transaction_date'] as String?,
    );

Map<String, dynamic> _$$AdjustmentParamsImplToJson(
        _$AdjustmentParamsImpl instance) =>
    <String, dynamic>{
      if (instance.cashBoxId case final value?) 'cash_box_id': value,
      if (instance.currencyId case final value?) 'currency_id': value,
      if (instance.direction case final value?) 'direction': value,
      if (instance.amount case final value?) 'amount': value,
      if (instance.description case final value?) 'description': value,
      if (instance.transactionDate case final value?) 'transaction_date': value,
    };

_$TransferParamsImpl _$$TransferParamsImplFromJson(Map<String, dynamic> json) =>
    _$TransferParamsImpl(
      fromCashBoxId: (json['from_cash_box_id'] as num?)?.toInt(),
      toCashBoxId: (json['to_cash_box_id'] as num?)?.toInt(),
      currencyId: (json['currency_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      transferDate: json['transfer_date'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$TransferParamsImplToJson(
        _$TransferParamsImpl instance) =>
    <String, dynamic>{
      if (instance.fromCashBoxId case final value?) 'from_cash_box_id': value,
      if (instance.toCashBoxId case final value?) 'to_cash_box_id': value,
      if (instance.currencyId case final value?) 'currency_id': value,
      if (instance.amount case final value?) 'amount': value,
      if (instance.transferDate case final value?) 'transfer_date': value,
      if (instance.notes case final value?) 'notes': value,
    };

_$ExchangeParamsImpl _$$ExchangeParamsImplFromJson(Map<String, dynamic> json) =>
    _$ExchangeParamsImpl(
      fromCashBoxId: (json['from_cash_box_id'] as num?)?.toInt(),
      toCashBoxId: (json['to_cash_box_id'] as num?)?.toInt(),
      fromCurrencyId: (json['from_currency_id'] as num?)?.toInt(),
      toCurrencyId: (json['to_currency_id'] as num?)?.toInt(),
      fromAmount: (json['from_amount'] as num?)?.toDouble(),
      exchangeDate: json['exchange_date'] as String?,
      toAmount: (json['to_amount'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ExchangeParamsImplToJson(
        _$ExchangeParamsImpl instance) =>
    <String, dynamic>{
      if (instance.fromCashBoxId case final value?) 'from_cash_box_id': value,
      if (instance.toCashBoxId case final value?) 'to_cash_box_id': value,
      if (instance.fromCurrencyId case final value?) 'from_currency_id': value,
      if (instance.toCurrencyId case final value?) 'to_currency_id': value,
      if (instance.fromAmount case final value?) 'from_amount': value,
      if (instance.exchangeDate case final value?) 'exchange_date': value,
      if (instance.toAmount case final value?) 'to_amount': value,
      if (instance.notes case final value?) 'notes': value,
    };
