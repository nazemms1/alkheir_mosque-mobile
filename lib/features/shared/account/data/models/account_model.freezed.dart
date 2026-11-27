// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MobileUserModel _$MobileUserModelFromJson(Map<String, dynamic> json) {
  return _MobileUserModel.fromJson(json);
}

/// @nodoc
mixin _$MobileUserModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
  String? get primaryRole => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get roles => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
  bool? get usernameIsEditable => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id', fromJson: jsonIntLenient)
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  int? get teacherId => throw _privateConstructorUsedError;

  /// Serializes this MobileUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MobileUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MobileUserModelCopyWith<MobileUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileUserModelCopyWith<$Res> {
  factory $MobileUserModelCopyWith(
          MobileUserModel value, $Res Function(MobileUserModel) then) =
      _$MobileUserModelCopyWithImpl<$Res, MobileUserModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringLenient) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? username,
      @JsonKey(fromJson: jsonStringLenient) String? email,
      @JsonKey(fromJson: jsonStringLenient) String? phone,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
      String? primaryRole,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
      @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
      String? profilePhotoUrl,
      @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
      bool? usernameIsEditable,
      @JsonKey(name: 'parent_id', fromJson: jsonIntLenient) int? parentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient) int? studentId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId});
}

/// @nodoc
class _$MobileUserModelCopyWithImpl<$Res, $Val extends MobileUserModel>
    implements $MobileUserModelCopyWith<$Res> {
  _$MobileUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MobileUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? primaryRole = freezed,
    Object? roles = freezed,
    Object? permissions = freezed,
    Object? profilePhotoUrl = freezed,
    Object? usernameIsEditable = freezed,
    Object? parentId = freezed,
    Object? studentId = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryRole: freezed == primaryRole
          ? _value.primaryRole
          : primaryRole // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      usernameIsEditable: freezed == usernameIsEditable
          ? _value.usernameIsEditable
          : usernameIsEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MobileUserModelImplCopyWith<$Res>
    implements $MobileUserModelCopyWith<$Res> {
  factory _$$MobileUserModelImplCopyWith(_$MobileUserModelImpl value,
          $Res Function(_$MobileUserModelImpl) then) =
      __$$MobileUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringLenient) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? username,
      @JsonKey(fromJson: jsonStringLenient) String? email,
      @JsonKey(fromJson: jsonStringLenient) String? phone,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
      String? primaryRole,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
      @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
      String? profilePhotoUrl,
      @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
      bool? usernameIsEditable,
      @JsonKey(name: 'parent_id', fromJson: jsonIntLenient) int? parentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient) int? studentId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId});
}

/// @nodoc
class __$$MobileUserModelImplCopyWithImpl<$Res>
    extends _$MobileUserModelCopyWithImpl<$Res, _$MobileUserModelImpl>
    implements _$$MobileUserModelImplCopyWith<$Res> {
  __$$MobileUserModelImplCopyWithImpl(
      _$MobileUserModelImpl _value, $Res Function(_$MobileUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MobileUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? isActive = freezed,
    Object? primaryRole = freezed,
    Object? roles = freezed,
    Object? permissions = freezed,
    Object? profilePhotoUrl = freezed,
    Object? usernameIsEditable = freezed,
    Object? parentId = freezed,
    Object? studentId = freezed,
    Object? teacherId = freezed,
  }) {
    return _then(_$MobileUserModelImpl(
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryRole: freezed == primaryRole
          ? _value.primaryRole
          : primaryRole // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      usernameIsEditable: freezed == usernameIsEditable
          ? _value.usernameIsEditable
          : usernameIsEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MobileUserModelImpl implements _MobileUserModel {
  const _$MobileUserModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringLenient) this.name,
      @JsonKey(fromJson: jsonStringLenient) this.username,
      @JsonKey(fromJson: jsonStringLenient) this.email,
      @JsonKey(fromJson: jsonStringLenient) this.phone,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
      this.primaryRole,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? permissions,
      @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
      this.profilePhotoUrl,
      @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
      this.usernameIsEditable,
      @JsonKey(name: 'parent_id', fromJson: jsonIntLenient) this.parentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient) this.studentId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) this.teacherId})
      : _roles = roles,
        _permissions = permissions;

  factory _$MobileUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobileUserModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? username;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? email;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? phone;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
  final String? primaryRole;
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
  @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
  final String? profilePhotoUrl;
  @override
  @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
  final bool? usernameIsEditable;
  @override
  @JsonKey(name: 'parent_id', fromJson: jsonIntLenient)
  final int? parentId;
  @override
  @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
  final int? studentId;
  @override
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  final int? teacherId;

  @override
  String toString() {
    return 'MobileUserModel(id: $id, name: $name, username: $username, email: $email, phone: $phone, isActive: $isActive, primaryRole: $primaryRole, roles: $roles, permissions: $permissions, profilePhotoUrl: $profilePhotoUrl, usernameIsEditable: $usernameIsEditable, parentId: $parentId, studentId: $studentId, teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.primaryRole, primaryRole) ||
                other.primaryRole == primaryRole) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.usernameIsEditable, usernameIsEditable) ||
                other.usernameIsEditable == usernameIsEditable) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
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
      email,
      phone,
      isActive,
      primaryRole,
      const DeepCollectionEquality().hash(_roles),
      const DeepCollectionEquality().hash(_permissions),
      profilePhotoUrl,
      usernameIsEditable,
      parentId,
      studentId,
      teacherId);

  /// Create a copy of MobileUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobileUserModelImplCopyWith<_$MobileUserModelImpl> get copyWith =>
      __$$MobileUserModelImplCopyWithImpl<_$MobileUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MobileUserModelImplToJson(
      this,
    );
  }
}

