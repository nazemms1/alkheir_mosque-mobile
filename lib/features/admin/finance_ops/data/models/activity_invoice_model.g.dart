// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivitySummaryModelImpl _$$ActivitySummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivitySummaryModelImpl(
      id: jsonIntLenient(json['id']),
      title: jsonStringValue(json['title']),
      description: jsonStringLenient(json['description']),
      activityDate: jsonStringLenient(json['activity_date']),
      feeAmount: jsonDoubleLenient(json['fee_amount']),
      expectedRevenue: jsonDoubleLenient(json['expected_revenue']),
      collectedRevenue: jsonDoubleLenient(json['collected_revenue']),
      expenseTotal: jsonDoubleLenient(json['expense_total']),
      isActive: jsonBoolLenient(json['is_active']),
      groupName: _activitySummaryGroupNameValue(
          _activitySummaryGroupName(json, 'groupName')),
      courseName: _activitySummaryCourseNameValue(
          _activitySummaryCourseName(json, 'courseName')),
    );

_$ActivityDetailModelImpl _$$ActivityDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityDetailModelImpl(
      summary: _activityDetailSummary(json, 'summary') == null
          ? null
          : ActivitySummaryModel.fromJson(
              _activityDetailSummary(json, 'summary') as Map<String, dynamic>),
      status: jsonStringLenient(json['status']),
      audienceScope: jsonStringLenient(json['audience_scope']),
      registrationsCount: jsonIntLenient(json['registrations_count']),
      paymentsCount: jsonIntLenient(json['payments_count']),
      expensesCount: jsonIntLenient(json['expenses_count']),
      targetGroups: (readJsonList(json, 'target_groups') as List<dynamic>?)
          ?.map((e) => NamedRefModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$ActivityRegistrationModelImpl _$$ActivityRegistrationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityRegistrationModelImpl(
      id: jsonIntLenient(json['id']),
      studentId: _activityRegistrationStudentIdValue(
          _activityRegistrationStudentId(json, 'studentId')),
      studentName: _activityRegistrationStudentNameValue(
          _activityRegistrationStudentName(json, 'studentName')),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      groupName: jsonStringLenient(json['group_name']),
      feeAmount: jsonDoubleLenient(json['fee_amount']),
      paidTotal: jsonDoubleLenient(json['paid_total']),
      balance: jsonDoubleLenient(json['balance']),
      status: jsonStringValue(json['status']),
      notes: jsonStringLenient(json['notes']),
    );

_$ActivityPaymentModelImpl _$$ActivityPaymentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityPaymentModelImpl(
      id: jsonIntLenient(json['id']),
      registrationId: jsonIntLenient(json['activity_registration_id']),
      studentName: _activityPaymentStudentNameValue(
          _activityPaymentStudentName(json, 'studentName')),
      amount: jsonDoubleLenient(json['amount']),
      paidAt: jsonStringValue(json['paid_at']),
      paymentMethodName: _activityPaymentPaymentMethodNameValue(
          _activityPaymentPaymentMethodName(json, 'paymentMethodName')),
      referenceNo: jsonStringLenient(json['reference_no']),
      voidedAt: jsonStringLenient(json['voided_at']),
    );

_$ActivityExpenseModelImpl _$$ActivityExpenseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityExpenseModelImpl(
      id: jsonIntLenient(json['id']),
      amount: jsonDoubleLenient(json['amount']),
      description: jsonStringValue(json['description']),
      categoryId: _activityExpenseCategoryIdValue(
          _activityExpenseCategoryId(json, 'categoryId')),
      categoryName: _activityExpenseCategoryNameValue(
          _activityExpenseCategoryName(json, 'categoryName')),
      spentOn: jsonStringValue(json['spent_on']),
    );

_$InvoiceSummaryModelImpl _$$InvoiceSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceSummaryModelImpl(
      id: jsonIntLenient(json['id']),
      invoiceNo: jsonStringValue(json['invoice_no']),
      invoiceType: jsonStringValue(json['invoice_type']),
      issueDate: jsonStringValue(json['issue_date']),
      dueDate: jsonStringLenient(json['due_date']),
      status: jsonStringValue(json['status']),
      total: jsonDoubleLenient(json['total']),
      discount: jsonDoubleLenient(json['discount']),
      paidTotal: jsonDoubleLenient(json['paid_total']),
      balance: jsonDoubleLenient(json['balance']),
      itemsCount: jsonIntLenient(json['items_count']),
      parentName: _invoiceSummaryParentNameValue(
          _invoiceSummaryParentName(json, 'parentName')),
    );

_$InvoiceItemRecordModelImpl _$$InvoiceItemRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceItemRecordModelImpl(
      id: jsonIntLenient(json['id']),
      description: jsonStringValue(json['description']),
      quantity: jsonDoubleLenient(json['quantity']),
      unitPrice: jsonDoubleLenient(json['unit_price']),
      amount: jsonDoubleLenient(json['amount']),
      studentName: _invoiceItemRecordStudentNameValue(
          _invoiceItemRecordStudentName(json, 'studentName')),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      activityId: jsonIntLenient(json['activity_id']),
      groupName: jsonStringLenient(json['group_name']),
    );

_$InvoicePaymentRecordModelImpl _$$InvoicePaymentRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoicePaymentRecordModelImpl(
      id: jsonIntLenient(json['id']),
      invoiceId: jsonIntLenient(json['invoice_id']),
      invoiceNo: _invoicePaymentRecordInvoiceNoValue(
          _invoicePaymentRecordInvoiceNo(json, 'invoiceNo')),
      parentName: _invoicePaymentRecordParentNameValue(
          _invoicePaymentRecordParentName(json, 'parentName')),
      amount: jsonDoubleLenient(json['amount']),
      paidAt: jsonStringValue(json['paid_at']),
      paymentMethodName: _invoicePaymentRecordPaymentMethodNameValue(
          _invoicePaymentRecordPaymentMethodName(json, 'paymentMethodName')),
      referenceNo: jsonStringLenient(json['reference_no']),
      notes: jsonStringLenient(json['notes']),
      voidedAt: jsonStringLenient(json['voided_at']),
      voidReason: jsonStringLenient(json['void_reason']),
    );

_$InvoiceDetailModelImpl _$$InvoiceDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceDetailModelImpl(
      id: jsonIntLenient(json['id']),
      invoiceNo: jsonStringValue(json['invoice_no']),
      invoiceType: jsonStringValue(json['invoice_type']),
      issueDate: jsonStringValue(json['issue_date']),
      dueDate: jsonStringLenient(json['due_date']),
      status: jsonStringValue(json['status']),
      subtotal: jsonDoubleLenient(json['subtotal']),
      discount: jsonDoubleLenient(json['discount']),
      total: jsonDoubleLenient(json['total']),
      paidTotal: jsonDoubleLenient(json['paid_total']),
      balance: jsonDoubleLenient(json['balance']),
      parentName: _invoiceDetailParentNameValue(
          _invoiceDetailParentName(json, 'parentName')),
      notes: jsonStringLenient(json['notes']),
      items: (readJsonList(json, 'items') as List<dynamic>?)
          ?.map(
              (e) => InvoiceItemRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (readJsonList(json, 'payments') as List<dynamic>?)
          ?.map((e) =>
              InvoicePaymentRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
