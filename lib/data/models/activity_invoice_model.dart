import 'json_helpers.dart';
import 'quran_test_model.dart' show NamedRef;

/// نماذج الأنشطة والفواتير والمدفوعات — مطابقة لـ `FinanceRecordsController`
/// و`FinanceWriteController` في الباك إند.

String? _nameOf(Object? json) => jsonStringOrNull(jsonMap(json)?['name']);

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

  factory ActivitySummary.fromJson(Map<String, dynamic> json) {
    final group = jsonMap(json['group']);
    return ActivitySummary(
      id: jsonInt(json['id']),
      title: jsonString(json['title']),
      description: jsonStringOrNull(json['description']),
      activityDate: jsonStringOrNull(json['activity_date']),
      feeAmount: jsonDouble(json['fee_amount']),
      expectedRevenue: jsonDouble(json['expected_revenue']),
      collectedRevenue: jsonDouble(json['collected_revenue']),
      expenseTotal: jsonDouble(json['expense_total']),
      isActive: jsonBool(json['is_active']),
      groupName: jsonStringOrNull(group?['name']),
      courseName: jsonStringOrNull(group?['course_name']),
    );
  }

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

  factory ActivityDetail.fromJson(Map<String, dynamic> json) {
    return ActivityDetail(
      summary: ActivitySummary.fromJson(json),
      status: jsonStringOrNull(json['status']),
      audienceScope: jsonStringOrNull(json['audience_scope']),
      registrationsCount: jsonInt(json['registrations_count']),
      paymentsCount: jsonInt(json['payments_count']),
      expensesCount: jsonInt(json['expenses_count']),
      targetGroups: [
        for (final g in (json['target_groups'] as List? ?? const []))
          if (NamedRef.fromJson(g) != null) NamedRef.fromJson(g)!,
      ],
    );
  }
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

  factory ActivityRegistration.fromJson(Map<String, dynamic> json) {
    final student = jsonMap(json['student']);
    return ActivityRegistration(
      id: jsonInt(json['id']),
      studentId: jsonIntOrNull(student?['id']),
      studentName: jsonString(student?['name']),
      enrollmentId: jsonIntOrNull(json['enrollment_id']),
      groupName: jsonStringOrNull(json['group_name']),
      feeAmount: jsonDouble(json['fee_amount']),
      paidTotal: jsonDouble(json['paid_total']),
      balance: jsonDouble(json['balance']),
      status: jsonString(json['status']),
      notes: jsonStringOrNull(json['notes']),
    );
  }
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

  factory ActivityPayment.fromJson(Map<String, dynamic> json) {
    return ActivityPayment(
      id: jsonInt(json['id']),
      registrationId: jsonInt(json['activity_registration_id']),
      studentName: jsonString(jsonMap(json['student'])?['name']),
      amount: jsonDouble(json['amount']),
      paidAt: jsonString(json['paid_at']),
      paymentMethodName: _nameOf(json['payment_method']),
      referenceNo: jsonStringOrNull(json['reference_no']),
      voidedAt: jsonStringOrNull(json['voided_at']),
    );
  }

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

  factory ActivityExpense.fromJson(Map<String, dynamic> json) {
    final category = jsonMap(json['expense_category']);
    return ActivityExpense(
      id: jsonInt(json['id']),
      amount: jsonDouble(json['amount']),
      description: jsonString(json['description']),
      categoryId: jsonIntOrNull(category?['id']),
      categoryName: jsonStringOrNull(category?['name']),
      spentOn: jsonString(json['spent_on']),
    );
  }
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

  factory InvoiceSummary.fromJson(Map<String, dynamic> json) {
    final parent = json['parent'];
    return InvoiceSummary(
      id: jsonInt(json['id']),
      invoiceNo: jsonString(json['invoice_no']),
      invoiceType: jsonString(json['invoice_type']),
      issueDate: jsonString(json['issue_date']),
      dueDate: jsonStringOrNull(json['due_date']),
      status: jsonString(json['status']),
      total: jsonDouble(json['total']),
      discount: jsonDouble(json['discount']),
      paidTotal: jsonDouble(json['paid_total']),
      balance: jsonDouble(json['balance']),
      itemsCount: jsonInt(json['items_count']),
      // القائمة ترسل اسم ولي الأمر نصاً، والتفاصيل ترسله كائناً {id, name}.
      parentName: parent is Map
          ? jsonStringOrNull(parent['name'])
          : jsonStringOrNull(parent),
    );
  }

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

  factory InvoiceItemRecord.fromJson(Map<String, dynamic> json) {
    return InvoiceItemRecord(
      id: jsonInt(json['id']),
      description: jsonString(json['description']),
      quantity: jsonDouble(json['quantity']),
      unitPrice: jsonDouble(json['unit_price']),
      amount: jsonDouble(json['amount']),
      studentName: jsonStringOrNull(jsonMap(json['student'])?['name']),
      enrollmentId: jsonIntOrNull(json['enrollment_id']),
      activityId: jsonIntOrNull(json['activity_id']),
      groupName: jsonStringOrNull(json['group_name']),
    );
  }
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

  factory InvoicePaymentRecord.fromJson(Map<String, dynamic> json) {
    final invoice = jsonMap(json['invoice']);
    return InvoicePaymentRecord(
      id: jsonInt(json['id']),
      invoiceId: jsonInt(json['invoice_id']),
      invoiceNo: jsonStringOrNull(invoice?['invoice_no']),
      parentName: jsonStringOrNull(invoice?['parent_name']),
      amount: jsonDouble(json['amount']),
      paidAt: jsonString(json['paid_at']),
      paymentMethodName: _nameOf(json['payment_method']),
      referenceNo: jsonStringOrNull(json['reference_no']),
      notes: jsonStringOrNull(json['notes']),
      voidedAt: jsonStringOrNull(json['voided_at']),
      voidReason: jsonStringOrNull(json['void_reason']),
    );
  }

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

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) {
    return InvoiceDetail(
      id: jsonInt(json['id']),
      invoiceNo: jsonString(json['invoice_no']),
      invoiceType: jsonString(json['invoice_type']),
      issueDate: jsonString(json['issue_date']),
      dueDate: jsonStringOrNull(json['due_date']),
      status: jsonString(json['status']),
      subtotal: jsonDouble(json['subtotal']),
      discount: jsonDouble(json['discount']),
      total: jsonDouble(json['total']),
      paidTotal: jsonDouble(json['paid_total']),
      balance: jsonDouble(json['balance']),
      parentName: _parentNameOf(json['parent']),
      notes: jsonStringOrNull(json['notes']),
      items: jsonList(json['items'], InvoiceItemRecord.fromJson),
      payments: jsonList(json['payments'], InvoicePaymentRecord.fromJson),
    );
  }

  bool get isPaid => status == 'paid';
}

String? _parentNameOf(Object? parent) =>
    parent is Map ? jsonStringOrNull(parent['name']) : jsonStringOrNull(parent);
