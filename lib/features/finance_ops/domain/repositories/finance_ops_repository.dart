import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../data/models/activity_invoice_model.dart';

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
