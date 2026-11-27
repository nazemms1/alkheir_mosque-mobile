// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'management_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParentItemModel _$ParentItemModelFromJson(Map<String, dynamic> json) {
  return _ParentItemModel.fromJson(json);
}

/// @nodoc
mixin _$ParentItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
  String? get parentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'father_name', fromJson: jsonStringValue)
  String? get fatherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
  String? get fatherWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
  String? get fatherPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
  String? get motherName => throw _privateConstructorUsedError;
  @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
  String? get motherPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_phone', fromJson: jsonStringLenient)
  String? get homePhone => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
  int? get studentsCount => throw _privateConstructorUsedError;

  /// Create a copy of ParentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentItemModelCopyWith<ParentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentItemModelCopyWith<$Res> {
  factory $ParentItemModelCopyWith(
          ParentItemModel value, $Res Function(ParentItemModel) then) =
      _$ParentItemModelCopyWithImpl<$Res, ParentItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
      String? parentNumber,
      @JsonKey(name: 'father_name', fromJson: jsonStringValue)
      String? fatherName,
      @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
      String? fatherWork,
      @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
      String? fatherPhone,
      @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
      String? motherName,
      @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
      String? motherPhone,
      @JsonKey(name: 'home_phone', fromJson: jsonStringLenient)
      String? homePhone,
      @JsonKey(fromJson: jsonStringLenient) String? address,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
      int? studentsCount});
}

/// @nodoc
class _$ParentItemModelCopyWithImpl<$Res, $Val extends ParentItemModel>
    implements $ParentItemModelCopyWith<$Res> {
  _$ParentItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentNumber = freezed,
    Object? fatherName = freezed,
    Object? fatherWork = freezed,
    Object? fatherPhone = freezed,
    Object? motherName = freezed,
    Object? motherPhone = freezed,
    Object? homePhone = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? isActive = freezed,
    Object? studentsCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentNumber: freezed == parentNumber
          ? _value.parentNumber
          : parentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
      studentsCount: freezed == studentsCount
          ? _value.studentsCount
          : studentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentItemModelImplCopyWith<$Res>
    implements $ParentItemModelCopyWith<$Res> {
  factory _$$ParentItemModelImplCopyWith(_$ParentItemModelImpl value,
          $Res Function(_$ParentItemModelImpl) then) =
      __$$ParentItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
      String? parentNumber,
      @JsonKey(name: 'father_name', fromJson: jsonStringValue)
      String? fatherName,
      @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
      String? fatherWork,
      @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
      String? fatherPhone,
      @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
      String? motherName,
      @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
      String? motherPhone,
      @JsonKey(name: 'home_phone', fromJson: jsonStringLenient)
      String? homePhone,
      @JsonKey(fromJson: jsonStringLenient) String? address,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
      int? studentsCount});
}

/// @nodoc
class __$$ParentItemModelImplCopyWithImpl<$Res>
    extends _$ParentItemModelCopyWithImpl<$Res, _$ParentItemModelImpl>
    implements _$$ParentItemModelImplCopyWith<$Res> {
  __$$ParentItemModelImplCopyWithImpl(
      _$ParentItemModelImpl _value, $Res Function(_$ParentItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentNumber = freezed,
    Object? fatherName = freezed,
    Object? fatherWork = freezed,
    Object? fatherPhone = freezed,
    Object? motherName = freezed,
    Object? motherPhone = freezed,
    Object? homePhone = freezed,
    Object? address = freezed,
    Object? notes = freezed,
    Object? isActive = freezed,
    Object? studentsCount = freezed,
  }) {
    return _then(_$ParentItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentNumber: freezed == parentNumber
          ? _value.parentNumber
          : parentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
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
      studentsCount: freezed == studentsCount
          ? _value.studentsCount
          : studentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ParentItemModelImpl implements _ParentItemModel {
  const _$ParentItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
      this.parentNumber,
      @JsonKey(name: 'father_name', fromJson: jsonStringValue) this.fatherName,
      @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
      this.fatherWork,
      @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
      this.fatherPhone,
      @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
      this.motherName,
      @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
      this.motherPhone,
      @JsonKey(name: 'home_phone', fromJson: jsonStringLenient) this.homePhone,
      @JsonKey(fromJson: jsonStringLenient) this.address,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
      this.studentsCount});

  factory _$ParentItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
  final String? parentNumber;
  @override
  @JsonKey(name: 'father_name', fromJson: jsonStringValue)
  final String? fatherName;
  @override
  @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
  final String? fatherWork;
  @override
  @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
  final String? fatherPhone;
  @override
  @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
  final String? motherName;
  @override
  @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
  final String? motherPhone;
  @override
  @JsonKey(name: 'home_phone', fromJson: jsonStringLenient)
  final String? homePhone;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? address;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
  final int? studentsCount;

  @override
  String toString() {
    return 'ParentItemModel(id: $id, parentNumber: $parentNumber, fatherName: $fatherName, fatherWork: $fatherWork, fatherPhone: $fatherPhone, motherName: $motherName, motherPhone: $motherPhone, homePhone: $homePhone, address: $address, notes: $notes, isActive: $isActive, studentsCount: $studentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentNumber, parentNumber) ||
                other.parentNumber == parentNumber) &&
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
                other.isActive == isActive) &&
            (identical(other.studentsCount, studentsCount) ||
                other.studentsCount == studentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parentNumber,
      fatherName,
      fatherWork,
      fatherPhone,
      motherName,
      motherPhone,
      homePhone,
      address,
      notes,
      isActive,
      studentsCount);

  /// Create a copy of ParentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentItemModelImplCopyWith<_$ParentItemModelImpl> get copyWith =>
      __$$ParentItemModelImplCopyWithImpl<_$ParentItemModelImpl>(
          this, _$identity);
}

