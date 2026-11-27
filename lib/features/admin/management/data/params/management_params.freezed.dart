// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'management_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaveCourseParams _$SaveCourseParamsFromJson(Map<String, dynamic> json) {
  return _SaveCourseParams.fromJson(json);
}

/// @nodoc
mixin _$SaveCourseParams {
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  int? get academicYearId => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'awards_points', includeIfNull: true)
  bool? get awardsPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default', includeIfNull: true)
  bool? get isDefault => throw _privateConstructorUsedError;

  /// Serializes this SaveCourseParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveCourseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveCourseParamsCopyWith<SaveCourseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveCourseParamsCopyWith<$Res> {
  factory $SaveCourseParamsCopyWith(
          SaveCourseParams value, $Res Function(SaveCourseParams) then) =
      _$SaveCourseParamsCopyWithImpl<$Res, SaveCourseParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      int? academicYearId,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(includeIfNull: true) String? description,
      @JsonKey(name: 'awards_points', includeIfNull: true) bool? awardsPoints,
      @JsonKey(name: 'is_default', includeIfNull: true) bool? isDefault});
}

/// @nodoc
class _$SaveCourseParamsCopyWithImpl<$Res, $Val extends SaveCourseParams>
    implements $SaveCourseParamsCopyWith<$Res> {
  _$SaveCourseParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveCourseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? academicYearId = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
    Object? description = freezed,
    Object? awardsPoints = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYearId: freezed == academicYearId
          ? _value.academicYearId
          : academicYearId // ignore: cast_nullable_to_non_nullable
              as int?,
      startsOn: freezed == startsOn
          ? _value.startsOn
          : startsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      awardsPoints: freezed == awardsPoints
          ? _value.awardsPoints
          : awardsPoints // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveCourseParamsImplCopyWith<$Res>
    implements $SaveCourseParamsCopyWith<$Res> {
  factory _$$SaveCourseParamsImplCopyWith(_$SaveCourseParamsImpl value,
          $Res Function(_$SaveCourseParamsImpl) then) =
      __$$SaveCourseParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      int? academicYearId,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(includeIfNull: true) String? description,
      @JsonKey(name: 'awards_points', includeIfNull: true) bool? awardsPoints,
      @JsonKey(name: 'is_default', includeIfNull: true) bool? isDefault});
}

