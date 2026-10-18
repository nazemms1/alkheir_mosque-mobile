import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../data/models/finance_model.dart';

abstract class FinanceRepository {
  Future<FinanceSummary> summary();

  Future<List<CashBoxBalance>> cashBoxes();

  Future<PagedResult<LedgerEntry>> transactions({
    int page = 1,
    int? cashBoxId,
    String? direction,
    String? dateFrom,
    String? dateTo,
  });

  Future<LedgerEntry> postAdjustment({
    required int cashBoxId,
    required int currencyId,
    required String direction,
    required double amount,
    required String description,
    String? transactionDate,
  });

  Future<PagedResult<CashBoxTransfer>> transfers({int page = 1});

  Future<CashBoxTransfer> postTransfer({
    required int fromCashBoxId,
    required int toCashBoxId,
    required int currencyId,
    required double amount,
    required String transferDate,
    String? notes,
  });

  Future<PagedResult<CurrencyExchange>> exchanges({int page = 1});

  Future<CurrencyExchange> postExchange({
    required int fromCashBoxId,
    required int toCashBoxId,
    required int fromCurrencyId,
    required int toCurrencyId,
    required double fromAmount,
    required String exchangeDate,
    double? toAmount,
    String? notes,
  });

  Future<PagedResult<FinanceRequestItem>> requests({
    int page = 1,
    String? type,
    String? status,
  });
}