abstract class _ParentItemModel implements ParentItemModel {
  const factory _ParentItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
      final String? parentNumber,
      @JsonKey(name: 'father_name', fromJson: jsonStringValue)
      final String? fatherName,
      @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
      final String? fatherWork,
      @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
      final String? fatherPhone,
      @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
      final String? motherName,
      @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
      final String? motherPhone,
      @JsonKey(name: 'home_phone', fromJson: jsonStringLenient)
      final String? homePhone,
      @JsonKey(fromJson: jsonStringLenient) final String? address,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive,
      @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
      final int? studentsCount}) = _$ParentItemModelImpl;

  factory _ParentItemModel.fromJson(Map<String, dynamic> json) =
      _$ParentItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'parent_number', fromJson: jsonStringValue)
  String? get parentNumber;
  @override
  @JsonKey(name: 'father_name', fromJson: jsonStringValue)
  String? get fatherName;
  @override
  @JsonKey(name: 'father_work', fromJson: jsonStringLenient)
  String? get fatherWork;
  @override
  @JsonKey(name: 'father_phone', fromJson: jsonStringLenient)
  String? get fatherPhone;
  @override
  @JsonKey(name: 'mother_name', fromJson: jsonStringLenient)
  String? get motherName;
  @override
  @JsonKey(name: 'mother_phone', fromJson: jsonStringLenient)
  String? get motherPhone;
  @override
  @JsonKey(name: 'home_phone', fromJson: jsonStringLenient)
  String? get homePhone;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get address;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(name: 'students_count', fromJson: jsonIntLenient)
  int? get studentsCount;

  /// Create a copy of ParentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentItemModelImplCopyWith<_$ParentItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherItemModel _$TeacherItemModelFromJson(Map<String, dynamic> json) {
  return _TeacherItemModel.fromJson(json);
}

/// @nodoc
mixin _$TeacherItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name', fromJson: jsonStringValue)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', fromJson: jsonStringValue)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient)
  bool? get isHelping => throw _privateConstructorUsedError;
  @JsonKey(name: 'hired_at', fromJson: jsonStringLenient)
  String? get hiredAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title', fromJson: jsonStringLenient)
  String? get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
  int? get teacherJobTitleId => throw _privateConstructorUsedError;
  @JsonKey(readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherItemCourseName, fromJson: _teacherItemCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
  int? get assignedGroupsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
  int? get assistedGroupsCount => throw _privateConstructorUsedError;

  /// Create a copy of TeacherItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherItemModelCopyWith<TeacherItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherItemModelCopyWith<$Res> {
  factory $TeacherItemModelCopyWith(
          TeacherItemModel value, $Res Function(TeacherItemModel) then) =
      _$TeacherItemModelCopyWithImpl<$Res, TeacherItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
      @JsonKey(fromJson: jsonStringValue) String? phone,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient) bool? isHelping,
      @JsonKey(name: 'hired_at', fromJson: jsonStringLenient) String? hiredAt,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'job_title', fromJson: jsonStringLenient) String? jobTitle,
      @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
      int? teacherJobTitleId,
      @JsonKey(
          readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
      int? courseId,
      @JsonKey(
          readValue: _teacherItemCourseName,
          fromJson: _teacherItemCourseNameValue)
      String? courseName,
      @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
      int? assignedGroupsCount,
      @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
      int? assistedGroupsCount});
}

