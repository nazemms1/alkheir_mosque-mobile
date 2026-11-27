// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateUsernameParams _$UpdateUsernameParamsFromJson(Map<String, dynamic> json) {
  return _UpdateUsernameParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateUsernameParams {
  String? get username => throw _privateConstructorUsedError;

  /// Serializes this UpdateUsernameParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUsernameParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUsernameParamsCopyWith<UpdateUsernameParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUsernameParamsCopyWith<$Res> {
  factory $UpdateUsernameParamsCopyWith(UpdateUsernameParams value,
          $Res Function(UpdateUsernameParams) then) =
      _$UpdateUsernameParamsCopyWithImpl<$Res, UpdateUsernameParams>;
  @useResult
  $Res call({String? username});
}

/// @nodoc
class _$UpdateUsernameParamsCopyWithImpl<$Res,
        $Val extends UpdateUsernameParams>
    implements $UpdateUsernameParamsCopyWith<$Res> {
  _$UpdateUsernameParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUsernameParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUsernameParamsImplCopyWith<$Res>
    implements $UpdateUsernameParamsCopyWith<$Res> {
  factory _$$UpdateUsernameParamsImplCopyWith(_$UpdateUsernameParamsImpl value,
          $Res Function(_$UpdateUsernameParamsImpl) then) =
      __$$UpdateUsernameParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? username});
}

/// @nodoc
class __$$UpdateUsernameParamsImplCopyWithImpl<$Res>
    extends _$UpdateUsernameParamsCopyWithImpl<$Res, _$UpdateUsernameParamsImpl>
    implements _$$UpdateUsernameParamsImplCopyWith<$Res> {
  __$$UpdateUsernameParamsImplCopyWithImpl(_$UpdateUsernameParamsImpl _value,
      $Res Function(_$UpdateUsernameParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUsernameParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
  }) {
    return _then(_$UpdateUsernameParamsImpl(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUsernameParamsImpl implements _UpdateUsernameParams {
  const _$UpdateUsernameParamsImpl({this.username});

  factory _$UpdateUsernameParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUsernameParamsImplFromJson(json);

  @override
  final String? username;

  @override
  String toString() {
    return 'UpdateUsernameParams(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUsernameParamsImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of UpdateUsernameParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUsernameParamsImplCopyWith<_$UpdateUsernameParamsImpl>
      get copyWith =>
          __$$UpdateUsernameParamsImplCopyWithImpl<_$UpdateUsernameParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUsernameParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateUsernameParams implements UpdateUsernameParams {
  const factory _UpdateUsernameParams({final String? username}) =
      _$UpdateUsernameParamsImpl;

  factory _UpdateUsernameParams.fromJson(Map<String, dynamic> json) =
      _$UpdateUsernameParamsImpl.fromJson;

  @override
  String? get username;

  /// Create a copy of UpdateUsernameParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUsernameParamsImplCopyWith<_$UpdateUsernameParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChangePasswordParams _$ChangePasswordParamsFromJson(Map<String, dynamic> json) {
  return _ChangePasswordParams.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordParams {
  @JsonKey(name: 'current_password')
  String? get currentPassword => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_confirmation')
  String? get passwordConfirmation => throw _privateConstructorUsedError;

  /// Serializes this ChangePasswordParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordParamsCopyWith<ChangePasswordParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordParamsCopyWith<$Res> {
  factory $ChangePasswordParamsCopyWith(ChangePasswordParams value,
          $Res Function(ChangePasswordParams) then) =
      _$ChangePasswordParamsCopyWithImpl<$Res, ChangePasswordParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_password') String? currentPassword,
      String? password,
      @JsonKey(name: 'password_confirmation') String? passwordConfirmation});
}

/// @nodoc
class _$ChangePasswordParamsCopyWithImpl<$Res,
        $Val extends ChangePasswordParams>
    implements $ChangePasswordParamsCopyWith<$Res> {
  _$ChangePasswordParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_value.copyWith(
      currentPassword: freezed == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordParamsImplCopyWith<$Res>
    implements $ChangePasswordParamsCopyWith<$Res> {
  factory _$$ChangePasswordParamsImplCopyWith(_$ChangePasswordParamsImpl value,
          $Res Function(_$ChangePasswordParamsImpl) then) =
      __$$ChangePasswordParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_password') String? currentPassword,
      String? password,
      @JsonKey(name: 'password_confirmation') String? passwordConfirmation});
}

/// @nodoc
class __$$ChangePasswordParamsImplCopyWithImpl<$Res>
    extends _$ChangePasswordParamsCopyWithImpl<$Res, _$ChangePasswordParamsImpl>
    implements _$$ChangePasswordParamsImplCopyWith<$Res> {
  __$$ChangePasswordParamsImplCopyWithImpl(_$ChangePasswordParamsImpl _value,
      $Res Function(_$ChangePasswordParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePasswordParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_$ChangePasswordParamsImpl(
      currentPassword: freezed == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordParamsImpl implements _ChangePasswordParams {
  const _$ChangePasswordParamsImpl(
      {@JsonKey(name: 'current_password') this.currentPassword,
      this.password,
      @JsonKey(name: 'password_confirmation') this.passwordConfirmation});

  factory _$ChangePasswordParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordParamsImplFromJson(json);

  @override
  @JsonKey(name: 'current_password')
  final String? currentPassword;
  @override
  final String? password;
  @override
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  @override
  String toString() {
    return 'ChangePasswordParams(currentPassword: $currentPassword, password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordParamsImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPassword, password, passwordConfirmation);

  /// Create a copy of ChangePasswordParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordParamsImplCopyWith<_$ChangePasswordParamsImpl>
      get copyWith =>
          __$$ChangePasswordParamsImplCopyWithImpl<_$ChangePasswordParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordParamsImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordParams implements ChangePasswordParams {
  const factory _ChangePasswordParams(
      {@JsonKey(name: 'current_password') final String? currentPassword,
      final String? password,
      @JsonKey(name: 'password_confirmation')
      final String? passwordConfirmation}) = _$ChangePasswordParamsImpl;

  factory _ChangePasswordParams.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordParamsImpl.fromJson;

  @override
  @JsonKey(name: 'current_password')
  String? get currentPassword;
  @override
  String? get password;
  @override
  @JsonKey(name: 'password_confirmation')
  String? get passwordConfirmation;

  /// Create a copy of ChangePasswordParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordParamsImplCopyWith<_$ChangePasswordParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
