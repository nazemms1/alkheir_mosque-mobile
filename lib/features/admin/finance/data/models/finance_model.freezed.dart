// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinanceCurrencyModel _$FinanceCurrencyModelFromJson(Map<String, dynamic> json) {
  return _FinanceCurrencyModel.fromJson(json);
}

/// @nodoc
mixin _$FinanceCurrencyModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get symbol => throw _privateConstructorUsedError;

  /// Create a copy of FinanceCurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceCurrencyModelCopyWith<FinanceCurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceCurrencyModelCopyWith<$Res> {
  factory $FinanceCurrencyModelCopyWith(FinanceCurrencyModel value,
          $Res Function(FinanceCurrencyModel) then) =
      _$FinanceCurrencyModelCopyWithImpl<$Res, FinanceCurrencyModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? code,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? symbol});
}

/// @nodoc
class _$FinanceCurrencyModelCopyWithImpl<$Res,
        $Val extends FinanceCurrencyModel>
    implements $FinanceCurrencyModelCopyWith<$Res> {
  _$FinanceCurrencyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceCurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinanceCurrencyModelImplCopyWith<$Res>
    implements $FinanceCurrencyModelCopyWith<$Res> {
  factory _$$FinanceCurrencyModelImplCopyWith(_$FinanceCurrencyModelImpl value,
          $Res Function(_$FinanceCurrencyModelImpl) then) =
      __$$FinanceCurrencyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? code,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? symbol});
}

/// @nodoc
class __$$FinanceCurrencyModelImplCopyWithImpl<$Res>
    extends _$FinanceCurrencyModelCopyWithImpl<$Res, _$FinanceCurrencyModelImpl>
    implements _$$FinanceCurrencyModelImplCopyWith<$Res> {
  __$$FinanceCurrencyModelImplCopyWithImpl(_$FinanceCurrencyModelImpl _value,
      $Res Function(_$FinanceCurrencyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceCurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_$FinanceCurrencyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$FinanceCurrencyModelImpl implements _FinanceCurrencyModel {
  const _$FinanceCurrencyModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.code,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(fromJson: jsonStringValue) this.symbol});

  factory _$FinanceCurrencyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceCurrencyModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? code;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? symbol;

  @override
  String toString() {
    return 'FinanceCurrencyModel(id: $id, code: $code, name: $name, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceCurrencyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, symbol);

  /// Create a copy of FinanceCurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceCurrencyModelImplCopyWith<_$FinanceCurrencyModelImpl>
      get copyWith =>
          __$$FinanceCurrencyModelImplCopyWithImpl<_$FinanceCurrencyModelImpl>(
              this, _$identity);
}

abstract class _FinanceCurrencyModel implements FinanceCurrencyModel {
  const factory _FinanceCurrencyModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? code,
          @JsonKey(fromJson: jsonStringValue) final String? name,
          @JsonKey(fromJson: jsonStringValue) final String? symbol}) =
      _$FinanceCurrencyModelImpl;

  factory _FinanceCurrencyModel.fromJson(Map<String, dynamic> json) =
      _$FinanceCurrencyModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get code;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get symbol;

  /// Create a copy of FinanceCurrencyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceCurrencyModelImplCopyWith<_$FinanceCurrencyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CashBoxRefModel _$CashBoxRefModelFromJson(Map<String, dynamic> json) {
  return _CashBoxRefModel.fromJson(json);
}

/// @nodoc
mixin _$CashBoxRefModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get code => throw _privateConstructorUsedError;

  /// Create a copy of CashBoxRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashBoxRefModelCopyWith<CashBoxRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashBoxRefModelCopyWith<$Res> {
  factory $CashBoxRefModelCopyWith(
          CashBoxRefModel value, $Res Function(CashBoxRefModel) then) =
      _$CashBoxRefModelCopyWithImpl<$Res, CashBoxRefModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? code});
}

/// @nodoc
class _$CashBoxRefModelCopyWithImpl<$Res, $Val extends CashBoxRefModel>
    implements $CashBoxRefModelCopyWith<$Res> {
  _$CashBoxRefModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashBoxRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashBoxRefModelImplCopyWith<$Res>
    implements $CashBoxRefModelCopyWith<$Res> {
  factory _$$CashBoxRefModelImplCopyWith(_$CashBoxRefModelImpl value,
          $Res Function(_$CashBoxRefModelImpl) then) =
      __$$CashBoxRefModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? code});
}

/// @nodoc
class __$$CashBoxRefModelImplCopyWithImpl<$Res>
    extends _$CashBoxRefModelCopyWithImpl<$Res, _$CashBoxRefModelImpl>
    implements _$$CashBoxRefModelImplCopyWith<$Res> {
  __$$CashBoxRefModelImplCopyWithImpl(
      _$CashBoxRefModelImpl _value, $Res Function(_$CashBoxRefModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashBoxRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$CashBoxRefModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CashBoxRefModelImpl implements _CashBoxRefModel {
  const _$CashBoxRefModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(fromJson: jsonStringValue) this.code});

  factory _$CashBoxRefModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashBoxRefModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? code;

  @override
  String toString() {
    return 'CashBoxRefModel(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashBoxRefModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code);

  /// Create a copy of CashBoxRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashBoxRefModelImplCopyWith<_$CashBoxRefModelImpl> get copyWith =>
      __$$CashBoxRefModelImplCopyWithImpl<_$CashBoxRefModelImpl>(
          this, _$identity);
}

abstract class _CashBoxRefModel implements CashBoxRefModel {
  const factory _CashBoxRefModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? name,
          @JsonKey(fromJson: jsonStringValue) final String? code}) =
      _$CashBoxRefModelImpl;

  factory _CashBoxRefModel.fromJson(Map<String, dynamic> json) =
      _$CashBoxRefModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get code;

  /// Create a copy of CashBoxRefModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashBoxRefModelImplCopyWith<_$CashBoxRefModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CashBoxCurrencyBalanceModel _$CashBoxCurrencyBalanceModelFromJson(
    Map<String, dynamic> json) {
  return _CashBoxCurrencyBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$CashBoxCurrencyBalanceModel {
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
  double? get localEquivalent => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency => throw _privateConstructorUsedError;

  /// Create a copy of CashBoxCurrencyBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashBoxCurrencyBalanceModelCopyWith<CashBoxCurrencyBalanceModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashBoxCurrencyBalanceModelCopyWith<$Res> {
  factory $CashBoxCurrencyBalanceModelCopyWith(
          CashBoxCurrencyBalanceModel value,
          $Res Function(CashBoxCurrencyBalanceModel) then) =
      _$CashBoxCurrencyBalanceModelCopyWithImpl<$Res,
          CashBoxCurrencyBalanceModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
      double? localEquivalent,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency});

  $FinanceCurrencyModelCopyWith<$Res>? get currency;
}

/// @nodoc
class _$CashBoxCurrencyBalanceModelCopyWithImpl<$Res,
        $Val extends CashBoxCurrencyBalanceModel>
    implements $CashBoxCurrencyBalanceModelCopyWith<$Res> {
  _$CashBoxCurrencyBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashBoxCurrencyBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? localEquivalent = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      localEquivalent: freezed == localEquivalent
          ? _value.localEquivalent
          : localEquivalent // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
    ) as $Val);
  }

  /// Create a copy of CashBoxCurrencyBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CashBoxCurrencyBalanceModelImplCopyWith<$Res>
    implements $CashBoxCurrencyBalanceModelCopyWith<$Res> {
  factory _$$CashBoxCurrencyBalanceModelImplCopyWith(
          _$CashBoxCurrencyBalanceModelImpl value,
          $Res Function(_$CashBoxCurrencyBalanceModelImpl) then) =
      __$$CashBoxCurrencyBalanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
      double? localEquivalent,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency});

  @override
  $FinanceCurrencyModelCopyWith<$Res>? get currency;
}

