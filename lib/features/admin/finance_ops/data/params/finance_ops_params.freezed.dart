// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_ops_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddActivityPaymentParams _$AddActivityPaymentParamsFromJson(
    Map<String, dynamic> json) {
  return _AddActivityPaymentParams.fromJson(json);
}

/// @nodoc
mixin _$AddActivityPaymentParams {
  @JsonKey(name: 'activity_registration_id', includeIfNull: true)
  int? get activityRegistrationId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_at', includeIfNull: true)
  String? get paidAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_id', includeIfNull: true)
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_no')
  String? get referenceNo => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this AddActivityPaymentParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddActivityPaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddActivityPaymentParamsCopyWith<AddActivityPaymentParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddActivityPaymentParamsCopyWith<$Res> {
  factory $AddActivityPaymentParamsCopyWith(AddActivityPaymentParams value,
          $Res Function(AddActivityPaymentParams) then) =
      _$AddActivityPaymentParamsCopyWithImpl<$Res, AddActivityPaymentParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'activity_registration_id', includeIfNull: true)
      int? activityRegistrationId,
      @JsonKey(includeIfNull: true) double? amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) String? paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      int? paymentMethodId,
      @JsonKey(name: 'reference_no') String? referenceNo,
      String? notes});
}

/// @nodoc
class _$AddActivityPaymentParamsCopyWithImpl<$Res,
        $Val extends AddActivityPaymentParams>
    implements $AddActivityPaymentParamsCopyWith<$Res> {
  _$AddActivityPaymentParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddActivityPaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityRegistrationId = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodId = freezed,
    Object? referenceNo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      activityRegistrationId: freezed == activityRegistrationId
          ? _value.activityRegistrationId
          : activityRegistrationId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddActivityPaymentParamsImplCopyWith<$Res>
    implements $AddActivityPaymentParamsCopyWith<$Res> {
  factory _$$AddActivityPaymentParamsImplCopyWith(
          _$AddActivityPaymentParamsImpl value,
          $Res Function(_$AddActivityPaymentParamsImpl) then) =
      __$$AddActivityPaymentParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'activity_registration_id', includeIfNull: true)
      int? activityRegistrationId,
      @JsonKey(includeIfNull: true) double? amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) String? paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      int? paymentMethodId,
      @JsonKey(name: 'reference_no') String? referenceNo,
      String? notes});
}

