import 'package:alkheir_mosque/features/admin/finance/data/models/finance_model.dart';
import 'package:alkheir_mosque/features/admin/finance/domain/entities/finance_entity.dart';

extension FinanceCurrencyModelMapper on FinanceCurrencyModel? {
  FinanceCurrency? toDomain() {
    if (this == null) return null;
    return FinanceCurrency(
      id: this?.id ?? 0,
      code: this?.code ?? '',
      name: this?.name ?? '',
      symbol: this?.symbol ?? '',
    );
  }
}

extension CashBoxRefModelMapper on CashBoxRefModel? {
  CashBoxRef? toDomain() {
    if (this == null) return null;
    return CashBoxRef(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      code: this?.code ?? '',
    );
  }
}

extension CashBoxCurrencyBalanceModelMapper on CashBoxCurrencyBalanceModel? {
  CashBoxCurrencyBalance toDomain() {
    return CashBoxCurrencyBalance(
      balance: this?.balance ?? 0.0,
      localEquivalent: this?.localEquivalent ?? 0.0,
      currency: (this?.currency).toDomain(),
    );
  }
}

extension CashBoxBalanceModelMapper on CashBoxBalanceModel? {
  CashBoxBalance toDomain() {
    return CashBoxBalance(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      code: this?.code ?? '',
      isActive: this?.isActive ?? false,
      localTotal: this?.localTotal ?? 0.0,
      currencies: [
        for (final e
            in this?.currencies ?? const <CashBoxCurrencyBalanceModel>[])
          e.toDomain()
      ],
    );
  }
}

extension CurrencyTotalModelMapper on CurrencyTotalModel? {
  CurrencyTotal toDomain() {
    return CurrencyTotal(
      balance: this?.balance ?? 0.0,
      currency: (this?.currency).toDomain(),
    );
  }
}

extension FinanceSummaryModelMapper on FinanceSummaryModel? {
  FinanceSummary toDomain() {
    return FinanceSummary(
      cashBoxes: [
        for (final e in this?.cashBoxes ?? const <CashBoxBalanceModel>[])
          e.toDomain()
      ],
      pendingRequests: this?.pendingRequests ?? const {},
      totals: [
        for (final e in this?.totals ?? const <CurrencyTotalModel>[])
          e.toDomain()
      ],
    );
  }
}

extension LedgerEntryModelMapper on LedgerEntryModel? {
  LedgerEntry toDomain() {
    return LedgerEntry(
      id: this?.id ?? 0,
      transactionNo: this?.transactionNo ?? '',
      type: this?.type ?? '',
      direction: this?.direction ?? '',
      status: this?.status ?? '',
      transactionDate: this?.transactionDate ?? '',
      amount: this?.amount ?? 0.0,
      signedAmount: this?.signedAmount ?? 0.0,
      localAmount: this?.localAmount ?? 0.0,
      currency: (this?.currency).toDomain(),
      cashBox: (this?.cashBox).toDomain(),
      categoryName: this?.categoryName,
      description: this?.description,
      enteredByName: this?.enteredByName,
      financeRequestId: this?.financeRequestId,
    );
  }
}

extension CashBoxTransferModelMapper on CashBoxTransferModel? {
  CashBoxTransfer toDomain() {
    return CashBoxTransfer(
      id: this?.id ?? 0,
      transferNo: this?.transferNo ?? '',
      transferDate: this?.transferDate ?? '',
      amount: this?.amount ?? 0.0,
      currency: (this?.currency).toDomain(),
      fromCashBox: (this?.fromCashBox).toDomain(),
      toCashBox: (this?.toCashBox).toDomain(),
      notes: this?.notes,
      enteredByName: this?.enteredByName,
    );
  }
}

extension CurrencyExchangeModelMapper on CurrencyExchangeModel? {
  CurrencyExchange toDomain() {
    return CurrencyExchange(
      id: this?.id ?? 0,
      exchangeNo: this?.exchangeNo ?? '',
      exchangeDate: this?.exchangeDate ?? '',
      fromAmount: this?.fromAmount ?? 0.0,
      toAmount: this?.toAmount ?? 0.0,
      localAmount: this?.localAmount ?? 0.0,
      fromCurrency: (this?.fromCurrency).toDomain(),
      toCurrency: (this?.toCurrency).toDomain(),
      fromCashBox: (this?.fromCashBox).toDomain(),
      toCashBox: (this?.toCashBox).toDomain(),
      notes: this?.notes,
      enteredByName: this?.enteredByName,
    );
  }
}

extension FinanceRequestItemModelMapper on FinanceRequestItemModel? {
  FinanceRequestItem toDomain() {
    return FinanceRequestItem(
      id: this?.id ?? 0,
      requestNo: this?.requestNo ?? '',
      type: this?.type ?? '',
      status: this?.status ?? '',
      requestedAmount: this?.requestedAmount ?? 0.0,
      requestedCount: this?.requestedCount,
      requestedCurrency: (this?.requestedCurrency).toDomain(),
      acceptedAmount: this?.acceptedAmount,
      acceptedCurrency: (this?.acceptedCurrency).toDomain(),
      cashBoxName: this?.cashBoxName,
      categoryName: this?.categoryName,
      counterpartyName: this?.counterpartyName,
      requestedReason: this?.requestedReason,
      reviewNotes: this?.reviewNotes,
      requestedByName: this?.requestedByName,
      reviewedByName: this?.reviewedByName,
    );
  }
}