abstract class _MobileUserModel implements MobileUserModel {
  const factory _MobileUserModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringLenient) final String? name,
      @JsonKey(fromJson: jsonStringLenient) final String? username,
      @JsonKey(fromJson: jsonStringLenient) final String? email,
      @JsonKey(fromJson: jsonStringLenient) final String? phone,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive,
      @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
      final String? primaryRole,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? roles,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? permissions,
      @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
      final String? profilePhotoUrl,
      @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
      final bool? usernameIsEditable,
      @JsonKey(name: 'parent_id', fromJson: jsonIntLenient) final int? parentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
      final int? studentId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
      final int? teacherId}) = _$MobileUserModelImpl;

  factory _MobileUserModel.fromJson(Map<String, dynamic> json) =
      _$MobileUserModelImpl.fromJson;

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
  @JsonKey(fromJson: jsonStringLenient)
  String? get email;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get phone;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
  String? get primaryRole;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get roles;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get permissions;
  @override
  @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
  String? get profilePhotoUrl;
  @override
  @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
  bool? get usernameIsEditable;
  @override
  @JsonKey(name: 'parent_id', fromJson: jsonIntLenient)
  int? get parentId;
  @override
  @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
  int? get studentId;
  @override
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  int? get teacherId;

  /// Create a copy of MobileUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobileUserModelImplCopyWith<_$MobileUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BootstrapModel _$BootstrapModelFromJson(Map<String, dynamic> json) {
  return _BootstrapModel.fromJson(json);
}

/// @nodoc
mixin _$BootstrapModel {
  MobileUserModel? get user => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get permissions => throw _privateConstructorUsedError;
  OrganizationModel? get organization => throw _privateConstructorUsedError;
  FeaturesModel? get features => throw _privateConstructorUsedError;
  LocalizationModel? get localization => throw _privateConstructorUsedError;

  /// Serializes this BootstrapModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BootstrapModelCopyWith<BootstrapModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BootstrapModelCopyWith<$Res> {
  factory $BootstrapModelCopyWith(
          BootstrapModel value, $Res Function(BootstrapModel) then) =
      _$BootstrapModelCopyWithImpl<$Res, BootstrapModel>;
  @useResult
  $Res call(
      {MobileUserModel? user,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
      OrganizationModel? organization,
      FeaturesModel? features,
      LocalizationModel? localization});

  $MobileUserModelCopyWith<$Res>? get user;
  $OrganizationModelCopyWith<$Res>? get organization;
  $FeaturesModelCopyWith<$Res>? get features;
  $LocalizationModelCopyWith<$Res>? get localization;
}

