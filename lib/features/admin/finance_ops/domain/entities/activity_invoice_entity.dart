import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart'
    show NamedRef;

/// نماذج الأنشطة والفواتير والمدفوعات — مطابقة لـ `FinanceRecordsController`
/// و`FinanceWriteController` في الباك إند.

class ActivitySummary {
  final int id;
  final String title;
  final String? description;
  final String? activityDate;
  final double feeAmount;
  final double expectedRevenue;
  final double collectedRevenue;
  final double expenseTotal;
  final bool isActive;
  final String? groupName;
  final String? courseName;

  const ActivitySummary({
    required this.id,
    required this.title,
    required this.description,
    required this.activityDate,
    required this.feeAmount,
    required this.expectedRevenue,
    required this.collectedRevenue,
    required this.expenseTotal,
    required this.isActive,
    required this.groupName,
    required this.courseName,
  });

  double get netRevenue => collectedRevenue - expenseTotal;
}

class ActivityDetail {
  final ActivitySummary summary;
  final String? status;
  final String? audienceScope;
  final int registrationsCount;
  final int paymentsCount;
  final int expensesCount;
  final List<NamedRef> targetGroups;

  const ActivityDetail({
    required this.summary,
    required this.status,
    required this.audienceScope,
    required this.registrationsCount,
    required this.paymentsCount,
    required this.expensesCount,
    required this.targetGroups,
  });
}

class ActivityRegistration {
  final int id;
  final int? studentId;
  final String studentName;
  final int? enrollmentId;
  final String? groupName;
  final double feeAmount;
  final double paidTotal;
  final double balance;
  final String status;
  final String? notes;

  const ActivityRegistration({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.enrollmentId,
    required this.groupName,
    required this.feeAmount,
    required this.paidTotal,
    required this.balance,
    required this.status,
    required this.notes,
  });
}

class ActivityPayment {
  final int id;
  final int registrationId;
  final String studentName;
  final double amount;
  final String paidAt;
  final String? paymentMethodName;
  final String? referenceNo;
  final String? voidedAt;

  const ActivityPayment({
    required this.id,
    required this.registrationId,
    required this.studentName,
    required this.amount,
    required this.paidAt,
    required this.paymentMethodName,
    required this.referenceNo,
    required this.voidedAt,
  });

  bool get isVoided => voidedAt != null;
}

class ActivityExpense {
  final int id;
  final double amount;
  final String description;
  final int? categoryId;
  final String? categoryName;
  final String spentOn;

  const ActivityExpense({
    required this.id,
    required this.amount,
    required this.description,
    required this.categoryId,
    required this.categoryName,
    required this.spentOn,
  });
}

class InvoiceSummary {
  final int id;
  final String invoiceNo;
  final String invoiceType;
  final String issueDate;
  final String? dueDate;
  final String status;
  final double total;
  final double discount;
  final double paidTotal;
  final double balance;
  final int itemsCount;
  final String? parentName;

  const InvoiceSummary({
    required this.id,
    required this.invoiceNo,
    required this.invoiceType,
    required this.issueDate,
    required this.dueDate,
    required this.status,
    required this.total,
    required this.discount,
    required this.paidTotal,
    required this.balance,
    required this.itemsCount,
    required this.parentName,
  });

  bool get isPaid => status == 'paid';
}

class InvoiceItemRecord {
  final int id;
  final String description;
  final double quantity;
  final double unitPrice;
  final double amount;
  final String? studentName;
  final int? enrollmentId;
  final int? activityId;
  final String? groupName;

  const InvoiceItemRecord({
    required this.id,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.amount,
    required this.studentName,
    required this.enrollmentId,
    required this.activityId,
    required this.groupName,
  });
}

class InvoicePaymentRecord {
  final int id;
  final int invoiceId;
  final String? invoiceNo;
  final String? parentName;
  final double amount;
  final String paidAt;
  final String? paymentMethodName;
  final String? referenceNo;
  final String? notes;
  final String? voidedAt;
  final String? voidReason;

  const InvoicePaymentRecord({
    required this.id,
    required this.invoiceId,
    required this.invoiceNo,
    required this.parentName,
    required this.amount,
    required this.paidAt,
    required this.paymentMethodName,
    required this.referenceNo,
    required this.notes,
    required this.voidedAt,
    required this.voidReason,
  });

  bool get isVoided => voidedAt != null;
}

class InvoiceDetail {
  final int id;
  final String invoiceNo;
  final String invoiceType;
  final String issueDate;
  final String? dueDate;
  final String status;
  final double subtotal;
  final double discount;
  final double total;
  final double paidTotal;
  final double balance;
  final String? parentName;
  final String? notes;
  final List<InvoiceItemRecord> items;
  final List<InvoicePaymentRecord> payments;

  const InvoiceDetail({
    required this.id,
    required this.invoiceNo,
    required this.invoiceType,
    required this.issueDate,
    required this.dueDate,
    required this.status,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.paidTotal,
    required this.balance,
    required this.parentName,
    required this.notes,
    required this.items,
    required this.payments,
  });

  bool get isPaid => status == 'paid';
}
