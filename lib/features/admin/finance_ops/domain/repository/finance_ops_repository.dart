import 'package:alkheir_mosque/features/admin/finance_ops/data/params/finance_ops_params.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/domain/entities/activity_invoice_entity.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/data/mapper/activity_invoice_mapper.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/data/mapper/shared_mapper.dart';

import '../../data/apis/finance_ops_apis.dart';

abstract class FinanceOpsRepository {
  Future<PagedResult<ActivitySummary>> activities({
    int page = 1,
    bool? isActive,
  });

  Future<ActivityDetail> activity(int id);

  Future<PagedResult<ActivityRegistration>> registrations(
    int activityId, {
    int page = 1,
    String? status,
    int? studentId,
  });

  Future<void> saveRegistration(
    int activityId, {
    int? id,
    required int studentId,
    required double feeAmount,
    required String status,
    int? enrollmentId,
    String? notes,
  });

  Future<void> deleteRegistration(int activityId, int id);

  Future<PagedResult<ActivityPayment>> activityPayments(
    int activityId, {
    int page = 1,
    String? state,
  });

  Future<void> addActivityPayment(
    int activityId, {
    required int registrationId,
    required double amount,
    required String paidAt,
    required int paymentMethodId,
    String? referenceNo,
    String? notes,
  });

  Future<void> voidActivityPayment(int activityId, int paymentId);

  Future<PagedResult<ActivityExpense>> activityExpenses(
    int activityId, {
    int page = 1,
  });

  Future<void> saveActivityExpense(
    int activityId, {
    int? id,
    required double amount,
    required String description,
    required int expenseCategoryId,
    required String spentOn,
  });

  Future<void> deleteActivityExpense(int activityId, int id);

  Future<PagedResult<InvoiceSummary>> invoices({
    int page = 1,
    String? status,
    int? parentId,
  });

  Future<InvoiceDetail> invoice(int id);

  Future<void> addInvoiceItem(
    int invoiceId, {
    required String description,
    required double quantity,
    required double unitPrice,
    int? studentId,
    int? enrollmentId,
    int? activityId,
  });

  Future<void> deleteInvoiceItem(int invoiceId, int itemId);

  Future<void> addInvoicePayment(
    int invoiceId, {
    required double amount,
    required String paidAt,
    required int paymentMethodId,
    String? referenceNo,
    String? notes,
  });

  Future<void> voidInvoicePayment(int invoiceId, int paymentId);

  Future<PagedResult<InvoicePaymentRecord>> payments({
    int page = 1,
    String? state,
    int? invoiceId,
    String? dateFrom,
    String? dateTo,
  });
}

class FinanceOpsRepositoryImpl implements FinanceOpsRepository {
  static const _perPage = 20;

  final FinanceOpsApis api;

  FinanceOpsRepositoryImpl(this.api);

