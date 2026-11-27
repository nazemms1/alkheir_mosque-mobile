// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'records_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentRecordModel _$StudentRecordModelFromJson(Map<String, dynamic> json) {
  return _StudentRecordModel.fromJson(json);
}

/// @nodoc
mixin _$StudentRecordModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name', fromJson: jsonStringValue)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', fromJson: jsonStringValue)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentRecordParentId, fromJson: _studentRecordParentIdValue)
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentRecordParentName,
      fromJson: _studentRecordParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentRecordGradeLevelId,
      fromJson: _studentRecordGradeLevelIdValue)
  int? get gradeLevelId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentRecordGradeLevelName,
      fromJson: _studentRecordGradeLevelNameValue)
  String? get gradeLevelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at', fromJson: jsonStringLenient)
  String? get joinedAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentRecordQuranCurrentJuzId,
      fromJson: _studentRecordQuranCurrentJuzIdValue)
  int? get quranCurrentJuzId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentRecordQuranCurrentJuz,
      fromJson: _studentRecordQuranCurrentJuzValue)
  int? get quranCurrentJuz => throw _privateConstructorUsedError;
  @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
  String? get schoolName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentRecordHasPhoto, fromJson: _studentRecordHasPhotoValue)
  bool? get hasPhoto => throw _privateConstructorUsedError;

  /// Create a copy of StudentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentRecordModelCopyWith<StudentRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentRecordModelCopyWith<$Res> {
  factory $StudentRecordModelCopyWith(
          StudentRecordModel value, $Res Function(StudentRecordModel) then) =
      _$StudentRecordModelCopyWithImpl<$Res, StudentRecordModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      String? studentNumber,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
      String? birthDate,
      @JsonKey(fromJson: jsonStringLenient) String? gender,
      @JsonKey(
          readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
      String? status,
      @JsonKey(
          readValue: _studentRecordParentId,
          fromJson: _studentRecordParentIdValue)
      int? parentId,
      @JsonKey(
          readValue: _studentRecordParentName,
          fromJson: _studentRecordParentNameValue)
      String? parentName,
      @JsonKey(
          readValue: _studentRecordGradeLevelId,
          fromJson: _studentRecordGradeLevelIdValue)
      int? gradeLevelId,
      @JsonKey(
          readValue: _studentRecordGradeLevelName,
          fromJson: _studentRecordGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(name: 'joined_at', fromJson: jsonStringLenient) String? joinedAt,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuzId,
          fromJson: _studentRecordQuranCurrentJuzIdValue)
      int? quranCurrentJuzId,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuz,
          fromJson: _studentRecordQuranCurrentJuzValue)
      int? quranCurrentJuz,
      @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
      String? schoolName,
      @JsonKey(
          readValue: _studentRecordHasPhoto,
          fromJson: _studentRecordHasPhotoValue)
      bool? hasPhoto});
}

/// @nodoc
class _$StudentRecordModelCopyWithImpl<$Res, $Val extends StudentRecordModel>
    implements $StudentRecordModelCopyWith<$Res> {
  _$StudentRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? studentNumber = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? status = freezed,
    Object? parentId = freezed,
    Object? parentName = freezed,
    Object? gradeLevelId = freezed,
    Object? gradeLevelName = freezed,
    Object? joinedAt = freezed,
    Object? notes = freezed,
    Object? quranCurrentJuzId = freezed,
    Object? quranCurrentJuz = freezed,
    Object? schoolName = freezed,
    Object? hasPhoto = freezed,
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelId: freezed == gradeLevelId
          ? _value.gradeLevelId
          : gradeLevelId // ignore: cast_nullable_to_non_nullable
              as int?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuzId: freezed == quranCurrentJuzId
          ? _value.quranCurrentJuzId
          : quranCurrentJuzId // ignore: cast_nullable_to_non_nullable
              as int?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPhoto: freezed == hasPhoto
          ? _value.hasPhoto
          : hasPhoto // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentRecordModelImplCopyWith<$Res>
    implements $StudentRecordModelCopyWith<$Res> {
  factory _$$StudentRecordModelImplCopyWith(_$StudentRecordModelImpl value,
          $Res Function(_$StudentRecordModelImpl) then) =
      __$$StudentRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) String? lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      String? studentNumber,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
      String? birthDate,
      @JsonKey(fromJson: jsonStringLenient) String? gender,
      @JsonKey(
          readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
      String? status,
      @JsonKey(
          readValue: _studentRecordParentId,
          fromJson: _studentRecordParentIdValue)
      int? parentId,
      @JsonKey(
          readValue: _studentRecordParentName,
          fromJson: _studentRecordParentNameValue)
      String? parentName,
      @JsonKey(
          readValue: _studentRecordGradeLevelId,
          fromJson: _studentRecordGradeLevelIdValue)
      int? gradeLevelId,
      @JsonKey(
          readValue: _studentRecordGradeLevelName,
          fromJson: _studentRecordGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(name: 'joined_at', fromJson: jsonStringLenient) String? joinedAt,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuzId,
          fromJson: _studentRecordQuranCurrentJuzIdValue)
      int? quranCurrentJuzId,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuz,
          fromJson: _studentRecordQuranCurrentJuzValue)
      int? quranCurrentJuz,
      @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
      String? schoolName,
      @JsonKey(
          readValue: _studentRecordHasPhoto,
          fromJson: _studentRecordHasPhotoValue)
      bool? hasPhoto});
}