/// @nodoc
class _$BootstrapModelCopyWithImpl<$Res, $Val extends BootstrapModel>
    implements $BootstrapModelCopyWith<$Res> {
  _$BootstrapModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? permissions = freezed,
    Object? organization = freezed,
    Object? features = freezed,
    Object? localization = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MobileUserModel?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationModel?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as FeaturesModel?,
      localization: freezed == localization
          ? _value.localization
          : localization // ignore: cast_nullable_to_non_nullable
              as LocalizationModel?,
    ) as $Val);
  }

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MobileUserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $MobileUserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationModelCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $OrganizationModelCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value) as $Val);
    });
  }

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeaturesModelCopyWith<$Res>? get features {
    if (_value.features == null) {
      return null;
    }

    return $FeaturesModelCopyWith<$Res>(_value.features!, (value) {
      return _then(_value.copyWith(features: value) as $Val);
    });
  }

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizationModelCopyWith<$Res>? get localization {
    if (_value.localization == null) {
      return null;
    }

    return $LocalizationModelCopyWith<$Res>(_value.localization!, (value) {
      return _then(_value.copyWith(localization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BootstrapModelImplCopyWith<$Res>
    implements $BootstrapModelCopyWith<$Res> {
  factory _$$BootstrapModelImplCopyWith(_$BootstrapModelImpl value,
          $Res Function(_$BootstrapModelImpl) then) =
      __$$BootstrapModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MobileUserModel? user,
      @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
      OrganizationModel? organization,
      FeaturesModel? features,
      LocalizationModel? localization});

  @override
  $MobileUserModelCopyWith<$Res>? get user;
  @override
  $OrganizationModelCopyWith<$Res>? get organization;
  @override
  $FeaturesModelCopyWith<$Res>? get features;
  @override
  $LocalizationModelCopyWith<$Res>? get localization;
}

/// @nodoc
class __$$BootstrapModelImplCopyWithImpl<$Res>
    extends _$BootstrapModelCopyWithImpl<$Res, _$BootstrapModelImpl>
    implements _$$BootstrapModelImplCopyWith<$Res> {
  __$$BootstrapModelImplCopyWithImpl(
      _$BootstrapModelImpl _value, $Res Function(_$BootstrapModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? permissions = freezed,
    Object? organization = freezed,
    Object? features = freezed,
    Object? localization = freezed,
  }) {
    return _then(_$BootstrapModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MobileUserModel?,
      permissions: freezed == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationModel?,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as FeaturesModel?,
      localization: freezed == localization
          ? _value.localization
          : localization // ignore: cast_nullable_to_non_nullable
              as LocalizationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BootstrapModelImpl implements _BootstrapModel {
  const _$BootstrapModelImpl(
      {this.user,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? permissions,
      this.organization,
      this.features,
      this.localization})
      : _permissions = permissions;

  factory _$BootstrapModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BootstrapModelImplFromJson(json);

  @override
  final MobileUserModel? user;
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
  final OrganizationModel? organization;
  @override
  final FeaturesModel? features;
  @override
  final LocalizationModel? localization;

  @override
  String toString() {
    return 'BootstrapModel(user: $user, permissions: $permissions, organization: $organization, features: $features, localization: $localization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BootstrapModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.features, features) ||
                other.features == features) &&
            (identical(other.localization, localization) ||
                other.localization == localization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_permissions),
      organization,
      features,
      localization);

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BootstrapModelImplCopyWith<_$BootstrapModelImpl> get copyWith =>
      __$$BootstrapModelImplCopyWithImpl<_$BootstrapModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BootstrapModelImplToJson(
      this,
    );
  }
}

abstract class _BootstrapModel implements BootstrapModel {
  const factory _BootstrapModel(
      {final MobileUserModel? user,
      @JsonKey(fromJson: jsonStringListLenient) final List<String>? permissions,
      final OrganizationModel? organization,
      final FeaturesModel? features,
      final LocalizationModel? localization}) = _$BootstrapModelImpl;

  factory _BootstrapModel.fromJson(Map<String, dynamic> json) =
      _$BootstrapModelImpl.fromJson;

  @override
  MobileUserModel? get user;
  @override
  @JsonKey(fromJson: jsonStringListLenient)
  List<String>? get permissions;
  @override
  OrganizationModel? get organization;
  @override
  FeaturesModel? get features;
  @override
  LocalizationModel? get localization;

  /// Create a copy of BootstrapModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BootstrapModelImplCopyWith<_$BootstrapModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganizationModel {
  @JsonKey(fromJson: jsonStringLenient)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url', fromJson: jsonStringLenient)
  String? get logoUrl => throw _privateConstructorUsedError;

  /// Serializes this OrganizationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizationModelCopyWith<OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationModelCopyWith<$Res> {
  factory $OrganizationModelCopyWith(
          OrganizationModel value, $Res Function(OrganizationModel) then) =
      _$OrganizationModelCopyWithImpl<$Res, OrganizationModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonStringLenient) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? phone,
      @JsonKey(fromJson: jsonStringLenient) String? email,
      @JsonKey(name: 'logo_url', fromJson: jsonStringLenient) String? logoUrl});
}

/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res, $Val extends OrganizationModel>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizationModelImplCopyWith<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  factory _$$OrganizationModelImplCopyWith(_$OrganizationModelImpl value,
          $Res Function(_$OrganizationModelImpl) then) =
      __$$OrganizationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonStringLenient) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? phone,
      @JsonKey(fromJson: jsonStringLenient) String? email,
      @JsonKey(name: 'logo_url', fromJson: jsonStringLenient) String? logoUrl});
}