/// @nodoc
class __$$AddActivityPaymentParamsImplCopyWithImpl<$Res>
    extends _$AddActivityPaymentParamsCopyWithImpl<$Res,
        _$AddActivityPaymentParamsImpl>
    implements _$$AddActivityPaymentParamsImplCopyWith<$Res> {
  __$$AddActivityPaymentParamsImplCopyWithImpl(
      _$AddActivityPaymentParamsImpl _value,
      $Res Function(_$AddActivityPaymentParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddActivityPaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityRegistrationId = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodId = freezed,
    Object? referenceNo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$AddActivityPaymentParamsImpl(
      activityRegistrationId: freezed == activityRegistrationId
          ? _value.activityRegistrationId
          : activityRegistrationId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$AddActivityPaymentParamsImpl implements _AddActivityPaymentParams {
  const _$AddActivityPaymentParamsImpl(
      {@JsonKey(name: 'activity_registration_id', includeIfNull: true)
      this.activityRegistrationId,
      @JsonKey(includeIfNull: true) this.amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) this.paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      this.paymentMethodId,
      @JsonKey(name: 'reference_no') this.referenceNo,
      this.notes});

  factory _$AddActivityPaymentParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddActivityPaymentParamsImplFromJson(json);

  @override
  @JsonKey(name: 'activity_registration_id', includeIfNull: true)
  final int? activityRegistrationId;
  @override
  @JsonKey(includeIfNull: true)
  final double? amount;
  @override
  @JsonKey(name: 'paid_at', includeIfNull: true)
  final String? paidAt;
  @override
  @JsonKey(name: 'payment_method_id', includeIfNull: true)
  final int? paymentMethodId;
  @override
  @JsonKey(name: 'reference_no')
  final String? referenceNo;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AddActivityPaymentParams(activityRegistrationId: $activityRegistrationId, amount: $amount, paidAt: $paidAt, paymentMethodId: $paymentMethodId, referenceNo: $referenceNo, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddActivityPaymentParamsImpl &&
            (identical(other.activityRegistrationId, activityRegistrationId) ||
                other.activityRegistrationId == activityRegistrationId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, activityRegistrationId, amount,
      paidAt, paymentMethodId, referenceNo, notes);

  /// Create a copy of AddActivityPaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddActivityPaymentParamsImplCopyWith<_$AddActivityPaymentParamsImpl>
      get copyWith => __$$AddActivityPaymentParamsImplCopyWithImpl<
          _$AddActivityPaymentParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddActivityPaymentParamsImplToJson(
      this,
    );
  }
}

abstract class _AddActivityPaymentParams implements AddActivityPaymentParams {
  const factory _AddActivityPaymentParams(
      {@JsonKey(name: 'activity_registration_id', includeIfNull: true)
      final int? activityRegistrationId,
      @JsonKey(includeIfNull: true) final double? amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) final String? paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      final int? paymentMethodId,
      @JsonKey(name: 'reference_no') final String? referenceNo,
      final String? notes}) = _$AddActivityPaymentParamsImpl;

  factory _AddActivityPaymentParams.fromJson(Map<String, dynamic> json) =
      _$AddActivityPaymentParamsImpl.fromJson;

  @override
  @JsonKey(name: 'activity_registration_id', includeIfNull: true)
  int? get activityRegistrationId;
  @override
  @JsonKey(includeIfNull: true)
  double? get amount;
  @override
  @JsonKey(name: 'paid_at', includeIfNull: true)
  String? get paidAt;
  @override
  @JsonKey(name: 'payment_method_id', includeIfNull: true)
  int? get paymentMethodId;
  @override
  @JsonKey(name: 'reference_no')
  String? get referenceNo;
  @override
  String? get notes;

  /// Create a copy of AddActivityPaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddActivityPaymentParamsImplCopyWith<_$AddActivityPaymentParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AddInvoiceItemParams _$AddInvoiceItemParamsFromJson(Map<String, dynamic> json) {
  return _AddInvoiceItemParams.fromJson(json);
}

/// @nodoc
mixin _$AddInvoiceItemParams {
  @JsonKey(includeIfNull: true)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price', includeIfNull: true)
  double? get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_id')
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id')
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_id')
  int? get activityId => throw _privateConstructorUsedError;

  /// Serializes this AddInvoiceItemParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddInvoiceItemParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddInvoiceItemParamsCopyWith<AddInvoiceItemParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddInvoiceItemParamsCopyWith<$Res> {
  factory $AddInvoiceItemParamsCopyWith(AddInvoiceItemParams value,
          $Res Function(AddInvoiceItemParams) then) =
      _$AddInvoiceItemParamsCopyWithImpl<$Res, AddInvoiceItemParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? description,
      @JsonKey(includeIfNull: true) double? quantity,
      @JsonKey(name: 'unit_price', includeIfNull: true) double? unitPrice,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'enrollment_id') int? enrollmentId,
      @JsonKey(name: 'activity_id') int? activityId});
}