/// @nodoc
class __$$CashBoxCurrencyBalanceModelImplCopyWithImpl<$Res>
    extends _$CashBoxCurrencyBalanceModelCopyWithImpl<$Res,
        _$CashBoxCurrencyBalanceModelImpl>
    implements _$$CashBoxCurrencyBalanceModelImplCopyWith<$Res> {
  __$$CashBoxCurrencyBalanceModelImplCopyWithImpl(
      _$CashBoxCurrencyBalanceModelImpl _value,
      $Res Function(_$CashBoxCurrencyBalanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashBoxCurrencyBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? localEquivalent = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$CashBoxCurrencyBalanceModelImpl(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      localEquivalent: freezed == localEquivalent
          ? _value.localEquivalent
          : localEquivalent // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CashBoxCurrencyBalanceModelImpl
    implements _CashBoxCurrencyBalanceModel {
  const _$CashBoxCurrencyBalanceModelImpl(
      {@JsonKey(fromJson: jsonDoubleLenient) this.balance,
      @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
      this.localEquivalent,
      @JsonKey(readValue: readJsonMap) this.currency});

  factory _$CashBoxCurrencyBalanceModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CashBoxCurrencyBalanceModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? balance;
  @override
  @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
  final double? localEquivalent;
  @override
  @JsonKey(readValue: readJsonMap)
  final FinanceCurrencyModel? currency;

  @override
  String toString() {
    return 'CashBoxCurrencyBalanceModel(balance: $balance, localEquivalent: $localEquivalent, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashBoxCurrencyBalanceModelImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.localEquivalent, localEquivalent) ||
                other.localEquivalent == localEquivalent) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, balance, localEquivalent, currency);

  /// Create a copy of CashBoxCurrencyBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashBoxCurrencyBalanceModelImplCopyWith<_$CashBoxCurrencyBalanceModelImpl>
      get copyWith => __$$CashBoxCurrencyBalanceModelImplCopyWithImpl<
          _$CashBoxCurrencyBalanceModelImpl>(this, _$identity);
}

abstract class _CashBoxCurrencyBalanceModel
    implements CashBoxCurrencyBalanceModel {
  const factory _CashBoxCurrencyBalanceModel(
          {@JsonKey(fromJson: jsonDoubleLenient) final double? balance,
          @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
          final double? localEquivalent,
          @JsonKey(readValue: readJsonMap)
          final FinanceCurrencyModel? currency}) =
      _$CashBoxCurrencyBalanceModelImpl;

  factory _CashBoxCurrencyBalanceModel.fromJson(Map<String, dynamic> json) =
      _$CashBoxCurrencyBalanceModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance;
  @override
  @JsonKey(name: 'local_equivalent', fromJson: jsonDoubleLenient)
  double? get localEquivalent;
  @override
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency;

  /// Create a copy of CashBoxCurrencyBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashBoxCurrencyBalanceModelImplCopyWith<_$CashBoxCurrencyBalanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CashBoxBalanceModel _$CashBoxBalanceModelFromJson(Map<String, dynamic> json) {
  return _CashBoxBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$CashBoxBalanceModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
  double? get localTotal => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<CashBoxCurrencyBalanceModel>? get currencies =>
      throw _privateConstructorUsedError;

  /// Create a copy of CashBoxBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashBoxBalanceModelCopyWith<CashBoxBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashBoxBalanceModelCopyWith<$Res> {
  factory $CashBoxBalanceModelCopyWith(
          CashBoxBalanceModel value, $Res Function(CashBoxBalanceModel) then) =
      _$CashBoxBalanceModelCopyWithImpl<$Res, CashBoxBalanceModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? code,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
      double? localTotal,
      @JsonKey(readValue: readJsonList)
      List<CashBoxCurrencyBalanceModel>? currencies});
}

/// @nodoc
class _$CashBoxBalanceModelCopyWithImpl<$Res, $Val extends CashBoxBalanceModel>
    implements $CashBoxBalanceModelCopyWith<$Res> {
  _$CashBoxBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashBoxBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? localTotal = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      localTotal: freezed == localTotal
          ? _value.localTotal
          : localTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CashBoxCurrencyBalanceModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashBoxBalanceModelImplCopyWith<$Res>
    implements $CashBoxBalanceModelCopyWith<$Res> {
  factory _$$CashBoxBalanceModelImplCopyWith(_$CashBoxBalanceModelImpl value,
          $Res Function(_$CashBoxBalanceModelImpl) then) =
      __$$CashBoxBalanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? code,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
      double? localTotal,
      @JsonKey(readValue: readJsonList)
      List<CashBoxCurrencyBalanceModel>? currencies});
}

/// @nodoc
class __$$CashBoxBalanceModelImplCopyWithImpl<$Res>
    extends _$CashBoxBalanceModelCopyWithImpl<$Res, _$CashBoxBalanceModelImpl>
    implements _$$CashBoxBalanceModelImplCopyWith<$Res> {
  __$$CashBoxBalanceModelImplCopyWithImpl(_$CashBoxBalanceModelImpl _value,
      $Res Function(_$CashBoxBalanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashBoxBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? localTotal = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_$CashBoxBalanceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      localTotal: freezed == localTotal
          ? _value.localTotal
          : localTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CashBoxCurrencyBalanceModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CashBoxBalanceModelImpl implements _CashBoxBalanceModel {
  const _$CashBoxBalanceModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(fromJson: jsonStringValue) this.code,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
      this.localTotal,
      @JsonKey(readValue: readJsonList)
      final List<CashBoxCurrencyBalanceModel>? currencies})
      : _currencies = currencies;

  factory _$CashBoxBalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashBoxBalanceModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? code;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
  final double? localTotal;
  final List<CashBoxCurrencyBalanceModel>? _currencies;
  @override
  @JsonKey(readValue: readJsonList)
  List<CashBoxCurrencyBalanceModel>? get currencies {
    final value = _currencies;
    if (value == null) return null;
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CashBoxBalanceModel(id: $id, name: $name, code: $code, isActive: $isActive, localTotal: $localTotal, currencies: $currencies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashBoxBalanceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.localTotal, localTotal) ||
                other.localTotal == localTotal) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, isActive,
      localTotal, const DeepCollectionEquality().hash(_currencies));

  /// Create a copy of CashBoxBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashBoxBalanceModelImplCopyWith<_$CashBoxBalanceModelImpl> get copyWith =>
      __$$CashBoxBalanceModelImplCopyWithImpl<_$CashBoxBalanceModelImpl>(
          this, _$identity);
}

abstract class _CashBoxBalanceModel implements CashBoxBalanceModel {
  const factory _CashBoxBalanceModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? name,
          @JsonKey(fromJson: jsonStringValue) final String? code,
          @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
          final bool? isActive,
          @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
          final double? localTotal,
          @JsonKey(readValue: readJsonList)
          final List<CashBoxCurrencyBalanceModel>? currencies}) =
      _$CashBoxBalanceModelImpl;

  factory _CashBoxBalanceModel.fromJson(Map<String, dynamic> json) =
      _$CashBoxBalanceModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get code;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(name: 'local_total', fromJson: jsonDoubleLenient)
  double? get localTotal;
  @override
  @JsonKey(readValue: readJsonList)
  List<CashBoxCurrencyBalanceModel>? get currencies;

  /// Create a copy of CashBoxBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashBoxBalanceModelImplCopyWith<_$CashBoxBalanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrencyTotalModel _$CurrencyTotalModelFromJson(Map<String, dynamic> json) {
  return _CurrencyTotalModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyTotalModel {
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyTotalModelCopyWith<CurrencyTotalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyTotalModelCopyWith<$Res> {
  factory $CurrencyTotalModelCopyWith(
          CurrencyTotalModel value, $Res Function(CurrencyTotalModel) then) =
      _$CurrencyTotalModelCopyWithImpl<$Res, CurrencyTotalModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency});

  $FinanceCurrencyModelCopyWith<$Res>? get currency;
}

/// @nodoc
class _$CurrencyTotalModelCopyWithImpl<$Res, $Val extends CurrencyTotalModel>
    implements $CurrencyTotalModelCopyWith<$Res> {
  _$CurrencyTotalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
    ) as $Val);
  }

  /// Create a copy of CurrencyTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyTotalModelImplCopyWith<$Res>
    implements $CurrencyTotalModelCopyWith<$Res> {
  factory _$$CurrencyTotalModelImplCopyWith(_$CurrencyTotalModelImpl value,
          $Res Function(_$CurrencyTotalModelImpl) then) =
      __$$CurrencyTotalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency});

  @override
  $FinanceCurrencyModelCopyWith<$Res>? get currency;
}