/// @nodoc
class __$$OrganizationModelImplCopyWithImpl<$Res>
    extends _$OrganizationModelCopyWithImpl<$Res, _$OrganizationModelImpl>
    implements _$$OrganizationModelImplCopyWith<$Res> {
  __$$OrganizationModelImplCopyWithImpl(_$OrganizationModelImpl _value,
      $Res Function(_$OrganizationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? logoUrl = freezed,
  }) {
    return _then(_$OrganizationModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizationModelImpl implements _OrganizationModel {
  const _$OrganizationModelImpl(
      {@JsonKey(fromJson: jsonStringLenient) this.name,
      @JsonKey(fromJson: jsonStringLenient) this.phone,
      @JsonKey(fromJson: jsonStringLenient) this.email,
      @JsonKey(name: 'logo_url', fromJson: jsonStringLenient) this.logoUrl});

  factory _$OrganizationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? phone;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? email;
  @override
  @JsonKey(name: 'logo_url', fromJson: jsonStringLenient)
  final String? logoUrl;

  @override
  String toString() {
    return 'OrganizationModel(name: $name, phone: $phone, email: $email, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, email, logoUrl);

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationModelImplCopyWith<_$OrganizationModelImpl> get copyWith =>
      __$$OrganizationModelImplCopyWithImpl<_$OrganizationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationModelImplToJson(
      this,
    );
  }
}

abstract class _OrganizationModel implements OrganizationModel {
  const factory _OrganizationModel(
      {@JsonKey(fromJson: jsonStringLenient) final String? name,
      @JsonKey(fromJson: jsonStringLenient) final String? phone,
      @JsonKey(fromJson: jsonStringLenient) final String? email,
      @JsonKey(name: 'logo_url', fromJson: jsonStringLenient)
      final String? logoUrl}) = _$OrganizationModelImpl;

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$OrganizationModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get phone;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get email;
  @override
  @JsonKey(name: 'logo_url', fromJson: jsonStringLenient)
  String? get logoUrl;

  /// Create a copy of OrganizationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizationModelImplCopyWith<_$OrganizationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeaturesModel _$FeaturesModelFromJson(Map<String, dynamic> json) {
  return _FeaturesModel.fromJson(json);
}

/// @nodoc
mixin _$FeaturesModel {
  @JsonKey(fromJson: jsonBoolLenient)
  bool? get activities => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
  bool? get parentPortal => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
  bool? get profilePhotoUpload => throw _privateConstructorUsedError;

  /// Serializes this FeaturesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeaturesModelCopyWith<FeaturesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturesModelCopyWith<$Res> {
  factory $FeaturesModelCopyWith(
          FeaturesModel value, $Res Function(FeaturesModel) then) =
      _$FeaturesModelCopyWithImpl<$Res, FeaturesModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonBoolLenient) bool? activities,
      @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
      bool? parentPortal,
      @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
      bool? profilePhotoUpload});
}

