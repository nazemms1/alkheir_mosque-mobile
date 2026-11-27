// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdjustmentParams _$AdjustmentParamsFromJson(Map<String, dynamic> json) {
  return _AdjustmentParams.fromJson(json);
}

/// @nodoc
mixin _$AdjustmentParams {
  @JsonKey(name: 'cash_box_id')
  int? get cashBoxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  int? get currencyId => throw _privateConstructorUsedError;
  String? get direction => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  String? get transactionDate => throw _privateConstructorUsedError;

  /// Serializes this AdjustmentParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdjustmentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdjustmentParamsCopyWith<AdjustmentParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdjustmentParamsCopyWith<$Res> {
  factory $AdjustmentParamsCopyWith(
          AdjustmentParams value, $Res Function(AdjustmentParams) then) =
      _$AdjustmentParamsCopyWithImpl<$Res, AdjustmentParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cash_box_id') int? cashBoxId,
      @JsonKey(name: 'currency_id') int? currencyId,
      String? direction,
      double? amount,
      String? description,
      @JsonKey(name: 'transaction_date') String? transactionDate});
}

/// @nodoc
class _$AdjustmentParamsCopyWithImpl<$Res, $Val extends AdjustmentParams>
    implements $AdjustmentParamsCopyWith<$Res> {
  _$AdjustmentParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdjustmentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashBoxId = freezed,
    Object? currencyId = freezed,
    Object? direction = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(_value.copyWith(
      cashBoxId: freezed == cashBoxId
          ? _value.cashBoxId
          : cashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyId: freezed == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdjustmentParamsImplCopyWith<$Res>
    implements $AdjustmentParamsCopyWith<$Res> {
  factory _$$AdjustmentParamsImplCopyWith(_$AdjustmentParamsImpl value,
          $Res Function(_$AdjustmentParamsImpl) then) =
      __$$AdjustmentParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cash_box_id') int? cashBoxId,
      @JsonKey(name: 'currency_id') int? currencyId,
      String? direction,
      double? amount,
      String? description,
      @JsonKey(name: 'transaction_date') String? transactionDate});
}

/// @nodoc
class __$$AdjustmentParamsImplCopyWithImpl<$Res>
    extends _$AdjustmentParamsCopyWithImpl<$Res, _$AdjustmentParamsImpl>
    implements _$$AdjustmentParamsImplCopyWith<$Res> {
  __$$AdjustmentParamsImplCopyWithImpl(_$AdjustmentParamsImpl _value,
      $Res Function(_$AdjustmentParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdjustmentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashBoxId = freezed,
    Object? currencyId = freezed,
    Object? direction = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(_$AdjustmentParamsImpl(
      cashBoxId: freezed == cashBoxId
          ? _value.cashBoxId
          : cashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyId: freezed == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$AdjustmentParamsImpl implements _AdjustmentParams {
  const _$AdjustmentParamsImpl(
      {@JsonKey(name: 'cash_box_id') this.cashBoxId,
      @JsonKey(name: 'currency_id') this.currencyId,
      this.direction,
      this.amount,
      this.description,
      @JsonKey(name: 'transaction_date') this.transactionDate});

  factory _$AdjustmentParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdjustmentParamsImplFromJson(json);

  @override
  @JsonKey(name: 'cash_box_id')
  final int? cashBoxId;
  @override
  @JsonKey(name: 'currency_id')
  final int? currencyId;
  @override
  final String? direction;
  @override
  final double? amount;
  @override
  final String? description;
  @override
  @JsonKey(name: 'transaction_date')
  final String? transactionDate;

  @override
  String toString() {
    return 'AdjustmentParams(cashBoxId: $cashBoxId, currencyId: $currencyId, direction: $direction, amount: $amount, description: $description, transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdjustmentParamsImpl &&
            (identical(other.cashBoxId, cashBoxId) ||
                other.cashBoxId == cashBoxId) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cashBoxId, currencyId, direction,
      amount, description, transactionDate);

  /// Create a copy of AdjustmentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdjustmentParamsImplCopyWith<_$AdjustmentParamsImpl> get copyWith =>
      __$$AdjustmentParamsImplCopyWithImpl<_$AdjustmentParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdjustmentParamsImplToJson(
      this,
    );
  }
}

abstract class _AdjustmentParams implements AdjustmentParams {
  const factory _AdjustmentParams(
          {@JsonKey(name: 'cash_box_id') final int? cashBoxId,
          @JsonKey(name: 'currency_id') final int? currencyId,
          final String? direction,
          final double? amount,
          final String? description,
          @JsonKey(name: 'transaction_date') final String? transactionDate}) =
      _$AdjustmentParamsImpl;

  factory _AdjustmentParams.fromJson(Map<String, dynamic> json) =
      _$AdjustmentParamsImpl.fromJson;

  @override
  @JsonKey(name: 'cash_box_id')
  int? get cashBoxId;
  @override
  @JsonKey(name: 'currency_id')
  int? get currencyId;
  @override
  String? get direction;
  @override
  double? get amount;
  @override
  String? get description;
  @override
  @JsonKey(name: 'transaction_date')
  String? get transactionDate;

  /// Create a copy of AdjustmentParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdjustmentParamsImplCopyWith<_$AdjustmentParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransferParams _$TransferParamsFromJson(Map<String, dynamic> json) {
  return _TransferParams.fromJson(json);
}

/// @nodoc
mixin _$TransferParams {
  @JsonKey(name: 'from_cash_box_id')
  int? get fromCashBoxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_cash_box_id')
  int? get toCashBoxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  int? get currencyId => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_date')
  String? get transferDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this TransferParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferParamsCopyWith<TransferParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferParamsCopyWith<$Res> {
  factory $TransferParamsCopyWith(
          TransferParams value, $Res Function(TransferParams) then) =
      _$TransferParamsCopyWithImpl<$Res, TransferParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'from_cash_box_id') int? fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') int? toCashBoxId,
      @JsonKey(name: 'currency_id') int? currencyId,
      double? amount,
      @JsonKey(name: 'transfer_date') String? transferDate,
      String? notes});
}

/// @nodoc
class _$TransferParamsCopyWithImpl<$Res, $Val extends TransferParams>
    implements $TransferParamsCopyWith<$Res> {
  _$TransferParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCashBoxId = freezed,
    Object? toCashBoxId = freezed,
    Object? currencyId = freezed,
    Object? amount = freezed,
    Object? transferDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      fromCashBoxId: freezed == fromCashBoxId
          ? _value.fromCashBoxId
          : fromCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      toCashBoxId: freezed == toCashBoxId
          ? _value.toCashBoxId
          : toCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyId: freezed == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      transferDate: freezed == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferParamsImplCopyWith<$Res>
    implements $TransferParamsCopyWith<$Res> {
  factory _$$TransferParamsImplCopyWith(_$TransferParamsImpl value,
          $Res Function(_$TransferParamsImpl) then) =
      __$$TransferParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'from_cash_box_id') int? fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') int? toCashBoxId,
      @JsonKey(name: 'currency_id') int? currencyId,
      double? amount,
      @JsonKey(name: 'transfer_date') String? transferDate,
      String? notes});
}

/// @nodoc
class __$$TransferParamsImplCopyWithImpl<$Res>
    extends _$TransferParamsCopyWithImpl<$Res, _$TransferParamsImpl>
    implements _$$TransferParamsImplCopyWith<$Res> {
  __$$TransferParamsImplCopyWithImpl(
      _$TransferParamsImpl _value, $Res Function(_$TransferParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCashBoxId = freezed,
    Object? toCashBoxId = freezed,
    Object? currencyId = freezed,
    Object? amount = freezed,
    Object? transferDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$TransferParamsImpl(
      fromCashBoxId: freezed == fromCashBoxId
          ? _value.fromCashBoxId
          : fromCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      toCashBoxId: freezed == toCashBoxId
          ? _value.toCashBoxId
          : toCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      currencyId: freezed == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      transferDate: freezed == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
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
class _$TransferParamsImpl implements _TransferParams {
  const _$TransferParamsImpl(
      {@JsonKey(name: 'from_cash_box_id') this.fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') this.toCashBoxId,
      @JsonKey(name: 'currency_id') this.currencyId,
      this.amount,
      @JsonKey(name: 'transfer_date') this.transferDate,
      this.notes});

  factory _$TransferParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferParamsImplFromJson(json);

  @override
  @JsonKey(name: 'from_cash_box_id')
  final int? fromCashBoxId;
  @override
  @JsonKey(name: 'to_cash_box_id')
  final int? toCashBoxId;
  @override
  @JsonKey(name: 'currency_id')
  final int? currencyId;
  @override
  final double? amount;
  @override
  @JsonKey(name: 'transfer_date')
  final String? transferDate;
  @override
  final String? notes;

  @override
  String toString() {
    return 'TransferParams(fromCashBoxId: $fromCashBoxId, toCashBoxId: $toCashBoxId, currencyId: $currencyId, amount: $amount, transferDate: $transferDate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferParamsImpl &&
            (identical(other.fromCashBoxId, fromCashBoxId) ||
                other.fromCashBoxId == fromCashBoxId) &&
            (identical(other.toCashBoxId, toCashBoxId) ||
                other.toCashBoxId == toCashBoxId) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transferDate, transferDate) ||
                other.transferDate == transferDate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fromCashBoxId, toCashBoxId,
      currencyId, amount, transferDate, notes);

  /// Create a copy of TransferParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferParamsImplCopyWith<_$TransferParamsImpl> get copyWith =>
      __$$TransferParamsImplCopyWithImpl<_$TransferParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferParamsImplToJson(
      this,
    );
  }
}

abstract class _TransferParams implements TransferParams {
  const factory _TransferParams(
      {@JsonKey(name: 'from_cash_box_id') final int? fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') final int? toCashBoxId,
      @JsonKey(name: 'currency_id') final int? currencyId,
      final double? amount,
      @JsonKey(name: 'transfer_date') final String? transferDate,
      final String? notes}) = _$TransferParamsImpl;

  factory _TransferParams.fromJson(Map<String, dynamic> json) =
      _$TransferParamsImpl.fromJson;

  @override
  @JsonKey(name: 'from_cash_box_id')
  int? get fromCashBoxId;
  @override
  @JsonKey(name: 'to_cash_box_id')
  int? get toCashBoxId;
  @override
  @JsonKey(name: 'currency_id')
  int? get currencyId;
  @override
  double? get amount;
  @override
  @JsonKey(name: 'transfer_date')
  String? get transferDate;
  @override
  String? get notes;

  /// Create a copy of TransferParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferParamsImplCopyWith<_$TransferParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExchangeParams _$ExchangeParamsFromJson(Map<String, dynamic> json) {
  return _ExchangeParams.fromJson(json);
}

/// @nodoc
mixin _$ExchangeParams {
  @JsonKey(name: 'from_cash_box_id')
  int? get fromCashBoxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_cash_box_id')
  int? get toCashBoxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_currency_id')
  int? get fromCurrencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_currency_id')
  int? get toCurrencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_amount')
  double? get fromAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'exchange_date')
  String? get exchangeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_amount')
  double? get toAmount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this ExchangeParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExchangeParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExchangeParamsCopyWith<ExchangeParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeParamsCopyWith<$Res> {
  factory $ExchangeParamsCopyWith(
          ExchangeParams value, $Res Function(ExchangeParams) then) =
      _$ExchangeParamsCopyWithImpl<$Res, ExchangeParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'from_cash_box_id') int? fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') int? toCashBoxId,
      @JsonKey(name: 'from_currency_id') int? fromCurrencyId,
      @JsonKey(name: 'to_currency_id') int? toCurrencyId,
      @JsonKey(name: 'from_amount') double? fromAmount,
      @JsonKey(name: 'exchange_date') String? exchangeDate,
      @JsonKey(name: 'to_amount') double? toAmount,
      String? notes});
}