/// @nodoc
class __$$StudentRecordModelImplCopyWithImpl<$Res>
    extends _$StudentRecordModelCopyWithImpl<$Res, _$StudentRecordModelImpl>
    implements _$$StudentRecordModelImplCopyWith<$Res> {
  __$$StudentRecordModelImplCopyWithImpl(_$StudentRecordModelImpl _value,
      $Res Function(_$StudentRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? studentNumber = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? status = freezed,
    Object? parentId = freezed,
    Object? parentName = freezed,
    Object? gradeLevelId = freezed,
    Object? gradeLevelName = freezed,
    Object? joinedAt = freezed,
    Object? notes = freezed,
    Object? quranCurrentJuzId = freezed,
    Object? quranCurrentJuz = freezed,
    Object? schoolName = freezed,
    Object? hasPhoto = freezed,
  }) {
    return _then(_$StudentRecordModelImpl(
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelId: freezed == gradeLevelId
          ? _value.gradeLevelId
          : gradeLevelId // ignore: cast_nullable_to_non_nullable
              as int?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuzId: freezed == quranCurrentJuzId
          ? _value.quranCurrentJuzId
          : quranCurrentJuzId // ignore: cast_nullable_to_non_nullable
              as int?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPhoto: freezed == hasPhoto
          ? _value.hasPhoto
          : hasPhoto // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentRecordModelImpl implements _StudentRecordModel {
  const _$StudentRecordModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue) this.firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue) this.lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      this.studentNumber,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient) this.birthDate,
      @JsonKey(fromJson: jsonStringLenient) this.gender,
      @JsonKey(
          readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
      this.status,
      @JsonKey(
          readValue: _studentRecordParentId,
          fromJson: _studentRecordParentIdValue)
      this.parentId,
      @JsonKey(
          readValue: _studentRecordParentName,
          fromJson: _studentRecordParentNameValue)
      this.parentName,
      @JsonKey(
          readValue: _studentRecordGradeLevelId,
          fromJson: _studentRecordGradeLevelIdValue)
      this.gradeLevelId,
      @JsonKey(
          readValue: _studentRecordGradeLevelName,
          fromJson: _studentRecordGradeLevelNameValue)
      this.gradeLevelName,
      @JsonKey(name: 'joined_at', fromJson: jsonStringLenient) this.joinedAt,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuzId,
          fromJson: _studentRecordQuranCurrentJuzIdValue)
      this.quranCurrentJuzId,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuz,
          fromJson: _studentRecordQuranCurrentJuzValue)
      this.quranCurrentJuz,
      @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
      this.schoolName,
      @JsonKey(
          readValue: _studentRecordHasPhoto,
          fromJson: _studentRecordHasPhotoValue)
      this.hasPhoto});

  factory _$StudentRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentRecordModelImplFromJson(json);

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
  @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
  final String? birthDate;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? gender;
  @override
  @JsonKey(readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _studentRecordParentId, fromJson: _studentRecordParentIdValue)
  final int? parentId;
  @override
  @JsonKey(
      readValue: _studentRecordParentName,
      fromJson: _studentRecordParentNameValue)
  final String? parentName;
  @override
  @JsonKey(
      readValue: _studentRecordGradeLevelId,
      fromJson: _studentRecordGradeLevelIdValue)
  final int? gradeLevelId;
  @override
  @JsonKey(
      readValue: _studentRecordGradeLevelName,
      fromJson: _studentRecordGradeLevelNameValue)
  final String? gradeLevelName;
  @override
  @JsonKey(name: 'joined_at', fromJson: jsonStringLenient)
  final String? joinedAt;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(
      readValue: _studentRecordQuranCurrentJuzId,
      fromJson: _studentRecordQuranCurrentJuzIdValue)
  final int? quranCurrentJuzId;
  @override
  @JsonKey(
      readValue: _studentRecordQuranCurrentJuz,
      fromJson: _studentRecordQuranCurrentJuzValue)
  final int? quranCurrentJuz;
  @override
  @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
  final String? schoolName;
  @override
  @JsonKey(
      readValue: _studentRecordHasPhoto, fromJson: _studentRecordHasPhotoValue)
  final bool? hasPhoto;

  @override
  String toString() {
    return 'StudentRecordModel(id: $id, firstName: $firstName, lastName: $lastName, studentNumber: $studentNumber, birthDate: $birthDate, gender: $gender, status: $status, parentId: $parentId, parentName: $parentName, gradeLevelId: $gradeLevelId, gradeLevelName: $gradeLevelName, joinedAt: $joinedAt, notes: $notes, quranCurrentJuzId: $quranCurrentJuzId, quranCurrentJuz: $quranCurrentJuz, schoolName: $schoolName, hasPhoto: $hasPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.gradeLevelId, gradeLevelId) ||
                other.gradeLevelId == gradeLevelId) &&
            (identical(other.gradeLevelName, gradeLevelName) ||
                other.gradeLevelName == gradeLevelName) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.quranCurrentJuzId, quranCurrentJuzId) ||
                other.quranCurrentJuzId == quranCurrentJuzId) &&
            (identical(other.quranCurrentJuz, quranCurrentJuz) ||
                other.quranCurrentJuz == quranCurrentJuz) &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            (identical(other.hasPhoto, hasPhoto) ||
                other.hasPhoto == hasPhoto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      studentNumber,
      birthDate,
      gender,
      status,
      parentId,
      parentName,
      gradeLevelId,
      gradeLevelName,
      joinedAt,
      notes,
      quranCurrentJuzId,
      quranCurrentJuz,
      schoolName,
      hasPhoto);

  /// Create a copy of StudentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentRecordModelImplCopyWith<_$StudentRecordModelImpl> get copyWith =>
      __$$StudentRecordModelImplCopyWithImpl<_$StudentRecordModelImpl>(
          this, _$identity);
}

