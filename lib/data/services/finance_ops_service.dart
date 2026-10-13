import '../models/activity_invoice_model.dart';
import '../models/json_helpers.dart';
import 'api_service.dart';

/// عمليات الأنشطة والفواتير والمدفوعات: قراءة وكتابة.
/// الإجماليات ومنطق التسوية في الخادم (نفس خدمات الموقع).
class FinanceOpsService {
  final ApiService _api;

  FinanceOpsService({ApiService? api}) : _api = api ?? ApiService();

  // ─── الأنشطة ───────────────────────────────────────────────────────────────
  Future<PagedResult<ActivitySummary>> activities({
    int page = 1,
    bool? isActive,
  }) async {
    final json = await _api.get('activities', query: {
      'page': page,
      'per_page': 20,
      if (isActive != null) 'is_active': isActive ? 1 : 0,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, ActivitySummary.fromJson);
  }

  Future<ActivityDetail> activity(int id) async {
    final json = await _api.get('activities/$id') as Map<String, dynamic>;
    return ActivityDetail.fromJson(jsonMap(json['data']) ?? const {});
  }

  Future<PagedResult<ActivityRegistration>> registrations(
    int activityId, {
    int page = 1,
    String? status,
    int? studentId,
  }) async {
    final json = await _api.get('activities/$activityId/registrations', query: {
      'page': page,
      'per_page': 20,
      if (status != null) 'status': status,
      if (studentId != null) 'student_id': studentId,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, ActivityRegistration.fromJson);
  }

  /// `id` يُرسل للتعديل فقط. `status`: registered | declined | cancelled | attended.
  Future<void> saveRegistration(
    int activityId, {
    int? id,
    required int studentId,
    required double feeAmount,
    required String status,
    int? enrollmentId,
    String? notes,
  }) async {
    final body = {
      'student_id': studentId,
      'fee_amount': feeAmount,
      'status': status,
      if (enrollmentId != null) 'enrollment_id': enrollmentId,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    };
    if (id == null) {
      await _api.post('activities/$activityId/registrations', body: body);
    } else {
      await _api.patch(
        'activities/$activityId/registrations/$id',
        body: body,
      );
    }
  }

  /// يرفض الخادم الحذف إن وُجدت مدفوعات نشطة (422).
  Future<void> deleteRegistration(int activityId, int id) =>
      _api.delete('activities/$activityId/registrations/$id');

  Future<PagedResult<ActivityPayment>> activityPayments(
    int activityId, {
    int page = 1,
    String? state,
  }) async {
    final json = await _api.get('activities/$activityId/payments', query: {
      'page': page,
      'per_page': 20,
      if (state != null) 'state': state,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, ActivityPayment.fromJson);
  }

  Future<void> addActivityPayment(
    int activityId, {
    required int registrationId,
    required double amount,
    required String paidAt,
    required int paymentMethodId,
    String? referenceNo,
    String? notes,
  }) async {
    await _api.post('activities/$activityId/payments', body: {
      'activity_registration_id': registrationId,
      'amount': amount,
      'paid_at': paidAt,
      'payment_method_id': paymentMethodId,
      if (referenceNo != null && referenceNo.isNotEmpty)
        'reference_no': referenceNo,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
  }

  Future<void> voidActivityPayment(int activityId, int paymentId) =>
      _api.post('activities/$activityId/payments/$paymentId/void');

  Future<PagedResult<ActivityExpense>> activityExpenses(
    int activityId, {
    int page = 1,
  }) async {
    final json = await _api.get('activities/$activityId/expenses', query: {
      'page': page,
      'per_page': 20,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, ActivityExpense.fromJson);
  }

  Future<void> saveActivityExpense(
    int activityId, {
    int? id,
    required double amount,
    required String description,
    required int expenseCategoryId,
    required String spentOn,
  }) async {
    final body = {
      'amount': amount,
      'description': description,
      'expense_category_id': expenseCategoryId,
      'spent_on': spentOn,
    };
    if (id == null) {
      await _api.post('activities/$activityId/expenses', body: body);
    } else {
      await _api.patch('activities/$activityId/expenses/$id', body: body);
    }
  }

  Future<void> deleteActivityExpense(int activityId, int id) =>
      _api.delete('activities/$activityId/expenses/$id');

  // ─── الفواتير ──────────────────────────────────────────────────────────────
  Future<PagedResult<InvoiceSummary>> invoices({
    int page = 1,
    String? status,
    int? parentId,
  }) async {
    final json = await _api.get('invoices', query: {
      'page': page,
      'per_page': 20,
      if (status != null) 'status': status,
      if (parentId != null) 'parent_id': parentId,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, InvoiceSummary.fromJson);
  }

  Future<InvoiceDetail> invoice(int id) async {
    final json = await _api.get('invoices/$id') as Map<String, dynamic>;
    return InvoiceDetail.fromJson(jsonMap(json['data']) ?? const {});
  }

  Future<void> addInvoiceItem(
    int invoiceId, {
    required String description,
    required double quantity,
    required double unitPrice,
    int? studentId,
    int? enrollmentId,
    int? activityId,
  }) async {
    await _api.post('invoices/$invoiceId/items', body: {
      'description': description,
      'quantity': quantity,
      'unit_price': unitPrice,
      if (studentId != null) 'student_id': studentId,
      if (enrollmentId != null) 'enrollment_id': enrollmentId,
      if (activityId != null) 'activity_id': activityId,
    });
  }

  Future<void> deleteInvoiceItem(int invoiceId, int itemId) =>
      _api.delete('invoices/$invoiceId/items/$itemId');

  Future<void> addInvoicePayment(
    int invoiceId, {
    required double amount,
    required String paidAt,
    required int paymentMethodId,
    String? referenceNo,
    String? notes,
  }) async {
    await _api.post('invoices/$invoiceId/payments', body: {
      'amount': amount,
      'paid_at': paidAt,
      'payment_method_id': paymentMethodId,
      if (referenceNo != null && referenceNo.isNotEmpty)
        'reference_no': referenceNo,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
  }

  Future<void> voidInvoicePayment(int invoiceId, int paymentId) =>
      _api.post('invoices/$invoiceId/payments/$paymentId/void');

  /// كل مدفوعات الفواتير التي يملك المستخدم صلاحية رؤيتها.
  Future<PagedResult<InvoicePaymentRecord>> payments({
    int page = 1,
    String? state,
    int? invoiceId,
    String? dateFrom,
    String? dateTo,
  }) async {
    final json = await _api.get('payments', query: {
      'page': page,
      'per_page': 20,
      if (state != null) 'state': state,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, InvoicePaymentRecord.fromJson);
  }
}
