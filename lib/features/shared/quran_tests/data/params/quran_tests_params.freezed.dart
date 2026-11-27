// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_tests_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecordFinalAttemptParams _$RecordFinalAttemptParamsFromJson(
    Map<String, dynamic> json) {
  return _RecordFinalAttemptParams.fromJson(json);
}

/// @nodoc
mixin _$RecordFinalAttemptParams {
  @JsonKey(includeIfNull: true)
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'tested_on', includeIfNull: true)
  String? get testedOn => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id')
  int? get teacherId => throw _privateConstructorUsedError;

  /// Serializes this RecordFinalAttemptParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordFinalAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordFinalAttemptParamsCopyWith<RecordFinalAttemptParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordFinalAttemptParamsCopyWith<$Res> {
  factory $RecordFinalAttemptParamsCopyWith(RecordFinalAttemptParams value,
          $Res Function(RecordFinalAttemptParams) then) =
      _$RecordFinalAttemptParamsCopyWithImpl<$Res, RecordFinalAttemptParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) double? score,
      @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
      String? notes,
      @JsonKey(name: 'teacher_id') int? teacherId});
}

/// @nodoc
class _$RecordFinalAttemptParamsCopyWithImpl<$Res,
        $Val extends RecordFinalAttemptParams>
    implements $RecordFinalAttemptParamsCopyWith<$Res> {
  _$RecordFinalAttemptParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordFinalAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacherId = freezed,
  }) {
    return _then(_value.copyWith(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordFinalAttemptParamsImplCopyWith<$Res>
    implements $RecordFinalAttemptParamsCopyWith<$Res> {
  factory _$$RecordFinalAttemptParamsImplCopyWith(
          _$RecordFinalAttemptParamsImpl value,
          $Res Function(_$RecordFinalAttemptParamsImpl) then) =
      __$$RecordFinalAttemptParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) double? score,
      @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
      String? notes,
      @JsonKey(name: 'teacher_id') int? teacherId});
}

/// @nodoc
class __$$RecordFinalAttemptParamsImplCopyWithImpl<$Res>
    extends _$RecordFinalAttemptParamsCopyWithImpl<$Res,
        _$RecordFinalAttemptParamsImpl>
    implements _$$RecordFinalAttemptParamsImplCopyWith<$Res> {
  __$$RecordFinalAttemptParamsImplCopyWithImpl(
      _$RecordFinalAttemptParamsImpl _value,
      $Res Function(_$RecordFinalAttemptParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordFinalAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacherId = freezed,
  }) {
    return _then(_$RecordFinalAttemptParamsImpl(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RecordFinalAttemptParamsImpl implements _RecordFinalAttemptParams {
  const _$RecordFinalAttemptParamsImpl(
      {@JsonKey(includeIfNull: true) this.score,
      @JsonKey(name: 'tested_on', includeIfNull: true) this.testedOn,
      this.notes,
      @JsonKey(name: 'teacher_id') this.teacherId});

  factory _$RecordFinalAttemptParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordFinalAttemptParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final double? score;
  @override
  @JsonKey(name: 'tested_on', includeIfNull: true)
  final String? testedOn;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'teacher_id')
  final int? teacherId;

  @override
  String toString() {
    return 'RecordFinalAttemptParams(score: $score, testedOn: $testedOn, notes: $notes, teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordFinalAttemptParamsImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.testedOn, testedOn) ||
                other.testedOn == testedOn) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, score, testedOn, notes, teacherId);

  /// Create a copy of RecordFinalAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordFinalAttemptParamsImplCopyWith<_$RecordFinalAttemptParamsImpl>
      get copyWith => __$$RecordFinalAttemptParamsImplCopyWithImpl<
          _$RecordFinalAttemptParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordFinalAttemptParamsImplToJson(
      this,
    );
  }
}

abstract class _RecordFinalAttemptParams implements RecordFinalAttemptParams {
  const factory _RecordFinalAttemptParams(
      {@JsonKey(includeIfNull: true) final double? score,
      @JsonKey(name: 'tested_on', includeIfNull: true) final String? testedOn,
      final String? notes,
      @JsonKey(name: 'teacher_id')
      final int? teacherId}) = _$RecordFinalAttemptParamsImpl;

  factory _RecordFinalAttemptParams.fromJson(Map<String, dynamic> json) =
      _$RecordFinalAttemptParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  double? get score;
  @override
  @JsonKey(name: 'tested_on', includeIfNull: true)
  String? get testedOn;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'teacher_id')
  int? get teacherId;

  /// Create a copy of RecordFinalAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordFinalAttemptParamsImplCopyWith<_$RecordFinalAttemptParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecordPartialAttemptParams _$RecordPartialAttemptParamsFromJson(
    Map<String, dynamic> json) {
  return _RecordPartialAttemptParams.fromJson(json);
}