abstract class _StudentRecordModel implements StudentRecordModel {
  const factory _StudentRecordModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'first_name', fromJson: jsonStringValue)
      final String? firstName,
      @JsonKey(name: 'last_name', fromJson: jsonStringValue)
      final String? lastName,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      final String? studentNumber,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
      final String? birthDate,
      @JsonKey(fromJson: jsonStringLenient) final String? gender,
      @JsonKey(
          readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
      final String? status,
      @JsonKey(
          readValue: _studentRecordParentId,
          fromJson: _studentRecordParentIdValue)
      final int? parentId,
      @JsonKey(
          readValue: _studentRecordParentName,
          fromJson: _studentRecordParentNameValue)
      final String? parentName,
      @JsonKey(
          readValue: _studentRecordGradeLevelId,
          fromJson: _studentRecordGradeLevelIdValue)
      final int? gradeLevelId,
      @JsonKey(
          readValue: _studentRecordGradeLevelName,
          fromJson: _studentRecordGradeLevelNameValue)
      final String? gradeLevelName,
      @JsonKey(name: 'joined_at', fromJson: jsonStringLenient)
      final String? joinedAt,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuzId,
          fromJson: _studentRecordQuranCurrentJuzIdValue)
      final int? quranCurrentJuzId,
      @JsonKey(
          readValue: _studentRecordQuranCurrentJuz,
          fromJson: _studentRecordQuranCurrentJuzValue)
      final int? quranCurrentJuz,
      @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
      final String? schoolName,
      @JsonKey(
          readValue: _studentRecordHasPhoto,
          fromJson: _studentRecordHasPhotoValue)
      final bool? hasPhoto}) = _$StudentRecordModelImpl;

  factory _StudentRecordModel.fromJson(Map<String, dynamic> json) =
      _$StudentRecordModelImpl.fromJson;

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
  @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
  String? get birthDate;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get gender;
  @override
  @JsonKey(readValue: _studentRecordStatus, fromJson: _studentRecordStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _studentRecordParentId, fromJson: _studentRecordParentIdValue)
  int? get parentId;
  @override
  @JsonKey(
      readValue: _studentRecordParentName,
      fromJson: _studentRecordParentNameValue)
  String? get parentName;
  @override
  @JsonKey(
      readValue: _studentRecordGradeLevelId,
      fromJson: _studentRecordGradeLevelIdValue)
  int? get gradeLevelId;
  @override
  @JsonKey(
      readValue: _studentRecordGradeLevelName,
      fromJson: _studentRecordGradeLevelNameValue)
  String? get gradeLevelName;
  @override
  @JsonKey(name: 'joined_at', fromJson: jsonStringLenient)
  String? get joinedAt;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(
      readValue: _studentRecordQuranCurrentJuzId,
      fromJson: _studentRecordQuranCurrentJuzIdValue)
  int? get quranCurrentJuzId;
  @override
  @JsonKey(
      readValue: _studentRecordQuranCurrentJuz,
      fromJson: _studentRecordQuranCurrentJuzValue)
  int? get quranCurrentJuz;
  @override
  @JsonKey(name: 'school_name', fromJson: jsonStringLenient)
  String? get schoolName;
  @override
  @JsonKey(
      readValue: _studentRecordHasPhoto, fromJson: _studentRecordHasPhotoValue)
  bool? get hasPhoto;

  /// Create a copy of StudentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentRecordModelImplCopyWith<_$StudentRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnrollmentRecordModel _$EnrollmentRecordModelFromJson(
    Map<String, dynamic> json) {
  return _EnrollmentRecordModel.fromJson(json);
}