/// @nodoc
class __$$CurrencyTotalModelImplCopyWithImpl<$Res>
    extends _$CurrencyTotalModelCopyWithImpl<$Res, _$CurrencyTotalModelImpl>
    implements _$$CurrencyTotalModelImplCopyWith<$Res> {
  __$$CurrencyTotalModelImplCopyWithImpl(_$CurrencyTotalModelImpl _value,
      $Res Function(_$CurrencyTotalModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$CurrencyTotalModelImpl(
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurrencyTotalModelImpl implements _CurrencyTotalModel {
  const _$CurrencyTotalModelImpl(
      {@JsonKey(fromJson: jsonDoubleLenient) this.balance,
      @JsonKey(readValue: readJsonMap) this.currency});

  factory _$CurrencyTotalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyTotalModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? balance;
  @override
  @JsonKey(readValue: readJsonMap)
  final FinanceCurrencyModel? currency;

  @override
  String toString() {
    return 'CurrencyTotalModel(balance: $balance, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyTotalModelImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, balance, currency);

  /// Create a copy of CurrencyTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyTotalModelImplCopyWith<_$CurrencyTotalModelImpl> get copyWith =>
      __$$CurrencyTotalModelImplCopyWithImpl<_$CurrencyTotalModelImpl>(
          this, _$identity);
}

abstract class _CurrencyTotalModel implements CurrencyTotalModel {
  const factory _CurrencyTotalModel(
      {@JsonKey(fromJson: jsonDoubleLenient) final double? balance,
      @JsonKey(readValue: readJsonMap)
      final FinanceCurrencyModel? currency}) = _$CurrencyTotalModelImpl;

  factory _CurrencyTotalModel.fromJson(Map<String, dynamic> json) =
      _$CurrencyTotalModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance;
  @override
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency;

  /// Create a copy of CurrencyTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyTotalModelImplCopyWith<_$CurrencyTotalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinanceSummaryModel _$FinanceSummaryModelFromJson(Map<String, dynamic> json) {
  return _FinanceSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$FinanceSummaryModel {
  @JsonKey(name: 'cash_boxes', readValue: readJsonList)
  List<CashBoxBalanceModel>? get cashBoxes =>
      throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _financeSummaryPendingRequests,
      fromJson: _financeSummaryPendingRequestsValue)
  Map<String, int>? get pendingRequests => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<CurrencyTotalModel>? get totals => throw _privateConstructorUsedError;

  /// Create a copy of FinanceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceSummaryModelCopyWith<FinanceSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceSummaryModelCopyWith<$Res> {
  factory $FinanceSummaryModelCopyWith(
          FinanceSummaryModel value, $Res Function(FinanceSummaryModel) then) =
      _$FinanceSummaryModelCopyWithImpl<$Res, FinanceSummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cash_boxes', readValue: readJsonList)
      List<CashBoxBalanceModel>? cashBoxes,
      @JsonKey(
          readValue: _financeSummaryPendingRequests,
          fromJson: _financeSummaryPendingRequestsValue)
      Map<String, int>? pendingRequests,
      @JsonKey(readValue: readJsonList) List<CurrencyTotalModel>? totals});
}

/// @nodoc
class _$FinanceSummaryModelCopyWithImpl<$Res, $Val extends FinanceSummaryModel>
    implements $FinanceSummaryModelCopyWith<$Res> {
  _$FinanceSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashBoxes = freezed,
    Object? pendingRequests = freezed,
    Object? totals = freezed,
  }) {
    return _then(_value.copyWith(
      cashBoxes: freezed == cashBoxes
          ? _value.cashBoxes
          : cashBoxes // ignore: cast_nullable_to_non_nullable
              as List<CashBoxBalanceModel>?,
      pendingRequests: freezed == pendingRequests
          ? _value.pendingRequests
          : pendingRequests // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      totals: freezed == totals
          ? _value.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as List<CurrencyTotalModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinanceSummaryModelImplCopyWith<$Res>
    implements $FinanceSummaryModelCopyWith<$Res> {
  factory _$$FinanceSummaryModelImplCopyWith(_$FinanceSummaryModelImpl value,
          $Res Function(_$FinanceSummaryModelImpl) then) =
      __$$FinanceSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cash_boxes', readValue: readJsonList)
      List<CashBoxBalanceModel>? cashBoxes,
      @JsonKey(
          readValue: _financeSummaryPendingRequests,
          fromJson: _financeSummaryPendingRequestsValue)
      Map<String, int>? pendingRequests,
      @JsonKey(readValue: readJsonList) List<CurrencyTotalModel>? totals});
}

/// @nodoc
class __$$FinanceSummaryModelImplCopyWithImpl<$Res>
    extends _$FinanceSummaryModelCopyWithImpl<$Res, _$FinanceSummaryModelImpl>
    implements _$$FinanceSummaryModelImplCopyWith<$Res> {
  __$$FinanceSummaryModelImplCopyWithImpl(_$FinanceSummaryModelImpl _value,
      $Res Function(_$FinanceSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cashBoxes = freezed,
    Object? pendingRequests = freezed,
    Object? totals = freezed,
  }) {
    return _then(_$FinanceSummaryModelImpl(
      cashBoxes: freezed == cashBoxes
          ? _value._cashBoxes
          : cashBoxes // ignore: cast_nullable_to_non_nullable
              as List<CashBoxBalanceModel>?,
      pendingRequests: freezed == pendingRequests
          ? _value._pendingRequests
          : pendingRequests // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      totals: freezed == totals
          ? _value._totals
          : totals // ignore: cast_nullable_to_non_nullable
              as List<CurrencyTotalModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$FinanceSummaryModelImpl implements _FinanceSummaryModel {
  const _$FinanceSummaryModelImpl(
      {@JsonKey(name: 'cash_boxes', readValue: readJsonList)
      final List<CashBoxBalanceModel>? cashBoxes,
      @JsonKey(
          readValue: _financeSummaryPendingRequests,
          fromJson: _financeSummaryPendingRequestsValue)
      final Map<String, int>? pendingRequests,
      @JsonKey(readValue: readJsonList) final List<CurrencyTotalModel>? totals})
      : _cashBoxes = cashBoxes,
        _pendingRequests = pendingRequests,
        _totals = totals;

  factory _$FinanceSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceSummaryModelImplFromJson(json);

  final List<CashBoxBalanceModel>? _cashBoxes;
  @override
  @JsonKey(name: 'cash_boxes', readValue: readJsonList)
  List<CashBoxBalanceModel>? get cashBoxes {
    final value = _cashBoxes;
    if (value == null) return null;
    if (_cashBoxes is EqualUnmodifiableListView) return _cashBoxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, int>? _pendingRequests;
  @override
  @JsonKey(
      readValue: _financeSummaryPendingRequests,
      fromJson: _financeSummaryPendingRequestsValue)
  Map<String, int>? get pendingRequests {
    final value = _pendingRequests;
    if (value == null) return null;
    if (_pendingRequests is EqualUnmodifiableMapView) return _pendingRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<CurrencyTotalModel>? _totals;
  @override
  @JsonKey(readValue: readJsonList)
  List<CurrencyTotalModel>? get totals {
    final value = _totals;
    if (value == null) return null;
    if (_totals is EqualUnmodifiableListView) return _totals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FinanceSummaryModel(cashBoxes: $cashBoxes, pendingRequests: $pendingRequests, totals: $totals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceSummaryModelImpl &&
            const DeepCollectionEquality()
                .equals(other._cashBoxes, _cashBoxes) &&
            const DeepCollectionEquality()
                .equals(other._pendingRequests, _pendingRequests) &&
            const DeepCollectionEquality().equals(other._totals, _totals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cashBoxes),
      const DeepCollectionEquality().hash(_pendingRequests),
      const DeepCollectionEquality().hash(_totals));

  /// Create a copy of FinanceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceSummaryModelImplCopyWith<_$FinanceSummaryModelImpl> get copyWith =>
      __$$FinanceSummaryModelImplCopyWithImpl<_$FinanceSummaryModelImpl>(
          this, _$identity);
}

abstract class _FinanceSummaryModel implements FinanceSummaryModel {
  const factory _FinanceSummaryModel(
      {@JsonKey(name: 'cash_boxes', readValue: readJsonList)
      final List<CashBoxBalanceModel>? cashBoxes,
      @JsonKey(
          readValue: _financeSummaryPendingRequests,
          fromJson: _financeSummaryPendingRequestsValue)
      final Map<String, int>? pendingRequests,
      @JsonKey(readValue: readJsonList)
      final List<CurrencyTotalModel>? totals}) = _$FinanceSummaryModelImpl;

  factory _FinanceSummaryModel.fromJson(Map<String, dynamic> json) =
      _$FinanceSummaryModelImpl.fromJson;

  @override
  @JsonKey(name: 'cash_boxes', readValue: readJsonList)
  List<CashBoxBalanceModel>? get cashBoxes;
  @override
  @JsonKey(
      readValue: _financeSummaryPendingRequests,
      fromJson: _financeSummaryPendingRequestsValue)
  Map<String, int>? get pendingRequests;
  @override
  @JsonKey(readValue: readJsonList)
  List<CurrencyTotalModel>? get totals;

  /// Create a copy of FinanceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceSummaryModelImplCopyWith<_$FinanceSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LedgerEntryModel _$LedgerEntryModelFromJson(Map<String, dynamic> json) {
  return _LedgerEntryModel.fromJson(json);
}

/// @nodoc
mixin _$LedgerEntryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
  String? get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get direction => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
  String? get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
  double? get signedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
  double? get localAmount => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'cash_box', readValue: readJsonMap)
  CashBoxRefModel? get cashBox => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _ledgerEntryCategoryName,
      fromJson: _ledgerEntryCategoryNameValue)
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _ledgerEntryEnteredByName,
      fromJson: _ledgerEntryEnteredByNameValue)
  String? get enteredByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
  int? get financeRequestId => throw _privateConstructorUsedError;

  /// Create a copy of LedgerEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LedgerEntryModelCopyWith<LedgerEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerEntryModelCopyWith<$Res> {
  factory $LedgerEntryModelCopyWith(
          LedgerEntryModel value, $Res Function(LedgerEntryModel) then) =
      _$LedgerEntryModelCopyWithImpl<$Res, LedgerEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
      String? transactionNo,
      @JsonKey(fromJson: jsonStringValue) String? type,
      @JsonKey(fromJson: jsonStringValue) String? direction,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
      String? transactionDate,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
      double? signedAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      double? localAmount,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
      @JsonKey(name: 'cash_box', readValue: readJsonMap)
      CashBoxRefModel? cashBox,
      @JsonKey(
          readValue: _ledgerEntryCategoryName,
          fromJson: _ledgerEntryCategoryNameValue)
      String? categoryName,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(
          readValue: _ledgerEntryEnteredByName,
          fromJson: _ledgerEntryEnteredByNameValue)
      String? enteredByName,
      @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
      int? financeRequestId});

  $FinanceCurrencyModelCopyWith<$Res>? get currency;
  $CashBoxRefModelCopyWith<$Res>? get cashBox;
}

/// @nodoc
class _$LedgerEntryModelCopyWithImpl<$Res, $Val extends LedgerEntryModel>
    implements $LedgerEntryModelCopyWith<$Res> {
  _$LedgerEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LedgerEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? transactionNo = freezed,
    Object? type = freezed,
    Object? direction = freezed,
    Object? status = freezed,
    Object? transactionDate = freezed,
    Object? amount = freezed,
    Object? signedAmount = freezed,
    Object? localAmount = freezed,
    Object? currency = freezed,
    Object? cashBox = freezed,
    Object? categoryName = freezed,
    Object? description = freezed,
    Object? enteredByName = freezed,
    Object? financeRequestId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      signedAmount: freezed == signedAmount
          ? _value.signedAmount
          : signedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      localAmount: freezed == localAmount
          ? _value.localAmount
          : localAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      cashBox: freezed == cashBox
          ? _value.cashBox
          : cashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      enteredByName: freezed == enteredByName
          ? _value.enteredByName
          : enteredByName // ignore: cast_nullable_to_non_nullable
              as String?,
      financeRequestId: freezed == financeRequestId
          ? _value.financeRequestId
          : financeRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of LedgerEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of LedgerEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CashBoxRefModelCopyWith<$Res>? get cashBox {
    if (_value.cashBox == null) {
      return null;
    }

    return $CashBoxRefModelCopyWith<$Res>(_value.cashBox!, (value) {
      return _then(_value.copyWith(cashBox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LedgerEntryModelImplCopyWith<$Res>
    implements $LedgerEntryModelCopyWith<$Res> {
  factory _$$LedgerEntryModelImplCopyWith(_$LedgerEntryModelImpl value,
          $Res Function(_$LedgerEntryModelImpl) then) =
      __$$LedgerEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
      String? transactionNo,
      @JsonKey(fromJson: jsonStringValue) String? type,
      @JsonKey(fromJson: jsonStringValue) String? direction,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
      String? transactionDate,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
      double? signedAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      double? localAmount,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
      @JsonKey(name: 'cash_box', readValue: readJsonMap)
      CashBoxRefModel? cashBox,
      @JsonKey(
          readValue: _ledgerEntryCategoryName,
          fromJson: _ledgerEntryCategoryNameValue)
      String? categoryName,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(
          readValue: _ledgerEntryEnteredByName,
          fromJson: _ledgerEntryEnteredByNameValue)
      String? enteredByName,
      @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
      int? financeRequestId});

  @override
  $FinanceCurrencyModelCopyWith<$Res>? get currency;
  @override
  $CashBoxRefModelCopyWith<$Res>? get cashBox;
}

/// @nodoc
class __$$LedgerEntryModelImplCopyWithImpl<$Res>
    extends _$LedgerEntryModelCopyWithImpl<$Res, _$LedgerEntryModelImpl>
    implements _$$LedgerEntryModelImplCopyWith<$Res> {
  __$$LedgerEntryModelImplCopyWithImpl(_$LedgerEntryModelImpl _value,
      $Res Function(_$LedgerEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? transactionNo = freezed,
    Object? type = freezed,
    Object? direction = freezed,
    Object? status = freezed,
    Object? transactionDate = freezed,
    Object? amount = freezed,
    Object? signedAmount = freezed,
    Object? localAmount = freezed,
    Object? currency = freezed,
    Object? cashBox = freezed,
    Object? categoryName = freezed,
    Object? description = freezed,
    Object? enteredByName = freezed,
    Object? financeRequestId = freezed,
  }) {
    return _then(_$LedgerEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      signedAmount: freezed == signedAmount
          ? _value.signedAmount
          : signedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      localAmount: freezed == localAmount
          ? _value.localAmount
          : localAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      cashBox: freezed == cashBox
          ? _value.cashBox
          : cashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      enteredByName: freezed == enteredByName
          ? _value.enteredByName
          : enteredByName // ignore: cast_nullable_to_non_nullable
              as String?,
      financeRequestId: freezed == financeRequestId
          ? _value.financeRequestId
          : financeRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$LedgerEntryModelImpl implements _LedgerEntryModel {
  const _$LedgerEntryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
      this.transactionNo,
      @JsonKey(fromJson: jsonStringValue) this.type,
      @JsonKey(fromJson: jsonStringValue) this.direction,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
      this.transactionDate,
      @JsonKey(fromJson: jsonDoubleLenient) this.amount,
      @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
      this.signedAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      this.localAmount,
      @JsonKey(readValue: readJsonMap) this.currency,
      @JsonKey(name: 'cash_box', readValue: readJsonMap) this.cashBox,
      @JsonKey(
          readValue: _ledgerEntryCategoryName,
          fromJson: _ledgerEntryCategoryNameValue)
      this.categoryName,
      @JsonKey(fromJson: jsonStringLenient) this.description,
      @JsonKey(
          readValue: _ledgerEntryEnteredByName,
          fromJson: _ledgerEntryEnteredByNameValue)
      this.enteredByName,
      @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
      this.financeRequestId});

  factory _$LedgerEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerEntryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
  final String? transactionNo;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? type;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? direction;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
  final String? transactionDate;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? amount;
  @override
  @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
  final double? signedAmount;
  @override
  @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
  final double? localAmount;
  @override
  @JsonKey(readValue: readJsonMap)
  final FinanceCurrencyModel? currency;
  @override
  @JsonKey(name: 'cash_box', readValue: readJsonMap)
  final CashBoxRefModel? cashBox;
  @override
  @JsonKey(
      readValue: _ledgerEntryCategoryName,
      fromJson: _ledgerEntryCategoryNameValue)
  final String? categoryName;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? description;
  @override
  @JsonKey(
      readValue: _ledgerEntryEnteredByName,
      fromJson: _ledgerEntryEnteredByNameValue)
  final String? enteredByName;
  @override
  @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
  final int? financeRequestId;

  @override
  String toString() {
    return 'LedgerEntryModel(id: $id, transactionNo: $transactionNo, type: $type, direction: $direction, status: $status, transactionDate: $transactionDate, amount: $amount, signedAmount: $signedAmount, localAmount: $localAmount, currency: $currency, cashBox: $cashBox, categoryName: $categoryName, description: $description, enteredByName: $enteredByName, financeRequestId: $financeRequestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.signedAmount, signedAmount) ||
                other.signedAmount == signedAmount) &&
            (identical(other.localAmount, localAmount) ||
                other.localAmount == localAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.cashBox, cashBox) || other.cashBox == cashBox) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enteredByName, enteredByName) ||
                other.enteredByName == enteredByName) &&
            (identical(other.financeRequestId, financeRequestId) ||
                other.financeRequestId == financeRequestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      transactionNo,
      type,
      direction,
      status,
      transactionDate,
      amount,
      signedAmount,
      localAmount,
      currency,
      cashBox,
      categoryName,
      description,
      enteredByName,
      financeRequestId);

  /// Create a copy of LedgerEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerEntryModelImplCopyWith<_$LedgerEntryModelImpl> get copyWith =>
      __$$LedgerEntryModelImplCopyWithImpl<_$LedgerEntryModelImpl>(
          this, _$identity);
}

abstract class _LedgerEntryModel implements LedgerEntryModel {
  const factory _LedgerEntryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
      final String? transactionNo,
      @JsonKey(fromJson: jsonStringValue) final String? type,
      @JsonKey(fromJson: jsonStringValue) final String? direction,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
      final String? transactionDate,
      @JsonKey(fromJson: jsonDoubleLenient) final double? amount,
      @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
      final double? signedAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      final double? localAmount,
      @JsonKey(readValue: readJsonMap) final FinanceCurrencyModel? currency,
      @JsonKey(name: 'cash_box', readValue: readJsonMap)
      final CashBoxRefModel? cashBox,
      @JsonKey(
          readValue: _ledgerEntryCategoryName,
          fromJson: _ledgerEntryCategoryNameValue)
      final String? categoryName,
      @JsonKey(fromJson: jsonStringLenient) final String? description,
      @JsonKey(
          readValue: _ledgerEntryEnteredByName,
          fromJson: _ledgerEntryEnteredByNameValue)
      final String? enteredByName,
      @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
      final int? financeRequestId}) = _$LedgerEntryModelImpl;

  factory _LedgerEntryModel.fromJson(Map<String, dynamic> json) =
      _$LedgerEntryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'transaction_no', fromJson: jsonStringValue)
  String? get transactionNo;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get type;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get direction;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'transaction_date', fromJson: jsonStringValue)
  String? get transactionDate;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount;
  @override
  @JsonKey(name: 'signed_amount', fromJson: jsonDoubleLenient)
  double? get signedAmount;
  @override
  @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
  double? get localAmount;
  @override
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency;
  @override
  @JsonKey(name: 'cash_box', readValue: readJsonMap)
  CashBoxRefModel? get cashBox;
  @override
  @JsonKey(
      readValue: _ledgerEntryCategoryName,
      fromJson: _ledgerEntryCategoryNameValue)
  String? get categoryName;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get description;
  @override
  @JsonKey(
      readValue: _ledgerEntryEnteredByName,
      fromJson: _ledgerEntryEnteredByNameValue)
  String? get enteredByName;
  @override
  @JsonKey(name: 'finance_request_id', fromJson: jsonIntLenient)
  int? get financeRequestId;

  /// Create a copy of LedgerEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LedgerEntryModelImplCopyWith<_$LedgerEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CashBoxTransferModel _$CashBoxTransferModelFromJson(Map<String, dynamic> json) {
  return _CashBoxTransferModel.fromJson(json);
}

/// @nodoc
mixin _$CashBoxTransferModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_no', fromJson: jsonStringValue)
  String? get transferNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
  String? get transferDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get fromCashBox => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get toCashBox => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _cashBoxTransferEnteredByName,
      fromJson: _cashBoxTransferEnteredByNameValue)
  String? get enteredByName => throw _privateConstructorUsedError;

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashBoxTransferModelCopyWith<CashBoxTransferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashBoxTransferModelCopyWith<$Res> {
  factory $CashBoxTransferModelCopyWith(CashBoxTransferModel value,
          $Res Function(CashBoxTransferModel) then) =
      _$CashBoxTransferModelCopyWithImpl<$Res, CashBoxTransferModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'transfer_no', fromJson: jsonStringValue)
      String? transferNo,
      @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
      String? transferDate,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
      CashBoxRefModel? fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
      CashBoxRefModel? toCashBox,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _cashBoxTransferEnteredByName,
          fromJson: _cashBoxTransferEnteredByNameValue)
      String? enteredByName});

  $FinanceCurrencyModelCopyWith<$Res>? get currency;
  $CashBoxRefModelCopyWith<$Res>? get fromCashBox;
  $CashBoxRefModelCopyWith<$Res>? get toCashBox;
}