/// @nodoc
class _$ExchangeParamsCopyWithImpl<$Res, $Val extends ExchangeParams>
    implements $ExchangeParamsCopyWith<$Res> {
  _$ExchangeParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExchangeParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCashBoxId = freezed,
    Object? toCashBoxId = freezed,
    Object? fromCurrencyId = freezed,
    Object? toCurrencyId = freezed,
    Object? fromAmount = freezed,
    Object? exchangeDate = freezed,
    Object? toAmount = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      fromCashBoxId: freezed == fromCashBoxId
          ? _value.fromCashBoxId
          : fromCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      toCashBoxId: freezed == toCashBoxId
          ? _value.toCashBoxId
          : toCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromCurrencyId: freezed == fromCurrencyId
          ? _value.fromCurrencyId
          : fromCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      toCurrencyId: freezed == toCurrencyId
          ? _value.toCurrencyId
          : toCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromAmount: freezed == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      exchangeDate: freezed == exchangeDate
          ? _value.exchangeDate
          : exchangeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      toAmount: freezed == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeParamsImplCopyWith<$Res>
    implements $ExchangeParamsCopyWith<$Res> {
  factory _$$ExchangeParamsImplCopyWith(_$ExchangeParamsImpl value,
          $Res Function(_$ExchangeParamsImpl) then) =
      __$$ExchangeParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'from_cash_box_id') int? fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') int? toCashBoxId,
      @JsonKey(name: 'from_currency_id') int? fromCurrencyId,
      @JsonKey(name: 'to_currency_id') int? toCurrencyId,
      @JsonKey(name: 'from_amount') double? fromAmount,
      @JsonKey(name: 'exchange_date') String? exchangeDate,
      @JsonKey(name: 'to_amount') double? toAmount,
      String? notes});
}

