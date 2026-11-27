// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RespondToActivityParams _$RespondToActivityParamsFromJson(
    Map<String, dynamic> json) {
  return _RespondToActivityParams.fromJson(json);
}

/// @nodoc
mixin _$RespondToActivityParams {
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get response => throw _privateConstructorUsedError;

  /// Serializes this RespondToActivityParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RespondToActivityParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RespondToActivityParamsCopyWith<RespondToActivityParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RespondToActivityParamsCopyWith<$Res> {
  factory $RespondToActivityParamsCopyWith(RespondToActivityParams value,
          $Res Function(RespondToActivityParams) then) =
      _$RespondToActivityParamsCopyWithImpl<$Res, RespondToActivityParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(includeIfNull: true) String? response});
}

/// @nodoc
class _$RespondToActivityParamsCopyWithImpl<$Res,
        $Val extends RespondToActivityParams>
    implements $RespondToActivityParamsCopyWith<$Res> {
  _$RespondToActivityParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RespondToActivityParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RespondToActivityParamsImplCopyWith<$Res>
    implements $RespondToActivityParamsCopyWith<$Res> {
  factory _$$RespondToActivityParamsImplCopyWith(
          _$RespondToActivityParamsImpl value,
          $Res Function(_$RespondToActivityParamsImpl) then) =
      __$$RespondToActivityParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(includeIfNull: true) String? response});
}

/// @nodoc
class __$$RespondToActivityParamsImplCopyWithImpl<$Res>
    extends _$RespondToActivityParamsCopyWithImpl<$Res,
        _$RespondToActivityParamsImpl>
    implements _$$RespondToActivityParamsImplCopyWith<$Res> {
  __$$RespondToActivityParamsImplCopyWithImpl(
      _$RespondToActivityParamsImpl _value,
      $Res Function(_$RespondToActivityParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RespondToActivityParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? response = freezed,
  }) {
    return _then(_$RespondToActivityParamsImpl(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RespondToActivityParamsImpl implements _RespondToActivityParams {
  const _$RespondToActivityParamsImpl(
      {@JsonKey(name: 'student_id', includeIfNull: true) this.studentId,
      @JsonKey(includeIfNull: true) this.response});

  factory _$RespondToActivityParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RespondToActivityParamsImplFromJson(json);

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  final int? studentId;
  @override
  @JsonKey(includeIfNull: true)
  final String? response;

  @override
  String toString() {
    return 'RespondToActivityParams(studentId: $studentId, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RespondToActivityParamsImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, studentId, response);

  /// Create a copy of RespondToActivityParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RespondToActivityParamsImplCopyWith<_$RespondToActivityParamsImpl>
      get copyWith => __$$RespondToActivityParamsImplCopyWithImpl<
          _$RespondToActivityParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RespondToActivityParamsImplToJson(
      this,
    );
  }
}

abstract class _RespondToActivityParams implements RespondToActivityParams {
  const factory _RespondToActivityParams(
      {@JsonKey(name: 'student_id', includeIfNull: true) final int? studentId,
      @JsonKey(includeIfNull: true)
      final String? response}) = _$RespondToActivityParamsImpl;

  factory _RespondToActivityParams.fromJson(Map<String, dynamic> json) =
      _$RespondToActivityParamsImpl.fromJson;

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId;
  @override
  @JsonKey(includeIfNull: true)
  String? get response;

  /// Create a copy of RespondToActivityParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RespondToActivityParamsImplCopyWith<_$RespondToActivityParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