/// @nodoc
class _$FeaturesModelCopyWithImpl<$Res, $Val extends FeaturesModel>
    implements $FeaturesModelCopyWith<$Res> {
  _$FeaturesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = freezed,
    Object? parentPortal = freezed,
    Object? profilePhotoUpload = freezed,
  }) {
    return _then(_value.copyWith(
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentPortal: freezed == parentPortal
          ? _value.parentPortal
          : parentPortal // ignore: cast_nullable_to_non_nullable
              as bool?,
      profilePhotoUpload: freezed == profilePhotoUpload
          ? _value.profilePhotoUpload
          : profilePhotoUpload // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeaturesModelImplCopyWith<$Res>
    implements $FeaturesModelCopyWith<$Res> {
  factory _$$FeaturesModelImplCopyWith(
          _$FeaturesModelImpl value, $Res Function(_$FeaturesModelImpl) then) =
      __$$FeaturesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonBoolLenient) bool? activities,
      @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
      bool? parentPortal,
      @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
      bool? profilePhotoUpload});
}

/// @nodoc
class __$$FeaturesModelImplCopyWithImpl<$Res>
    extends _$FeaturesModelCopyWithImpl<$Res, _$FeaturesModelImpl>
    implements _$$FeaturesModelImplCopyWith<$Res> {
  __$$FeaturesModelImplCopyWithImpl(
      _$FeaturesModelImpl _value, $Res Function(_$FeaturesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = freezed,
    Object? parentPortal = freezed,
    Object? profilePhotoUpload = freezed,
  }) {
    return _then(_$FeaturesModelImpl(
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentPortal: freezed == parentPortal
          ? _value.parentPortal
          : parentPortal // ignore: cast_nullable_to_non_nullable
              as bool?,
      profilePhotoUpload: freezed == profilePhotoUpload
          ? _value.profilePhotoUpload
          : profilePhotoUpload // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeaturesModelImpl implements _FeaturesModel {
  const _$FeaturesModelImpl(
      {@JsonKey(fromJson: jsonBoolLenient) this.activities,
      @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
      this.parentPortal,
      @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
      this.profilePhotoUpload});

  factory _$FeaturesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturesModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonBoolLenient)
  final bool? activities;
  @override
  @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
  final bool? parentPortal;
  @override
  @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
  final bool? profilePhotoUpload;

  @override
  String toString() {
    return 'FeaturesModel(activities: $activities, parentPortal: $parentPortal, profilePhotoUpload: $profilePhotoUpload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturesModelImpl &&
            (identical(other.activities, activities) ||
                other.activities == activities) &&
            (identical(other.parentPortal, parentPortal) ||
                other.parentPortal == parentPortal) &&
            (identical(other.profilePhotoUpload, profilePhotoUpload) ||
                other.profilePhotoUpload == profilePhotoUpload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, activities, parentPortal, profilePhotoUpload);

  /// Create a copy of FeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturesModelImplCopyWith<_$FeaturesModelImpl> get copyWith =>
      __$$FeaturesModelImplCopyWithImpl<_$FeaturesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturesModelImplToJson(
      this,
    );
  }
}

abstract class _FeaturesModel implements FeaturesModel {
  const factory _FeaturesModel(
      {@JsonKey(fromJson: jsonBoolLenient) final bool? activities,
      @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
      final bool? parentPortal,
      @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
      final bool? profilePhotoUpload}) = _$FeaturesModelImpl;

  factory _FeaturesModel.fromJson(Map<String, dynamic> json) =
      _$FeaturesModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonBoolLenient)
  bool? get activities;
  @override
  @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
  bool? get parentPortal;
  @override
  @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
  bool? get profilePhotoUpload;

  /// Create a copy of FeaturesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeaturesModelImplCopyWith<_$FeaturesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalizationModel _$LocalizationModelFromJson(Map<String, dynamic> json) {
  return _LocalizationModel.fromJson(json);
}

/// @nodoc
mixin _$LocalizationModel {
  @JsonKey(fromJson: jsonStringLenient)
  String? get locale => throw _privateConstructorUsedError;

  /// Serializes this LocalizationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalizationModelCopyWith<LocalizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationModelCopyWith<$Res> {
  factory $LocalizationModelCopyWith(
          LocalizationModel value, $Res Function(LocalizationModel) then) =
      _$LocalizationModelCopyWithImpl<$Res, LocalizationModel>;
  @useResult
  $Res call({@JsonKey(fromJson: jsonStringLenient) String? locale});
}

/// @nodoc
class _$LocalizationModelCopyWithImpl<$Res, $Val extends LocalizationModel>
    implements $LocalizationModelCopyWith<$Res> {
  _$LocalizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationModelImplCopyWith<$Res>
    implements $LocalizationModelCopyWith<$Res> {
  factory _$$LocalizationModelImplCopyWith(_$LocalizationModelImpl value,
          $Res Function(_$LocalizationModelImpl) then) =
      __$$LocalizationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: jsonStringLenient) String? locale});
}

