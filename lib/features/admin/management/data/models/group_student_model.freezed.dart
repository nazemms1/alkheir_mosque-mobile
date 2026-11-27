// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupItemModel _$GroupItemModelFromJson(Map<String, dynamic> json) {
  return _GroupItemModel.fromJson(json);
}

/// @nodoc
mixin _$GroupItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'course', fromJson: jsonStringLenient)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher', fromJson: jsonStringLenient)
  String? get teacherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
  int? get enrollmentsCount => throw _privateConstructorUsedError;

  /// Create a copy of GroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupItemModelCopyWith<GroupItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupItemModelCopyWith<$Res> {
  factory $GroupItemModelCopyWith(
          GroupItemModel value, $Res Function(GroupItemModel) then) =
      _$GroupItemModelCopyWithImpl<$Res, GroupItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'course', fromJson: jsonStringLenient) String? courseName,
      @JsonKey(name: 'teacher', fromJson: jsonStringLenient)
      String? teacherName,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      int? enrollmentsCount});
}

/// @nodoc
class _$GroupItemModelCopyWithImpl<$Res, $Val extends GroupItemModel>
    implements $GroupItemModelCopyWith<$Res> {
  _$GroupItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? courseName = freezed,
    Object? teacherName = freezed,
    Object? isActive = freezed,
    Object? enrollmentsCount = freezed,
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
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupItemModelImplCopyWith<$Res>
    implements $GroupItemModelCopyWith<$Res> {
  factory _$$GroupItemModelImplCopyWith(_$GroupItemModelImpl value,
          $Res Function(_$GroupItemModelImpl) then) =
      __$$GroupItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'course', fromJson: jsonStringLenient) String? courseName,
      @JsonKey(name: 'teacher', fromJson: jsonStringLenient)
      String? teacherName,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      int? enrollmentsCount});
}

/// @nodoc
class __$$GroupItemModelImplCopyWithImpl<$Res>
    extends _$GroupItemModelCopyWithImpl<$Res, _$GroupItemModelImpl>
    implements _$$GroupItemModelImplCopyWith<$Res> {
  __$$GroupItemModelImplCopyWithImpl(
      _$GroupItemModelImpl _value, $Res Function(_$GroupItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? courseName = freezed,
    Object? teacherName = freezed,
    Object? isActive = freezed,
    Object? enrollmentsCount = freezed,
  }) {
    return _then(_$GroupItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GroupItemModelImpl implements _GroupItemModel {
  const _$GroupItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(name: 'course', fromJson: jsonStringLenient) this.courseName,
      @JsonKey(name: 'teacher', fromJson: jsonStringLenient) this.teacherName,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      this.enrollmentsCount});

  factory _$GroupItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(name: 'course', fromJson: jsonStringLenient)
  final String? courseName;
  @override
  @JsonKey(name: 'teacher', fromJson: jsonStringLenient)
  final String? teacherName;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
  final int? enrollmentsCount;

  @override
  String toString() {
    return 'GroupItemModel(id: $id, name: $name, courseName: $courseName, teacherName: $teacherName, isActive: $isActive, enrollmentsCount: $enrollmentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.enrollmentsCount, enrollmentsCount) ||
                other.enrollmentsCount == enrollmentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, courseName,
      teacherName, isActive, enrollmentsCount);

  /// Create a copy of GroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupItemModelImplCopyWith<_$GroupItemModelImpl> get copyWith =>
      __$$GroupItemModelImplCopyWithImpl<_$GroupItemModelImpl>(
          this, _$identity);
}

abstract class _GroupItemModel implements GroupItemModel {
  const factory _GroupItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(name: 'course', fromJson: jsonStringLenient)
      final String? courseName,
      @JsonKey(name: 'teacher', fromJson: jsonStringLenient)
      final String? teacherName,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      final int? enrollmentsCount}) = _$GroupItemModelImpl;

  factory _GroupItemModel.fromJson(Map<String, dynamic> json) =
      _$GroupItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(name: 'course', fromJson: jsonStringLenient)
  String? get courseName;
  @override
  @JsonKey(name: 'teacher', fromJson: jsonStringLenient)
  String? get teacherName;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
  int? get enrollmentsCount;

  /// Create a copy of GroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupItemModelImplCopyWith<_$GroupItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentListItemModel _$StudentListItemModelFromJson(Map<String, dynamic> json) {
  return _StudentListItemModel.fromJson(json);
}