/// @nodoc
class _$CashBoxTransferModelCopyWithImpl<$Res,
        $Val extends CashBoxTransferModel>
    implements $CashBoxTransferModelCopyWith<$Res> {
  _$CashBoxTransferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? transferNo = freezed,
    Object? transferDate = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? fromCashBox = freezed,
    Object? toCashBox = freezed,
    Object? notes = freezed,
    Object? enteredByName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transferNo: freezed == transferNo
          ? _value.transferNo
          : transferNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transferDate: freezed == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      fromCashBox: freezed == fromCashBox
          ? _value.fromCashBox
          : fromCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      toCashBox: freezed == toCashBox
          ? _value.toCashBox
          : toCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      enteredByName: freezed == enteredByName
          ? _value.enteredByName
          : enteredByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CashBoxRefModelCopyWith<$Res>? get fromCashBox {
    if (_value.fromCashBox == null) {
      return null;
    }

    return $CashBoxRefModelCopyWith<$Res>(_value.fromCashBox!, (value) {
      return _then(_value.copyWith(fromCashBox: value) as $Val);
    });
  }

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CashBoxRefModelCopyWith<$Res>? get toCashBox {
    if (_value.toCashBox == null) {
      return null;
    }

    return $CashBoxRefModelCopyWith<$Res>(_value.toCashBox!, (value) {
      return _then(_value.copyWith(toCashBox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CashBoxTransferModelImplCopyWith<$Res>
    implements $CashBoxTransferModelCopyWith<$Res> {
  factory _$$CashBoxTransferModelImplCopyWith(_$CashBoxTransferModelImpl value,
          $Res Function(_$CashBoxTransferModelImpl) then) =
      __$$CashBoxTransferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'transfer_no', fromJson: jsonStringValue)
      String? transferNo,
      @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
      String? transferDate,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(readValue: readJsonMap) FinanceCurrencyModel? currency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
      CashBoxRefModel? fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
      CashBoxRefModel? toCashBox,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _cashBoxTransferEnteredByName,
          fromJson: _cashBoxTransferEnteredByNameValue)
      String? enteredByName});

  @override
  $FinanceCurrencyModelCopyWith<$Res>? get currency;
  @override
  $CashBoxRefModelCopyWith<$Res>? get fromCashBox;
  @override
  $CashBoxRefModelCopyWith<$Res>? get toCashBox;
}

/// @nodoc
class __$$CashBoxTransferModelImplCopyWithImpl<$Res>
    extends _$CashBoxTransferModelCopyWithImpl<$Res, _$CashBoxTransferModelImpl>
    implements _$$CashBoxTransferModelImplCopyWith<$Res> {
  __$$CashBoxTransferModelImplCopyWithImpl(_$CashBoxTransferModelImpl _value,
      $Res Function(_$CashBoxTransferModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? transferNo = freezed,
    Object? transferDate = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? fromCashBox = freezed,
    Object? toCashBox = freezed,
    Object? notes = freezed,
    Object? enteredByName = freezed,
  }) {
    return _then(_$CashBoxTransferModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      transferNo: freezed == transferNo
          ? _value.transferNo
          : transferNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transferDate: freezed == transferDate
          ? _value.transferDate
          : transferDate // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      fromCashBox: freezed == fromCashBox
          ? _value.fromCashBox
          : fromCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      toCashBox: freezed == toCashBox
          ? _value.toCashBox
          : toCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      enteredByName: freezed == enteredByName
          ? _value.enteredByName
          : enteredByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CashBoxTransferModelImpl implements _CashBoxTransferModel {
  const _$CashBoxTransferModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'transfer_no', fromJson: jsonStringValue) this.transferNo,
      @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
      this.transferDate,
      @JsonKey(fromJson: jsonDoubleLenient) this.amount,
      @JsonKey(readValue: readJsonMap) this.currency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap) this.fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap) this.toCashBox,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(
          readValue: _cashBoxTransferEnteredByName,
          fromJson: _cashBoxTransferEnteredByNameValue)
      this.enteredByName});

  factory _$CashBoxTransferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashBoxTransferModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'transfer_no', fromJson: jsonStringValue)
  final String? transferNo;
  @override
  @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
  final String? transferDate;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? amount;
  @override
  @JsonKey(readValue: readJsonMap)
  final FinanceCurrencyModel? currency;
  @override
  @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
  final CashBoxRefModel? fromCashBox;
  @override
  @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
  final CashBoxRefModel? toCashBox;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(
      readValue: _cashBoxTransferEnteredByName,
      fromJson: _cashBoxTransferEnteredByNameValue)
  final String? enteredByName;

  @override
  String toString() {
    return 'CashBoxTransferModel(id: $id, transferNo: $transferNo, transferDate: $transferDate, amount: $amount, currency: $currency, fromCashBox: $fromCashBox, toCashBox: $toCashBox, notes: $notes, enteredByName: $enteredByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashBoxTransferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transferNo, transferNo) ||
                other.transferNo == transferNo) &&
            (identical(other.transferDate, transferDate) ||
                other.transferDate == transferDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.fromCashBox, fromCashBox) ||
                other.fromCashBox == fromCashBox) &&
            (identical(other.toCashBox, toCashBox) ||
                other.toCashBox == toCashBox) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.enteredByName, enteredByName) ||
                other.enteredByName == enteredByName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, transferNo, transferDate,
      amount, currency, fromCashBox, toCashBox, notes, enteredByName);

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashBoxTransferModelImplCopyWith<_$CashBoxTransferModelImpl>
      get copyWith =>
          __$$CashBoxTransferModelImplCopyWithImpl<_$CashBoxTransferModelImpl>(
              this, _$identity);
}