/// @nodoc
class __$$LocalizationModelImplCopyWithImpl<$Res>
    extends _$LocalizationModelCopyWithImpl<$Res, _$LocalizationModelImpl>
    implements _$$LocalizationModelImplCopyWith<$Res> {
  __$$LocalizationModelImplCopyWithImpl(_$LocalizationModelImpl _value,
      $Res Function(_$LocalizationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalizationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$LocalizationModelImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizationModelImpl implements _LocalizationModel {
  const _$LocalizationModelImpl(
      {@JsonKey(fromJson: jsonStringLenient) this.locale});

  factory _$LocalizationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizationModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? locale;

  @override
  String toString() {
    return 'LocalizationModel(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationModelImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale);

  /// Create a copy of LocalizationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationModelImplCopyWith<_$LocalizationModelImpl> get copyWith =>
      __$$LocalizationModelImplCopyWithImpl<_$LocalizationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizationModelImplToJson(
      this,
    );
  }
}

abstract class _LocalizationModel implements LocalizationModel {
  const factory _LocalizationModel(
          {@JsonKey(fromJson: jsonStringLenient) final String? locale}) =
      _$LocalizationModelImpl;

  factory _LocalizationModel.fromJson(Map<String, dynamic> json) =
      _$LocalizationModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get locale;

  /// Create a copy of LocalizationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizationModelImplCopyWith<_$LocalizationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return _DashboardModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardModel {
  @JsonKey(fromJson: jsonStringLenient)
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
  String? get generatedAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonMap)
  Map<String, dynamic>? get metrics => throw _privateConstructorUsedError;

  /// Serializes this DashboardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardModelCopyWith<DashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardModelCopyWith<$Res> {
  factory $DashboardModelCopyWith(
          DashboardModel value, $Res Function(DashboardModel) then) =
      _$DashboardModelCopyWithImpl<$Res, DashboardModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonStringLenient) String? role,
      @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
      String? generatedAt,
      @JsonKey(fromJson: jsonMap) Map<String, dynamic>? metrics});
}

/// @nodoc
class _$DashboardModelCopyWithImpl<$Res, $Val extends DashboardModel>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? generatedAt = freezed,
    Object? metrics = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardModelImplCopyWith<$Res>
    implements $DashboardModelCopyWith<$Res> {
  factory _$$DashboardModelImplCopyWith(_$DashboardModelImpl value,
          $Res Function(_$DashboardModelImpl) then) =
      __$$DashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonStringLenient) String? role,
      @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
      String? generatedAt,
      @JsonKey(fromJson: jsonMap) Map<String, dynamic>? metrics});
}