/// @nodoc
mixin _$StudentListItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name', fromJson: jsonStringValue)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', fromJson: jsonStringValue)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent', fromJson: jsonStringLenient)
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
  String? get gradeLevel => throw _privateConstructorUsedError;

  /// Create a copy of StudentListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentListItemModelCopyWith<StudentListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentListItemModelCopyWith<$Res> {
  factory $StudentListItemModelCopyWith(StudentListItemModel value,
          $Res Function(StudentListItemModel) then) =
      _$StudentListItemModelCopyWithImpl<$Res, StudentListItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      String? studentNumber,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'parent', fromJson: jsonStringLenient) String? parentName,
      @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
      String? gradeLevel});
}

/// @nodoc
class _$StudentListItemModelCopyWithImpl<$Res,
        $Val extends StudentListItemModel>
    implements $StudentListItemModelCopyWith<$Res> {
  _$StudentListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? studentNumber = freezed,
    Object? status = freezed,
    Object? parentName = freezed,
    Object? gradeLevel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentListItemModelImplCopyWith<$Res>
    implements $StudentListItemModelCopyWith<$Res> {
  factory _$$StudentListItemModelImplCopyWith(_$StudentListItemModelImpl value,
          $Res Function(_$StudentListItemModelImpl) then) =
      __$$StudentListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      String? studentNumber,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'parent', fromJson: jsonStringLenient) String? parentName,
      @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
      String? gradeLevel});
}

/// @nodoc
class __$$StudentListItemModelImplCopyWithImpl<$Res>
    extends _$StudentListItemModelCopyWithImpl<$Res, _$StudentListItemModelImpl>
    implements _$$StudentListItemModelImplCopyWith<$Res> {
  __$$StudentListItemModelImplCopyWithImpl(_$StudentListItemModelImpl _value,
      $Res Function(_$StudentListItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? studentNumber = freezed,
    Object? status = freezed,
    Object? parentName = freezed,
    Object? gradeLevel = freezed,
  }) {
    return _then(_$StudentListItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentListItemModelImpl implements _StudentListItemModel {
  const _$StudentListItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) this.firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) this.lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      this.studentNumber,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'parent', fromJson: jsonStringLenient) this.parentName,
      @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
      this.gradeLevel});

  factory _$StudentListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentListItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'first_name', fromJson: jsonStringValue)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name', fromJson: jsonStringValue)
  final String? lastName;
  @override
  @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
  final String? studentNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'parent', fromJson: jsonStringLenient)
  final String? parentName;
  @override
  @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
  final String? gradeLevel;

  @override
  String toString() {
    return 'StudentListItemModel(id: $id, firstName: $firstName, lastName: $lastName, studentNumber: $studentNumber, status: $status, parentName: $parentName, gradeLevel: $gradeLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.gradeLevel, gradeLevel) ||
                other.gradeLevel == gradeLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      studentNumber, status, parentName, gradeLevel);

  /// Create a copy of StudentListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentListItemModelImplCopyWith<_$StudentListItemModelImpl>
      get copyWith =>
          __$$StudentListItemModelImplCopyWithImpl<_$StudentListItemModelImpl>(
              this, _$identity);
}

abstract class _StudentListItemModel implements StudentListItemModel {
  const factory _StudentListItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue)
      final String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue)
      final String? lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      final String? studentNumber,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'parent', fromJson: jsonStringLenient)
      final String? parentName,
      @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
      final String? gradeLevel}) = _$StudentListItemModelImpl;

  factory _StudentListItemModel.fromJson(Map<String, dynamic> json) =
      _$StudentListItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'first_name', fromJson: jsonStringValue)
  String? get firstName;
  @override
  @JsonKey(name: 'last_name', fromJson: jsonStringValue)
  String? get lastName;
  @override
  @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
  String? get studentNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'parent', fromJson: jsonStringLenient)
  String? get parentName;
  @override
  @JsonKey(name: 'grade_level', fromJson: jsonStringLenient)
  String? get gradeLevel;

  /// Create a copy of StudentListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentListItemModelImplCopyWith<_$StudentListItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