abstract class _CashBoxTransferModel implements CashBoxTransferModel {
  const factory _CashBoxTransferModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'transfer_no', fromJson: jsonStringValue)
      final String? transferNo,
      @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
      final String? transferDate,
      @JsonKey(fromJson: jsonDoubleLenient) final double? amount,
      @JsonKey(readValue: readJsonMap) final FinanceCurrencyModel? currency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
      final CashBoxRefModel? fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
      final CashBoxRefModel? toCashBox,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(
          readValue: _cashBoxTransferEnteredByName,
          fromJson: _cashBoxTransferEnteredByNameValue)
      final String? enteredByName}) = _$CashBoxTransferModelImpl;

  factory _CashBoxTransferModel.fromJson(Map<String, dynamic> json) =
      _$CashBoxTransferModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'transfer_no', fromJson: jsonStringValue)
  String? get transferNo;
  @override
  @JsonKey(name: 'transfer_date', fromJson: jsonStringValue)
  String? get transferDate;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount;
  @override
  @JsonKey(readValue: readJsonMap)
  FinanceCurrencyModel? get currency;
  @override
  @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get fromCashBox;
  @override
  @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get toCashBox;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(
      readValue: _cashBoxTransferEnteredByName,
      fromJson: _cashBoxTransferEnteredByNameValue)
  String? get enteredByName;

  /// Create a copy of CashBoxTransferModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashBoxTransferModelImplCopyWith<_$CashBoxTransferModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurrencyExchangeModel _$CurrencyExchangeModelFromJson(
    Map<String, dynamic> json) {
  return _CurrencyExchangeModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyExchangeModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'exchange_no', fromJson: jsonStringValue)
  String? get exchangeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
  String? get exchangeDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
  double? get fromAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient)
  double? get toAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
  double? get localAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get fromCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get toCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get fromCashBox => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get toCashBox => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _currencyExchangeEnteredByName,
      fromJson: _currencyExchangeEnteredByNameValue)
  String? get enteredByName => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyExchangeModelCopyWith<CurrencyExchangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyExchangeModelCopyWith<$Res> {
  factory $CurrencyExchangeModelCopyWith(CurrencyExchangeModel value,
          $Res Function(CurrencyExchangeModel) then) =
      _$CurrencyExchangeModelCopyWithImpl<$Res, CurrencyExchangeModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'exchange_no', fromJson: jsonStringValue)
      String? exchangeNo,
      @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
      String? exchangeDate,
      @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
      double? fromAmount,
      @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient) double? toAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      double? localAmount,
      @JsonKey(name: 'from_currency', readValue: readJsonMap)
      FinanceCurrencyModel? fromCurrency,
      @JsonKey(name: 'to_currency', readValue: readJsonMap)
      FinanceCurrencyModel? toCurrency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
      CashBoxRefModel? fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
      CashBoxRefModel? toCashBox,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _currencyExchangeEnteredByName,
          fromJson: _currencyExchangeEnteredByNameValue)
      String? enteredByName});

  $FinanceCurrencyModelCopyWith<$Res>? get fromCurrency;
  $FinanceCurrencyModelCopyWith<$Res>? get toCurrency;
  $CashBoxRefModelCopyWith<$Res>? get fromCashBox;
  $CashBoxRefModelCopyWith<$Res>? get toCashBox;
}

