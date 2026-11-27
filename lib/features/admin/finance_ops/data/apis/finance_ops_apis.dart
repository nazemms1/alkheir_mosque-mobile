import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/data/params/finance_ops_params.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';

import '../models/activity_invoice_model.dart';

part 'finance_ops_apis.g.dart';

@RestApi()
abstract class FinanceOpsApis {
  factory FinanceOpsApis(Dio dio) = _FinanceOpsApis;

  // ─── الأنشطة ───────────────────────────────────────────────────────────────
  @GET('activities')
  Future<BaseApiModel<List<ActivitySummaryModel>>> activities(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('is_active') int? isActive,
  });

  @GET('activities/{id}')
  Future<BaseApiModel<ActivityDetailModel>> activity(@Path('id') int id);

  @GET('activities/{activityId}/registrations')
  Future<BaseApiModel<List<ActivityRegistrationModel>>> registrations(
    @Path('activityId') int activityId,
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('status') String? status,
    @Query('student_id') int? studentId,
  });

  @POST('activities/{activityId}/registrations')
  Future<void> createRegistration(@Path('activityId') int activityId,
      @Body() SaveRegistrationParams params);

  @PATCH('activities/{activityId}/registrations/{id}')
  Future<void> updateRegistration(@Path('activityId') int activityId,
      @Path('id') int id, @Body() SaveRegistrationParams params);

  @DELETE('activities/{activityId}/registrations/{id}')
  Future<void> deleteRegistration(
      @Path('activityId') int activityId, @Path('id') int id);

  @GET('activities/{activityId}/payments')
  Future<BaseApiModel<List<ActivityPaymentModel>>> activityPayments(
    @Path('activityId') int activityId,
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('state') String? state,
  });

  @POST('activities/{activityId}/payments')
  Future<void> addActivityPayment(@Path('activityId') int activityId,
      @Body() AddActivityPaymentParams params);

  @POST('activities/{activityId}/payments/{paymentId}/void')
  Future<void> voidActivityPayment(
      @Path('activityId') int activityId, @Path('paymentId') int paymentId);

  @GET('activities/{activityId}/expenses')
  Future<BaseApiModel<List<ActivityExpenseModel>>> activityExpenses(
    @Path('activityId') int activityId,
    @Query('page') int page,
    @Query('per_page') int perPage,
  );

  @POST('activities/{activityId}/expenses')
  Future<void> createActivityExpense(@Path('activityId') int activityId,
      @Body() SaveActivityExpenseParams params);

  @PATCH('activities/{activityId}/expenses/{id}')
  Future<void> updateActivityExpense(@Path('activityId') int activityId,
      @Path('id') int id, @Body() SaveActivityExpenseParams params);

  @DELETE('activities/{activityId}/expenses/{id}')
  Future<void> deleteActivityExpense(
      @Path('activityId') int activityId, @Path('id') int id);

  // ─── الفواتير ──────────────────────────────────────────────────────────────
  @GET('invoices')
  Future<BaseApiModel<List<InvoiceSummaryModel>>> invoices(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('status') String? status,
    @Query('parent_id') int? parentId,
  });

  @GET('invoices/{id}')
  Future<BaseApiModel<InvoiceDetailModel>> invoice(@Path('id') int id);

  @POST('invoices/{invoiceId}/items')
  Future<void> addInvoiceItem(
      @Path('invoiceId') int invoiceId, @Body() AddInvoiceItemParams params);

  @DELETE('invoices/{invoiceId}/items/{itemId}')
  Future<void> deleteInvoiceItem(
      @Path('invoiceId') int invoiceId, @Path('itemId') int itemId);

  @POST('invoices/{invoiceId}/payments')
  Future<void> addInvoicePayment(
      @Path('invoiceId') int invoiceId, @Body() AddInvoicePaymentParams params);

  @POST('invoices/{invoiceId}/payments/{paymentId}/void')
  Future<void> voidInvoicePayment(
      @Path('invoiceId') int invoiceId, @Path('paymentId') int paymentId);

  @GET('payments')
  Future<BaseApiModel<List<InvoicePaymentRecordModel>>> payments(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('state') String? state,
    @Query('invoice_id') int? invoiceId,
    @Query('date_from') String? dateFrom,
    @Query('date_to') String? dateTo,
  });
}