/// @nodoc
class _$TeacherItemModelCopyWithImpl<$Res, $Val extends TeacherItemModel>
    implements $TeacherItemModelCopyWith<$Res> {
  _$TeacherItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? isHelping = freezed,
    Object? hiredAt = freezed,
    Object? notes = freezed,
    Object? jobTitle = freezed,
    Object? teacherJobTitleId = freezed,
    Object? courseId = freezed,
    Object? courseName = freezed,
    Object? assignedGroupsCount = freezed,
    Object? assistedGroupsCount = freezed,
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isHelping: freezed == isHelping
          ? _value.isHelping
          : isHelping // ignore: cast_nullable_to_non_nullable
              as bool?,
      hiredAt: freezed == hiredAt
          ? _value.hiredAt
          : hiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherJobTitleId: freezed == teacherJobTitleId
          ? _value.teacherJobTitleId
          : teacherJobTitleId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedGroupsCount: freezed == assignedGroupsCount
          ? _value.assignedGroupsCount
          : assignedGroupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      assistedGroupsCount: freezed == assistedGroupsCount
          ? _value.assistedGroupsCount
          : assistedGroupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherItemModelImplCopyWith<$Res>
    implements $TeacherItemModelCopyWith<$Res> {
  factory _$$TeacherItemModelImplCopyWith(_$TeacherItemModelImpl value,
          $Res Function(_$TeacherItemModelImpl) then) =
      __$$TeacherItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
      @JsonKey(fromJson: jsonStringValue) String? phone,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient) bool? isHelping,
      @JsonKey(name: 'hired_at', fromJson: jsonStringLenient) String? hiredAt,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'job_title', fromJson: jsonStringLenient) String? jobTitle,
      @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
      int? teacherJobTitleId,
      @JsonKey(
          readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
      int? courseId,
      @JsonKey(
          readValue: _teacherItemCourseName,
          fromJson: _teacherItemCourseNameValue)
      String? courseName,
      @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
      int? assignedGroupsCount,
      @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
      int? assistedGroupsCount});
}

/// @nodoc
class __$$TeacherItemModelImplCopyWithImpl<$Res>
    extends _$TeacherItemModelCopyWithImpl<$Res, _$TeacherItemModelImpl>
    implements _$$TeacherItemModelImplCopyWith<$Res> {
  __$$TeacherItemModelImplCopyWithImpl(_$TeacherItemModelImpl _value,
      $Res Function(_$TeacherItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? isHelping = freezed,
    Object? hiredAt = freezed,
    Object? notes = freezed,
    Object? jobTitle = freezed,
    Object? teacherJobTitleId = freezed,
    Object? courseId = freezed,
    Object? courseName = freezed,
    Object? assignedGroupsCount = freezed,
    Object? assistedGroupsCount = freezed,
  }) {
    return _then(_$TeacherItemModelImpl(
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isHelping: freezed == isHelping
          ? _value.isHelping
          : isHelping // ignore: cast_nullable_to_non_nullable
              as bool?,
      hiredAt: freezed == hiredAt
          ? _value.hiredAt
          : hiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      jobTitle: freezed == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherJobTitleId: freezed == teacherJobTitleId
          ? _value.teacherJobTitleId
          : teacherJobTitleId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedGroupsCount: freezed == assignedGroupsCount
          ? _value.assignedGroupsCount
          : assignedGroupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      assistedGroupsCount: freezed == assistedGroupsCount
          ? _value.assistedGroupsCount
          : assistedGroupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TeacherItemModelImpl implements _TeacherItemModel {
  const _$TeacherItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) this.firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) this.lastName,
      @JsonKey(fromJson: jsonStringValue) this.phone,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient) this.isHelping,
      @JsonKey(name: 'hired_at', fromJson: jsonStringLenient) this.hiredAt,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(name: 'job_title', fromJson: jsonStringLenient) this.jobTitle,
      @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
      this.teacherJobTitleId,
      @JsonKey(
          readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
      this.courseId,
      @JsonKey(
          readValue: _teacherItemCourseName,
          fromJson: _teacherItemCourseNameValue)
      this.courseName,
      @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
      this.assignedGroupsCount,
      @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
      this.assistedGroupsCount});

  factory _$TeacherItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherItemModelImplFromJson(json);

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
  @JsonKey(fromJson: jsonStringValue)
  final String? phone;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient)
  final bool? isHelping;
  @override
  @JsonKey(name: 'hired_at', fromJson: jsonStringLenient)
  final String? hiredAt;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(name: 'job_title', fromJson: jsonStringLenient)
  final String? jobTitle;
  @override
  @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
  final int? teacherJobTitleId;
  @override
  @JsonKey(readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
  final int? courseId;
  @override
  @JsonKey(
      readValue: _teacherItemCourseName, fromJson: _teacherItemCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
  final int? assignedGroupsCount;
  @override
  @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
  final int? assistedGroupsCount;

  @override
  String toString() {
    return 'TeacherItemModel(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, status: $status, isHelping: $isHelping, hiredAt: $hiredAt, notes: $notes, jobTitle: $jobTitle, teacherJobTitleId: $teacherJobTitleId, courseId: $courseId, courseName: $courseName, assignedGroupsCount: $assignedGroupsCount, assistedGroupsCount: $assistedGroupsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isHelping, isHelping) ||
                other.isHelping == isHelping) &&
            (identical(other.hiredAt, hiredAt) || other.hiredAt == hiredAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.teacherJobTitleId, teacherJobTitleId) ||
                other.teacherJobTitleId == teacherJobTitleId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.assignedGroupsCount, assignedGroupsCount) ||
                other.assignedGroupsCount == assignedGroupsCount) &&
            (identical(other.assistedGroupsCount, assistedGroupsCount) ||
                other.assistedGroupsCount == assistedGroupsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      phone,
      status,
      isHelping,
      hiredAt,
      notes,
      jobTitle,
      teacherJobTitleId,
      courseId,
      courseName,
      assignedGroupsCount,
      assistedGroupsCount);

  /// Create a copy of TeacherItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherItemModelImplCopyWith<_$TeacherItemModelImpl> get copyWith =>
      __$$TeacherItemModelImplCopyWithImpl<_$TeacherItemModelImpl>(
          this, _$identity);
}

