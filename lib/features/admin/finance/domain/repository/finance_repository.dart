import 'package:alkheir_mosque/features/admin/finance/domain/entities/finance_entity.dart';
import 'package:alkheir_mosque/features/admin/finance/data/mapper/finance_mapper.dart';
import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/data/mapper/shared_mapper.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

import '../../data/apis/finance_apis.dart';
import '../../data/params/finance_params.dart';

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

class FinanceRepositoryImpl implements FinanceRepository {
  static const _perPage = 20;

  final FinanceApis api;

  FinanceRepositoryImpl(this.api);

  @override
  Future<FinanceSummary> summary() async {
    final result = await handleRepoData(() => api.summary());
    return result.data.toDomain();
  }

  @override
  Future<List<CashBoxBalance>> cashBoxes() async {
    final result = await handleRepoData(() => api.cashBoxes());
    return result.data?.map((e) => e.toDomain()).toList() ?? const [];
  }

  @override
  Future<PagedResult<LedgerEntry>> transactions({
    int page = 1,
    int? cashBoxId,
    String? direction,
    String? dateFrom,
    String? dateTo,
  }) async {
    final result = await handleRepoData(() => api.transactions(
          page,
          _perPage,
          cashBoxId: cashBoxId,
          direction: direction,
          dateFrom: dateFrom,
          dateTo: dateTo,
        ));
    return result.toPaged((e) => e.toDomain());
  }

  /// حركة تسوية يدوية (إيداع أو سحب) على صندوق بعملة محددة.
  @override
  Future<LedgerEntry> postAdjustment({
    required int cashBoxId,
    required int currencyId,
    required String direction,
    required double amount,
    required String description,
    String? transactionDate,
  }) async {
    final result = await handleRepoData(() => api.postAdjustment(
          AdjustmentParams(
            cashBoxId: cashBoxId,
            currencyId: currencyId,
            direction: direction,
            amount: amount,
            description: description,
            transactionDate: transactionDate,
          ),
        ));
    return result.data.toDomain();
  }

  @override
  Future<PagedResult<CashBoxTransfer>> transfers({int page = 1}) async {
    final result = await handleRepoData(() => api.transfers(page, _perPage));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<CashBoxTransfer> postTransfer({
    required int fromCashBoxId,
    required int toCashBoxId,
    required int currencyId,
    required double amount,
    required String transferDate,
    String? notes,
  }) async {
    final result = await handleRepoData(() => api.postTransfer(
          TransferParams(
            fromCashBoxId: fromCashBoxId,
            toCashBoxId: toCashBoxId,
            currencyId: currencyId,
            amount: amount,
            transferDate: transferDate,
            notes: _nonEmpty(notes),
          ),
        ));
    return result.data.toDomain();
  }

  @override
  Future<PagedResult<CurrencyExchange>> exchanges({int page = 1}) async {
    final result = await handleRepoData(() => api.exchanges(page, _perPage));
    return result.toPaged((e) => e.toDomain());
  }

  /// صرف عملة. إن لم يُرسل `toAmount` يحسبه الخادم من أسعار الصرف المعدّة.
  @override
  Future<CurrencyExchange> postExchange({
    required int fromCashBoxId,
    required int toCashBoxId,
    required int fromCurrencyId,
    required int toCurrencyId,
    required double fromAmount,
    required String exchangeDate,
    double? toAmount,
    String? notes,
  }) async {
    final result = await handleRepoData(() => api.postExchange(
          ExchangeParams(
            fromCashBoxId: fromCashBoxId,
            toCashBoxId: toCashBoxId,
            fromCurrencyId: fromCurrencyId,
            toCurrencyId: toCurrencyId,
            fromAmount: fromAmount,
            exchangeDate: exchangeDate,
            toAmount: toAmount,
            notes: _nonEmpty(notes),
          ),
        ));
    return result.data.toDomain();
  }

  @override
  Future<PagedResult<FinanceRequestItem>> requests({
    int page = 1,
    String? type,
    String? status,
  }) async {
    final result = await handleRepoData(
        () => api.requests(page, _perPage, type: type, status: status));
    return result.toPaged((e) => e.toDomain());
  }

  String? _nonEmpty(String? v) => v == null || v.isEmpty ? null : v;
}