/// @nodoc
mixin _$EnrollmentRecordModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
  String? get enrolledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'left_at', fromJson: jsonStringLenient)
  String? get leftAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_points', fromJson: jsonIntLenient)
  int? get finalPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
  int? get memorizedPages => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentRecordGroupId,
      fromJson: _enrollmentRecordGroupIdValue)
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentRecordGroupName,
      fromJson: _enrollmentRecordGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentRecordCourseName,
      fromJson: _enrollmentRecordCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentRecordStudentId,
      fromJson: _enrollmentRecordStudentIdValue)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentRecordStudentName,
      fromJson: _enrollmentRecordStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentRecordParentName,
      fromJson: _enrollmentRecordParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;

  /// Create a copy of EnrollmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentRecordModelCopyWith<EnrollmentRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentRecordModelCopyWith<$Res> {
  factory $EnrollmentRecordModelCopyWith(EnrollmentRecordModel value,
          $Res Function(EnrollmentRecordModel) then) =
      _$EnrollmentRecordModelCopyWithImpl<$Res, EnrollmentRecordModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
      String? enrolledAt,
      @JsonKey(name: 'left_at', fromJson: jsonStringLenient) String? leftAt,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'final_points', fromJson: jsonIntLenient) int? finalPoints,
      @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
      int? memorizedPages,
      @JsonKey(
          readValue: _enrollmentRecordGroupId,
          fromJson: _enrollmentRecordGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _enrollmentRecordGroupName,
          fromJson: _enrollmentRecordGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _enrollmentRecordCourseName,
          fromJson: _enrollmentRecordCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _enrollmentRecordStudentId,
          fromJson: _enrollmentRecordStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _enrollmentRecordStudentName,
          fromJson: _enrollmentRecordStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _enrollmentRecordParentName,
          fromJson: _enrollmentRecordParentNameValue)
      String? parentName});
}