abstract class _TeacherItemModel implements TeacherItemModel {
  const factory _TeacherItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue)
      final String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue)
      final String? lastName,
      @JsonKey(fromJson: jsonStringValue) final String? phone,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient)
      final bool? isHelping,
      @JsonKey(name: 'hired_at', fromJson: jsonStringLenient)
      final String? hiredAt,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(name: 'job_title', fromJson: jsonStringLenient)
      final String? jobTitle,
      @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
      final int? teacherJobTitleId,
      @JsonKey(
          readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
      final int? courseId,
      @JsonKey(
          readValue: _teacherItemCourseName,
          fromJson: _teacherItemCourseNameValue)
      final String? courseName,
      @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
      final int? assignedGroupsCount,
      @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
      final int? assistedGroupsCount}) = _$TeacherItemModelImpl;

  factory _TeacherItemModel.fromJson(Map<String, dynamic> json) =
      _$TeacherItemModelImpl.fromJson;

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
  @JsonKey(fromJson: jsonStringValue)
  String? get phone;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'is_helping', fromJson: jsonBoolLenient)
  bool? get isHelping;
  @override
  @JsonKey(name: 'hired_at', fromJson: jsonStringLenient)
  String? get hiredAt;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(name: 'job_title', fromJson: jsonStringLenient)
  String? get jobTitle;
  @override
  @JsonKey(name: 'teacher_job_title_id', fromJson: jsonIntLenient)
  int? get teacherJobTitleId;
  @override
  @JsonKey(readValue: _teacherItemCourseId, fromJson: _teacherItemCourseIdValue)
  int? get courseId;
  @override
  @JsonKey(
      readValue: _teacherItemCourseName, fromJson: _teacherItemCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(name: 'assigned_groups_count', fromJson: jsonIntLenient)
  int? get assignedGroupsCount;
  @override
  @JsonKey(name: 'assisted_groups_count', fromJson: jsonIntLenient)
  int? get assistedGroupsCount;

  /// Create a copy of TeacherItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherItemModelImplCopyWith<_$TeacherItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseItemModel _$CourseItemModelFromJson(Map<String, dynamic> json) {
  return _CourseItemModel.fromJson(json);
}

