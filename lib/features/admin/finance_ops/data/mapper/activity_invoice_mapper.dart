import 'package:alkheir_mosque/features/admin/finance_ops/data/models/activity_invoice_model.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/domain/entities/activity_invoice_entity.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/mapper/quran_test_mapper.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/models/quran_test_model.dart';

extension ActivitySummaryModelMapper on ActivitySummaryModel? {
  ActivitySummary toDomain() {
    return ActivitySummary(
      id: this?.id ?? 0,
      title: this?.title ?? '',
      description: this?.description,
      activityDate: this?.activityDate,
      feeAmount: this?.feeAmount ?? 0.0,
      expectedRevenue: this?.expectedRevenue ?? 0.0,
      collectedRevenue: this?.collectedRevenue ?? 0.0,
      expenseTotal: this?.expenseTotal ?? 0.0,
      isActive: this?.isActive ?? false,
      groupName: this?.groupName,
      courseName: this?.courseName,
    );
  }
}

extension ActivityDetailModelMapper on ActivityDetailModel? {
  ActivityDetail toDomain() {
    return ActivityDetail(
      summary: (this?.summary).toDomain(),
      status: this?.status,
      audienceScope: this?.audienceScope,
      registrationsCount: this?.registrationsCount ?? 0,
      paymentsCount: this?.paymentsCount ?? 0,
      expensesCount: this?.expensesCount ?? 0,
      targetGroups: [
        for (final e in this?.targetGroups ?? const <NamedRefModel>[])
          if (e.toDomain() case final v?) v
      ],
    );
  }
}

extension ActivityRegistrationModelMapper on ActivityRegistrationModel? {
  ActivityRegistration toDomain() {
    return ActivityRegistration(
      id: this?.id ?? 0,
      studentId: this?.studentId,
      studentName: this?.studentName ?? '',
      enrollmentId: this?.enrollmentId,
      groupName: this?.groupName,
      feeAmount: this?.feeAmount ?? 0.0,
      paidTotal: this?.paidTotal ?? 0.0,
      balance: this?.balance ?? 0.0,
      status: this?.status ?? '',
      notes: this?.notes,
    );
  }
}

extension ActivityPaymentModelMapper on ActivityPaymentModel? {
  ActivityPayment toDomain() {
    return ActivityPayment(
      id: this?.id ?? 0,
      registrationId: this?.registrationId ?? 0,
      studentName: this?.studentName ?? '',
      amount: this?.amount ?? 0.0,
      paidAt: this?.paidAt ?? '',
      paymentMethodName: this?.paymentMethodName,
      referenceNo: this?.referenceNo,
      voidedAt: this?.voidedAt,
    );
  }
}

extension ActivityExpenseModelMapper on ActivityExpenseModel? {
  ActivityExpense toDomain() {
    return ActivityExpense(
      id: this?.id ?? 0,
      amount: this?.amount ?? 0.0,
      description: this?.description ?? '',
      categoryId: this?.categoryId,
      categoryName: this?.categoryName,
      spentOn: this?.spentOn ?? '',
    );
  }
}

extension InvoiceSummaryModelMapper on InvoiceSummaryModel? {
  InvoiceSummary toDomain() {
    return InvoiceSummary(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo ?? '',
      invoiceType: this?.invoiceType ?? '',
      issueDate: this?.issueDate ?? '',
      dueDate: this?.dueDate,
      status: this?.status ?? '',
      total: this?.total ?? 0.0,
      discount: this?.discount ?? 0.0,
      paidTotal: this?.paidTotal ?? 0.0,
      balance: this?.balance ?? 0.0,
      itemsCount: this?.itemsCount ?? 0,
      parentName: this?.parentName,
    );
  }
}

extension InvoiceItemRecordModelMapper on InvoiceItemRecordModel? {
  InvoiceItemRecord toDomain() {
    return InvoiceItemRecord(
      id: this?.id ?? 0,
      description: this?.description ?? '',
      quantity: this?.quantity ?? 0.0,
      unitPrice: this?.unitPrice ?? 0.0,
      amount: this?.amount ?? 0.0,
      studentName: this?.studentName,
      enrollmentId: this?.enrollmentId,
      activityId: this?.activityId,
      groupName: this?.groupName,
    );
  }
}

extension InvoicePaymentRecordModelMapper on InvoicePaymentRecordModel? {
  InvoicePaymentRecord toDomain() {
    return InvoicePaymentRecord(
      id: this?.id ?? 0,
      invoiceId: this?.invoiceId ?? 0,
      invoiceNo: this?.invoiceNo,
      parentName: this?.parentName,
      amount: this?.amount ?? 0.0,
      paidAt: this?.paidAt ?? '',
      paymentMethodName: this?.paymentMethodName,
      referenceNo: this?.referenceNo,
      notes: this?.notes,
      voidedAt: this?.voidedAt,
      voidReason: this?.voidReason,
    );
  }
}

extension InvoiceDetailModelMapper on InvoiceDetailModel? {
  InvoiceDetail toDomain() {
    return InvoiceDetail(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo ?? '',
      invoiceType: this?.invoiceType ?? '',
      issueDate: this?.issueDate ?? '',
      dueDate: this?.dueDate,
      status: this?.status ?? '',
      subtotal: this?.subtotal ?? 0.0,
      discount: this?.discount ?? 0.0,
      total: this?.total ?? 0.0,
      paidTotal: this?.paidTotal ?? 0.0,
      balance: this?.balance ?? 0.0,
      parentName: this?.parentName,
      notes: this?.notes,
      items: [
        for (final e in this?.items ?? const <InvoiceItemRecordModel>[])
          e.toDomain()
      ],
      payments: [
        for (final e in this?.payments ?? const <InvoicePaymentRecordModel>[])
          e.toDomain()
      ],
    );
  }
}
