// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) {
  return _MetaModel.fromJson(json);
}

/// @nodoc
mixin _$MetaModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonIntLenient)
  int? get limit => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonIntLenient)
  int? get offset => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_more', fromJson: jsonBoolLenient)
  bool? get hasMore => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', fromJson: jsonIntLenient)
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: jsonIntLenient)
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page', fromJson: jsonIntLenient)
  int? get perPage => throw _privateConstructorUsedError;

  /// Serializes this MetaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaModelCopyWith<MetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaModelCopyWith<$Res> {
  factory $MetaModelCopyWith(MetaModel value, $Res Function(MetaModel) then) =
      _$MetaModelCopyWithImpl<$Res, MetaModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? total,
      @JsonKey(fromJson: jsonIntLenient) int? limit,
      @JsonKey(fromJson: jsonIntLenient) int? offset,
      @JsonKey(name: 'has_more', fromJson: jsonBoolLenient) bool? hasMore,
      @JsonKey(name: 'current_page', fromJson: jsonIntLenient) int? currentPage,
      @JsonKey(name: 'last_page', fromJson: jsonIntLenient) int? lastPage,
      @JsonKey(name: 'per_page', fromJson: jsonIntLenient) int? perPage});
}

/// @nodoc
class _$MetaModelCopyWithImpl<$Res, $Val extends MetaModel>
    implements $MetaModelCopyWith<$Res> {
  _$MetaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? hasMore = freezed,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaModelImplCopyWith<$Res>
    implements $MetaModelCopyWith<$Res> {
  factory _$$MetaModelImplCopyWith(
          _$MetaModelImpl value, $Res Function(_$MetaModelImpl) then) =
      __$$MetaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? total,
      @JsonKey(fromJson: jsonIntLenient) int? limit,
      @JsonKey(fromJson: jsonIntLenient) int? offset,
      @JsonKey(name: 'has_more', fromJson: jsonBoolLenient) bool? hasMore,
      @JsonKey(name: 'current_page', fromJson: jsonIntLenient) int? currentPage,
      @JsonKey(name: 'last_page', fromJson: jsonIntLenient) int? lastPage,
      @JsonKey(name: 'per_page', fromJson: jsonIntLenient) int? perPage});
}

/// @nodoc
class __$$MetaModelImplCopyWithImpl<$Res>
    extends _$MetaModelCopyWithImpl<$Res, _$MetaModelImpl>
    implements _$$MetaModelImplCopyWith<$Res> {
  __$$MetaModelImplCopyWithImpl(
      _$MetaModelImpl _value, $Res Function(_$MetaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? hasMore = freezed,
    Object? currentPage = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_$MetaModelImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaModelImpl implements _MetaModel {
  const _$MetaModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.total,
      @JsonKey(fromJson: jsonIntLenient) this.limit,
      @JsonKey(fromJson: jsonIntLenient) this.offset,
      @JsonKey(name: 'has_more', fromJson: jsonBoolLenient) this.hasMore,
      @JsonKey(name: 'current_page', fromJson: jsonIntLenient) this.currentPage,
      @JsonKey(name: 'last_page', fromJson: jsonIntLenient) this.lastPage,
      @JsonKey(name: 'per_page', fromJson: jsonIntLenient) this.perPage});

  factory _$MetaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? total;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? limit;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? offset;
  @override
  @JsonKey(name: 'has_more', fromJson: jsonBoolLenient)
  final bool? hasMore;
  @override
  @JsonKey(name: 'current_page', fromJson: jsonIntLenient)
  final int? currentPage;
  @override
  @JsonKey(name: 'last_page', fromJson: jsonIntLenient)
  final int? lastPage;
  @override
  @JsonKey(name: 'per_page', fromJson: jsonIntLenient)
  final int? perPage;

  @override
  String toString() {
    return 'MetaModel(total: $total, limit: $limit, offset: $offset, hasMore: $hasMore, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, limit, offset, hasMore,
      currentPage, lastPage, perPage);

  /// Create a copy of MetaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaModelImplCopyWith<_$MetaModelImpl> get copyWith =>
      __$$MetaModelImplCopyWithImpl<_$MetaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaModelImplToJson(
      this,
    );
  }
}

abstract class _MetaModel implements MetaModel {
  const factory _MetaModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? total,
      @JsonKey(fromJson: jsonIntLenient) final int? limit,
      @JsonKey(fromJson: jsonIntLenient) final int? offset,
      @JsonKey(name: 'has_more', fromJson: jsonBoolLenient) final bool? hasMore,
      @JsonKey(name: 'current_page', fromJson: jsonIntLenient)
      final int? currentPage,
      @JsonKey(name: 'last_page', fromJson: jsonIntLenient) final int? lastPage,
      @JsonKey(name: 'per_page', fromJson: jsonIntLenient)
      final int? perPage}) = _$MetaModelImpl;

  factory _MetaModel.fromJson(Map<String, dynamic> json) =
      _$MetaModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get total;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get limit;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get offset;
  @override
  @JsonKey(name: 'has_more', fromJson: jsonBoolLenient)
  bool? get hasMore;
  @override
  @JsonKey(name: 'current_page', fromJson: jsonIntLenient)
  int? get currentPage;
  @override
  @JsonKey(name: 'last_page', fromJson: jsonIntLenient)
  int? get lastPage;
  @override
  @JsonKey(name: 'per_page', fromJson: jsonIntLenient)
  int? get perPage;

  /// Create a copy of MetaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaModelImplCopyWith<_$MetaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