/// @nodoc
class _$EnrollmentRecordModelCopyWithImpl<$Res,
        $Val extends EnrollmentRecordModel>
    implements $EnrollmentRecordModelCopyWith<$Res> {
  _$EnrollmentRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
    Object? leftAt = freezed,
    Object? notes = freezed,
    Object? finalPoints = freezed,
    Object? memorizedPages = freezed,
    Object? groupId = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? parentName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      leftAt: freezed == leftAt
          ? _value.leftAt
          : leftAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      finalPoints: freezed == finalPoints
          ? _value.finalPoints
          : finalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnrollmentRecordModelImplCopyWith<$Res>
    implements $EnrollmentRecordModelCopyWith<$Res> {
  factory _$$EnrollmentRecordModelImplCopyWith(
          _$EnrollmentRecordModelImpl value,
          $Res Function(_$EnrollmentRecordModelImpl) then) =
      __$$EnrollmentRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
      String? enrolledAt,
      @JsonKey(name: 'left_at', fromJson: jsonStringLenient) String? leftAt,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'final_points', fromJson: jsonIntLenient) int? finalPoints,
      @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
      int? memorizedPages,
      @JsonKey(
          readValue: _enrollmentRecordGroupId,
          fromJson: _enrollmentRecordGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _enrollmentRecordGroupName,
          fromJson: _enrollmentRecordGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _enrollmentRecordCourseName,
          fromJson: _enrollmentRecordCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _enrollmentRecordStudentId,
          fromJson: _enrollmentRecordStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _enrollmentRecordStudentName,
          fromJson: _enrollmentRecordStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _enrollmentRecordParentName,
          fromJson: _enrollmentRecordParentNameValue)
      String? parentName});
}