/// @nodoc
mixin _$CourseItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
  String? get academicYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
  int? get academicYearId => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
  String? get startsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
  String? get endsOn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
  bool? get awardsPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default', fromJson: jsonBoolLenient)
  bool? get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
  String? get finishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  int? get groupsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
  int? get enrollmentsCount => throw _privateConstructorUsedError;

  /// Create a copy of CourseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseItemModelCopyWith<CourseItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseItemModelCopyWith<$Res> {
  factory $CourseItemModelCopyWith(
          CourseItemModel value, $Res Function(CourseItemModel) then) =
      _$CourseItemModelCopyWithImpl<$Res, CourseItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
      String? academicYear,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      int? academicYearId,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) String? startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) String? endsOn,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
      bool? awardsPoints,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'is_default', fromJson: jsonBoolLenient) bool? isDefault,
      @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
      String? finishedAt,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      int? enrollmentsCount});
}

/// @nodoc
class _$CourseItemModelCopyWithImpl<$Res, $Val extends CourseItemModel>
    implements $CourseItemModelCopyWith<$Res> {
  _$CourseItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? academicYear = freezed,
    Object? academicYearId = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
    Object? description = freezed,
    Object? awardsPoints = freezed,
    Object? isActive = freezed,
    Object? isDefault = freezed,
    Object? finishedAt = freezed,
    Object? groupsCount = freezed,
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
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      groupsCount: freezed == groupsCount
          ? _value.groupsCount
          : groupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseItemModelImplCopyWith<$Res>
    implements $CourseItemModelCopyWith<$Res> {
  factory _$$CourseItemModelImplCopyWith(_$CourseItemModelImpl value,
          $Res Function(_$CourseItemModelImpl) then) =
      __$$CourseItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
      String? academicYear,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      int? academicYearId,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) String? startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) String? endsOn,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
      bool? awardsPoints,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'is_default', fromJson: jsonBoolLenient) bool? isDefault,
      @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
      String? finishedAt,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      int? enrollmentsCount});
}

/// @nodoc
class __$$CourseItemModelImplCopyWithImpl<$Res>
    extends _$CourseItemModelCopyWithImpl<$Res, _$CourseItemModelImpl>
    implements _$$CourseItemModelImplCopyWith<$Res> {
  __$$CourseItemModelImplCopyWithImpl(
      _$CourseItemModelImpl _value, $Res Function(_$CourseItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? academicYear = freezed,
    Object? academicYearId = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
    Object? description = freezed,
    Object? awardsPoints = freezed,
    Object? isActive = freezed,
    Object? isDefault = freezed,
    Object? finishedAt = freezed,
    Object? groupsCount = freezed,
    Object? enrollmentsCount = freezed,
  }) {
    return _then(_$CourseItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      groupsCount: freezed == groupsCount
          ? _value.groupsCount
          : groupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CourseItemModelImpl implements _CourseItemModel {
  const _$CourseItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
      this.academicYear,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      this.academicYearId,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) this.startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) this.endsOn,
      @JsonKey(fromJson: jsonStringLenient) this.description,
      @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
      this.awardsPoints,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(name: 'is_default', fromJson: jsonBoolLenient) this.isDefault,
      @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
      this.finishedAt,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) this.groupsCount,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      this.enrollmentsCount});

  factory _$CourseItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
  final String? academicYear;
  @override
  @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
  final int? academicYearId;
  @override
  @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
  final String? startsOn;
  @override
  @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
  final String? endsOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? description;
  @override
  @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
  final bool? awardsPoints;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(name: 'is_default', fromJson: jsonBoolLenient)
  final bool? isDefault;
  @override
  @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
  final String? finishedAt;
  @override
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  final int? groupsCount;
  @override
  @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
  final int? enrollmentsCount;

  @override
  String toString() {
    return 'CourseItemModel(id: $id, name: $name, academicYear: $academicYear, academicYearId: $academicYearId, startsOn: $startsOn, endsOn: $endsOn, description: $description, awardsPoints: $awardsPoints, isActive: $isActive, isDefault: $isDefault, finishedAt: $finishedAt, groupsCount: $groupsCount, enrollmentsCount: $enrollmentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.academicYearId, academicYearId) ||
                other.academicYearId == academicYearId) &&
            (identical(other.startsOn, startsOn) ||
                other.startsOn == startsOn) &&
            (identical(other.endsOn, endsOn) || other.endsOn == endsOn) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.awardsPoints, awardsPoints) ||
                other.awardsPoints == awardsPoints) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.groupsCount, groupsCount) ||
                other.groupsCount == groupsCount) &&
            (identical(other.enrollmentsCount, enrollmentsCount) ||
                other.enrollmentsCount == enrollmentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      academicYear,
      academicYearId,
      startsOn,
      endsOn,
      description,
      awardsPoints,
      isActive,
      isDefault,
      finishedAt,
      groupsCount,
      enrollmentsCount);

  /// Create a copy of CourseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseItemModelImplCopyWith<_$CourseItemModelImpl> get copyWith =>
      __$$CourseItemModelImplCopyWithImpl<_$CourseItemModelImpl>(
          this, _$identity);
}