/// @nodoc
class __$$DashboardModelImplCopyWithImpl<$Res>
    extends _$DashboardModelCopyWithImpl<$Res, _$DashboardModelImpl>
    implements _$$DashboardModelImplCopyWith<$Res> {
  __$$DashboardModelImplCopyWithImpl(
      _$DashboardModelImpl _value, $Res Function(_$DashboardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? generatedAt = freezed,
    Object? metrics = freezed,
  }) {
    return _then(_$DashboardModelImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      metrics: freezed == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardModelImpl implements _DashboardModel {
  const _$DashboardModelImpl(
      {@JsonKey(fromJson: jsonStringLenient) this.role,
      @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
      this.generatedAt,
      @JsonKey(fromJson: jsonMap) final Map<String, dynamic>? metrics})
      : _metrics = metrics;

  factory _$DashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? role;
  @override
  @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
  final String? generatedAt;
  final Map<String, dynamic>? _metrics;
  @override
  @JsonKey(fromJson: jsonMap)
  Map<String, dynamic>? get metrics {
    final value = _metrics;
    if (value == null) return null;
    if (_metrics is EqualUnmodifiableMapView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DashboardModel(role: $role, generatedAt: $generatedAt, metrics: $metrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, generatedAt,
      const DeepCollectionEquality().hash(_metrics));

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      __$$DashboardModelImplCopyWithImpl<_$DashboardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardModel implements DashboardModel {
  const factory _DashboardModel(
          {@JsonKey(fromJson: jsonStringLenient) final String? role,
          @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
          final String? generatedAt,
          @JsonKey(fromJson: jsonMap) final Map<String, dynamic>? metrics}) =
      _$DashboardModelImpl;

  factory _DashboardModel.fromJson(Map<String, dynamic> json) =
      _$DashboardModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get role;
  @override
  @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
  String? get generatedAt;
  @override
  @JsonKey(fromJson: jsonMap)
  Map<String, dynamic>? get metrics;

  /// Create a copy of DashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardModelImplCopyWith<_$DashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PasswordChangeModel _$PasswordChangeModelFromJson(Map<String, dynamic> json) {
  return _PasswordChangeModel.fromJson(json);
}

/// @nodoc
mixin _$PasswordChangeModel {
  @JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
  int? get otherTokensRevoked => throw _privateConstructorUsedError;

  /// Serializes this PasswordChangeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasswordChangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordChangeModelCopyWith<PasswordChangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangeModelCopyWith<$Res> {
  factory $PasswordChangeModelCopyWith(
          PasswordChangeModel value, $Res Function(PasswordChangeModel) then) =
      _$PasswordChangeModelCopyWithImpl<$Res, PasswordChangeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
      int? otherTokensRevoked});
}

/// @nodoc
class _$PasswordChangeModelCopyWithImpl<$Res, $Val extends PasswordChangeModel>
    implements $PasswordChangeModelCopyWith<$Res> {
  _$PasswordChangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordChangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otherTokensRevoked = freezed,
  }) {
    return _then(_value.copyWith(
      otherTokensRevoked: freezed == otherTokensRevoked
          ? _value.otherTokensRevoked
          : otherTokensRevoked // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordChangeModelImplCopyWith<$Res>
    implements $PasswordChangeModelCopyWith<$Res> {
  factory _$$PasswordChangeModelImplCopyWith(_$PasswordChangeModelImpl value,
          $Res Function(_$PasswordChangeModelImpl) then) =
      __$$PasswordChangeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
      int? otherTokensRevoked});
}

/// @nodoc
class __$$PasswordChangeModelImplCopyWithImpl<$Res>
    extends _$PasswordChangeModelCopyWithImpl<$Res, _$PasswordChangeModelImpl>
    implements _$$PasswordChangeModelImplCopyWith<$Res> {
  __$$PasswordChangeModelImplCopyWithImpl(_$PasswordChangeModelImpl _value,
      $Res Function(_$PasswordChangeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PasswordChangeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otherTokensRevoked = freezed,
  }) {
    return _then(_$PasswordChangeModelImpl(
      otherTokensRevoked: freezed == otherTokensRevoked
          ? _value.otherTokensRevoked
          : otherTokensRevoked // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordChangeModelImpl implements _PasswordChangeModel {
  const _$PasswordChangeModelImpl(
      {@JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
      this.otherTokensRevoked});

  factory _$PasswordChangeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordChangeModelImplFromJson(json);

  @override
  @JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
  final int? otherTokensRevoked;

  @override
  String toString() {
    return 'PasswordChangeModel(otherTokensRevoked: $otherTokensRevoked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangeModelImpl &&
            (identical(other.otherTokensRevoked, otherTokensRevoked) ||
                other.otherTokensRevoked == otherTokensRevoked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, otherTokensRevoked);

  /// Create a copy of PasswordChangeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangeModelImplCopyWith<_$PasswordChangeModelImpl> get copyWith =>
      __$$PasswordChangeModelImplCopyWithImpl<_$PasswordChangeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordChangeModelImplToJson(
      this,
    );
  }
}

abstract class _PasswordChangeModel implements PasswordChangeModel {
  const factory _PasswordChangeModel(
      {@JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
      final int? otherTokensRevoked}) = _$PasswordChangeModelImpl;

  factory _PasswordChangeModel.fromJson(Map<String, dynamic> json) =
      _$PasswordChangeModelImpl.fromJson;

  @override
  @JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
  int? get otherTokensRevoked;

  /// Create a copy of PasswordChangeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangeModelImplCopyWith<_$PasswordChangeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
