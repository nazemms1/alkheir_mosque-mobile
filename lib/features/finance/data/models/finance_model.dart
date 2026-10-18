import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

/// نماذج المالية — مطابقة لاستجابات `/api/v1/finance/*`.

class FinanceCurrency {
  final int id;
  final String code;
  final String name;
  final String symbol;

  const FinanceCurrency({
    required this.id,
    required this.code,
    required this.name,
    required this.symbol,
  });

  static FinanceCurrency? fromJson(Object? json) {
    final map = jsonMap(json);
    if (map == null) return null;
    return FinanceCurrency(
      id: jsonInt(map['id']),
      code: jsonString(map['code']),
      name: jsonString(map['name']),
      symbol: jsonString(map['symbol']),
    );
  }

  /// الرمز المعروض: الرمز الرسمي إن وُجد وإلا الكود.
  String get label => symbol.isNotEmpty ? symbol : code;
}

class CashBoxRef {
  final int id;
  final String name;
  final String code;

  const CashBoxRef({required this.id, required this.name, required this.code});

  static CashBoxRef? fromJson(Object? json) {
    final map = jsonMap(json);
    if (map == null) return null;
    return CashBoxRef(
      id: jsonInt(map['id']),
      name: jsonString(map['name']),
      code: jsonString(map['code']),
    );
  }
}

class CashBoxCurrencyBalance {
  final double balance;
  final double localEquivalent;
  final FinanceCurrency? currency;

  const CashBoxCurrencyBalance({
    required this.balance,
    required this.localEquivalent,
    required this.currency,
  });

  factory CashBoxCurrencyBalance.fromJson(Map<String, dynamic> json) {
    return CashBoxCurrencyBalance(
      balance: jsonDouble(json['balance']),
      localEquivalent: jsonDouble(json['local_equivalent']),
      currency: FinanceCurrency.fromJson(json['currency']),
    );
  }
}

class CashBoxBalance {
  final int id;
  final String name;
  final String code;
  final bool isActive;
  final double localTotal;
  final List<CashBoxCurrencyBalance> currencies;

  const CashBoxBalance({
    required this.id,
    required this.name,
    required this.code,
    required this.isActive,
    required this.localTotal,
    required this.currencies,
  });

  factory CashBoxBalance.fromJson(Map<String, dynamic> json) {
    return CashBoxBalance(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      code: jsonString(json['code']),
      isActive: jsonBool(json['is_active']),
      localTotal: jsonDouble(json['local_total']),
      currencies: jsonList(json['currencies'], CashBoxCurrencyBalance.fromJson),
    );
  }

  /// العملات التي يحملها الصندوق — تُستخدم لتصفية العملات في النماذج.
  List<FinanceCurrency> get currencyOptions => [
        for (final row in currencies)
          if (row.currency != null) row.currency!,
      ];
}

class CurrencyTotal {
  final double balance;
  final FinanceCurrency? currency;

  const CurrencyTotal({required this.balance, required this.currency});

  factory CurrencyTotal.fromJson(Map<String, dynamic> json) => CurrencyTotal(
        balance: jsonDouble(json['balance']),
        currency: FinanceCurrency.fromJson(json['currency']),
      );
}

class FinanceSummary {
  final List<CashBoxBalance> cashBoxes;

  /// عدد الطلبات المعلّقة لكل نوع (pull / expense / revenue ...).
  final Map<String, int> pendingRequests;
  final List<CurrencyTotal> totals;

  const FinanceSummary({
    required this.cashBoxes,
    required this.pendingRequests,
    required this.totals,
  });

  factory FinanceSummary.fromJson(Map<String, dynamic> json) {
    // الخادم يُرجع `[]` عندما لا توجد طلبات معلّقة، و{نوع: عدد} عند وجودها.
    final pendingRaw = json['pending_requests'];
    final pending = <String, int>{};
    if (pendingRaw is Map) {
      pendingRaw.forEach((key, value) => pending['$key'] = jsonInt(value));
    }
    return FinanceSummary(
      cashBoxes: jsonList(json['cash_boxes'], CashBoxBalance.fromJson),
      pendingRequests: pending,
      totals: jsonList(json['totals'], CurrencyTotal.fromJson),
    );
  }

  int get pendingTotal => pendingRequests.values.fold(0, (a, b) => a + b);
}

class LedgerEntry {
  final int id;
  final String transactionNo;
  final String type;
  final String direction;
  final String status;
  final String transactionDate;
  final double amount;
  final double signedAmount;
  final double localAmount;
  final FinanceCurrency? currency;
  final CashBoxRef? cashBox;
  final String? categoryName;
  final String? description;
  final String? enteredByName;
  final int? financeRequestId;

  const LedgerEntry({
    required this.id,
    required this.transactionNo,
    required this.type,
    required this.direction,
    required this.status,
    required this.transactionDate,
    required this.amount,
    required this.signedAmount,
    required this.localAmount,
    required this.currency,
    required this.cashBox,
    required this.categoryName,
    required this.description,
    required this.enteredByName,
    required this.financeRequestId,
  });

  factory LedgerEntry.fromJson(Map<String, dynamic> json) {
    return LedgerEntry(
      id: jsonInt(json['id']),
      transactionNo: jsonString(json['transaction_no']),
      type: jsonString(json['type']),
      direction: jsonString(json['direction']),
      status: jsonString(json['status']),
      transactionDate: jsonString(json['transaction_date']),
      amount: jsonDouble(json['amount']),
      signedAmount: jsonDouble(json['signed_amount']),
      localAmount: jsonDouble(json['local_amount']),
      currency: FinanceCurrency.fromJson(json['currency']),
      cashBox: CashBoxRef.fromJson(json['cash_box']),
      categoryName: jsonStringOrNull(jsonMap(json['category'])?['name']),
      description: jsonStringOrNull(json['description']),
      enteredByName: jsonStringOrNull(jsonMap(json['entered_by'])?['name']),
      financeRequestId: jsonIntOrNull(json['finance_request_id']),
    );
  }

