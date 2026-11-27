// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_ops_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddActivityPaymentParamsImpl _$$AddActivityPaymentParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AddActivityPaymentParamsImpl(
      activityRegistrationId:
          (json['activity_registration_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      paidAt: json['paid_at'] as String?,
      paymentMethodId: (json['payment_method_id'] as num?)?.toInt(),
      referenceNo: json['reference_no'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$AddActivityPaymentParamsImplToJson(
        _$AddActivityPaymentParamsImpl instance) =>
    <String, dynamic>{
      'activity_registration_id': instance.activityRegistrationId,
      'amount': instance.amount,
      'paid_at': instance.paidAt,
      'payment_method_id': instance.paymentMethodId,
      if (instance.referenceNo case final value?) 'reference_no': value,
      if (instance.notes case final value?) 'notes': value,
    };

_$AddInvoiceItemParamsImpl _$$AddInvoiceItemParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AddInvoiceItemParamsImpl(
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      unitPrice: (json['unit_price'] as num?)?.toDouble(),
      studentId: (json['student_id'] as num?)?.toInt(),
      enrollmentId: (json['enrollment_id'] as num?)?.toInt(),
      activityId: (json['activity_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddInvoiceItemParamsImplToJson(
        _$AddInvoiceItemParamsImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      if (instance.studentId case final value?) 'student_id': value,
      if (instance.enrollmentId case final value?) 'enrollment_id': value,
      if (instance.activityId case final value?) 'activity_id': value,
    };

_$AddInvoicePaymentParamsImpl _$$AddInvoicePaymentParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AddInvoicePaymentParamsImpl(
      amount: (json['amount'] as num?)?.toDouble(),
      paidAt: json['paid_at'] as String?,
      paymentMethodId: (json['payment_method_id'] as num?)?.toInt(),
      referenceNo: json['reference_no'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$AddInvoicePaymentParamsImplToJson(
        _$AddInvoicePaymentParamsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'paid_at': instance.paidAt,
      'payment_method_id': instance.paymentMethodId,
      if (instance.referenceNo case final value?) 'reference_no': value,
      if (instance.notes case final value?) 'notes': value,
    };

_$SaveActivityExpenseParamsImpl _$$SaveActivityExpenseParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveActivityExpenseParamsImpl(
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      expenseCategoryId: (json['expense_category_id'] as num?)?.toInt(),
      spentOn: json['spent_on'] as String?,
    );

Map<String, dynamic> _$$SaveActivityExpenseParamsImplToJson(
        _$SaveActivityExpenseParamsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'description': instance.description,
      'expense_category_id': instance.expenseCategoryId,
      'spent_on': instance.spentOn,
    };

_$SaveRegistrationParamsImpl _$$SaveRegistrationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveRegistrationParamsImpl(
      studentId: (json['student_id'] as num?)?.toInt(),
      feeAmount: (json['fee_amount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      enrollmentId: (json['enrollment_id'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$SaveRegistrationParamsImplToJson(
        _$SaveRegistrationParamsImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'fee_amount': instance.feeAmount,
      'status': instance.status,
      if (instance.enrollmentId case final value?) 'enrollment_id': value,
      if (instance.notes case final value?) 'notes': value,
    };