/// @nodoc
class _$AddInvoiceItemParamsCopyWithImpl<$Res,
        $Val extends AddInvoiceItemParams>
    implements $AddInvoiceItemParamsCopyWith<$Res> {
  _$AddInvoiceItemParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddInvoiceItemParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? studentId = freezed,
    Object? enrollmentId = freezed,
    Object? activityId = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddInvoiceItemParamsImplCopyWith<$Res>
    implements $AddInvoiceItemParamsCopyWith<$Res> {
  factory _$$AddInvoiceItemParamsImplCopyWith(_$AddInvoiceItemParamsImpl value,
          $Res Function(_$AddInvoiceItemParamsImpl) then) =
      __$$AddInvoiceItemParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? description,
      @JsonKey(includeIfNull: true) double? quantity,
      @JsonKey(name: 'unit_price', includeIfNull: true) double? unitPrice,
      @JsonKey(name: 'student_id') int? studentId,
      @JsonKey(name: 'enrollment_id') int? enrollmentId,
      @JsonKey(name: 'activity_id') int? activityId});
}

/// @nodoc
class __$$AddInvoiceItemParamsImplCopyWithImpl<$Res>
    extends _$AddInvoiceItemParamsCopyWithImpl<$Res, _$AddInvoiceItemParamsImpl>
    implements _$$AddInvoiceItemParamsImplCopyWith<$Res> {
  __$$AddInvoiceItemParamsImplCopyWithImpl(_$AddInvoiceItemParamsImpl _value,
      $Res Function(_$AddInvoiceItemParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddInvoiceItemParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? studentId = freezed,
    Object? enrollmentId = freezed,
    Object? activityId = freezed,
  }) {
    return _then(_$AddInvoiceItemParamsImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$AddInvoiceItemParamsImpl implements _AddInvoiceItemParams {
  const _$AddInvoiceItemParamsImpl(
      {@JsonKey(includeIfNull: true) this.description,
      @JsonKey(includeIfNull: true) this.quantity,
      @JsonKey(name: 'unit_price', includeIfNull: true) this.unitPrice,
      @JsonKey(name: 'student_id') this.studentId,
      @JsonKey(name: 'enrollment_id') this.enrollmentId,
      @JsonKey(name: 'activity_id') this.activityId});

  factory _$AddInvoiceItemParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddInvoiceItemParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? description;
  @override
  @JsonKey(includeIfNull: true)
  final double? quantity;
  @override
  @JsonKey(name: 'unit_price', includeIfNull: true)
  final double? unitPrice;
  @override
  @JsonKey(name: 'student_id')
  final int? studentId;
  @override
  @JsonKey(name: 'enrollment_id')
  final int? enrollmentId;
  @override
  @JsonKey(name: 'activity_id')
  final int? activityId;

  @override
  String toString() {
    return 'AddInvoiceItemParams(description: $description, quantity: $quantity, unitPrice: $unitPrice, studentId: $studentId, enrollmentId: $enrollmentId, activityId: $activityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddInvoiceItemParamsImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, quantity, unitPrice,
      studentId, enrollmentId, activityId);

  /// Create a copy of AddInvoiceItemParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddInvoiceItemParamsImplCopyWith<_$AddInvoiceItemParamsImpl>
      get copyWith =>
          __$$AddInvoiceItemParamsImplCopyWithImpl<_$AddInvoiceItemParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddInvoiceItemParamsImplToJson(
      this,
    );
  }
}

abstract class _AddInvoiceItemParams implements AddInvoiceItemParams {
  const factory _AddInvoiceItemParams(
      {@JsonKey(includeIfNull: true) final String? description,
      @JsonKey(includeIfNull: true) final double? quantity,
      @JsonKey(name: 'unit_price', includeIfNull: true) final double? unitPrice,
      @JsonKey(name: 'student_id') final int? studentId,
      @JsonKey(name: 'enrollment_id') final int? enrollmentId,
      @JsonKey(name: 'activity_id')
      final int? activityId}) = _$AddInvoiceItemParamsImpl;

  factory _AddInvoiceItemParams.fromJson(Map<String, dynamic> json) =
      _$AddInvoiceItemParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get description;
  @override
  @JsonKey(includeIfNull: true)
  double? get quantity;
  @override
  @JsonKey(name: 'unit_price', includeIfNull: true)
  double? get unitPrice;
  @override
  @JsonKey(name: 'student_id')
  int? get studentId;
  @override
  @JsonKey(name: 'enrollment_id')
  int? get enrollmentId;
  @override
  @JsonKey(name: 'activity_id')
  int? get activityId;

  /// Create a copy of AddInvoiceItemParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddInvoiceItemParamsImplCopyWith<_$AddInvoiceItemParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AddInvoicePaymentParams _$AddInvoicePaymentParamsFromJson(
    Map<String, dynamic> json) {
  return _AddInvoicePaymentParams.fromJson(json);
}

/// @nodoc
mixin _$AddInvoicePaymentParams {
  @JsonKey(includeIfNull: true)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_at', includeIfNull: true)
  String? get paidAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_id', includeIfNull: true)
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_no')
  String? get referenceNo => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this AddInvoicePaymentParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddInvoicePaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddInvoicePaymentParamsCopyWith<AddInvoicePaymentParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddInvoicePaymentParamsCopyWith<$Res> {
  factory $AddInvoicePaymentParamsCopyWith(AddInvoicePaymentParams value,
          $Res Function(AddInvoicePaymentParams) then) =
      _$AddInvoicePaymentParamsCopyWithImpl<$Res, AddInvoicePaymentParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) double? amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) String? paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      int? paymentMethodId,
      @JsonKey(name: 'reference_no') String? referenceNo,
      String? notes});
}