  bool get isIncoming => direction == 'in';
}

class CashBoxTransfer {
  final int id;
  final String transferNo;
  final String transferDate;
  final double amount;
  final FinanceCurrency? currency;
  final CashBoxRef? fromCashBox;
  final CashBoxRef? toCashBox;
  final String? notes;
  final String? enteredByName;

  const CashBoxTransfer({
    required this.id,
    required this.transferNo,
    required this.transferDate,
    required this.amount,
    required this.currency,
    required this.fromCashBox,
    required this.toCashBox,
    required this.notes,
    required this.enteredByName,
  });

  factory CashBoxTransfer.fromJson(Map<String, dynamic> json) {
    return CashBoxTransfer(
      id: jsonInt(json['id']),
      transferNo: jsonString(json['transfer_no']),
      transferDate: jsonString(json['transfer_date']),
      amount: jsonDouble(json['amount']),
      currency: FinanceCurrency.fromJson(json['currency']),
      fromCashBox: CashBoxRef.fromJson(json['from_cash_box']),
      toCashBox: CashBoxRef.fromJson(json['to_cash_box']),
      notes: jsonStringOrNull(json['notes']),
      enteredByName: jsonStringOrNull(jsonMap(json['entered_by'])?['name']),
    );
  }
}

class CurrencyExchange {
  final int id;
  final String exchangeNo;
  final String exchangeDate;
  final double fromAmount;
  final double toAmount;
  final double localAmount;
  final FinanceCurrency? fromCurrency;
  final FinanceCurrency? toCurrency;
  final CashBoxRef? fromCashBox;
  final CashBoxRef? toCashBox;
  final String? notes;
  final String? enteredByName;

  const CurrencyExchange({
    required this.id,
    required this.exchangeNo,
    required this.exchangeDate,
    required this.fromAmount,
    required this.toAmount,
    required this.localAmount,
    required this.fromCurrency,
    required this.toCurrency,
    required this.fromCashBox,
    required this.toCashBox,
    required this.notes,
    required this.enteredByName,
  });

  factory CurrencyExchange.fromJson(Map<String, dynamic> json) {
    return CurrencyExchange(
      id: jsonInt(json['id']),
      exchangeNo: jsonString(json['exchange_no']),
      exchangeDate: jsonString(json['exchange_date']),
      fromAmount: jsonDouble(json['from_amount']),
      toAmount: jsonDouble(json['to_amount']),
      localAmount: jsonDouble(json['local_amount']),
      fromCurrency: FinanceCurrency.fromJson(json['from_currency']),
      toCurrency: FinanceCurrency.fromJson(json['to_currency']),
      fromCashBox: CashBoxRef.fromJson(json['from_cash_box']),
      toCashBox: CashBoxRef.fromJson(json['to_cash_box']),
      notes: jsonStringOrNull(json['notes']),
      enteredByName: jsonStringOrNull(jsonMap(json['entered_by'])?['name']),
    );
  }
}

class FinanceRequestItem {
  final int id;
  final String requestNo;
  final String type;
  final String status;
  final double requestedAmount;
  final int? requestedCount;
  final FinanceCurrency? requestedCurrency;
  final double? acceptedAmount;
  final FinanceCurrency? acceptedCurrency;
  final String? cashBoxName;
  final String? categoryName;
  final String? counterpartyName;
  final String? requestedReason;
  final String? reviewNotes;
  final String? requestedByName;
  final String? reviewedByName;

  const FinanceRequestItem({
    required this.id,
    required this.requestNo,
    required this.type,
    required this.status,
    required this.requestedAmount,
    required this.requestedCount,
    required this.requestedCurrency,
    required this.acceptedAmount,
    required this.acceptedCurrency,
    required this.cashBoxName,
    required this.categoryName,
    required this.counterpartyName,
    required this.requestedReason,
    required this.reviewNotes,
    required this.requestedByName,
    required this.reviewedByName,
  });

  factory FinanceRequestItem.fromJson(Map<String, dynamic> json) {
    return FinanceRequestItem(
      id: jsonInt(json['id']),
      requestNo: jsonString(json['request_no']),
      type: jsonString(json['type']),
      status: jsonString(json['status']),
      requestedAmount: jsonDouble(json['requested_amount']),
      requestedCount: jsonIntOrNull(json['requested_count']),
      requestedCurrency: FinanceCurrency.fromJson(json['requested_currency']),
      acceptedAmount: jsonDoubleOrNull(json['accepted_amount']),
      acceptedCurrency: FinanceCurrency.fromJson(json['accepted_currency']),
      cashBoxName: jsonStringOrNull(jsonMap(json['cash_box'])?['name']),
      categoryName: jsonStringOrNull(jsonMap(json['category'])?['name']),
      counterpartyName: jsonStringOrNull(json['counterparty_name']),
      requestedReason: jsonStringOrNull(json['requested_reason']),
      reviewNotes: jsonStringOrNull(json['review_notes']),
      requestedByName: jsonStringOrNull(jsonMap(json['requested_by'])?['name']),
      reviewedByName: jsonStringOrNull(jsonMap(json['reviewed_by'])?['name']),
    );
  }
}