abstract class _CourseItemModel implements CourseItemModel {
  const factory _CourseItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
      final String? academicYear,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      final int? academicYearId,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
      final String? startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
      final String? endsOn,
      @JsonKey(fromJson: jsonStringLenient) final String? description,
      @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
      final bool? awardsPoints,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive,
      @JsonKey(name: 'is_default', fromJson: jsonBoolLenient)
      final bool? isDefault,
      @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
      final String? finishedAt,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
      final int? groupsCount,
      @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
      final int? enrollmentsCount}) = _$CourseItemModelImpl;

  factory _CourseItemModel.fromJson(Map<String, dynamic> json) =
      _$CourseItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(name: 'academic_year', fromJson: jsonStringLenient)
  String? get academicYear;
  @override
  @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
  int? get academicYearId;
  @override
  @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
  String? get startsOn;
  @override
  @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
  String? get endsOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get description;
  @override
  @JsonKey(name: 'awards_points', fromJson: jsonBoolLenient)
  bool? get awardsPoints;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(name: 'is_default', fromJson: jsonBoolLenient)
  bool? get isDefault;
  @override
  @JsonKey(name: 'finished_at', fromJson: jsonStringLenient)
  String? get finishedAt;
  @override
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  int? get groupsCount;
  @override
  @JsonKey(name: 'enrollments_count', fromJson: jsonIntLenient)
  int? get enrollmentsCount;

  /// Create a copy of CourseItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseItemModelImplCopyWith<_$CourseItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupScheduleSlotModel _$GroupScheduleSlotModelFromJson(
    Map<String, dynamic> json) {
  return _GroupScheduleSlotModel.fromJson(json);
}

/// @nodoc
mixin _$GroupScheduleSlotModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient)
  int? get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _groupScheduleSlotTimeSlot,
      fromJson: _groupScheduleSlotTimeSlotValue)
  String? get timeSlot => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _groupScheduleSlotTimeSlotLabel,
      fromJson: _groupScheduleSlotTimeSlotLabelValue)
  String? get timeSlotLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_at', fromJson: jsonStringValue)
  String? get startsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_at', fromJson: jsonStringValue)
  String? get endsAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;

  /// Create a copy of GroupScheduleSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupScheduleSlotModelCopyWith<GroupScheduleSlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupScheduleSlotModelCopyWith<$Res> {
  factory $GroupScheduleSlotModelCopyWith(GroupScheduleSlotModel value,
          $Res Function(GroupScheduleSlotModel) then) =
      _$GroupScheduleSlotModelCopyWithImpl<$Res, GroupScheduleSlotModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient) int? dayOfWeek,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlot,
          fromJson: _groupScheduleSlotTimeSlotValue)
      String? timeSlot,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlotLabel,
          fromJson: _groupScheduleSlotTimeSlotLabelValue)
      String? timeSlotLabel,
      @JsonKey(name: 'starts_at', fromJson: jsonStringValue) String? startsAt,
      @JsonKey(name: 'ends_at', fromJson: jsonStringValue) String? endsAt,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive});
}

/// @nodoc
class _$GroupScheduleSlotModelCopyWithImpl<$Res,
        $Val extends GroupScheduleSlotModel>
    implements $GroupScheduleSlotModelCopyWith<$Res> {
  _$GroupScheduleSlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupScheduleSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dayOfWeek = freezed,
    Object? timeSlot = freezed,
    Object? timeSlotLabel = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSlotLabel: freezed == timeSlotLabel
          ? _value.timeSlotLabel
          : timeSlotLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupScheduleSlotModelImplCopyWith<$Res>
    implements $GroupScheduleSlotModelCopyWith<$Res> {
  factory _$$GroupScheduleSlotModelImplCopyWith(
          _$GroupScheduleSlotModelImpl value,
          $Res Function(_$GroupScheduleSlotModelImpl) then) =
      __$$GroupScheduleSlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient) int? dayOfWeek,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlot,
          fromJson: _groupScheduleSlotTimeSlotValue)
      String? timeSlot,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlotLabel,
          fromJson: _groupScheduleSlotTimeSlotLabelValue)
      String? timeSlotLabel,
      @JsonKey(name: 'starts_at', fromJson: jsonStringValue) String? startsAt,
      @JsonKey(name: 'ends_at', fromJson: jsonStringValue) String? endsAt,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive});
}

