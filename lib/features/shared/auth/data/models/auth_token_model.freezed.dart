// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthTokenModel _$AuthTokenModelFromJson(Map<String, dynamic> json) {
  return _AuthTokenModel.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenModel {
  @JsonKey(fromJson: jsonStringLenient)
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type', fromJson: jsonStringLenient)
  String? get tokenType => throw _privateConstructorUsedError;
  AuthUserModel? get user => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get abilities => throw _privateConstructorUsedError;

  /// Serializes this AuthTokenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokenModelCopyWith<AuthTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenModelCopyWith<$Res> {
  factory $AuthTokenModelCopyWith(
          AuthTokenModel value, $Res Function(AuthTokenModel) then) =
      _$AuthTokenModelCopyWithImpl<$Res, AuthTokenModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonStringLenient) String? token,
      @JsonKey(name: 'token_type', fromJson: jsonStringLenient)
      String? tokenType,
      AuthUserModel? user,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? abilities});

  $AuthUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthTokenModelCopyWithImpl<$Res, $Val extends AuthTokenModel>
    implements $AuthTokenModelCopyWith<$Res> {
  _$AuthTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? user = freezed,
    Object? abilities = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUserModel?,
      abilities: freezed == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  /// Create a copy of AuthTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthUserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AuthUserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthTokenModelImplCopyWith<$Res>
    implements $AuthTokenModelCopyWith<$Res> {
  factory _$$AuthTokenModelImplCopyWith(_$AuthTokenModelImpl value,
          $Res Function(_$AuthTokenModelImpl) then) =
      __$$AuthTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonStringLenient) String? token,
      @JsonKey(name: 'token_type', fromJson: jsonStringLenient)
      String? tokenType,
      AuthUserModel? user,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? abilities});

  @override
  $AuthUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthTokenModelImplCopyWithImpl<$Res>
    extends _$AuthTokenModelCopyWithImpl<$Res, _$AuthTokenModelImpl>
    implements _$$AuthTokenModelImplCopyWith<$Res> {
  __$$AuthTokenModelImplCopyWithImpl(
      _$AuthTokenModelImpl _value, $Res Function(_$AuthTokenModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? user = freezed,
    Object? abilities = freezed,
  }) {
    return _then(_$AuthTokenModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUserModel?,
      abilities: freezed == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokenModelImpl implements _AuthTokenModel {
  const _$AuthTokenModelImpl(
      {@JsonKey(fromJson: jsonStringLenient) this.token,
      @JsonKey(name: 'token_type', fromJson: jsonStringLenient) this.tokenType,
      this.user,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? abilities})
      : _abilities = abilities;

  factory _$AuthTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokenModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? token;
  @override
  @JsonKey(name: 'token_type', fromJson: jsonStringLenient)
  final String? tokenType;
  @override
  final AuthUserModel? user;
  final List<String>? _abilities;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get abilities {
    final value = _abilities;
    if (value == null) return null;
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AuthTokenModel(token: $token, tokenType: $tokenType, user: $user, abilities: $abilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, tokenType, user,
      const DeepCollectionEquality().hash(_abilities));

  /// Create a copy of AuthTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenModelImplCopyWith<_$AuthTokenModelImpl> get copyWith =>
      __$$AuthTokenModelImplCopyWithImpl<_$AuthTokenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokenModelImplToJson(
      this,
    );
  }
}

abstract class _AuthTokenModel implements AuthTokenModel {
  const factory _AuthTokenModel(
      {@JsonKey(fromJson: jsonStringLenient) final String? token,
      @JsonKey(name: 'token_type', fromJson: jsonStringLenient)
      final String? tokenType,
      final AuthUserModel? user,
      @JsonKey(fromJson: jsonStringListLenient)
      final List<String>? abilities}) = _$AuthTokenModelImpl;

  factory _AuthTokenModel.fromJson(Map<String, dynamic> json) =
      _$AuthTokenModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get token;
  @override
  @JsonKey(name: 'token_type', fromJson: jsonStringLenient)
  String? get tokenType;
  @override
  AuthUserModel? get user;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get abilities;

  /// Create a copy of AuthTokenModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokenModelImplCopyWith<_$AuthTokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) {
  return _AuthUserModel.fromJson(json);
}

/// @nodoc
mixin _$AuthUserModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get roles => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  int? get teacherId => throw _privateConstructorUsedError;

  /// Serializes this AuthUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthUserModelCopyWith<AuthUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserModelCopyWith<$Res> {
  factory $AuthUserModelCopyWith(
          AuthUserModel value, $Res Function(AuthUserModel) then) =
      _$AuthUserModelCopyWithImpl<$Res, AuthUserModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringLenient) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? username,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId});
}

/// @nodoc
class _$AuthUserModelCopyWithImpl<$Res, $Val extends AuthUserModel>
    implements $AuthUserModelCopyWith<$Res> {
  _$AuthUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? roles = freezed,
    Object? permissions = freezed,
    Object? teacherId = freezed,
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
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserModelImplCopyWith<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  factory _$$AuthUserModelImplCopyWith(
          _$AuthUserModelImpl value, $Res Function(_$AuthUserModelImpl) then) =
      __$$AuthUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringLenient) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? username,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId});
}

/// @nodoc
class __$$AuthUserModelImplCopyWithImpl<$Res>
    extends _$AuthUserModelCopyWithImpl<$Res, _$AuthUserModelImpl>
    implements _$$AuthUserModelImplCopyWith<$Res> {
  __$$AuthUserModelImplCopyWithImpl(
      _$AuthUserModelImpl _value, $Res Function(_$AuthUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? roles = freezed,
    Object? permissions = freezed,
    Object? teacherId = freezed,
  }) {
    return _then(_$AuthUserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthUserModelImpl implements _AuthUserModel {
  const _$AuthUserModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringLenient) this.name,
      @JsonKey(fromJson: jsonStringLenient) this.username,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? permissions,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) this.teacherId})
      : _roles = roles,
        _permissions = permissions;

  factory _$AuthUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthUserModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? username;
  final List<String>? _roles;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _permissions;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get permissions {
    final value = _permissions;
    if (value == null) return null;
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  final int? teacherId;

  @override
  String toString() {
    return 'AuthUserModel(id: $id, name: $name, username: $username, roles: $roles, permissions: $permissions, teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      username,
      const DeepCollectionEquality().hash(_roles),
      const DeepCollectionEquality().hash(_permissions),
      teacherId);

  /// Create a copy of AuthUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserModelImplCopyWith<_$AuthUserModelImpl> get copyWith =>
      __$$AuthUserModelImplCopyWithImpl<_$AuthUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthUserModelImplToJson(
      this,
    );
  }
}

abstract class _AuthUserModel implements AuthUserModel {
  const factory _AuthUserModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringLenient) final String? name,
      @JsonKey(fromJson: jsonStringLenient) final String? username,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? permissions,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
      final int? teacherId}) = _$AuthUserModelImpl;

  factory _AuthUserModel.fromJson(Map<String, dynamic> json) =
      _$AuthUserModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get username;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get roles;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get permissions;
  @override
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  int? get teacherId;

  /// Create a copy of AuthUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthUserModelImplCopyWith<_$AuthUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