/// @nodoc
class __$$EnrollmentRecordModelImplCopyWithImpl<$Res>
    extends _$EnrollmentRecordModelCopyWithImpl<$Res,
        _$EnrollmentRecordModelImpl>
    implements _$$EnrollmentRecordModelImplCopyWith<$Res> {
  __$$EnrollmentRecordModelImplCopyWithImpl(_$EnrollmentRecordModelImpl _value,
      $Res Function(_$EnrollmentRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnrollmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
    Object? leftAt = freezed,
    Object? notes = freezed,
    Object? finalPoints = freezed,
    Object? memorizedPages = freezed,
    Object? groupId = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? parentName = freezed,
  }) {
    return _then(_$EnrollmentRecordModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      leftAt: freezed == leftAt
          ? _value.leftAt
          : leftAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      finalPoints: freezed == finalPoints
          ? _value.finalPoints
          : finalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EnrollmentRecordModelImpl implements _EnrollmentRecordModel {
  const _$EnrollmentRecordModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
      this.enrolledAt,
      @JsonKey(name: 'left_at', fromJson: jsonStringLenient) this.leftAt,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(name: 'final_points', fromJson: jsonIntLenient) this.finalPoints,
      @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
      this.memorizedPages,
      @JsonKey(
          readValue: _enrollmentRecordGroupId,
          fromJson: _enrollmentRecordGroupIdValue)
      this.groupId,
      @JsonKey(
          readValue: _enrollmentRecordGroupName,
          fromJson: _enrollmentRecordGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _enrollmentRecordCourseName,
          fromJson: _enrollmentRecordCourseNameValue)
      this.courseName,
      @JsonKey(
          readValue: _enrollmentRecordStudentId,
          fromJson: _enrollmentRecordStudentIdValue)
      this.studentId,
      @JsonKey(
          readValue: _enrollmentRecordStudentName,
          fromJson: _enrollmentRecordStudentNameValue)
      this.studentName,
      @JsonKey(
          readValue: _enrollmentRecordParentName,
          fromJson: _enrollmentRecordParentNameValue)
      this.parentName});

  factory _$EnrollmentRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentRecordModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
  final String? enrolledAt;
  @override
  @JsonKey(name: 'left_at', fromJson: jsonStringLenient)
  final String? leftAt;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(name: 'final_points', fromJson: jsonIntLenient)
  final int? finalPoints;
  @override
  @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
  final int? memorizedPages;
  @override
  @JsonKey(
      readValue: _enrollmentRecordGroupId,
      fromJson: _enrollmentRecordGroupIdValue)
  final int? groupId;
  @override
  @JsonKey(
      readValue: _enrollmentRecordGroupName,
      fromJson: _enrollmentRecordGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _enrollmentRecordCourseName,
      fromJson: _enrollmentRecordCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(
      readValue: _enrollmentRecordStudentId,
      fromJson: _enrollmentRecordStudentIdValue)
  final int? studentId;
  @override
  @JsonKey(
      readValue: _enrollmentRecordStudentName,
      fromJson: _enrollmentRecordStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(
      readValue: _enrollmentRecordParentName,
      fromJson: _enrollmentRecordParentNameValue)
  final String? parentName;

  @override
  String toString() {
    return 'EnrollmentRecordModel(id: $id, status: $status, enrolledAt: $enrolledAt, leftAt: $leftAt, notes: $notes, finalPoints: $finalPoints, memorizedPages: $memorizedPages, groupId: $groupId, groupName: $groupName, courseName: $courseName, studentId: $studentId, studentName: $studentName, parentName: $parentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.finalPoints, finalPoints) ||
                other.finalPoints == finalPoints) &&
            (identical(other.memorizedPages, memorizedPages) ||
                other.memorizedPages == memorizedPages) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      enrolledAt,
      leftAt,
      notes,
      finalPoints,
      memorizedPages,
      groupId,
      groupName,
      courseName,
      studentId,
      studentName,
      parentName);

  /// Create a copy of EnrollmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentRecordModelImplCopyWith<_$EnrollmentRecordModelImpl>
      get copyWith => __$$EnrollmentRecordModelImplCopyWithImpl<
          _$EnrollmentRecordModelImpl>(this, _$identity);
}

abstract class _EnrollmentRecordModel implements EnrollmentRecordModel {
  const factory _EnrollmentRecordModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
      final String? enrolledAt,
      @JsonKey(name: 'left_at', fromJson: jsonStringLenient)
      final String? leftAt,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(name: 'final_points', fromJson: jsonIntLenient)
      final int? finalPoints,
      @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
      final int? memorizedPages,
      @JsonKey(
          readValue: _enrollmentRecordGroupId,
          fromJson: _enrollmentRecordGroupIdValue)
      final int? groupId,
      @JsonKey(
          readValue: _enrollmentRecordGroupName,
          fromJson: _enrollmentRecordGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _enrollmentRecordCourseName,
          fromJson: _enrollmentRecordCourseNameValue)
      final String? courseName,
      @JsonKey(
          readValue: _enrollmentRecordStudentId,
          fromJson: _enrollmentRecordStudentIdValue)
      final int? studentId,
      @JsonKey(
          readValue: _enrollmentRecordStudentName,
          fromJson: _enrollmentRecordStudentNameValue)
      final String? studentName,
      @JsonKey(
          readValue: _enrollmentRecordParentName,
          fromJson: _enrollmentRecordParentNameValue)
      final String? parentName}) = _$EnrollmentRecordModelImpl;

  factory _EnrollmentRecordModel.fromJson(Map<String, dynamic> json) =
      _$EnrollmentRecordModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
  String? get enrolledAt;
  @override
  @JsonKey(name: 'left_at', fromJson: jsonStringLenient)
  String? get leftAt;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(name: 'final_points', fromJson: jsonIntLenient)
  int? get finalPoints;
  @override
  @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
  int? get memorizedPages;
  @override
  @JsonKey(
      readValue: _enrollmentRecordGroupId,
      fromJson: _enrollmentRecordGroupIdValue)
  int? get groupId;
  @override
  @JsonKey(
      readValue: _enrollmentRecordGroupName,
      fromJson: _enrollmentRecordGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _enrollmentRecordCourseName,
      fromJson: _enrollmentRecordCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(
      readValue: _enrollmentRecordStudentId,
      fromJson: _enrollmentRecordStudentIdValue)
  int? get studentId;
  @override
  @JsonKey(
      readValue: _enrollmentRecordStudentName,
      fromJson: _enrollmentRecordStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(
      readValue: _enrollmentRecordParentName,
      fromJson: _enrollmentRecordParentNameValue)
  String? get parentName;

  /// Create a copy of EnrollmentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentRecordModelImplCopyWith<_$EnrollmentRecordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GroupRecordModel _$GroupRecordModelFromJson(Map<String, dynamic> json) {
  return _GroupRecordModel.fromJson(json);
}

/// @nodoc
mixin _$GroupRecordModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
  int? get academicYearId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id', fromJson: jsonIntLenient)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  int? get teacherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
  int? get assistantTeacherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
  int? get gradeLevelId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonIntLenient)
  int? get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
  double? get monthlyFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
  String? get startsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
  String? get endsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;

  /// Create a copy of GroupRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupRecordModelCopyWith<GroupRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupRecordModelCopyWith<$Res> {
  factory $GroupRecordModelCopyWith(
          GroupRecordModel value, $Res Function(GroupRecordModel) then) =
      _$GroupRecordModelCopyWithImpl<$Res, GroupRecordModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      int? academicYearId,
      @JsonKey(name: 'course_id', fromJson: jsonIntLenient) int? courseId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
      int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
      int? gradeLevelId,
      @JsonKey(fromJson: jsonIntLenient) int? capacity,
      @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
      double? monthlyFee,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) String? startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) String? endsOn,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive});
}