/// @nodoc
class __$$GroupScheduleSlotModelImplCopyWithImpl<$Res>
    extends _$GroupScheduleSlotModelCopyWithImpl<$Res,
        _$GroupScheduleSlotModelImpl>
    implements _$$GroupScheduleSlotModelImplCopyWith<$Res> {
  __$$GroupScheduleSlotModelImplCopyWithImpl(
      _$GroupScheduleSlotModelImpl _value,
      $Res Function(_$GroupScheduleSlotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupScheduleSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dayOfWeek = freezed,
    Object? timeSlot = freezed,
    Object? timeSlotLabel = freezed,
    Object? startsAt = freezed,
    Object? endsAt = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$GroupScheduleSlotModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      timeSlot: freezed == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSlotLabel: freezed == timeSlotLabel
          ? _value.timeSlotLabel
          : timeSlotLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      startsAt: freezed == startsAt
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endsAt: freezed == endsAt
          ? _value.endsAt
          : endsAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GroupScheduleSlotModelImpl implements _GroupScheduleSlotModel {
  const _$GroupScheduleSlotModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient) this.dayOfWeek,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlot,
          fromJson: _groupScheduleSlotTimeSlotValue)
      this.timeSlot,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlotLabel,
          fromJson: _groupScheduleSlotTimeSlotLabelValue)
      this.timeSlotLabel,
      @JsonKey(name: 'starts_at', fromJson: jsonStringValue) this.startsAt,
      @JsonKey(name: 'ends_at', fromJson: jsonStringValue) this.endsAt,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive});

  factory _$GroupScheduleSlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupScheduleSlotModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient)
  final int? dayOfWeek;
  @override
  @JsonKey(
      readValue: _groupScheduleSlotTimeSlot,
      fromJson: _groupScheduleSlotTimeSlotValue)
  final String? timeSlot;
  @override
  @JsonKey(
      readValue: _groupScheduleSlotTimeSlotLabel,
      fromJson: _groupScheduleSlotTimeSlotLabelValue)
  final String? timeSlotLabel;
  @override
  @JsonKey(name: 'starts_at', fromJson: jsonStringValue)
  final String? startsAt;
  @override
  @JsonKey(name: 'ends_at', fromJson: jsonStringValue)
  final String? endsAt;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;

  @override
  String toString() {
    return 'GroupScheduleSlotModel(id: $id, dayOfWeek: $dayOfWeek, timeSlot: $timeSlot, timeSlotLabel: $timeSlotLabel, startsAt: $startsAt, endsAt: $endsAt, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupScheduleSlotModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.timeSlotLabel, timeSlotLabel) ||
                other.timeSlotLabel == timeSlotLabel) &&
            (identical(other.startsAt, startsAt) ||
                other.startsAt == startsAt) &&
            (identical(other.endsAt, endsAt) || other.endsAt == endsAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dayOfWeek, timeSlot,
      timeSlotLabel, startsAt, endsAt, isActive);

  /// Create a copy of GroupScheduleSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupScheduleSlotModelImplCopyWith<_$GroupScheduleSlotModelImpl>
      get copyWith => __$$GroupScheduleSlotModelImplCopyWithImpl<
          _$GroupScheduleSlotModelImpl>(this, _$identity);
}