/// @nodoc
class __$$SaveCourseParamsImplCopyWithImpl<$Res>
    extends _$SaveCourseParamsCopyWithImpl<$Res, _$SaveCourseParamsImpl>
    implements _$$SaveCourseParamsImplCopyWith<$Res> {
  __$$SaveCourseParamsImplCopyWithImpl(_$SaveCourseParamsImpl _value,
      $Res Function(_$SaveCourseParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveCourseParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? academicYearId = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
    Object? description = freezed,
    Object? awardsPoints = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_$SaveCourseParamsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYearId: freezed == academicYearId
          ? _value.academicYearId
          : academicYearId // ignore: cast_nullable_to_non_nullable
              as int?,
      startsOn: freezed == startsOn
          ? _value.startsOn
          : startsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      awardsPoints: freezed == awardsPoints
          ? _value.awardsPoints
          : awardsPoints // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SaveCourseParamsImpl implements _SaveCourseParams {
  const _$SaveCourseParamsImpl(
      {@JsonKey(includeIfNull: true) this.name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      this.academicYearId,
      @JsonKey(name: 'starts_on', includeIfNull: true) this.startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) this.endsOn,
      @JsonKey(includeIfNull: true) this.description,
      @JsonKey(name: 'awards_points', includeIfNull: true) this.awardsPoints,
      @JsonKey(name: 'is_default', includeIfNull: true) this.isDefault});

  factory _$SaveCourseParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveCourseParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  final int? academicYearId;
  @override
  @JsonKey(name: 'starts_on', includeIfNull: true)
  final String? startsOn;
  @override
  @JsonKey(name: 'ends_on', includeIfNull: true)
  final String? endsOn;
  @override
  @JsonKey(includeIfNull: true)
  final String? description;
  @override
  @JsonKey(name: 'awards_points', includeIfNull: true)
  final bool? awardsPoints;
  @override
  @JsonKey(name: 'is_default', includeIfNull: true)
  final bool? isDefault;

  @override
  String toString() {
    return 'SaveCourseParams(name: $name, academicYearId: $academicYearId, startsOn: $startsOn, endsOn: $endsOn, description: $description, awardsPoints: $awardsPoints, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveCourseParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYearId, academicYearId) ||
                other.academicYearId == academicYearId) &&
            (identical(other.startsOn, startsOn) ||
                other.startsOn == startsOn) &&
            (identical(other.endsOn, endsOn) || other.endsOn == endsOn) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.awardsPoints, awardsPoints) ||
                other.awardsPoints == awardsPoints) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, academicYearId, startsOn,
      endsOn, description, awardsPoints, isDefault);

  /// Create a copy of SaveCourseParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveCourseParamsImplCopyWith<_$SaveCourseParamsImpl> get copyWith =>
      __$$SaveCourseParamsImplCopyWithImpl<_$SaveCourseParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveCourseParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveCourseParams implements SaveCourseParams {
  const factory _SaveCourseParams(
      {@JsonKey(includeIfNull: true) final String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      final int? academicYearId,
      @JsonKey(name: 'starts_on', includeIfNull: true) final String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) final String? endsOn,
      @JsonKey(includeIfNull: true) final String? description,
      @JsonKey(name: 'awards_points', includeIfNull: true)
      final bool? awardsPoints,
      @JsonKey(name: 'is_default', includeIfNull: true)
      final bool? isDefault}) = _$SaveCourseParamsImpl;

  factory _SaveCourseParams.fromJson(Map<String, dynamic> json) =
      _$SaveCourseParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get name;
  @override
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  int? get academicYearId;
  @override
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn;
  @override
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn;
  @override
  @JsonKey(includeIfNull: true)
  String? get description;
  @override
  @JsonKey(name: 'awards_points', includeIfNull: true)
  bool? get awardsPoints;
  @override
  @JsonKey(name: 'is_default', includeIfNull: true)
  bool? get isDefault;

  /// Create a copy of SaveCourseParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveCourseParamsImplCopyWith<_$SaveCourseParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaveParentParams _$SaveParentParamsFromJson(Map<String, dynamic> json) {
  return _SaveParentParams.fromJson(json);
}