/// @nodoc
class __$$ExchangeParamsImplCopyWithImpl<$Res>
    extends _$ExchangeParamsCopyWithImpl<$Res, _$ExchangeParamsImpl>
    implements _$$ExchangeParamsImplCopyWith<$Res> {
  __$$ExchangeParamsImplCopyWithImpl(
      _$ExchangeParamsImpl _value, $Res Function(_$ExchangeParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExchangeParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCashBoxId = freezed,
    Object? toCashBoxId = freezed,
    Object? fromCurrencyId = freezed,
    Object? toCurrencyId = freezed,
    Object? fromAmount = freezed,
    Object? exchangeDate = freezed,
    Object? toAmount = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ExchangeParamsImpl(
      fromCashBoxId: freezed == fromCashBoxId
          ? _value.fromCashBoxId
          : fromCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      toCashBoxId: freezed == toCashBoxId
          ? _value.toCashBoxId
          : toCashBoxId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromCurrencyId: freezed == fromCurrencyId
          ? _value.fromCurrencyId
          : fromCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      toCurrencyId: freezed == toCurrencyId
          ? _value.toCurrencyId
          : toCurrencyId // ignore: cast_nullable_to_non_nullable
              as int?,
      fromAmount: freezed == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      exchangeDate: freezed == exchangeDate
          ? _value.exchangeDate
          : exchangeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      toAmount: freezed == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ExchangeParamsImpl implements _ExchangeParams {
  const _$ExchangeParamsImpl(
      {@JsonKey(name: 'from_cash_box_id') this.fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') this.toCashBoxId,
      @JsonKey(name: 'from_currency_id') this.fromCurrencyId,
      @JsonKey(name: 'to_currency_id') this.toCurrencyId,
      @JsonKey(name: 'from_amount') this.fromAmount,
      @JsonKey(name: 'exchange_date') this.exchangeDate,
      @JsonKey(name: 'to_amount') this.toAmount,
      this.notes});

  factory _$ExchangeParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeParamsImplFromJson(json);

  @override
  @JsonKey(name: 'from_cash_box_id')
  final int? fromCashBoxId;
  @override
  @JsonKey(name: 'to_cash_box_id')
  final int? toCashBoxId;
  @override
  @JsonKey(name: 'from_currency_id')
  final int? fromCurrencyId;
  @override
  @JsonKey(name: 'to_currency_id')
  final int? toCurrencyId;
  @override
  @JsonKey(name: 'from_amount')
  final double? fromAmount;
  @override
  @JsonKey(name: 'exchange_date')
  final String? exchangeDate;
  @override
  @JsonKey(name: 'to_amount')
  final double? toAmount;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ExchangeParams(fromCashBoxId: $fromCashBoxId, toCashBoxId: $toCashBoxId, fromCurrencyId: $fromCurrencyId, toCurrencyId: $toCurrencyId, fromAmount: $fromAmount, exchangeDate: $exchangeDate, toAmount: $toAmount, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeParamsImpl &&
            (identical(other.fromCashBoxId, fromCashBoxId) ||
                other.fromCashBoxId == fromCashBoxId) &&
            (identical(other.toCashBoxId, toCashBoxId) ||
                other.toCashBoxId == toCashBoxId) &&
            (identical(other.fromCurrencyId, fromCurrencyId) ||
                other.fromCurrencyId == fromCurrencyId) &&
            (identical(other.toCurrencyId, toCurrencyId) ||
                other.toCurrencyId == toCurrencyId) &&
            (identical(other.fromAmount, fromAmount) ||
                other.fromAmount == fromAmount) &&
            (identical(other.exchangeDate, exchangeDate) ||
                other.exchangeDate == exchangeDate) &&
            (identical(other.toAmount, toAmount) ||
                other.toAmount == toAmount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fromCashBoxId, toCashBoxId,
      fromCurrencyId, toCurrencyId, fromAmount, exchangeDate, toAmount, notes);

  /// Create a copy of ExchangeParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeParamsImplCopyWith<_$ExchangeParamsImpl> get copyWith =>
      __$$ExchangeParamsImplCopyWithImpl<_$ExchangeParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeParamsImplToJson(
      this,
    );
  }
}

abstract class _ExchangeParams implements ExchangeParams {
  const factory _ExchangeParams(
      {@JsonKey(name: 'from_cash_box_id') final int? fromCashBoxId,
      @JsonKey(name: 'to_cash_box_id') final int? toCashBoxId,
      @JsonKey(name: 'from_currency_id') final int? fromCurrencyId,
      @JsonKey(name: 'to_currency_id') final int? toCurrencyId,
      @JsonKey(name: 'from_amount') final double? fromAmount,
      @JsonKey(name: 'exchange_date') final String? exchangeDate,
      @JsonKey(name: 'to_amount') final double? toAmount,
      final String? notes}) = _$ExchangeParamsImpl;

  factory _ExchangeParams.fromJson(Map<String, dynamic> json) =
      _$ExchangeParamsImpl.fromJson;

  @override
  @JsonKey(name: 'from_cash_box_id')
  int? get fromCashBoxId;
  @override
  @JsonKey(name: 'to_cash_box_id')
  int? get toCashBoxId;
  @override
  @JsonKey(name: 'from_currency_id')
  int? get fromCurrencyId;
  @override
  @JsonKey(name: 'to_currency_id')
  int? get toCurrencyId;
  @override
  @JsonKey(name: 'from_amount')
  double? get fromAmount;
  @override
  @JsonKey(name: 'exchange_date')
  String? get exchangeDate;
  @override
  @JsonKey(name: 'to_amount')
  double? get toAmount;
  @override
  String? get notes;

  /// Create a copy of ExchangeParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeParamsImplCopyWith<_$ExchangeParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