/// @nodoc
class _$CurrencyExchangeModelCopyWithImpl<$Res,
        $Val extends CurrencyExchangeModel>
    implements $CurrencyExchangeModelCopyWith<$Res> {
  _$CurrencyExchangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exchangeNo = freezed,
    Object? exchangeDate = freezed,
    Object? fromAmount = freezed,
    Object? toAmount = freezed,
    Object? localAmount = freezed,
    Object? fromCurrency = freezed,
    Object? toCurrency = freezed,
    Object? fromCashBox = freezed,
    Object? toCashBox = freezed,
    Object? notes = freezed,
    Object? enteredByName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exchangeNo: freezed == exchangeNo
          ? _value.exchangeNo
          : exchangeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeDate: freezed == exchangeDate
          ? _value.exchangeDate
          : exchangeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      fromAmount: freezed == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      toAmount: freezed == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      localAmount: freezed == localAmount
          ? _value.localAmount
          : localAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      fromCurrency: freezed == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      toCurrency: freezed == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      fromCashBox: freezed == fromCashBox
          ? _value.fromCashBox
          : fromCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      toCashBox: freezed == toCashBox
          ? _value.toCashBox
          : toCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      enteredByName: freezed == enteredByName
          ? _value.enteredByName
          : enteredByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get fromCurrency {
    if (_value.fromCurrency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.fromCurrency!, (value) {
      return _then(_value.copyWith(fromCurrency: value) as $Val);
    });
  }

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get toCurrency {
    if (_value.toCurrency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.toCurrency!, (value) {
      return _then(_value.copyWith(toCurrency: value) as $Val);
    });
  }

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CashBoxRefModelCopyWith<$Res>? get fromCashBox {
    if (_value.fromCashBox == null) {
      return null;
    }

    return $CashBoxRefModelCopyWith<$Res>(_value.fromCashBox!, (value) {
      return _then(_value.copyWith(fromCashBox: value) as $Val);
    });
  }

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CashBoxRefModelCopyWith<$Res>? get toCashBox {
    if (_value.toCashBox == null) {
      return null;
    }

    return $CashBoxRefModelCopyWith<$Res>(_value.toCashBox!, (value) {
      return _then(_value.copyWith(toCashBox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrencyExchangeModelImplCopyWith<$Res>
    implements $CurrencyExchangeModelCopyWith<$Res> {
  factory _$$CurrencyExchangeModelImplCopyWith(
          _$CurrencyExchangeModelImpl value,
          $Res Function(_$CurrencyExchangeModelImpl) then) =
      __$$CurrencyExchangeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'exchange_no', fromJson: jsonStringValue)
      String? exchangeNo,
      @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
      String? exchangeDate,
      @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
      double? fromAmount,
      @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient) double? toAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      double? localAmount,
      @JsonKey(name: 'from_currency', readValue: readJsonMap)
      FinanceCurrencyModel? fromCurrency,
      @JsonKey(name: 'to_currency', readValue: readJsonMap)
      FinanceCurrencyModel? toCurrency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
      CashBoxRefModel? fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
      CashBoxRefModel? toCashBox,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _currencyExchangeEnteredByName,
          fromJson: _currencyExchangeEnteredByNameValue)
      String? enteredByName});

  @override
  $FinanceCurrencyModelCopyWith<$Res>? get fromCurrency;
  @override
  $FinanceCurrencyModelCopyWith<$Res>? get toCurrency;
  @override
  $CashBoxRefModelCopyWith<$Res>? get fromCashBox;
  @override
  $CashBoxRefModelCopyWith<$Res>? get toCashBox;
}

/// @nodoc
class __$$CurrencyExchangeModelImplCopyWithImpl<$Res>
    extends _$CurrencyExchangeModelCopyWithImpl<$Res,
        _$CurrencyExchangeModelImpl>
    implements _$$CurrencyExchangeModelImplCopyWith<$Res> {
  __$$CurrencyExchangeModelImplCopyWithImpl(_$CurrencyExchangeModelImpl _value,
      $Res Function(_$CurrencyExchangeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? exchangeNo = freezed,
    Object? exchangeDate = freezed,
    Object? fromAmount = freezed,
    Object? toAmount = freezed,
    Object? localAmount = freezed,
    Object? fromCurrency = freezed,
    Object? toCurrency = freezed,
    Object? fromCashBox = freezed,
    Object? toCashBox = freezed,
    Object? notes = freezed,
    Object? enteredByName = freezed,
  }) {
    return _then(_$CurrencyExchangeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      exchangeNo: freezed == exchangeNo
          ? _value.exchangeNo
          : exchangeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      exchangeDate: freezed == exchangeDate
          ? _value.exchangeDate
          : exchangeDate // ignore: cast_nullable_to_non_nullable
              as String?,
      fromAmount: freezed == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      toAmount: freezed == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      localAmount: freezed == localAmount
          ? _value.localAmount
          : localAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      fromCurrency: freezed == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      toCurrency: freezed == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      fromCashBox: freezed == fromCashBox
          ? _value.fromCashBox
          : fromCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      toCashBox: freezed == toCashBox
          ? _value.toCashBox
          : toCashBox // ignore: cast_nullable_to_non_nullable
              as CashBoxRefModel?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      enteredByName: freezed == enteredByName
          ? _value.enteredByName
          : enteredByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurrencyExchangeModelImpl implements _CurrencyExchangeModel {
  const _$CurrencyExchangeModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'exchange_no', fromJson: jsonStringValue) this.exchangeNo,
      @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
      this.exchangeDate,
      @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
      this.fromAmount,
      @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient) this.toAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      this.localAmount,
      @JsonKey(name: 'from_currency', readValue: readJsonMap) this.fromCurrency,
      @JsonKey(name: 'to_currency', readValue: readJsonMap) this.toCurrency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap) this.fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap) this.toCashBox,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(
          readValue: _currencyExchangeEnteredByName,
          fromJson: _currencyExchangeEnteredByNameValue)
      this.enteredByName});

  factory _$CurrencyExchangeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyExchangeModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'exchange_no', fromJson: jsonStringValue)
  final String? exchangeNo;
  @override
  @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
  final String? exchangeDate;
  @override
  @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
  final double? fromAmount;
  @override
  @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient)
  final double? toAmount;
  @override
  @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
  final double? localAmount;
  @override
  @JsonKey(name: 'from_currency', readValue: readJsonMap)
  final FinanceCurrencyModel? fromCurrency;
  @override
  @JsonKey(name: 'to_currency', readValue: readJsonMap)
  final FinanceCurrencyModel? toCurrency;
  @override
  @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
  final CashBoxRefModel? fromCashBox;
  @override
  @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
  final CashBoxRefModel? toCashBox;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(
      readValue: _currencyExchangeEnteredByName,
      fromJson: _currencyExchangeEnteredByNameValue)
  final String? enteredByName;

  @override
  String toString() {
    return 'CurrencyExchangeModel(id: $id, exchangeNo: $exchangeNo, exchangeDate: $exchangeDate, fromAmount: $fromAmount, toAmount: $toAmount, localAmount: $localAmount, fromCurrency: $fromCurrency, toCurrency: $toCurrency, fromCashBox: $fromCashBox, toCashBox: $toCashBox, notes: $notes, enteredByName: $enteredByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyExchangeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exchangeNo, exchangeNo) ||
                other.exchangeNo == exchangeNo) &&
            (identical(other.exchangeDate, exchangeDate) ||
                other.exchangeDate == exchangeDate) &&
            (identical(other.fromAmount, fromAmount) ||
                other.fromAmount == fromAmount) &&
            (identical(other.toAmount, toAmount) ||
                other.toAmount == toAmount) &&
            (identical(other.localAmount, localAmount) ||
                other.localAmount == localAmount) &&
            (identical(other.fromCurrency, fromCurrency) ||
                other.fromCurrency == fromCurrency) &&
            (identical(other.toCurrency, toCurrency) ||
                other.toCurrency == toCurrency) &&
            (identical(other.fromCashBox, fromCashBox) ||
                other.fromCashBox == fromCashBox) &&
            (identical(other.toCashBox, toCashBox) ||
                other.toCashBox == toCashBox) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.enteredByName, enteredByName) ||
                other.enteredByName == enteredByName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      exchangeNo,
      exchangeDate,
      fromAmount,
      toAmount,
      localAmount,
      fromCurrency,
      toCurrency,
      fromCashBox,
      toCashBox,
      notes,
      enteredByName);

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyExchangeModelImplCopyWith<_$CurrencyExchangeModelImpl>
      get copyWith => __$$CurrencyExchangeModelImplCopyWithImpl<
          _$CurrencyExchangeModelImpl>(this, _$identity);
}

