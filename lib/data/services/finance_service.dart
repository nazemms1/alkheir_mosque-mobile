import '../models/finance_model.dart';
import '../models/json_helpers.dart';
import 'api_service.dart';

/// خدمة المالية — الأرصدة وسجل الحركات والتحويلات والصرف والطلبات.
/// كل الحسابات الحقيقية في الخادم؛ التطبيق يعرض ويرسل فقط.
class FinanceService {
  final ApiService _api;

  FinanceService({ApiService? api}) : _api = api ?? ApiService();

  Future<FinanceSummary> summary() async {
    final json = await _api.get('finance/summary') as Map<String, dynamic>;
    return FinanceSummary.fromJson(jsonMap(json['data']) ?? const {});
  }

  Future<List<CashBoxBalance>> cashBoxes() async {
    final json = await _api.get('finance/cash-boxes') as Map<String, dynamic>;
    return jsonList(json['data'], CashBoxBalance.fromJson);
  }

  Future<PagedResult<LedgerEntry>> transactions({
    int page = 1,
    int? cashBoxId,
    String? direction,
    String? dateFrom,
    String? dateTo,
  }) async {
    final json = await _api.get('finance/transactions', query: {
      'page': page,
      'per_page': 20,
      if (cashBoxId != null) 'cash_box_id': cashBoxId,
      if (direction != null) 'direction': direction,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, LedgerEntry.fromJson);
  }

  /// حركة تسوية يدوية (إيداع أو سحب) على صندوق بعملة محددة.
  Future<LedgerEntry> postAdjustment({
    required int cashBoxId,
    required int currencyId,
    required String direction,
    required double amount,
    required String description,
    String? transactionDate,
  }) async {
    final json = await _api.post('finance/adjustments', body: {
      'cash_box_id': cashBoxId,
      'currency_id': currencyId,
      'direction': direction,
      'amount': amount,
      'description': description,
      if (transactionDate != null) 'transaction_date': transactionDate,
    }) as Map<String, dynamic>;
    return LedgerEntry.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<PagedResult<CashBoxTransfer>> transfers({int page = 1}) async {
    final json = await _api.get('finance/transfers', query: {
      'page': page,
      'per_page': 20,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, CashBoxTransfer.fromJson);
  }

  Future<CashBoxTransfer> postTransfer({
    required int fromCashBoxId,
    required int toCashBoxId,
    required int currencyId,
    required double amount,
    required String transferDate,
    String? notes,
  }) async {
    final json = await _api.post('finance/transfers', body: {
      'from_cash_box_id': fromCashBoxId,
      'to_cash_box_id': toCashBoxId,
      'currency_id': currencyId,
      'amount': amount,
      'transfer_date': transferDate,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    }) as Map<String, dynamic>;
    return CashBoxTransfer.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<PagedResult<CurrencyExchange>> exchanges({int page = 1}) async {
    final json = await _api.get('finance/exchanges', query: {
      'page': page,
      'per_page': 20,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, CurrencyExchange.fromJson);
  }

  /// صرف عملة. إن لم يُرسل `toAmount` يحسبه الخادم من أسعار الصرف المعدّة.
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
    final json = await _api.post('finance/exchanges', body: {
      'from_cash_box_id': fromCashBoxId,
      'to_cash_box_id': toCashBoxId,
      'from_currency_id': fromCurrencyId,
      'to_currency_id': toCurrencyId,
      'from_amount': fromAmount,
      'exchange_date': exchangeDate,
      if (toAmount != null) 'to_amount': toAmount,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    }) as Map<String, dynamic>;
    return CurrencyExchange.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<PagedResult<FinanceRequestItem>> requests({
    int page = 1,
    String? type,
    String? status,
  }) async {
    final json = await _api.get('finance/requests', query: {
      'page': page,
      'per_page': 20,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, FinanceRequestItem.fromJson);
  }
}