/// @nodoc
mixin _$RecordPartialAttemptParams {
  @JsonKey(name: 'mistake_count', includeIfNull: true)
  int? get mistakeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'tested_on', includeIfNull: true)
  String? get testedOn => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id')
  int? get teacherId => throw _privateConstructorUsedError;

  /// Serializes this RecordPartialAttemptParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordPartialAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordPartialAttemptParamsCopyWith<RecordPartialAttemptParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordPartialAttemptParamsCopyWith<$Res> {
  factory $RecordPartialAttemptParamsCopyWith(RecordPartialAttemptParams value,
          $Res Function(RecordPartialAttemptParams) then) =
      _$RecordPartialAttemptParamsCopyWithImpl<$Res,
          RecordPartialAttemptParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mistake_count', includeIfNull: true) int? mistakeCount,
      @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
      String? notes,
      @JsonKey(name: 'teacher_id') int? teacherId});
}

/// @nodoc
class _$RecordPartialAttemptParamsCopyWithImpl<$Res,
        $Val extends RecordPartialAttemptParams>
    implements $RecordPartialAttemptParamsCopyWith<$Res> {
  _$RecordPartialAttemptParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordPartialAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mistakeCount = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacherId = freezed,
  }) {
    return _then(_value.copyWith(
      mistakeCount: freezed == mistakeCount
          ? _value.mistakeCount
          : mistakeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordPartialAttemptParamsImplCopyWith<$Res>
    implements $RecordPartialAttemptParamsCopyWith<$Res> {
  factory _$$RecordPartialAttemptParamsImplCopyWith(
          _$RecordPartialAttemptParamsImpl value,
          $Res Function(_$RecordPartialAttemptParamsImpl) then) =
      __$$RecordPartialAttemptParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mistake_count', includeIfNull: true) int? mistakeCount,
      @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
      String? notes,
      @JsonKey(name: 'teacher_id') int? teacherId});
}

/// @nodoc
class __$$RecordPartialAttemptParamsImplCopyWithImpl<$Res>
    extends _$RecordPartialAttemptParamsCopyWithImpl<$Res,
        _$RecordPartialAttemptParamsImpl>
    implements _$$RecordPartialAttemptParamsImplCopyWith<$Res> {
  __$$RecordPartialAttemptParamsImplCopyWithImpl(
      _$RecordPartialAttemptParamsImpl _value,
      $Res Function(_$RecordPartialAttemptParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordPartialAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mistakeCount = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacherId = freezed,
  }) {
    return _then(_$RecordPartialAttemptParamsImpl(
      mistakeCount: freezed == mistakeCount
          ? _value.mistakeCount
          : mistakeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RecordPartialAttemptParamsImpl implements _RecordPartialAttemptParams {
  const _$RecordPartialAttemptParamsImpl(
      {@JsonKey(name: 'mistake_count', includeIfNull: true) this.mistakeCount,
      @JsonKey(name: 'tested_on', includeIfNull: true) this.testedOn,
      this.notes,
      @JsonKey(name: 'teacher_id') this.teacherId});

  factory _$RecordPartialAttemptParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RecordPartialAttemptParamsImplFromJson(json);

  @override
  @JsonKey(name: 'mistake_count', includeIfNull: true)
  final int? mistakeCount;
  @override
  @JsonKey(name: 'tested_on', includeIfNull: true)
  final String? testedOn;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'teacher_id')
  final int? teacherId;

  @override
  String toString() {
    return 'RecordPartialAttemptParams(mistakeCount: $mistakeCount, testedOn: $testedOn, notes: $notes, teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordPartialAttemptParamsImpl &&
            (identical(other.mistakeCount, mistakeCount) ||
                other.mistakeCount == mistakeCount) &&
            (identical(other.testedOn, testedOn) ||
                other.testedOn == testedOn) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mistakeCount, testedOn, notes, teacherId);

  /// Create a copy of RecordPartialAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordPartialAttemptParamsImplCopyWith<_$RecordPartialAttemptParamsImpl>
      get copyWith => __$$RecordPartialAttemptParamsImplCopyWithImpl<
          _$RecordPartialAttemptParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordPartialAttemptParamsImplToJson(
      this,
    );
  }
}

abstract class _RecordPartialAttemptParams
    implements RecordPartialAttemptParams {
  const factory _RecordPartialAttemptParams(
      {@JsonKey(name: 'mistake_count', includeIfNull: true)
      final int? mistakeCount,
      @JsonKey(name: 'tested_on', includeIfNull: true) final String? testedOn,
      final String? notes,
      @JsonKey(name: 'teacher_id')
      final int? teacherId}) = _$RecordPartialAttemptParamsImpl;

  factory _RecordPartialAttemptParams.fromJson(Map<String, dynamic> json) =
      _$RecordPartialAttemptParamsImpl.fromJson;

  @override
  @JsonKey(name: 'mistake_count', includeIfNull: true)
  int? get mistakeCount;
  @override
  @JsonKey(name: 'tested_on', includeIfNull: true)
  String? get testedOn;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'teacher_id')
  int? get teacherId;

  /// Create a copy of RecordPartialAttemptParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordPartialAttemptParamsImplCopyWith<_$RecordPartialAttemptParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StartFinalParams _$StartFinalParamsFromJson(Map<String, dynamic> json) {
  return _StartFinalParams.fromJson(json);
}

/// @nodoc
mixin _$StartFinalParams {
  @JsonKey(name: 'juz_id', includeIfNull: true)
  int? get juzId => throw _privateConstructorUsedError;

  /// Serializes this StartFinalParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartFinalParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartFinalParamsCopyWith<StartFinalParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartFinalParamsCopyWith<$Res> {
  factory $StartFinalParamsCopyWith(
          StartFinalParams value, $Res Function(StartFinalParams) then) =
      _$StartFinalParamsCopyWithImpl<$Res, StartFinalParams>;
  @useResult
  $Res call({@JsonKey(name: 'juz_id', includeIfNull: true) int? juzId});
}

/// @nodoc
class _$StartFinalParamsCopyWithImpl<$Res, $Val extends StartFinalParams>
    implements $StartFinalParamsCopyWith<$Res> {
  _$StartFinalParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartFinalParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? juzId = freezed,
  }) {
    return _then(_value.copyWith(
      juzId: freezed == juzId
          ? _value.juzId
          : juzId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartFinalParamsImplCopyWith<$Res>
    implements $StartFinalParamsCopyWith<$Res> {
  factory _$$StartFinalParamsImplCopyWith(_$StartFinalParamsImpl value,
          $Res Function(_$StartFinalParamsImpl) then) =
      __$$StartFinalParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'juz_id', includeIfNull: true) int? juzId});
}

/// @nodoc
class __$$StartFinalParamsImplCopyWithImpl<$Res>
    extends _$StartFinalParamsCopyWithImpl<$Res, _$StartFinalParamsImpl>
    implements _$$StartFinalParamsImplCopyWith<$Res> {
  __$$StartFinalParamsImplCopyWithImpl(_$StartFinalParamsImpl _value,
      $Res Function(_$StartFinalParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartFinalParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? juzId = freezed,
  }) {
    return _then(_$StartFinalParamsImpl(
      juzId: freezed == juzId
          ? _value.juzId
          : juzId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$StartFinalParamsImpl implements _StartFinalParams {
  const _$StartFinalParamsImpl(
      {@JsonKey(name: 'juz_id', includeIfNull: true) this.juzId});

  factory _$StartFinalParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartFinalParamsImplFromJson(json);

  @override
  @JsonKey(name: 'juz_id', includeIfNull: true)
  final int? juzId;

  @override
  String toString() {
    return 'StartFinalParams(juzId: $juzId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartFinalParamsImpl &&
            (identical(other.juzId, juzId) || other.juzId == juzId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, juzId);

  /// Create a copy of StartFinalParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartFinalParamsImplCopyWith<_$StartFinalParamsImpl> get copyWith =>
      __$$StartFinalParamsImplCopyWithImpl<_$StartFinalParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartFinalParamsImplToJson(
      this,
    );
  }
}

abstract class _StartFinalParams implements StartFinalParams {
  const factory _StartFinalParams(
          {@JsonKey(name: 'juz_id', includeIfNull: true) final int? juzId}) =
      _$StartFinalParamsImpl;

  factory _StartFinalParams.fromJson(Map<String, dynamic> json) =
      _$StartFinalParamsImpl.fromJson;

  @override
  @JsonKey(name: 'juz_id', includeIfNull: true)
  int? get juzId;

  /// Create a copy of StartFinalParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartFinalParamsImplCopyWith<_$StartFinalParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StartPartialParams _$StartPartialParamsFromJson(Map<String, dynamic> json) {
  return _StartPartialParams.fromJson(json);
}

/// @nodoc
mixin _$StartPartialParams {
  @JsonKey(name: 'juz_id', includeIfNull: true)
  int? get juzId => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
  bool? get allowParallelCycle => throw _privateConstructorUsedError;

  /// Serializes this StartPartialParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartPartialParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartPartialParamsCopyWith<StartPartialParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartPartialParamsCopyWith<$Res> {
  factory $StartPartialParamsCopyWith(
          StartPartialParams value, $Res Function(StartPartialParams) then) =
      _$StartPartialParamsCopyWithImpl<$Res, StartPartialParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'juz_id', includeIfNull: true) int? juzId,
      @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
      bool? allowParallelCycle});
}

/// @nodoc
class _$StartPartialParamsCopyWithImpl<$Res, $Val extends StartPartialParams>
    implements $StartPartialParamsCopyWith<$Res> {
  _$StartPartialParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartPartialParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? juzId = freezed,
    Object? allowParallelCycle = freezed,
  }) {
    return _then(_value.copyWith(
      juzId: freezed == juzId
          ? _value.juzId
          : juzId // ignore: cast_nullable_to_non_nullable
              as int?,
      allowParallelCycle: freezed == allowParallelCycle
          ? _value.allowParallelCycle
          : allowParallelCycle // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartPartialParamsImplCopyWith<$Res>
    implements $StartPartialParamsCopyWith<$Res> {
  factory _$$StartPartialParamsImplCopyWith(_$StartPartialParamsImpl value,
          $Res Function(_$StartPartialParamsImpl) then) =
      __$$StartPartialParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'juz_id', includeIfNull: true) int? juzId,
      @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
      bool? allowParallelCycle});
}

/// @nodoc
class __$$StartPartialParamsImplCopyWithImpl<$Res>
    extends _$StartPartialParamsCopyWithImpl<$Res, _$StartPartialParamsImpl>
    implements _$$StartPartialParamsImplCopyWith<$Res> {
  __$$StartPartialParamsImplCopyWithImpl(_$StartPartialParamsImpl _value,
      $Res Function(_$StartPartialParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartPartialParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? juzId = freezed,
    Object? allowParallelCycle = freezed,
  }) {
    return _then(_$StartPartialParamsImpl(
      juzId: freezed == juzId
          ? _value.juzId
          : juzId // ignore: cast_nullable_to_non_nullable
              as int?,
      allowParallelCycle: freezed == allowParallelCycle
          ? _value.allowParallelCycle
          : allowParallelCycle // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$StartPartialParamsImpl implements _StartPartialParams {
  const _$StartPartialParamsImpl(
      {@JsonKey(name: 'juz_id', includeIfNull: true) this.juzId,
      @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
      this.allowParallelCycle});

  factory _$StartPartialParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartPartialParamsImplFromJson(json);

  @override
  @JsonKey(name: 'juz_id', includeIfNull: true)
  final int? juzId;
  @override
  @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
  final bool? allowParallelCycle;

  @override
  String toString() {
    return 'StartPartialParams(juzId: $juzId, allowParallelCycle: $allowParallelCycle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartPartialParamsImpl &&
            (identical(other.juzId, juzId) || other.juzId == juzId) &&
            (identical(other.allowParallelCycle, allowParallelCycle) ||
                other.allowParallelCycle == allowParallelCycle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, juzId, allowParallelCycle);

  /// Create a copy of StartPartialParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartPartialParamsImplCopyWith<_$StartPartialParamsImpl> get copyWith =>
      __$$StartPartialParamsImplCopyWithImpl<_$StartPartialParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartPartialParamsImplToJson(
      this,
    );
  }
}

abstract class _StartPartialParams implements StartPartialParams {
  const factory _StartPartialParams(
      {@JsonKey(name: 'juz_id', includeIfNull: true) final int? juzId,
      @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
      final bool? allowParallelCycle}) = _$StartPartialParamsImpl;

  factory _StartPartialParams.fromJson(Map<String, dynamic> json) =
      _$StartPartialParamsImpl.fromJson;

  @override
  @JsonKey(name: 'juz_id', includeIfNull: true)
  int? get juzId;
  @override
  @JsonKey(name: 'allow_parallel_cycle', includeIfNull: true)
  bool? get allowParallelCycle;

  /// Create a copy of StartPartialParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartPartialParamsImplCopyWith<_$StartPartialParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