abstract class _GroupScheduleSlotModel implements GroupScheduleSlotModel {
  const factory _GroupScheduleSlotModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient)
      final int? dayOfWeek,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlot,
          fromJson: _groupScheduleSlotTimeSlotValue)
      final String? timeSlot,
      @JsonKey(
          readValue: _groupScheduleSlotTimeSlotLabel,
          fromJson: _groupScheduleSlotTimeSlotLabelValue)
      final String? timeSlotLabel,
      @JsonKey(name: 'starts_at', fromJson: jsonStringValue)
      final String? startsAt,
      @JsonKey(name: 'ends_at', fromJson: jsonStringValue) final String? endsAt,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive}) = _$GroupScheduleSlotModelImpl;

  factory _GroupScheduleSlotModel.fromJson(Map<String, dynamic> json) =
      _$GroupScheduleSlotModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'day_of_week', fromJson: jsonIntLenient)
  int? get dayOfWeek;
  @override
  @JsonKey(
      readValue: _groupScheduleSlotTimeSlot,
      fromJson: _groupScheduleSlotTimeSlotValue)
  String? get timeSlot;
  @override
  @JsonKey(
      readValue: _groupScheduleSlotTimeSlotLabel,
      fromJson: _groupScheduleSlotTimeSlotLabelValue)
  String? get timeSlotLabel;
  @override
  @JsonKey(name: 'starts_at', fromJson: jsonStringValue)
  String? get startsAt;
  @override
  @JsonKey(name: 'ends_at', fromJson: jsonStringValue)
  String? get endsAt;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;

  /// Create a copy of GroupScheduleSlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupScheduleSlotModelImplCopyWith<_$GroupScheduleSlotModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RefItemModel _$RefItemModelFromJson(Map<String, dynamic> json) {
  return _RefItemModel.fromJson(json);
}

/// @nodoc
mixin _$RefItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_current', fromJson: jsonBoolLenient)
  bool? get isCurrent => throw _privateConstructorUsedError;

  /// Create a copy of RefItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefItemModelCopyWith<RefItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefItemModelCopyWith<$Res> {
  factory $RefItemModelCopyWith(
          RefItemModel value, $Res Function(RefItemModel) then) =
      _$RefItemModelCopyWithImpl<$Res, RefItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? code,
      @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
      bool? isActive,
      @JsonKey(name: 'is_current', fromJson: jsonBoolLenient) bool? isCurrent});
}

/// @nodoc
class _$RefItemModelCopyWithImpl<$Res, $Val extends RefItemModel>
    implements $RefItemModelCopyWith<$Res> {
  _$RefItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? isCurrent = freezed,
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
      isCurrent: freezed == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefItemModelImplCopyWith<$Res>
    implements $RefItemModelCopyWith<$Res> {
  factory _$$RefItemModelImplCopyWith(
          _$RefItemModelImpl value, $Res Function(_$RefItemModelImpl) then) =
      __$$RefItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringLenient) String? code,
      @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
      bool? isActive,
      @JsonKey(name: 'is_current', fromJson: jsonBoolLenient) bool? isCurrent});
}

/// @nodoc
class __$$RefItemModelImplCopyWithImpl<$Res>
    extends _$RefItemModelCopyWithImpl<$Res, _$RefItemModelImpl>
    implements _$$RefItemModelImplCopyWith<$Res> {
  __$$RefItemModelImplCopyWithImpl(
      _$RefItemModelImpl _value, $Res Function(_$RefItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? isCurrent = freezed,
  }) {
    return _then(_$RefItemModelImpl(
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
      isCurrent: freezed == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$RefItemModelImpl implements _RefItemModel {
  const _$RefItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(fromJson: jsonStringLenient) this.code,
      @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
      this.isActive,
      @JsonKey(name: 'is_current', fromJson: jsonBoolLenient) this.isCurrent});

  factory _$RefItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? code;
  @override
  @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
  final bool? isActive;
  @override
  @JsonKey(name: 'is_current', fromJson: jsonBoolLenient)
  final bool? isCurrent;

  @override
  String toString() {
    return 'RefItemModel(id: $id, name: $name, code: $code, isActive: $isActive, isCurrent: $isCurrent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isCurrent, isCurrent) ||
                other.isCurrent == isCurrent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, code, isActive, isCurrent);

  /// Create a copy of RefItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefItemModelImplCopyWith<_$RefItemModelImpl> get copyWith =>
      __$$RefItemModelImplCopyWithImpl<_$RefItemModelImpl>(this, _$identity);
}

abstract class _RefItemModel implements RefItemModel {
  const factory _RefItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(fromJson: jsonStringLenient) final String? code,
      @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
      final bool? isActive,
      @JsonKey(name: 'is_current', fromJson: jsonBoolLenient)
      final bool? isCurrent}) = _$RefItemModelImpl;

  factory _RefItemModel.fromJson(Map<String, dynamic> json) =
      _$RefItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get code;
  @override
  @JsonKey(readValue: _refItemIsActive, fromJson: _refItemIsActiveValue)
  bool? get isActive;
  @override
  @JsonKey(name: 'is_current', fromJson: jsonBoolLenient)
  bool? get isCurrent;

  /// Create a copy of RefItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefItemModelImplCopyWith<_$RefItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