/// @nodoc
class _$AddInvoicePaymentParamsCopyWithImpl<$Res,
        $Val extends AddInvoicePaymentParams>
    implements $AddInvoicePaymentParamsCopyWith<$Res> {
  _$AddInvoicePaymentParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddInvoicePaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodId = freezed,
    Object? referenceNo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddInvoicePaymentParamsImplCopyWith<$Res>
    implements $AddInvoicePaymentParamsCopyWith<$Res> {
  factory _$$AddInvoicePaymentParamsImplCopyWith(
          _$AddInvoicePaymentParamsImpl value,
          $Res Function(_$AddInvoicePaymentParamsImpl) then) =
      __$$AddInvoicePaymentParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) double? amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) String? paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      int? paymentMethodId,
      @JsonKey(name: 'reference_no') String? referenceNo,
      String? notes});
}

/// @nodoc
class __$$AddInvoicePaymentParamsImplCopyWithImpl<$Res>
    extends _$AddInvoicePaymentParamsCopyWithImpl<$Res,
        _$AddInvoicePaymentParamsImpl>
    implements _$$AddInvoicePaymentParamsImplCopyWith<$Res> {
  __$$AddInvoicePaymentParamsImplCopyWithImpl(
      _$AddInvoicePaymentParamsImpl _value,
      $Res Function(_$AddInvoicePaymentParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddInvoicePaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodId = freezed,
    Object? referenceNo = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$AddInvoicePaymentParamsImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$AddInvoicePaymentParamsImpl implements _AddInvoicePaymentParams {
  const _$AddInvoicePaymentParamsImpl(
      {@JsonKey(includeIfNull: true) this.amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) this.paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      this.paymentMethodId,
      @JsonKey(name: 'reference_no') this.referenceNo,
      this.notes});

  factory _$AddInvoicePaymentParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddInvoicePaymentParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final double? amount;
  @override
  @JsonKey(name: 'paid_at', includeIfNull: true)
  final String? paidAt;
  @override
  @JsonKey(name: 'payment_method_id', includeIfNull: true)
  final int? paymentMethodId;
  @override
  @JsonKey(name: 'reference_no')
  final String? referenceNo;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AddInvoicePaymentParams(amount: $amount, paidAt: $paidAt, paymentMethodId: $paymentMethodId, referenceNo: $referenceNo, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddInvoicePaymentParamsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, paidAt, paymentMethodId, referenceNo, notes);

  /// Create a copy of AddInvoicePaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddInvoicePaymentParamsImplCopyWith<_$AddInvoicePaymentParamsImpl>
      get copyWith => __$$AddInvoicePaymentParamsImplCopyWithImpl<
          _$AddInvoicePaymentParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddInvoicePaymentParamsImplToJson(
      this,
    );
  }
}

abstract class _AddInvoicePaymentParams implements AddInvoicePaymentParams {
  const factory _AddInvoicePaymentParams(
      {@JsonKey(includeIfNull: true) final double? amount,
      @JsonKey(name: 'paid_at', includeIfNull: true) final String? paidAt,
      @JsonKey(name: 'payment_method_id', includeIfNull: true)
      final int? paymentMethodId,
      @JsonKey(name: 'reference_no') final String? referenceNo,
      final String? notes}) = _$AddInvoicePaymentParamsImpl;

  factory _AddInvoicePaymentParams.fromJson(Map<String, dynamic> json) =
      _$AddInvoicePaymentParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  double? get amount;
  @override
  @JsonKey(name: 'paid_at', includeIfNull: true)
  String? get paidAt;
  @override
  @JsonKey(name: 'payment_method_id', includeIfNull: true)
  int? get paymentMethodId;
  @override
  @JsonKey(name: 'reference_no')
  String? get referenceNo;
  @override
  String? get notes;

  /// Create a copy of AddInvoicePaymentParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddInvoicePaymentParamsImplCopyWith<_$AddInvoicePaymentParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaveActivityExpenseParams _$SaveActivityExpenseParamsFromJson(
    Map<String, dynamic> json) {
  return _SaveActivityExpenseParams.fromJson(json);
}

/// @nodoc
mixin _$SaveActivityExpenseParams {
  @JsonKey(includeIfNull: true)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_category_id', includeIfNull: true)
  int? get expenseCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'spent_on', includeIfNull: true)
  String? get spentOn => throw _privateConstructorUsedError;

  /// Serializes this SaveActivityExpenseParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveActivityExpenseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveActivityExpenseParamsCopyWith<SaveActivityExpenseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveActivityExpenseParamsCopyWith<$Res> {
  factory $SaveActivityExpenseParamsCopyWith(SaveActivityExpenseParams value,
          $Res Function(SaveActivityExpenseParams) then) =
      _$SaveActivityExpenseParamsCopyWithImpl<$Res, SaveActivityExpenseParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) double? amount,
      @JsonKey(includeIfNull: true) String? description,
      @JsonKey(name: 'expense_category_id', includeIfNull: true)
      int? expenseCategoryId,
      @JsonKey(name: 'spent_on', includeIfNull: true) String? spentOn});
}