/// @nodoc
mixin _$SaveParentParams {
  @JsonKey(name: 'father_name', includeIfNull: true)
  String? get fatherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'father_work', includeIfNull: true)
  String? get fatherWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'father_phone', includeIfNull: true)
  String? get fatherPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'mother_name', includeIfNull: true)
  String? get motherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'mother_phone', includeIfNull: true)
  String? get motherPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_phone', includeIfNull: true)
  String? get homePhone => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this SaveParentParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveParentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveParentParamsCopyWith<SaveParentParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveParentParamsCopyWith<$Res> {
  factory $SaveParentParamsCopyWith(
          SaveParentParams value, $Res Function(SaveParentParams) then) =
      _$SaveParentParamsCopyWithImpl<$Res, SaveParentParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'father_name', includeIfNull: true) String? fatherName,
      @JsonKey(name: 'father_work', includeIfNull: true) String? fatherWork,
      @JsonKey(name: 'father_phone', includeIfNull: true) String? fatherPhone,
      @JsonKey(name: 'mother_name', includeIfNull: true) String? motherName,
      @JsonKey(name: 'mother_phone', includeIfNull: true) String? motherPhone,
      @JsonKey(name: 'home_phone', includeIfNull: true) String? homePhone,
      @JsonKey(includeIfNull: true) String? address,
      @JsonKey(includeIfNull: true) String? notes,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class _$SaveParentParamsCopyWithImpl<$Res, $Val extends SaveParentParams>
    implements $SaveParentParamsCopyWith<$Res> {
  _$SaveParentParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveParentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatherName = freezed,
    Object? fatherWork = freezed,
    Object? fatherPhone = freezed,
    Object? motherName = freezed,
    Object? motherPhone = freezed,
    Object? homePhone = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherWork: freezed == fatherWork
          ? _value.fatherWork
          : fatherWork // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherPhone: freezed == fatherPhone
          ? _value.fatherPhone
          : fatherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      motherPhone: freezed == motherPhone
          ? _value.motherPhone
          : motherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      homePhone: freezed == homePhone
          ? _value.homePhone
          : homePhone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveParentParamsImplCopyWith<$Res>
    implements $SaveParentParamsCopyWith<$Res> {
  factory _$$SaveParentParamsImplCopyWith(_$SaveParentParamsImpl value,
          $Res Function(_$SaveParentParamsImpl) then) =
      __$$SaveParentParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'father_name', includeIfNull: true) String? fatherName,
      @JsonKey(name: 'father_work', includeIfNull: true) String? fatherWork,
      @JsonKey(name: 'father_phone', includeIfNull: true) String? fatherPhone,
      @JsonKey(name: 'mother_name', includeIfNull: true) String? motherName,
      @JsonKey(name: 'mother_phone', includeIfNull: true) String? motherPhone,
      @JsonKey(name: 'home_phone', includeIfNull: true) String? homePhone,
      @JsonKey(includeIfNull: true) String? address,
      @JsonKey(includeIfNull: true) String? notes,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class __$$SaveParentParamsImplCopyWithImpl<$Res>
    extends _$SaveParentParamsCopyWithImpl<$Res, _$SaveParentParamsImpl>
    implements _$$SaveParentParamsImplCopyWith<$Res> {
  __$$SaveParentParamsImplCopyWithImpl(_$SaveParentParamsImpl _value,
      $Res Function(_$SaveParentParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveParentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatherName = freezed,
    Object? fatherWork = freezed,
    Object? fatherPhone = freezed,
    Object? motherName = freezed,
    Object? motherPhone = freezed,
    Object? homePhone = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$SaveParentParamsImpl(
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherWork: freezed == fatherWork
          ? _value.fatherWork
          : fatherWork // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherPhone: freezed == fatherPhone
          ? _value.fatherPhone
          : fatherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      motherPhone: freezed == motherPhone
          ? _value.motherPhone
          : motherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      homePhone: freezed == homePhone
          ? _value.homePhone
          : homePhone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SaveParentParamsImpl implements _SaveParentParams {
  const _$SaveParentParamsImpl(
      {@JsonKey(name: 'father_name', includeIfNull: true) this.fatherName,
      @JsonKey(name: 'father_work', includeIfNull: true) this.fatherWork,
      @JsonKey(name: 'father_phone', includeIfNull: true) this.fatherPhone,
      @JsonKey(name: 'mother_name', includeIfNull: true) this.motherName,
      @JsonKey(name: 'mother_phone', includeIfNull: true) this.motherPhone,
      @JsonKey(name: 'home_phone', includeIfNull: true) this.homePhone,
      @JsonKey(includeIfNull: true) this.address,
      @JsonKey(includeIfNull: true) this.notes,
      @JsonKey(name: 'is_active', includeIfNull: true) this.isActive});

  factory _$SaveParentParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveParentParamsImplFromJson(json);

  @override
  @JsonKey(name: 'father_name', includeIfNull: true)
  final String? fatherName;
  @override
  @JsonKey(name: 'father_work', includeIfNull: true)
  final String? fatherWork;
  @override
  @JsonKey(name: 'father_phone', includeIfNull: true)
  final String? fatherPhone;
  @override
  @JsonKey(name: 'mother_name', includeIfNull: true)
  final String? motherName;
  @override
  @JsonKey(name: 'mother_phone', includeIfNull: true)
  final String? motherPhone;
  @override
  @JsonKey(name: 'home_phone', includeIfNull: true)
  final String? homePhone;
  @override
  @JsonKey(includeIfNull: true)
  final String? address;
  @override
  @JsonKey(includeIfNull: true)
  final String? notes;
  @override
  @JsonKey(name: 'is_active', includeIfNull: true)
  final bool? isActive;

  @override
  String toString() {
    return 'SaveParentParams(fatherName: $fatherName, fatherWork: $fatherWork, fatherPhone: $fatherPhone, motherName: $motherName, motherPhone: $motherPhone, homePhone: $homePhone, address: $address, notes: $notes, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveParentParamsImpl &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.fatherWork, fatherWork) ||
                other.fatherWork == fatherWork) &&
            (identical(other.fatherPhone, fatherPhone) ||
                other.fatherPhone == fatherPhone) &&
            (identical(other.motherName, motherName) ||
                other.motherName == motherName) &&
            (identical(other.motherPhone, motherPhone) ||
                other.motherPhone == motherPhone) &&
            (identical(other.homePhone, homePhone) ||
                other.homePhone == homePhone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fatherName,
      fatherWork,
      fatherPhone,
      motherName,
      motherPhone,
      homePhone,
      address,
      notes,
      isActive);

  /// Create a copy of SaveParentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveParentParamsImplCopyWith<_$SaveParentParamsImpl> get copyWith =>
      __$$SaveParentParamsImplCopyWithImpl<_$SaveParentParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveParentParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveParentParams implements SaveParentParams {
  const factory _SaveParentParams(
      {@JsonKey(name: 'father_name', includeIfNull: true)
      final String? fatherName,
      @JsonKey(name: 'father_work', includeIfNull: true)
      final String? fatherWork,
      @JsonKey(name: 'father_phone', includeIfNull: true)
      final String? fatherPhone,
      @JsonKey(name: 'mother_name', includeIfNull: true)
      final String? motherName,
      @JsonKey(name: 'mother_phone', includeIfNull: true)
      final String? motherPhone,
      @JsonKey(name: 'home_phone', includeIfNull: true) final String? homePhone,
      @JsonKey(includeIfNull: true) final String? address,
      @JsonKey(includeIfNull: true) final String? notes,
      @JsonKey(name: 'is_active', includeIfNull: true)
      final bool? isActive}) = _$SaveParentParamsImpl;

  factory _SaveParentParams.fromJson(Map<String, dynamic> json) =
      _$SaveParentParamsImpl.fromJson;

  @override
  @JsonKey(name: 'father_name', includeIfNull: true)
  String? get fatherName;
  @override
  @JsonKey(name: 'father_work', includeIfNull: true)
  String? get fatherWork;
  @override
  @JsonKey(name: 'father_phone', includeIfNull: true)
  String? get fatherPhone;
  @override
  @JsonKey(name: 'mother_name', includeIfNull: true)
  String? get motherName;
  @override
  @JsonKey(name: 'mother_phone', includeIfNull: true)
  String? get motherPhone;
  @override
  @JsonKey(name: 'home_phone', includeIfNull: true)
  String? get homePhone;
  @override
  @JsonKey(includeIfNull: true)
  String? get address;
  @override
  @JsonKey(includeIfNull: true)
  String? get notes;
  @override
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive;

  /// Create a copy of SaveParentParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveParentParamsImplCopyWith<_$SaveParentParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaveScheduleParams _$SaveScheduleParamsFromJson(Map<String, dynamic> json) {
  return _SaveScheduleParams.fromJson(json);
}

/// @nodoc
mixin _$SaveScheduleParams {
  @JsonKey(name: 'day_of_week', includeIfNull: true)
  int? get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_slot', includeIfNull: true)
  String? get timeSlot => throw _privateConstructorUsedError;

  /// Serializes this SaveScheduleParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveScheduleParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveScheduleParamsCopyWith<SaveScheduleParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveScheduleParamsCopyWith<$Res> {
  factory $SaveScheduleParamsCopyWith(
          SaveScheduleParams value, $Res Function(SaveScheduleParams) then) =
      _$SaveScheduleParamsCopyWithImpl<$Res, SaveScheduleParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'day_of_week', includeIfNull: true) int? dayOfWeek,
      @JsonKey(name: 'time_slot', includeIfNull: true) String? timeSlot});
}

/// @nodoc
class _$SaveScheduleParamsCopyWithImpl<$Res, $Val extends SaveScheduleParams>
    implements $SaveScheduleParamsCopyWith<$Res> {
  _$SaveScheduleParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveScheduleParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? timeSlot = freezed,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveScheduleParamsImplCopyWith<$Res>
    implements $SaveScheduleParamsCopyWith<$Res> {
  factory _$$SaveScheduleParamsImplCopyWith(_$SaveScheduleParamsImpl value,
          $Res Function(_$SaveScheduleParamsImpl) then) =
      __$$SaveScheduleParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day_of_week', includeIfNull: true) int? dayOfWeek,
      @JsonKey(name: 'time_slot', includeIfNull: true) String? timeSlot});
}

/// @nodoc
class __$$SaveScheduleParamsImplCopyWithImpl<$Res>
    extends _$SaveScheduleParamsCopyWithImpl<$Res, _$SaveScheduleParamsImpl>
    implements _$$SaveScheduleParamsImplCopyWith<$Res> {
  __$$SaveScheduleParamsImplCopyWithImpl(_$SaveScheduleParamsImpl _value,
      $Res Function(_$SaveScheduleParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveScheduleParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? timeSlot = freezed,
  }) {
    return _then(_$SaveScheduleParamsImpl(
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SaveScheduleParamsImpl implements _SaveScheduleParams {
  const _$SaveScheduleParamsImpl(
      {@JsonKey(name: 'day_of_week', includeIfNull: true) this.dayOfWeek,
      @JsonKey(name: 'time_slot', includeIfNull: true) this.timeSlot});

  factory _$SaveScheduleParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveScheduleParamsImplFromJson(json);

  @override
  @JsonKey(name: 'day_of_week', includeIfNull: true)
  final int? dayOfWeek;
  @override
  @JsonKey(name: 'time_slot', includeIfNull: true)
  final String? timeSlot;

  @override
  String toString() {
    return 'SaveScheduleParams(dayOfWeek: $dayOfWeek, timeSlot: $timeSlot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveScheduleParamsImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dayOfWeek, timeSlot);

  /// Create a copy of SaveScheduleParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveScheduleParamsImplCopyWith<_$SaveScheduleParamsImpl> get copyWith =>
      __$$SaveScheduleParamsImplCopyWithImpl<_$SaveScheduleParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveScheduleParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveScheduleParams implements SaveScheduleParams {
  const factory _SaveScheduleParams(
      {@JsonKey(name: 'day_of_week', includeIfNull: true) final int? dayOfWeek,
      @JsonKey(name: 'time_slot', includeIfNull: true)
      final String? timeSlot}) = _$SaveScheduleParamsImpl;

  factory _SaveScheduleParams.fromJson(Map<String, dynamic> json) =
      _$SaveScheduleParamsImpl.fromJson;

  @override
  @JsonKey(name: 'day_of_week', includeIfNull: true)
  int? get dayOfWeek;
  @override
  @JsonKey(name: 'time_slot', includeIfNull: true)
  String? get timeSlot;

  /// Create a copy of SaveScheduleParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveScheduleParamsImplCopyWith<_$SaveScheduleParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaveTeacherParams _$SaveTeacherParamsFromJson(Map<String, dynamic> json) {
  return _SaveTeacherParams.fromJson(json);
}

/// @nodoc
mixin _$SaveTeacherParams {
  @JsonKey(name: 'first_name', includeIfNull: true)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', includeIfNull: true)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
  int? get teacherJobTitleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'hired_at', includeIfNull: true)
  String? get hiredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_helping', includeIfNull: true)
  bool? get isHelping => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_username', includeIfNull: true)
  String? get accountUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_password')
  Object? get accountPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_is_active', includeIfNull: true)
  bool? get accountIsActive => throw _privateConstructorUsedError;

  /// Serializes this SaveTeacherParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveTeacherParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveTeacherParamsCopyWith<SaveTeacherParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveTeacherParamsCopyWith<$Res> {
  factory $SaveTeacherParamsCopyWith(
          SaveTeacherParams value, $Res Function(SaveTeacherParams) then) =
      _$SaveTeacherParamsCopyWithImpl<$Res, SaveTeacherParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name', includeIfNull: true) String? firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) String? lastName,
      @JsonKey(includeIfNull: true) String? phone,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
      int? teacherJobTitleId,
      @JsonKey(name: 'hired_at', includeIfNull: true) String? hiredAt,
      @JsonKey(name: 'is_helping', includeIfNull: true) bool? isHelping,
      @JsonKey(includeIfNull: true) String? notes,
      @JsonKey(name: 'account_username', includeIfNull: true)
      String? accountUsername,
      @JsonKey(name: 'account_password') Object? accountPassword,
      @JsonKey(name: 'account_is_active', includeIfNull: true)
      bool? accountIsActive});
}

/// @nodoc
class _$SaveTeacherParamsCopyWithImpl<$Res, $Val extends SaveTeacherParams>
    implements $SaveTeacherParamsCopyWith<$Res> {
  _$SaveTeacherParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveTeacherParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? courseId = freezed,
    Object? teacherJobTitleId = freezed,
    Object? hiredAt = freezed,
    Object? isHelping = freezed,
    Object? notes = freezed,
    Object? accountUsername = freezed,
    Object? accountPassword = freezed,
    Object? accountIsActive = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherJobTitleId: freezed == teacherJobTitleId
          ? _value.teacherJobTitleId
          : teacherJobTitleId // ignore: cast_nullable_to_non_nullable
              as int?,
      hiredAt: freezed == hiredAt
          ? _value.hiredAt
          : hiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isHelping: freezed == isHelping
          ? _value.isHelping
          : isHelping // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      accountUsername: freezed == accountUsername
          ? _value.accountUsername
          : accountUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      accountPassword:
          freezed == accountPassword ? _value.accountPassword : accountPassword,
      accountIsActive: freezed == accountIsActive
          ? _value.accountIsActive
          : accountIsActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveTeacherParamsImplCopyWith<$Res>
    implements $SaveTeacherParamsCopyWith<$Res> {
  factory _$$SaveTeacherParamsImplCopyWith(_$SaveTeacherParamsImpl value,
          $Res Function(_$SaveTeacherParamsImpl) then) =
      __$$SaveTeacherParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name', includeIfNull: true) String? firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) String? lastName,
      @JsonKey(includeIfNull: true) String? phone,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
      int? teacherJobTitleId,
      @JsonKey(name: 'hired_at', includeIfNull: true) String? hiredAt,
      @JsonKey(name: 'is_helping', includeIfNull: true) bool? isHelping,
      @JsonKey(includeIfNull: true) String? notes,
      @JsonKey(name: 'account_username', includeIfNull: true)
      String? accountUsername,
      @JsonKey(name: 'account_password') Object? accountPassword,
      @JsonKey(name: 'account_is_active', includeIfNull: true)
      bool? accountIsActive});
}

/// @nodoc
class __$$SaveTeacherParamsImplCopyWithImpl<$Res>
    extends _$SaveTeacherParamsCopyWithImpl<$Res, _$SaveTeacherParamsImpl>
    implements _$$SaveTeacherParamsImplCopyWith<$Res> {
  __$$SaveTeacherParamsImplCopyWithImpl(_$SaveTeacherParamsImpl _value,
      $Res Function(_$SaveTeacherParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveTeacherParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? courseId = freezed,
    Object? teacherJobTitleId = freezed,
    Object? hiredAt = freezed,
    Object? isHelping = freezed,
    Object? notes = freezed,
    Object? accountUsername = freezed,
    Object? accountPassword = freezed,
    Object? accountIsActive = freezed,
  }) {
    return _then(_$SaveTeacherParamsImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherJobTitleId: freezed == teacherJobTitleId
          ? _value.teacherJobTitleId
          : teacherJobTitleId // ignore: cast_nullable_to_non_nullable
              as int?,
      hiredAt: freezed == hiredAt
          ? _value.hiredAt
          : hiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isHelping: freezed == isHelping
          ? _value.isHelping
          : isHelping // ignore: cast_nullable_to_non_nullable
              as bool?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      accountUsername: freezed == accountUsername
          ? _value.accountUsername
          : accountUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      accountPassword:
          freezed == accountPassword ? _value.accountPassword : accountPassword,
      accountIsActive: freezed == accountIsActive
          ? _value.accountIsActive
          : accountIsActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SaveTeacherParamsImpl implements _SaveTeacherParams {
  const _$SaveTeacherParamsImpl(
      {@JsonKey(name: 'first_name', includeIfNull: true) this.firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) this.lastName,
      @JsonKey(includeIfNull: true) this.phone,
      @JsonKey(name: 'course_id', includeIfNull: true) this.courseId,
      @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
      this.teacherJobTitleId,
      @JsonKey(name: 'hired_at', includeIfNull: true) this.hiredAt,
      @JsonKey(name: 'is_helping', includeIfNull: true) this.isHelping,
      @JsonKey(includeIfNull: true) this.notes,
      @JsonKey(name: 'account_username', includeIfNull: true)
      this.accountUsername,
      @JsonKey(name: 'account_password') this.accountPassword,
      @JsonKey(name: 'account_is_active', includeIfNull: true)
      this.accountIsActive});

  factory _$SaveTeacherParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveTeacherParamsImplFromJson(json);

  @override
  @JsonKey(name: 'first_name', includeIfNull: true)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name', includeIfNull: true)
  final String? lastName;
  @override
  @JsonKey(includeIfNull: true)
  final String? phone;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  final int? courseId;
  @override
  @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
  final int? teacherJobTitleId;
  @override
  @JsonKey(name: 'hired_at', includeIfNull: true)
  final String? hiredAt;
  @override
  @JsonKey(name: 'is_helping', includeIfNull: true)
  final bool? isHelping;
  @override
  @JsonKey(includeIfNull: true)
  final String? notes;
  @override
  @JsonKey(name: 'account_username', includeIfNull: true)
  final String? accountUsername;
  @override
  @JsonKey(name: 'account_password')
  final Object? accountPassword;
  @override
  @JsonKey(name: 'account_is_active', includeIfNull: true)
  final bool? accountIsActive;

  @override
  String toString() {
    return 'SaveTeacherParams(firstName: $firstName, lastName: $lastName, phone: $phone, courseId: $courseId, teacherJobTitleId: $teacherJobTitleId, hiredAt: $hiredAt, isHelping: $isHelping, notes: $notes, accountUsername: $accountUsername, accountPassword: $accountPassword, accountIsActive: $accountIsActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveTeacherParamsImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.teacherJobTitleId, teacherJobTitleId) ||
                other.teacherJobTitleId == teacherJobTitleId) &&
            (identical(other.hiredAt, hiredAt) || other.hiredAt == hiredAt) &&
            (identical(other.isHelping, isHelping) ||
                other.isHelping == isHelping) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.accountUsername, accountUsername) ||
                other.accountUsername == accountUsername) &&
            const DeepCollectionEquality()
                .equals(other.accountPassword, accountPassword) &&
            (identical(other.accountIsActive, accountIsActive) ||
                other.accountIsActive == accountIsActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      phone,
      courseId,
      teacherJobTitleId,
      hiredAt,
      isHelping,
      notes,
      accountUsername,
      const DeepCollectionEquality().hash(accountPassword),
      accountIsActive);

  /// Create a copy of SaveTeacherParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveTeacherParamsImplCopyWith<_$SaveTeacherParamsImpl> get copyWith =>
      __$$SaveTeacherParamsImplCopyWithImpl<_$SaveTeacherParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveTeacherParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveTeacherParams implements SaveTeacherParams {
  const factory _SaveTeacherParams(
      {@JsonKey(name: 'first_name', includeIfNull: true)
      final String? firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) final String? lastName,
      @JsonKey(includeIfNull: true) final String? phone,
      @JsonKey(name: 'course_id', includeIfNull: true) final int? courseId,
      @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
      final int? teacherJobTitleId,
      @JsonKey(name: 'hired_at', includeIfNull: true) final String? hiredAt,
      @JsonKey(name: 'is_helping', includeIfNull: true) final bool? isHelping,
      @JsonKey(includeIfNull: true) final String? notes,
      @JsonKey(name: 'account_username', includeIfNull: true)
      final String? accountUsername,
      @JsonKey(name: 'account_password') final Object? accountPassword,
      @JsonKey(name: 'account_is_active', includeIfNull: true)
      final bool? accountIsActive}) = _$SaveTeacherParamsImpl;

  factory _SaveTeacherParams.fromJson(Map<String, dynamic> json) =
      _$SaveTeacherParamsImpl.fromJson;

  @override
  @JsonKey(name: 'first_name', includeIfNull: true)
  String? get firstName;
  @override
  @JsonKey(name: 'last_name', includeIfNull: true)
  String? get lastName;
  @override
  @JsonKey(includeIfNull: true)
  String? get phone;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId;
  @override
  @JsonKey(name: 'teacher_job_title_id', includeIfNull: true)
  int? get teacherJobTitleId;
  @override
  @JsonKey(name: 'hired_at', includeIfNull: true)
  String? get hiredAt;
  @override
  @JsonKey(name: 'is_helping', includeIfNull: true)
  bool? get isHelping;
  @override
  @JsonKey(includeIfNull: true)
  String? get notes;
  @override
  @JsonKey(name: 'account_username', includeIfNull: true)
  String? get accountUsername;
  @override
  @JsonKey(name: 'account_password')
  Object? get accountPassword;
  @override
  @JsonKey(name: 'account_is_active', includeIfNull: true)
  bool? get accountIsActive;

  /// Create a copy of SaveTeacherParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveTeacherParamsImplCopyWith<_$SaveTeacherParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