abstract class _CurrencyExchangeModel implements CurrencyExchangeModel {
  const factory _CurrencyExchangeModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'exchange_no', fromJson: jsonStringValue)
      final String? exchangeNo,
      @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
      final String? exchangeDate,
      @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
      final double? fromAmount,
      @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient)
      final double? toAmount,
      @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
      final double? localAmount,
      @JsonKey(name: 'from_currency', readValue: readJsonMap)
      final FinanceCurrencyModel? fromCurrency,
      @JsonKey(name: 'to_currency', readValue: readJsonMap)
      final FinanceCurrencyModel? toCurrency,
      @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
      final CashBoxRefModel? fromCashBox,
      @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
      final CashBoxRefModel? toCashBox,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(
          readValue: _currencyExchangeEnteredByName,
          fromJson: _currencyExchangeEnteredByNameValue)
      final String? enteredByName}) = _$CurrencyExchangeModelImpl;

  factory _CurrencyExchangeModel.fromJson(Map<String, dynamic> json) =
      _$CurrencyExchangeModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'exchange_no', fromJson: jsonStringValue)
  String? get exchangeNo;
  @override
  @JsonKey(name: 'exchange_date', fromJson: jsonStringValue)
  String? get exchangeDate;
  @override
  @JsonKey(name: 'from_amount', fromJson: jsonDoubleLenient)
  double? get fromAmount;
  @override
  @JsonKey(name: 'to_amount', fromJson: jsonDoubleLenient)
  double? get toAmount;
  @override
  @JsonKey(name: 'local_amount', fromJson: jsonDoubleLenient)
  double? get localAmount;
  @override
  @JsonKey(name: 'from_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get fromCurrency;
  @override
  @JsonKey(name: 'to_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get toCurrency;
  @override
  @JsonKey(name: 'from_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get fromCashBox;
  @override
  @JsonKey(name: 'to_cash_box', readValue: readJsonMap)
  CashBoxRefModel? get toCashBox;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(
      readValue: _currencyExchangeEnteredByName,
      fromJson: _currencyExchangeEnteredByNameValue)
  String? get enteredByName;

  /// Create a copy of CurrencyExchangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyExchangeModelImplCopyWith<_$CurrencyExchangeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FinanceRequestItemModel _$FinanceRequestItemModelFromJson(
    Map<String, dynamic> json) {
  return _FinanceRequestItemModel.fromJson(json);
}

/// @nodoc
mixin _$FinanceRequestItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'request_no', fromJson: jsonStringValue)
  String? get requestNo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
  double? get requestedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
  int? get requestedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'requested_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get requestedCurrency =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
  double? get acceptedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get acceptedCurrency =>
      throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _financeRequestItemCashBoxName,
      fromJson: _financeRequestItemCashBoxNameValue)
  String? get cashBoxName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _financeRequestItemCategoryName,
      fromJson: _financeRequestItemCategoryNameValue)
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
  String? get counterpartyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
  String? get requestedReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
  String? get reviewNotes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _financeRequestItemRequestedByName,
      fromJson: _financeRequestItemRequestedByNameValue)
  String? get requestedByName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _financeRequestItemReviewedByName,
      fromJson: _financeRequestItemReviewedByNameValue)
  String? get reviewedByName => throw _privateConstructorUsedError;

  /// Create a copy of FinanceRequestItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceRequestItemModelCopyWith<FinanceRequestItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceRequestItemModelCopyWith<$Res> {
  factory $FinanceRequestItemModelCopyWith(FinanceRequestItemModel value,
          $Res Function(FinanceRequestItemModel) then) =
      _$FinanceRequestItemModelCopyWithImpl<$Res, FinanceRequestItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'request_no', fromJson: jsonStringValue) String? requestNo,
      @JsonKey(fromJson: jsonStringValue) String? type,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
      double? requestedAmount,
      @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
      int? requestedCount,
      @JsonKey(name: 'requested_currency', readValue: readJsonMap)
      FinanceCurrencyModel? requestedCurrency,
      @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
      double? acceptedAmount,
      @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
      FinanceCurrencyModel? acceptedCurrency,
      @JsonKey(
          readValue: _financeRequestItemCashBoxName,
          fromJson: _financeRequestItemCashBoxNameValue)
      String? cashBoxName,
      @JsonKey(
          readValue: _financeRequestItemCategoryName,
          fromJson: _financeRequestItemCategoryNameValue)
      String? categoryName,
      @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
      String? counterpartyName,
      @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
      String? requestedReason,
      @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
      String? reviewNotes,
      @JsonKey(
          readValue: _financeRequestItemRequestedByName,
          fromJson: _financeRequestItemRequestedByNameValue)
      String? requestedByName,
      @JsonKey(
          readValue: _financeRequestItemReviewedByName,
          fromJson: _financeRequestItemReviewedByNameValue)
      String? reviewedByName});

  $FinanceCurrencyModelCopyWith<$Res>? get requestedCurrency;
  $FinanceCurrencyModelCopyWith<$Res>? get acceptedCurrency;
}

