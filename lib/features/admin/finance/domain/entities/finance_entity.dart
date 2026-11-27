/// نماذج المالية — مطابقة لاستجابات `/api/v1/finance/*`.
library;

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

  /// الرمز المعروض: الرمز الرسمي إن وُجد وإلا الكود.
  String get label => symbol.isNotEmpty ? symbol : code;
}

class CashBoxRef {
  final int id;
  final String name;
  final String code;

  const CashBoxRef({required this.id, required this.name, required this.code});
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
}