  // ─── الأنشطة ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<ActivitySummary>> activities({
    int page = 1,
    bool? isActive,
  }) async {
    final result = await handleRepoData(
        () => api.activities(page, _perPage, isActive: queryFlag(isActive)));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<ActivityDetail> activity(int id) async {
    final result = await handleRepoData(() => api.activity(id));
    return result.data.toDomain();
  }

  @override
  Future<PagedResult<ActivityRegistration>> registrations(
    int activityId, {
    int page = 1,
    String? status,
    int? studentId,
  }) async {
    final result = await handleRepoData(() => api.registrations(
        activityId, page, _perPage,
        status: status, studentId: studentId));
    return result.toPaged((e) => e.toDomain());
  }

  /// `id` يُرسل للتعديل فقط. `status`: registered | declined | cancelled | attended.
  @override
  Future<void> saveRegistration(
    int activityId, {
    int? id,
    required int studentId,
    required double feeAmount,
    required String status,
    int? enrollmentId,
    String? notes,
  }) async {
    final body = SaveRegistrationParams(
        studentId: studentId,
        feeAmount: feeAmount,
        status: status,
        enrollmentId: (enrollmentId != null) ? enrollmentId : null,
        notes: (notes != null && notes.isNotEmpty) ? notes : null);
    await handleRepoData(() => id == null
        ? api.createRegistration(activityId, body)
        : api.updateRegistration(activityId, id, body));
  }

  /// يرفض الخادم الحذف إن وُجدت مدفوعات نشطة (422).
  @override
  Future<void> deleteRegistration(int activityId, int id) =>
      handleRepoData(() => api.deleteRegistration(activityId, id));

  @override
  Future<PagedResult<ActivityPayment>> activityPayments(
    int activityId, {
    int page = 1,
    String? state,
  }) async {
    final result = await handleRepoData(
        () => api.activityPayments(activityId, page, _perPage, state: state));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<void> addActivityPayment(
    int activityId, {
    required int registrationId,
    required double amount,
    required String paidAt,
    required int paymentMethodId,
    String? referenceNo,
    String? notes,
  }) async {
    await handleRepoData(() => api.addActivityPayment(
        activityId,
        AddActivityPaymentParams(
            activityRegistrationId: registrationId,
            amount: amount,
            paidAt: paidAt,
            paymentMethodId: paymentMethodId,
            referenceNo: (referenceNo != null && referenceNo.isNotEmpty)
                ? referenceNo
                : null,
            notes: (notes != null && notes.isNotEmpty) ? notes : null)));
  }

  @override
  Future<void> voidActivityPayment(int activityId, int paymentId) =>
      handleRepoData(() => api.voidActivityPayment(activityId, paymentId));

  @override
  Future<PagedResult<ActivityExpense>> activityExpenses(
    int activityId, {
    int page = 1,
  }) async {
    final result = await handleRepoData(
        () => api.activityExpenses(activityId, page, _perPage));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<void> saveActivityExpense(
    int activityId, {
    int? id,
    required double amount,
    required String description,
    required int expenseCategoryId,
    required String spentOn,
  }) async {
    final body = SaveActivityExpenseParams(
        amount: amount,
        description: description,
        expenseCategoryId: expenseCategoryId,
        spentOn: spentOn);
    await handleRepoData(() => id == null
        ? api.createActivityExpense(activityId, body)
        : api.updateActivityExpense(activityId, id, body));
  }

  @override
  Future<void> deleteActivityExpense(int activityId, int id) =>
      handleRepoData(() => api.deleteActivityExpense(activityId, id));

  // ─── الفواتير ──────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<InvoiceSummary>> invoices({
    int page = 1,
    String? status,
    int? parentId,
  }) async {
    final result = await handleRepoData(
        () => api.invoices(page, _perPage, status: status, parentId: parentId));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<InvoiceDetail> invoice(int id) async {
    final result = await handleRepoData(() => api.invoice(id));
    return result.data.toDomain();
  }

  @override
  Future<void> addInvoiceItem(
    int invoiceId, {
    required String description,
    required double quantity,
    required double unitPrice,
    int? studentId,
    int? enrollmentId,
    int? activityId,
  }) async {
    await handleRepoData(() => api.addInvoiceItem(
        invoiceId,
        AddInvoiceItemParams(
            description: description,
            quantity: quantity,
            unitPrice: unitPrice,
            studentId: (studentId != null) ? studentId : null,
            enrollmentId: (enrollmentId != null) ? enrollmentId : null,
            activityId: (activityId != null) ? activityId : null)));
  }

  @override
  Future<void> deleteInvoiceItem(int invoiceId, int itemId) =>
      handleRepoData(() => api.deleteInvoiceItem(invoiceId, itemId));

  @override
  Future<void> addInvoicePayment(
    int invoiceId, {
    required double amount,
    required String paidAt,
    required int paymentMethodId,
    String? referenceNo,
    String? notes,
  }) async {
    await handleRepoData(() => api.addInvoicePayment(
        invoiceId,
        AddInvoicePaymentParams(
            amount: amount,
            paidAt: paidAt,
            paymentMethodId: paymentMethodId,
            referenceNo: (referenceNo != null && referenceNo.isNotEmpty)
                ? referenceNo
                : null,
            notes: (notes != null && notes.isNotEmpty) ? notes : null)));
  }

  @override
  Future<void> voidInvoicePayment(int invoiceId, int paymentId) =>
      handleRepoData(() => api.voidInvoicePayment(invoiceId, paymentId));

  /// كل مدفوعات الفواتير التي يملك المستخدم صلاحية رؤيتها.
  @override
  Future<PagedResult<InvoicePaymentRecord>> payments({
    int page = 1,
    String? state,
    int? invoiceId,
    String? dateFrom,
    String? dateTo,
  }) async {
    final result = await handleRepoData(() => api.payments(page, _perPage,
        state: state,
        invoiceId: invoiceId,
        dateFrom: dateFrom,
        dateTo: dateTo));
    return result.toPaged((e) => e.toDomain());
  }
}