/// @nodoc
class _$FinanceRequestItemModelCopyWithImpl<$Res,
        $Val extends FinanceRequestItemModel>
    implements $FinanceRequestItemModelCopyWith<$Res> {
  _$FinanceRequestItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceRequestItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? requestNo = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? requestedAmount = freezed,
    Object? requestedCount = freezed,
    Object? requestedCurrency = freezed,
    Object? acceptedAmount = freezed,
    Object? acceptedCurrency = freezed,
    Object? cashBoxName = freezed,
    Object? categoryName = freezed,
    Object? counterpartyName = freezed,
    Object? requestedReason = freezed,
    Object? reviewNotes = freezed,
    Object? requestedByName = freezed,
    Object? reviewedByName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      requestNo: freezed == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedAmount: freezed == requestedAmount
          ? _value.requestedAmount
          : requestedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      requestedCount: freezed == requestedCount
          ? _value.requestedCount
          : requestedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      requestedCurrency: freezed == requestedCurrency
          ? _value.requestedCurrency
          : requestedCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      acceptedAmount: freezed == acceptedAmount
          ? _value.acceptedAmount
          : acceptedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      acceptedCurrency: freezed == acceptedCurrency
          ? _value.acceptedCurrency
          : acceptedCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      cashBoxName: freezed == cashBoxName
          ? _value.cashBoxName
          : cashBoxName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      counterpartyName: freezed == counterpartyName
          ? _value.counterpartyName
          : counterpartyName // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedReason: freezed == requestedReason
          ? _value.requestedReason
          : requestedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewNotes: freezed == reviewNotes
          ? _value.reviewNotes
          : reviewNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedByName: freezed == requestedByName
          ? _value.requestedByName
          : requestedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedByName: freezed == reviewedByName
          ? _value.reviewedByName
          : reviewedByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of FinanceRequestItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get requestedCurrency {
    if (_value.requestedCurrency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.requestedCurrency!,
        (value) {
      return _then(_value.copyWith(requestedCurrency: value) as $Val);
    });
  }

  /// Create a copy of FinanceRequestItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceCurrencyModelCopyWith<$Res>? get acceptedCurrency {
    if (_value.acceptedCurrency == null) {
      return null;
    }

    return $FinanceCurrencyModelCopyWith<$Res>(_value.acceptedCurrency!,
        (value) {
      return _then(_value.copyWith(acceptedCurrency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FinanceRequestItemModelImplCopyWith<$Res>
    implements $FinanceRequestItemModelCopyWith<$Res> {
  factory _$$FinanceRequestItemModelImplCopyWith(
          _$FinanceRequestItemModelImpl value,
          $Res Function(_$FinanceRequestItemModelImpl) then) =
      __$$FinanceRequestItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'request_no', fromJson: jsonStringValue) String? requestNo,
      @JsonKey(fromJson: jsonStringValue) String? type,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
      double? requestedAmount,
      @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
      int? requestedCount,
      @JsonKey(name: 'requested_currency', readValue: readJsonMap)
      FinanceCurrencyModel? requestedCurrency,
      @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
      double? acceptedAmount,
      @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
      FinanceCurrencyModel? acceptedCurrency,
      @JsonKey(
          readValue: _financeRequestItemCashBoxName,
          fromJson: _financeRequestItemCashBoxNameValue)
      String? cashBoxName,
      @JsonKey(
          readValue: _financeRequestItemCategoryName,
          fromJson: _financeRequestItemCategoryNameValue)
      String? categoryName,
      @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
      String? counterpartyName,
      @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
      String? requestedReason,
      @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
      String? reviewNotes,
      @JsonKey(
          readValue: _financeRequestItemRequestedByName,
          fromJson: _financeRequestItemRequestedByNameValue)
      String? requestedByName,
      @JsonKey(
          readValue: _financeRequestItemReviewedByName,
          fromJson: _financeRequestItemReviewedByNameValue)
      String? reviewedByName});

  @override
  $FinanceCurrencyModelCopyWith<$Res>? get requestedCurrency;
  @override
  $FinanceCurrencyModelCopyWith<$Res>? get acceptedCurrency;
}

/// @nodoc
class __$$FinanceRequestItemModelImplCopyWithImpl<$Res>
    extends _$FinanceRequestItemModelCopyWithImpl<$Res,
        _$FinanceRequestItemModelImpl>
    implements _$$FinanceRequestItemModelImplCopyWith<$Res> {
  __$$FinanceRequestItemModelImplCopyWithImpl(
      _$FinanceRequestItemModelImpl _value,
      $Res Function(_$FinanceRequestItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceRequestItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? requestNo = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? requestedAmount = freezed,
    Object? requestedCount = freezed,
    Object? requestedCurrency = freezed,
    Object? acceptedAmount = freezed,
    Object? acceptedCurrency = freezed,
    Object? cashBoxName = freezed,
    Object? categoryName = freezed,
    Object? counterpartyName = freezed,
    Object? requestedReason = freezed,
    Object? reviewNotes = freezed,
    Object? requestedByName = freezed,
    Object? reviewedByName = freezed,
  }) {
    return _then(_$FinanceRequestItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      requestNo: freezed == requestNo
          ? _value.requestNo
          : requestNo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedAmount: freezed == requestedAmount
          ? _value.requestedAmount
          : requestedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      requestedCount: freezed == requestedCount
          ? _value.requestedCount
          : requestedCount // ignore: cast_nullable_to_non_nullable
              as int?,
      requestedCurrency: freezed == requestedCurrency
          ? _value.requestedCurrency
          : requestedCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      acceptedAmount: freezed == acceptedAmount
          ? _value.acceptedAmount
          : acceptedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      acceptedCurrency: freezed == acceptedCurrency
          ? _value.acceptedCurrency
          : acceptedCurrency // ignore: cast_nullable_to_non_nullable
              as FinanceCurrencyModel?,
      cashBoxName: freezed == cashBoxName
          ? _value.cashBoxName
          : cashBoxName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      counterpartyName: freezed == counterpartyName
          ? _value.counterpartyName
          : counterpartyName // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedReason: freezed == requestedReason
          ? _value.requestedReason
          : requestedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewNotes: freezed == reviewNotes
          ? _value.reviewNotes
          : reviewNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedByName: freezed == requestedByName
          ? _value.requestedByName
          : requestedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedByName: freezed == reviewedByName
          ? _value.reviewedByName
          : reviewedByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$FinanceRequestItemModelImpl implements _FinanceRequestItemModel {
  const _$FinanceRequestItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'request_no', fromJson: jsonStringValue) this.requestNo,
      @JsonKey(fromJson: jsonStringValue) this.type,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
      this.requestedAmount,
      @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
      this.requestedCount,
      @JsonKey(name: 'requested_currency', readValue: readJsonMap)
      this.requestedCurrency,
      @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
      this.acceptedAmount,
      @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
      this.acceptedCurrency,
      @JsonKey(
          readValue: _financeRequestItemCashBoxName,
          fromJson: _financeRequestItemCashBoxNameValue)
      this.cashBoxName,
      @JsonKey(
          readValue: _financeRequestItemCategoryName,
          fromJson: _financeRequestItemCategoryNameValue)
      this.categoryName,
      @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
      this.counterpartyName,
      @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
      this.requestedReason,
      @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
      this.reviewNotes,
      @JsonKey(
          readValue: _financeRequestItemRequestedByName,
          fromJson: _financeRequestItemRequestedByNameValue)
      this.requestedByName,
      @JsonKey(
          readValue: _financeRequestItemReviewedByName,
          fromJson: _financeRequestItemReviewedByNameValue)
      this.reviewedByName});

  factory _$FinanceRequestItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceRequestItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'request_no', fromJson: jsonStringValue)
  final String? requestNo;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? type;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
  final double? requestedAmount;
  @override
  @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
  final int? requestedCount;
  @override
  @JsonKey(name: 'requested_currency', readValue: readJsonMap)
  final FinanceCurrencyModel? requestedCurrency;
  @override
  @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
  final double? acceptedAmount;
  @override
  @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
  final FinanceCurrencyModel? acceptedCurrency;
  @override
  @JsonKey(
      readValue: _financeRequestItemCashBoxName,
      fromJson: _financeRequestItemCashBoxNameValue)
  final String? cashBoxName;
  @override
  @JsonKey(
      readValue: _financeRequestItemCategoryName,
      fromJson: _financeRequestItemCategoryNameValue)
  final String? categoryName;
  @override
  @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
  final String? counterpartyName;
  @override
  @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
  final String? requestedReason;
  @override
  @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
  final String? reviewNotes;
  @override
  @JsonKey(
      readValue: _financeRequestItemRequestedByName,
      fromJson: _financeRequestItemRequestedByNameValue)
  final String? requestedByName;
  @override
  @JsonKey(
      readValue: _financeRequestItemReviewedByName,
      fromJson: _financeRequestItemReviewedByNameValue)
  final String? reviewedByName;

  @override
  String toString() {
    return 'FinanceRequestItemModel(id: $id, requestNo: $requestNo, type: $type, status: $status, requestedAmount: $requestedAmount, requestedCount: $requestedCount, requestedCurrency: $requestedCurrency, acceptedAmount: $acceptedAmount, acceptedCurrency: $acceptedCurrency, cashBoxName: $cashBoxName, categoryName: $categoryName, counterpartyName: $counterpartyName, requestedReason: $requestedReason, reviewNotes: $reviewNotes, requestedByName: $requestedByName, reviewedByName: $reviewedByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceRequestItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requestNo, requestNo) ||
                other.requestNo == requestNo) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.requestedAmount, requestedAmount) ||
                other.requestedAmount == requestedAmount) &&
            (identical(other.requestedCount, requestedCount) ||
                other.requestedCount == requestedCount) &&
            (identical(other.requestedCurrency, requestedCurrency) ||
                other.requestedCurrency == requestedCurrency) &&
            (identical(other.acceptedAmount, acceptedAmount) ||
                other.acceptedAmount == acceptedAmount) &&
            (identical(other.acceptedCurrency, acceptedCurrency) ||
                other.acceptedCurrency == acceptedCurrency) &&
            (identical(other.cashBoxName, cashBoxName) ||
                other.cashBoxName == cashBoxName) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.counterpartyName, counterpartyName) ||
                other.counterpartyName == counterpartyName) &&
            (identical(other.requestedReason, requestedReason) ||
                other.requestedReason == requestedReason) &&
            (identical(other.reviewNotes, reviewNotes) ||
                other.reviewNotes == reviewNotes) &&
            (identical(other.requestedByName, requestedByName) ||
                other.requestedByName == requestedByName) &&
            (identical(other.reviewedByName, reviewedByName) ||
                other.reviewedByName == reviewedByName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      requestNo,
      type,
      status,
      requestedAmount,
      requestedCount,
      requestedCurrency,
      acceptedAmount,
      acceptedCurrency,
      cashBoxName,
      categoryName,
      counterpartyName,
      requestedReason,
      reviewNotes,
      requestedByName,
      reviewedByName);

  /// Create a copy of FinanceRequestItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceRequestItemModelImplCopyWith<_$FinanceRequestItemModelImpl>
      get copyWith => __$$FinanceRequestItemModelImplCopyWithImpl<
          _$FinanceRequestItemModelImpl>(this, _$identity);
}

abstract class _FinanceRequestItemModel implements FinanceRequestItemModel {
  const factory _FinanceRequestItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'request_no', fromJson: jsonStringValue)
      final String? requestNo,
      @JsonKey(fromJson: jsonStringValue) final String? type,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
      final double? requestedAmount,
      @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
      final int? requestedCount,
      @JsonKey(name: 'requested_currency', readValue: readJsonMap)
      final FinanceCurrencyModel? requestedCurrency,
      @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
      final double? acceptedAmount,
      @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
      final FinanceCurrencyModel? acceptedCurrency,
      @JsonKey(
          readValue: _financeRequestItemCashBoxName,
          fromJson: _financeRequestItemCashBoxNameValue)
      final String? cashBoxName,
      @JsonKey(
          readValue: _financeRequestItemCategoryName,
          fromJson: _financeRequestItemCategoryNameValue)
      final String? categoryName,
      @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
      final String? counterpartyName,
      @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
      final String? requestedReason,
      @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
      final String? reviewNotes,
      @JsonKey(
          readValue: _financeRequestItemRequestedByName,
          fromJson: _financeRequestItemRequestedByNameValue)
      final String? requestedByName,
      @JsonKey(
          readValue: _financeRequestItemReviewedByName,
          fromJson: _financeRequestItemReviewedByNameValue)
      final String? reviewedByName}) = _$FinanceRequestItemModelImpl;

  factory _FinanceRequestItemModel.fromJson(Map<String, dynamic> json) =
      _$FinanceRequestItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'request_no', fromJson: jsonStringValue)
  String? get requestNo;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get type;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'requested_amount', fromJson: jsonDoubleLenient)
  double? get requestedAmount;
  @override
  @JsonKey(name: 'requested_count', fromJson: jsonIntLenient)
  int? get requestedCount;
  @override
  @JsonKey(name: 'requested_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get requestedCurrency;
  @override
  @JsonKey(name: 'accepted_amount', fromJson: jsonDoubleLenient)
  double? get acceptedAmount;
  @override
  @JsonKey(name: 'accepted_currency', readValue: readJsonMap)
  FinanceCurrencyModel? get acceptedCurrency;
  @override
  @JsonKey(
      readValue: _financeRequestItemCashBoxName,
      fromJson: _financeRequestItemCashBoxNameValue)
  String? get cashBoxName;
  @override
  @JsonKey(
      readValue: _financeRequestItemCategoryName,
      fromJson: _financeRequestItemCategoryNameValue)
  String? get categoryName;
  @override
  @JsonKey(name: 'counterparty_name', fromJson: jsonStringLenient)
  String? get counterpartyName;
  @override
  @JsonKey(name: 'requested_reason', fromJson: jsonStringLenient)
  String? get requestedReason;
  @override
  @JsonKey(name: 'review_notes', fromJson: jsonStringLenient)
  String? get reviewNotes;
  @override
  @JsonKey(
      readValue: _financeRequestItemRequestedByName,
      fromJson: _financeRequestItemRequestedByNameValue)
  String? get requestedByName;
  @override
  @JsonKey(
      readValue: _financeRequestItemReviewedByName,
      fromJson: _financeRequestItemReviewedByNameValue)
  String? get reviewedByName;

  /// Create a copy of FinanceRequestItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceRequestItemModelImplCopyWith<_$FinanceRequestItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