/// @nodoc
class _$SaveActivityExpenseParamsCopyWithImpl<$Res,
        $Val extends SaveActivityExpenseParams>
    implements $SaveActivityExpenseParamsCopyWith<$Res> {
  _$SaveActivityExpenseParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveActivityExpenseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? description = freezed,
    Object? expenseCategoryId = freezed,
    Object? spentOn = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseCategoryId: freezed == expenseCategoryId
          ? _value.expenseCategoryId
          : expenseCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      spentOn: freezed == spentOn
          ? _value.spentOn
          : spentOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveActivityExpenseParamsImplCopyWith<$Res>
    implements $SaveActivityExpenseParamsCopyWith<$Res> {
  factory _$$SaveActivityExpenseParamsImplCopyWith(
          _$SaveActivityExpenseParamsImpl value,
          $Res Function(_$SaveActivityExpenseParamsImpl) then) =
      __$$SaveActivityExpenseParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) double? amount,
      @JsonKey(includeIfNull: true) String? description,
      @JsonKey(name: 'expense_category_id', includeIfNull: true)
      int? expenseCategoryId,
      @JsonKey(name: 'spent_on', includeIfNull: true) String? spentOn});
}

/// @nodoc
class __$$SaveActivityExpenseParamsImplCopyWithImpl<$Res>
    extends _$SaveActivityExpenseParamsCopyWithImpl<$Res,
        _$SaveActivityExpenseParamsImpl>
    implements _$$SaveActivityExpenseParamsImplCopyWith<$Res> {
  __$$SaveActivityExpenseParamsImplCopyWithImpl(
      _$SaveActivityExpenseParamsImpl _value,
      $Res Function(_$SaveActivityExpenseParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveActivityExpenseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? description = freezed,
    Object? expenseCategoryId = freezed,
    Object? spentOn = freezed,
  }) {
    return _then(_$SaveActivityExpenseParamsImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      expenseCategoryId: freezed == expenseCategoryId
          ? _value.expenseCategoryId
          : expenseCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      spentOn: freezed == spentOn
          ? _value.spentOn
          : spentOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SaveActivityExpenseParamsImpl implements _SaveActivityExpenseParams {
  const _$SaveActivityExpenseParamsImpl(
      {@JsonKey(includeIfNull: true) this.amount,
      @JsonKey(includeIfNull: true) this.description,
      @JsonKey(name: 'expense_category_id', includeIfNull: true)
      this.expenseCategoryId,
      @JsonKey(name: 'spent_on', includeIfNull: true) this.spentOn});

  factory _$SaveActivityExpenseParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveActivityExpenseParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final double? amount;
  @override
  @JsonKey(includeIfNull: true)
  final String? description;
  @override
  @JsonKey(name: 'expense_category_id', includeIfNull: true)
  final int? expenseCategoryId;
  @override
  @JsonKey(name: 'spent_on', includeIfNull: true)
  final String? spentOn;

  @override
  String toString() {
    return 'SaveActivityExpenseParams(amount: $amount, description: $description, expenseCategoryId: $expenseCategoryId, spentOn: $spentOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveActivityExpenseParamsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.expenseCategoryId, expenseCategoryId) ||
                other.expenseCategoryId == expenseCategoryId) &&
            (identical(other.spentOn, spentOn) || other.spentOn == spentOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, description, expenseCategoryId, spentOn);

  /// Create a copy of SaveActivityExpenseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveActivityExpenseParamsImplCopyWith<_$SaveActivityExpenseParamsImpl>
      get copyWith => __$$SaveActivityExpenseParamsImplCopyWithImpl<
          _$SaveActivityExpenseParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveActivityExpenseParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveActivityExpenseParams implements SaveActivityExpenseParams {
  const factory _SaveActivityExpenseParams(
      {@JsonKey(includeIfNull: true) final double? amount,
      @JsonKey(includeIfNull: true) final String? description,
      @JsonKey(name: 'expense_category_id', includeIfNull: true)
      final int? expenseCategoryId,
      @JsonKey(name: 'spent_on', includeIfNull: true)
      final String? spentOn}) = _$SaveActivityExpenseParamsImpl;

  factory _SaveActivityExpenseParams.fromJson(Map<String, dynamic> json) =
      _$SaveActivityExpenseParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  double? get amount;
  @override
  @JsonKey(includeIfNull: true)
  String? get description;
  @override
  @JsonKey(name: 'expense_category_id', includeIfNull: true)
  int? get expenseCategoryId;
  @override
  @JsonKey(name: 'spent_on', includeIfNull: true)
  String? get spentOn;

  /// Create a copy of SaveActivityExpenseParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveActivityExpenseParamsImplCopyWith<_$SaveActivityExpenseParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaveRegistrationParams _$SaveRegistrationParamsFromJson(
    Map<String, dynamic> json) {
  return _SaveRegistrationParams.fromJson(json);
}

/// @nodoc
mixin _$SaveRegistrationParams {
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_amount', includeIfNull: true)
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id')
  int? get enrollmentId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this SaveRegistrationParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveRegistrationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveRegistrationParamsCopyWith<SaveRegistrationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveRegistrationParamsCopyWith<$Res> {
  factory $SaveRegistrationParamsCopyWith(SaveRegistrationParams value,
          $Res Function(SaveRegistrationParams) then) =
      _$SaveRegistrationParamsCopyWithImpl<$Res, SaveRegistrationParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(name: 'fee_amount', includeIfNull: true) double? feeAmount,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'enrollment_id') int? enrollmentId,
      String? notes});
}

/// @nodoc
class _$SaveRegistrationParamsCopyWithImpl<$Res,
        $Val extends SaveRegistrationParams>
    implements $SaveRegistrationParamsCopyWith<$Res> {
  _$SaveRegistrationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveRegistrationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? feeAmount = freezed,
    Object? status = freezed,
    Object? enrollmentId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveRegistrationParamsImplCopyWith<$Res>
    implements $SaveRegistrationParamsCopyWith<$Res> {
  factory _$$SaveRegistrationParamsImplCopyWith(
          _$SaveRegistrationParamsImpl value,
          $Res Function(_$SaveRegistrationParamsImpl) then) =
      __$$SaveRegistrationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(name: 'fee_amount', includeIfNull: true) double? feeAmount,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'enrollment_id') int? enrollmentId,
      String? notes});
}