/// @nodoc
class _$GroupRecordModelCopyWithImpl<$Res, $Val extends GroupRecordModel>
    implements $GroupRecordModelCopyWith<$Res> {
  _$GroupRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? academicYearId = freezed,
    Object? courseId = freezed,
    Object? teacherId = freezed,
    Object? assistantTeacherId = freezed,
    Object? gradeLevelId = freezed,
    Object? capacity = freezed,
    Object? monthlyFee = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
    Object? isActive = freezed,
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
      academicYearId: freezed == academicYearId
          ? _value.academicYearId
          : academicYearId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      assistantTeacherId: freezed == assistantTeacherId
          ? _value.assistantTeacherId
          : assistantTeacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      gradeLevelId: freezed == gradeLevelId
          ? _value.gradeLevelId
          : gradeLevelId // ignore: cast_nullable_to_non_nullable
              as int?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyFee: freezed == monthlyFee
          ? _value.monthlyFee
          : monthlyFee // ignore: cast_nullable_to_non_nullable
              as double?,
      startsOn: freezed == startsOn
          ? _value.startsOn
          : startsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupRecordModelImplCopyWith<$Res>
    implements $GroupRecordModelCopyWith<$Res> {
  factory _$$GroupRecordModelImplCopyWith(_$GroupRecordModelImpl value,
          $Res Function(_$GroupRecordModelImpl) then) =
      __$$GroupRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      int? academicYearId,
      @JsonKey(name: 'course_id', fromJson: jsonIntLenient) int? courseId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
      int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
      int? gradeLevelId,
      @JsonKey(fromJson: jsonIntLenient) int? capacity,
      @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
      double? monthlyFee,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) String? startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) String? endsOn,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive});
}

