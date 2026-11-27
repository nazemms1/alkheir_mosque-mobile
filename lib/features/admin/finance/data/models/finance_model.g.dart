// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinanceCurrencyModelImpl _$$FinanceCurrencyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FinanceCurrencyModelImpl(
      id: jsonIntLenient(json['id']),
      code: jsonStringValue(json['code']),
      name: jsonStringValue(json['name']),
      symbol: jsonStringValue(json['symbol']),
    );

_$CashBoxRefModelImpl _$$CashBoxRefModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashBoxRefModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      code: jsonStringValue(json['code']),
    );

_$CashBoxCurrencyBalanceModelImpl _$$CashBoxCurrencyBalanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashBoxCurrencyBalanceModelImpl(
      balance: jsonDoubleLenient(json['balance']),
      localEquivalent: jsonDoubleLenient(json['local_equivalent']),
      currency: readJsonMap(json, 'currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'currency') as Map<String, dynamic>),
    );

_$CashBoxBalanceModelImpl _$$CashBoxBalanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashBoxBalanceModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      code: jsonStringValue(json['code']),
      isActive: jsonBoolLenient(json['is_active']),
      localTotal: jsonDoubleLenient(json['local_total']),
      currencies: (readJsonList(json, 'currencies') as List<dynamic>?)
          ?.map((e) =>
              CashBoxCurrencyBalanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$CurrencyTotalModelImpl _$$CurrencyTotalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyTotalModelImpl(
      balance: jsonDoubleLenient(json['balance']),
      currency: readJsonMap(json, 'currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'currency') as Map<String, dynamic>),
    );

_$FinanceSummaryModelImpl _$$FinanceSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FinanceSummaryModelImpl(
      cashBoxes: (readJsonList(json, 'cash_boxes') as List<dynamic>?)
          ?.map((e) => CashBoxBalanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingRequests: _financeSummaryPendingRequestsValue(
          _financeSummaryPendingRequests(json, 'pendingRequests')),
      totals: (readJsonList(json, 'totals') as List<dynamic>?)
          ?.map((e) => CurrencyTotalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$LedgerEntryModelImpl _$$LedgerEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LedgerEntryModelImpl(
      id: jsonIntLenient(json['id']),
      transactionNo: jsonStringValue(json['transaction_no']),
      type: jsonStringValue(json['type']),
      direction: jsonStringValue(json['direction']),
      status: jsonStringValue(json['status']),
      transactionDate: jsonStringValue(json['transaction_date']),
      amount: jsonDoubleLenient(json['amount']),
      signedAmount: jsonDoubleLenient(json['signed_amount']),
      localAmount: jsonDoubleLenient(json['local_amount']),
      currency: readJsonMap(json, 'currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'currency') as Map<String, dynamic>),
      cashBox: readJsonMap(json, 'cash_box') == null
          ? null
          : CashBoxRefModel.fromJson(
              readJsonMap(json, 'cash_box') as Map<String, dynamic>),
      categoryName: _ledgerEntryCategoryNameValue(
          _ledgerEntryCategoryName(json, 'categoryName')),
      description: jsonStringLenient(json['description']),
      enteredByName: _ledgerEntryEnteredByNameValue(
          _ledgerEntryEnteredByName(json, 'enteredByName')),
      financeRequestId: jsonIntLenient(json['finance_request_id']),
    );

_$CashBoxTransferModelImpl _$$CashBoxTransferModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashBoxTransferModelImpl(
      id: jsonIntLenient(json['id']),
      transferNo: jsonStringValue(json['transfer_no']),
      transferDate: jsonStringValue(json['transfer_date']),
      amount: jsonDoubleLenient(json['amount']),
      currency: readJsonMap(json, 'currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'currency') as Map<String, dynamic>),
      fromCashBox: readJsonMap(json, 'from_cash_box') == null
          ? null
          : CashBoxRefModel.fromJson(
              readJsonMap(json, 'from_cash_box') as Map<String, dynamic>),
      toCashBox: readJsonMap(json, 'to_cash_box') == null
          ? null
          : CashBoxRefModel.fromJson(
              readJsonMap(json, 'to_cash_box') as Map<String, dynamic>),
      notes: jsonStringLenient(json['notes']),
      enteredByName: _cashBoxTransferEnteredByNameValue(
          _cashBoxTransferEnteredByName(json, 'enteredByName')),
    );

_$CurrencyExchangeModelImpl _$$CurrencyExchangeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrencyExchangeModelImpl(
      id: jsonIntLenient(json['id']),
      exchangeNo: jsonStringValue(json['exchange_no']),
      exchangeDate: jsonStringValue(json['exchange_date']),
      fromAmount: jsonDoubleLenient(json['from_amount']),
      toAmount: jsonDoubleLenient(json['to_amount']),
      localAmount: jsonDoubleLenient(json['local_amount']),
      fromCurrency: readJsonMap(json, 'from_currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'from_currency') as Map<String, dynamic>),
      toCurrency: readJsonMap(json, 'to_currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'to_currency') as Map<String, dynamic>),
      fromCashBox: readJsonMap(json, 'from_cash_box') == null
          ? null
          : CashBoxRefModel.fromJson(
              readJsonMap(json, 'from_cash_box') as Map<String, dynamic>),
      toCashBox: readJsonMap(json, 'to_cash_box') == null
          ? null
          : CashBoxRefModel.fromJson(
              readJsonMap(json, 'to_cash_box') as Map<String, dynamic>),
      notes: jsonStringLenient(json['notes']),
      enteredByName: _currencyExchangeEnteredByNameValue(
          _currencyExchangeEnteredByName(json, 'enteredByName')),
    );

_$FinanceRequestItemModelImpl _$$FinanceRequestItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FinanceRequestItemModelImpl(
      id: jsonIntLenient(json['id']),
      requestNo: jsonStringValue(json['request_no']),
      type: jsonStringValue(json['type']),
      status: jsonStringValue(json['status']),
      requestedAmount: jsonDoubleLenient(json['requested_amount']),
      requestedCount: jsonIntLenient(json['requested_count']),
      requestedCurrency: readJsonMap(json, 'requested_currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'requested_currency') as Map<String, dynamic>),
      acceptedAmount: jsonDoubleLenient(json['accepted_amount']),
      acceptedCurrency: readJsonMap(json, 'accepted_currency') == null
          ? null
          : FinanceCurrencyModel.fromJson(
              readJsonMap(json, 'accepted_currency') as Map<String, dynamic>),
      cashBoxName: _financeRequestItemCashBoxNameValue(
          _financeRequestItemCashBoxName(json, 'cashBoxName')),
      categoryName: _financeRequestItemCategoryNameValue(
          _financeRequestItemCategoryName(json, 'categoryName')),
      counterpartyName: jsonStringLenient(json['counterparty_name']),
      requestedReason: jsonStringLenient(json['requested_reason']),
      reviewNotes: jsonStringLenient(json['review_notes']),
      requestedByName: _financeRequestItemRequestedByNameValue(
          _financeRequestItemRequestedByName(json, 'requestedByName')),
      reviewedByName: _financeRequestItemReviewedByNameValue(
          _financeRequestItemReviewedByName(json, 'reviewedByName')),
    );