/// @nodoc
class __$$SaveRegistrationParamsImplCopyWithImpl<$Res>
    extends _$SaveRegistrationParamsCopyWithImpl<$Res,
        _$SaveRegistrationParamsImpl>
    implements _$$SaveRegistrationParamsImplCopyWith<$Res> {
  __$$SaveRegistrationParamsImplCopyWithImpl(
      _$SaveRegistrationParamsImpl _value,
      $Res Function(_$SaveRegistrationParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveRegistrationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? feeAmount = freezed,
    Object? status = freezed,
    Object? enrollmentId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$SaveRegistrationParamsImpl(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SaveRegistrationParamsImpl implements _SaveRegistrationParams {
  const _$SaveRegistrationParamsImpl(
      {@JsonKey(name: 'student_id', includeIfNull: true) this.studentId,
      @JsonKey(name: 'fee_amount', includeIfNull: true) this.feeAmount,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(name: 'enrollment_id') this.enrollmentId,
      this.notes});

  factory _$SaveRegistrationParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveRegistrationParamsImplFromJson(json);

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  final int? studentId;
  @override
  @JsonKey(name: 'fee_amount', includeIfNull: true)
  final double? feeAmount;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(name: 'enrollment_id')
  final int? enrollmentId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'SaveRegistrationParams(studentId: $studentId, feeAmount: $feeAmount, status: $status, enrollmentId: $enrollmentId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveRegistrationParamsImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, studentId, feeAmount, status, enrollmentId, notes);

  /// Create a copy of SaveRegistrationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveRegistrationParamsImplCopyWith<_$SaveRegistrationParamsImpl>
      get copyWith => __$$SaveRegistrationParamsImplCopyWithImpl<
          _$SaveRegistrationParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveRegistrationParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveRegistrationParams implements SaveRegistrationParams {
  const factory _SaveRegistrationParams(
      {@JsonKey(name: 'student_id', includeIfNull: true) final int? studentId,
      @JsonKey(name: 'fee_amount', includeIfNull: true) final double? feeAmount,
      @JsonKey(includeIfNull: true) final String? status,
      @JsonKey(name: 'enrollment_id') final int? enrollmentId,
      final String? notes}) = _$SaveRegistrationParamsImpl;

  factory _SaveRegistrationParams.fromJson(Map<String, dynamic> json) =
      _$SaveRegistrationParamsImpl.fromJson;

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId;
  @override
  @JsonKey(name: 'fee_amount', includeIfNull: true)
  double? get feeAmount;
  @override
  @JsonKey(includeIfNull: true)
  String? get status;
  @override
  @JsonKey(name: 'enrollment_id')
  int? get enrollmentId;
  @override
  String? get notes;

  /// Create a copy of SaveRegistrationParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveRegistrationParamsImplCopyWith<_$SaveRegistrationParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