/// @nodoc
class __$$GroupRecordModelImplCopyWithImpl<$Res>
    extends _$GroupRecordModelCopyWithImpl<$Res, _$GroupRecordModelImpl>
    implements _$$GroupRecordModelImplCopyWith<$Res> {
  __$$GroupRecordModelImplCopyWithImpl(_$GroupRecordModelImpl _value,
      $Res Function(_$GroupRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? academicYearId = freezed,
    Object? courseId = freezed,
    Object? teacherId = freezed,
    Object? assistantTeacherId = freezed,
    Object? gradeLevelId = freezed,
    Object? capacity = freezed,
    Object? monthlyFee = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$GroupRecordModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYearId: freezed == academicYearId
          ? _value.academicYearId
          : academicYearId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      assistantTeacherId: freezed == assistantTeacherId
          ? _value.assistantTeacherId
          : assistantTeacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      gradeLevelId: freezed == gradeLevelId
          ? _value.gradeLevelId
          : gradeLevelId // ignore: cast_nullable_to_non_nullable
              as int?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      monthlyFee: freezed == monthlyFee
          ? _value.monthlyFee
          : monthlyFee // ignore: cast_nullable_to_non_nullable
              as double?,
      startsOn: freezed == startsOn
          ? _value.startsOn
          : startsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
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
class _$GroupRecordModelImpl implements _GroupRecordModel {
  const _$GroupRecordModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      this.academicYearId,
      @JsonKey(name: 'course_id', fromJson: jsonIntLenient) this.courseId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) this.teacherId,
      @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
      this.assistantTeacherId,
      @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
      this.gradeLevelId,
      @JsonKey(fromJson: jsonIntLenient) this.capacity,
      @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
      this.monthlyFee,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient) this.startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient) this.endsOn,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive});

  factory _$GroupRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupRecordModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
  final int? academicYearId;
  @override
  @JsonKey(name: 'course_id', fromJson: jsonIntLenient)
  final int? courseId;
  @override
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  final int? teacherId;
  @override
  @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
  final int? assistantTeacherId;
  @override
  @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
  final int? gradeLevelId;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? capacity;
  @override
  @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
  final double? monthlyFee;
  @override
  @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
  final String? startsOn;
  @override
  @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
  final String? endsOn;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;

  @override
  String toString() {
    return 'GroupRecordModel(id: $id, name: $name, academicYearId: $academicYearId, courseId: $courseId, teacherId: $teacherId, assistantTeacherId: $assistantTeacherId, gradeLevelId: $gradeLevelId, capacity: $capacity, monthlyFee: $monthlyFee, startsOn: $startsOn, endsOn: $endsOn, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYearId, academicYearId) ||
                other.academicYearId == academicYearId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.assistantTeacherId, assistantTeacherId) ||
                other.assistantTeacherId == assistantTeacherId) &&
            (identical(other.gradeLevelId, gradeLevelId) ||
                other.gradeLevelId == gradeLevelId) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.monthlyFee, monthlyFee) ||
                other.monthlyFee == monthlyFee) &&
            (identical(other.startsOn, startsOn) ||
                other.startsOn == startsOn) &&
            (identical(other.endsOn, endsOn) || other.endsOn == endsOn) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      academicYearId,
      courseId,
      teacherId,
      assistantTeacherId,
      gradeLevelId,
      capacity,
      monthlyFee,
      startsOn,
      endsOn,
      isActive);

  /// Create a copy of GroupRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupRecordModelImplCopyWith<_$GroupRecordModelImpl> get copyWith =>
      __$$GroupRecordModelImplCopyWithImpl<_$GroupRecordModelImpl>(
          this, _$identity);
}

abstract class _GroupRecordModel implements GroupRecordModel {
  const factory _GroupRecordModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
      final int? academicYearId,
      @JsonKey(name: 'course_id', fromJson: jsonIntLenient) final int? courseId,
      @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
      final int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
      final int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
      final int? gradeLevelId,
      @JsonKey(fromJson: jsonIntLenient) final int? capacity,
      @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
      final double? monthlyFee,
      @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
      final String? startsOn,
      @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
      final String? endsOn,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive}) = _$GroupRecordModelImpl;

  factory _GroupRecordModel.fromJson(Map<String, dynamic> json) =
      _$GroupRecordModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(name: 'academic_year_id', fromJson: jsonIntLenient)
  int? get academicYearId;
  @override
  @JsonKey(name: 'course_id', fromJson: jsonIntLenient)
  int? get courseId;
  @override
  @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient)
  int? get teacherId;
  @override
  @JsonKey(name: 'assistant_teacher_id', fromJson: jsonIntLenient)
  int? get assistantTeacherId;
  @override
  @JsonKey(name: 'grade_level_id', fromJson: jsonIntLenient)
  int? get gradeLevelId;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get capacity;
  @override
  @JsonKey(name: 'monthly_fee', fromJson: jsonDoubleLenient)
  double? get monthlyFee;
  @override
  @JsonKey(name: 'starts_on', fromJson: jsonStringLenient)
  String? get startsOn;
  @override
  @JsonKey(name: 'ends_on', fromJson: jsonStringLenient)
  String? get endsOn;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;

  /// Create a copy of GroupRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupRecordModelImplCopyWith<_$GroupRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
