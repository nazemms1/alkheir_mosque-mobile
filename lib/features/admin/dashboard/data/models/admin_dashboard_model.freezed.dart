// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminGroupItemModel _$AdminGroupItemModelFromJson(Map<String, dynamic> json) {
  return _AdminGroupItemModel.fromJson(json);
}

/// @nodoc
mixin _$AdminGroupItemModel {
  @JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemTeacher, fromJson: _adminGroupItemTeacherValue)
  String? get teacher => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemAssistantTeacher,
      fromJson: _adminGroupItemAssistantTeacherValue)
  String? get assistantTeacher => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemCourse, fromJson: _adminGroupItemCourseValue)
  String? get course => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemAcademicYear,
      fromJson: _adminGroupItemAcademicYearValue)
  String? get academicYear => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemEnrollmentsCount,
      fromJson: _adminGroupItemEnrollmentsCountValue)
  int? get enrollmentsCount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemIsActive,
      fromJson: _adminGroupItemIsActiveValue)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemStartsOn,
      fromJson: _adminGroupItemStartsOnValue)
  String? get startsOn => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminGroupItemEndsOn, fromJson: _adminGroupItemEndsOnValue)
  String? get endsOn => throw _privateConstructorUsedError;

  /// Create a copy of AdminGroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminGroupItemModelCopyWith<AdminGroupItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminGroupItemModelCopyWith<$Res> {
  factory $AdminGroupItemModelCopyWith(
          AdminGroupItemModel value, $Res Function(AdminGroupItemModel) then) =
      _$AdminGroupItemModelCopyWithImpl<$Res, AdminGroupItemModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
      String? name,
      @JsonKey(
          readValue: _adminGroupItemTeacher,
          fromJson: _adminGroupItemTeacherValue)
      String? teacher,
      @JsonKey(
          readValue: _adminGroupItemAssistantTeacher,
          fromJson: _adminGroupItemAssistantTeacherValue)
      String? assistantTeacher,
      @JsonKey(
          readValue: _adminGroupItemCourse,
          fromJson: _adminGroupItemCourseValue)
      String? course,
      @JsonKey(
          readValue: _adminGroupItemAcademicYear,
          fromJson: _adminGroupItemAcademicYearValue)
      String? academicYear,
      @JsonKey(
          readValue: _adminGroupItemEnrollmentsCount,
          fromJson: _adminGroupItemEnrollmentsCountValue)
      int? enrollmentsCount,
      @JsonKey(
          readValue: _adminGroupItemIsActive,
          fromJson: _adminGroupItemIsActiveValue)
      bool? isActive,
      @JsonKey(
          readValue: _adminGroupItemStartsOn,
          fromJson: _adminGroupItemStartsOnValue)
      String? startsOn,
      @JsonKey(
          readValue: _adminGroupItemEndsOn,
          fromJson: _adminGroupItemEndsOnValue)
      String? endsOn});
}

/// @nodoc
class _$AdminGroupItemModelCopyWithImpl<$Res, $Val extends AdminGroupItemModel>
    implements $AdminGroupItemModelCopyWith<$Res> {
  _$AdminGroupItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminGroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? teacher = freezed,
    Object? assistantTeacher = freezed,
    Object? course = freezed,
    Object? academicYear = freezed,
    Object? enrollmentsCount = freezed,
    Object? isActive = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
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
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      assistantTeacher: freezed == assistantTeacher
          ? _value.assistantTeacher
          : assistantTeacher // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      startsOn: freezed == startsOn
          ? _value.startsOn
          : startsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminGroupItemModelImplCopyWith<$Res>
    implements $AdminGroupItemModelCopyWith<$Res> {
  factory _$$AdminGroupItemModelImplCopyWith(_$AdminGroupItemModelImpl value,
          $Res Function(_$AdminGroupItemModelImpl) then) =
      __$$AdminGroupItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
      String? name,
      @JsonKey(
          readValue: _adminGroupItemTeacher,
          fromJson: _adminGroupItemTeacherValue)
      String? teacher,
      @JsonKey(
          readValue: _adminGroupItemAssistantTeacher,
          fromJson: _adminGroupItemAssistantTeacherValue)
      String? assistantTeacher,
      @JsonKey(
          readValue: _adminGroupItemCourse,
          fromJson: _adminGroupItemCourseValue)
      String? course,
      @JsonKey(
          readValue: _adminGroupItemAcademicYear,
          fromJson: _adminGroupItemAcademicYearValue)
      String? academicYear,
      @JsonKey(
          readValue: _adminGroupItemEnrollmentsCount,
          fromJson: _adminGroupItemEnrollmentsCountValue)
      int? enrollmentsCount,
      @JsonKey(
          readValue: _adminGroupItemIsActive,
          fromJson: _adminGroupItemIsActiveValue)
      bool? isActive,
      @JsonKey(
          readValue: _adminGroupItemStartsOn,
          fromJson: _adminGroupItemStartsOnValue)
      String? startsOn,
      @JsonKey(
          readValue: _adminGroupItemEndsOn,
          fromJson: _adminGroupItemEndsOnValue)
      String? endsOn});
}

/// @nodoc
class __$$AdminGroupItemModelImplCopyWithImpl<$Res>
    extends _$AdminGroupItemModelCopyWithImpl<$Res, _$AdminGroupItemModelImpl>
    implements _$$AdminGroupItemModelImplCopyWith<$Res> {
  __$$AdminGroupItemModelImplCopyWithImpl(_$AdminGroupItemModelImpl _value,
      $Res Function(_$AdminGroupItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminGroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? teacher = freezed,
    Object? assistantTeacher = freezed,
    Object? course = freezed,
    Object? academicYear = freezed,
    Object? enrollmentsCount = freezed,
    Object? isActive = freezed,
    Object? startsOn = freezed,
    Object? endsOn = freezed,
  }) {
    return _then(_$AdminGroupItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      assistantTeacher: freezed == assistantTeacher
          ? _value.assistantTeacher
          : assistantTeacher // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      startsOn: freezed == startsOn
          ? _value.startsOn
          : startsOn // ignore: cast_nullable_to_non_nullable
              as String?,
      endsOn: freezed == endsOn
          ? _value.endsOn
          : endsOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AdminGroupItemModelImpl implements _AdminGroupItemModel {
  const _$AdminGroupItemModelImpl(
      {@JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
      this.id,
      @JsonKey(
          readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
      this.name,
      @JsonKey(
          readValue: _adminGroupItemTeacher,
          fromJson: _adminGroupItemTeacherValue)
      this.teacher,
      @JsonKey(
          readValue: _adminGroupItemAssistantTeacher,
          fromJson: _adminGroupItemAssistantTeacherValue)
      this.assistantTeacher,
      @JsonKey(
          readValue: _adminGroupItemCourse,
          fromJson: _adminGroupItemCourseValue)
      this.course,
      @JsonKey(
          readValue: _adminGroupItemAcademicYear,
          fromJson: _adminGroupItemAcademicYearValue)
      this.academicYear,
      @JsonKey(
          readValue: _adminGroupItemEnrollmentsCount,
          fromJson: _adminGroupItemEnrollmentsCountValue)
      this.enrollmentsCount,
      @JsonKey(
          readValue: _adminGroupItemIsActive,
          fromJson: _adminGroupItemIsActiveValue)
      this.isActive,
      @JsonKey(
          readValue: _adminGroupItemStartsOn,
          fromJson: _adminGroupItemStartsOnValue)
      this.startsOn,
      @JsonKey(
          readValue: _adminGroupItemEndsOn,
          fromJson: _adminGroupItemEndsOnValue)
      this.endsOn});

  factory _$AdminGroupItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminGroupItemModelImplFromJson(json);

  @override
  @JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
  final String? name;
  @override
  @JsonKey(
      readValue: _adminGroupItemTeacher, fromJson: _adminGroupItemTeacherValue)
  final String? teacher;
  @override
  @JsonKey(
      readValue: _adminGroupItemAssistantTeacher,
      fromJson: _adminGroupItemAssistantTeacherValue)
  final String? assistantTeacher;
  @override
  @JsonKey(
      readValue: _adminGroupItemCourse, fromJson: _adminGroupItemCourseValue)
  final String? course;
  @override
  @JsonKey(
      readValue: _adminGroupItemAcademicYear,
      fromJson: _adminGroupItemAcademicYearValue)
  final String? academicYear;
  @override
  @JsonKey(
      readValue: _adminGroupItemEnrollmentsCount,
      fromJson: _adminGroupItemEnrollmentsCountValue)
  final int? enrollmentsCount;
  @override
  @JsonKey(
      readValue: _adminGroupItemIsActive,
      fromJson: _adminGroupItemIsActiveValue)
  final bool? isActive;
  @override
  @JsonKey(
      readValue: _adminGroupItemStartsOn,
      fromJson: _adminGroupItemStartsOnValue)
  final String? startsOn;
  @override
  @JsonKey(
      readValue: _adminGroupItemEndsOn, fromJson: _adminGroupItemEndsOnValue)
  final String? endsOn;

  @override
  String toString() {
    return 'AdminGroupItemModel(id: $id, name: $name, teacher: $teacher, assistantTeacher: $assistantTeacher, course: $course, academicYear: $academicYear, enrollmentsCount: $enrollmentsCount, isActive: $isActive, startsOn: $startsOn, endsOn: $endsOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminGroupItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.assistantTeacher, assistantTeacher) ||
                other.assistantTeacher == assistantTeacher) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.enrollmentsCount, enrollmentsCount) ||
                other.enrollmentsCount == enrollmentsCount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.startsOn, startsOn) ||
                other.startsOn == startsOn) &&
            (identical(other.endsOn, endsOn) || other.endsOn == endsOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      teacher,
      assistantTeacher,
      course,
      academicYear,
      enrollmentsCount,
      isActive,
      startsOn,
      endsOn);

  /// Create a copy of AdminGroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminGroupItemModelImplCopyWith<_$AdminGroupItemModelImpl> get copyWith =>
      __$$AdminGroupItemModelImplCopyWithImpl<_$AdminGroupItemModelImpl>(
          this, _$identity);
}

abstract class _AdminGroupItemModel implements AdminGroupItemModel {
  const factory _AdminGroupItemModel(
      {@JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
      final String? name,
      @JsonKey(
          readValue: _adminGroupItemTeacher,
          fromJson: _adminGroupItemTeacherValue)
      final String? teacher,
      @JsonKey(
          readValue: _adminGroupItemAssistantTeacher,
          fromJson: _adminGroupItemAssistantTeacherValue)
      final String? assistantTeacher,
      @JsonKey(
          readValue: _adminGroupItemCourse,
          fromJson: _adminGroupItemCourseValue)
      final String? course,
      @JsonKey(
          readValue: _adminGroupItemAcademicYear,
          fromJson: _adminGroupItemAcademicYearValue)
      final String? academicYear,
      @JsonKey(
          readValue: _adminGroupItemEnrollmentsCount,
          fromJson: _adminGroupItemEnrollmentsCountValue)
      final int? enrollmentsCount,
      @JsonKey(
          readValue: _adminGroupItemIsActive,
          fromJson: _adminGroupItemIsActiveValue)
      final bool? isActive,
      @JsonKey(
          readValue: _adminGroupItemStartsOn,
          fromJson: _adminGroupItemStartsOnValue)
      final String? startsOn,
      @JsonKey(
          readValue: _adminGroupItemEndsOn,
          fromJson: _adminGroupItemEndsOnValue)
      final String? endsOn}) = _$AdminGroupItemModelImpl;

  factory _AdminGroupItemModel.fromJson(Map<String, dynamic> json) =
      _$AdminGroupItemModelImpl.fromJson;

  @override
  @JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
  String? get name;
  @override
  @JsonKey(
      readValue: _adminGroupItemTeacher, fromJson: _adminGroupItemTeacherValue)
  String? get teacher;
  @override
  @JsonKey(
      readValue: _adminGroupItemAssistantTeacher,
      fromJson: _adminGroupItemAssistantTeacherValue)
  String? get assistantTeacher;
  @override
  @JsonKey(
      readValue: _adminGroupItemCourse, fromJson: _adminGroupItemCourseValue)
  String? get course;
  @override
  @JsonKey(
      readValue: _adminGroupItemAcademicYear,
      fromJson: _adminGroupItemAcademicYearValue)
  String? get academicYear;
  @override
  @JsonKey(
      readValue: _adminGroupItemEnrollmentsCount,
      fromJson: _adminGroupItemEnrollmentsCountValue)
  int? get enrollmentsCount;
  @override
  @JsonKey(
      readValue: _adminGroupItemIsActive,
      fromJson: _adminGroupItemIsActiveValue)
  bool? get isActive;
  @override
  @JsonKey(
      readValue: _adminGroupItemStartsOn,
      fromJson: _adminGroupItemStartsOnValue)
  String? get startsOn;
  @override
  @JsonKey(
      readValue: _adminGroupItemEndsOn, fromJson: _adminGroupItemEndsOnValue)
  String? get endsOn;

  /// Create a copy of AdminGroupItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminGroupItemModelImplCopyWith<_$AdminGroupItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminStudentItemModel _$AdminStudentItemModelFromJson(
    Map<String, dynamic> json) {
  return _AdminStudentItemModel.fromJson(json);
}

/// @nodoc
mixin _$AdminStudentItemModel {
  @JsonKey(readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemFullName,
      fromJson: _adminStudentItemFullNameValue)
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemStudentNumber,
      fromJson: _adminStudentItemStudentNumberValue)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemGradeLevel,
      fromJson: _adminStudentItemGradeLevelValue)
  String? get gradeLevel => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemParent,
      fromJson: _adminStudentItemParentValue)
  String? get parent => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemSchoolName,
      fromJson: _adminStudentItemSchoolNameValue)
  String? get schoolName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemCurrentJuz,
      fromJson: _adminStudentItemCurrentJuzValue)
  int? get currentJuz => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemStatus,
      fromJson: _adminStudentItemStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemBirthDate,
      fromJson: _adminStudentItemBirthDateValue)
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemEnrollmentsCount,
      fromJson: _adminStudentItemEnrollmentsCountValue)
  int? get enrollmentsCount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemEnrollmentId,
      fromJson: _adminStudentItemEnrollmentIdValue)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentItemAttendanceStatusId,
      fromJson: _adminStudentItemAttendanceStatusIdValue)
  String? get attendanceStatusId => throw _privateConstructorUsedError;

  /// Create a copy of AdminStudentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminStudentItemModelCopyWith<AdminStudentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStudentItemModelCopyWith<$Res> {
  factory $AdminStudentItemModelCopyWith(AdminStudentItemModel value,
          $Res Function(AdminStudentItemModel) then) =
      _$AdminStudentItemModelCopyWithImpl<$Res, AdminStudentItemModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
      int? id,
      @JsonKey(readValue: _adminStudentItemFullName, fromJson: _adminStudentItemFullNameValue)
      String? fullName,
      @JsonKey(
          readValue: _adminStudentItemStudentNumber,
          fromJson: _adminStudentItemStudentNumberValue)
      String? studentNumber,
      @JsonKey(
          readValue: _adminStudentItemGradeLevel,
          fromJson: _adminStudentItemGradeLevelValue)
      String? gradeLevel,
      @JsonKey(readValue: _adminStudentItemParent, fromJson: _adminStudentItemParentValue)
      String? parent,
      @JsonKey(
          readValue: _adminStudentItemSchoolName,
          fromJson: _adminStudentItemSchoolNameValue)
      String? schoolName,
      @JsonKey(
          readValue: _adminStudentItemCurrentJuz,
          fromJson: _adminStudentItemCurrentJuzValue)
      int? currentJuz,
      @JsonKey(readValue: _adminStudentItemStatus, fromJson: _adminStudentItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _adminStudentItemBirthDate,
          fromJson: _adminStudentItemBirthDateValue)
      String? birthDate,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentsCount,
          fromJson: _adminStudentItemEnrollmentsCountValue)
      int? enrollmentsCount,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentId,
          fromJson: _adminStudentItemEnrollmentIdValue)
      int? enrollmentId,
      @JsonKey(
          readValue: _adminStudentItemAttendanceStatusId,
          fromJson: _adminStudentItemAttendanceStatusIdValue)
      String? attendanceStatusId});
}

/// @nodoc
class _$AdminStudentItemModelCopyWithImpl<$Res,
        $Val extends AdminStudentItemModel>
    implements $AdminStudentItemModelCopyWith<$Res> {
  _$AdminStudentItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminStudentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? studentNumber = freezed,
    Object? gradeLevel = freezed,
    Object? parent = freezed,
    Object? schoolName = freezed,
    Object? currentJuz = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? enrollmentsCount = freezed,
    Object? enrollmentId = freezed,
    Object? attendanceStatusId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentJuz: freezed == currentJuz
          ? _value.currentJuz
          : currentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminStudentItemModelImplCopyWith<$Res>
    implements $AdminStudentItemModelCopyWith<$Res> {
  factory _$$AdminStudentItemModelImplCopyWith(
          _$AdminStudentItemModelImpl value,
          $Res Function(_$AdminStudentItemModelImpl) then) =
      __$$AdminStudentItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
      int? id,
      @JsonKey(readValue: _adminStudentItemFullName, fromJson: _adminStudentItemFullNameValue)
      String? fullName,
      @JsonKey(
          readValue: _adminStudentItemStudentNumber,
          fromJson: _adminStudentItemStudentNumberValue)
      String? studentNumber,
      @JsonKey(
          readValue: _adminStudentItemGradeLevel,
          fromJson: _adminStudentItemGradeLevelValue)
      String? gradeLevel,
      @JsonKey(readValue: _adminStudentItemParent, fromJson: _adminStudentItemParentValue)
      String? parent,
      @JsonKey(
          readValue: _adminStudentItemSchoolName,
          fromJson: _adminStudentItemSchoolNameValue)
      String? schoolName,
      @JsonKey(
          readValue: _adminStudentItemCurrentJuz,
          fromJson: _adminStudentItemCurrentJuzValue)
      int? currentJuz,
      @JsonKey(readValue: _adminStudentItemStatus, fromJson: _adminStudentItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _adminStudentItemBirthDate,
          fromJson: _adminStudentItemBirthDateValue)
      String? birthDate,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentsCount,
          fromJson: _adminStudentItemEnrollmentsCountValue)
      int? enrollmentsCount,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentId,
          fromJson: _adminStudentItemEnrollmentIdValue)
      int? enrollmentId,
      @JsonKey(
          readValue: _adminStudentItemAttendanceStatusId,
          fromJson: _adminStudentItemAttendanceStatusIdValue)
      String? attendanceStatusId});
}

/// @nodoc
class __$$AdminStudentItemModelImplCopyWithImpl<$Res>
    extends _$AdminStudentItemModelCopyWithImpl<$Res,
        _$AdminStudentItemModelImpl>
    implements _$$AdminStudentItemModelImplCopyWith<$Res> {
  __$$AdminStudentItemModelImplCopyWithImpl(_$AdminStudentItemModelImpl _value,
      $Res Function(_$AdminStudentItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminStudentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? studentNumber = freezed,
    Object? gradeLevel = freezed,
    Object? parent = freezed,
    Object? schoolName = freezed,
    Object? currentJuz = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? enrollmentsCount = freezed,
    Object? enrollmentId = freezed,
    Object? attendanceStatusId = freezed,
  }) {
    return _then(_$AdminStudentItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      currentJuz: freezed == currentJuz
          ? _value.currentJuz
          : currentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentsCount: freezed == enrollmentsCount
          ? _value.enrollmentsCount
          : enrollmentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AdminStudentItemModelImpl implements _AdminStudentItemModel {
  const _$AdminStudentItemModelImpl(
      {@JsonKey(
          readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
      this.id,
      @JsonKey(
          readValue: _adminStudentItemFullName,
          fromJson: _adminStudentItemFullNameValue)
      this.fullName,
      @JsonKey(
          readValue: _adminStudentItemStudentNumber,
          fromJson: _adminStudentItemStudentNumberValue)
      this.studentNumber,
      @JsonKey(
          readValue: _adminStudentItemGradeLevel,
          fromJson: _adminStudentItemGradeLevelValue)
      this.gradeLevel,
      @JsonKey(
          readValue: _adminStudentItemParent,
          fromJson: _adminStudentItemParentValue)
      this.parent,
      @JsonKey(
          readValue: _adminStudentItemSchoolName,
          fromJson: _adminStudentItemSchoolNameValue)
      this.schoolName,
      @JsonKey(
          readValue: _adminStudentItemCurrentJuz,
          fromJson: _adminStudentItemCurrentJuzValue)
      this.currentJuz,
      @JsonKey(
          readValue: _adminStudentItemStatus,
          fromJson: _adminStudentItemStatusValue)
      this.status,
      @JsonKey(
          readValue: _adminStudentItemBirthDate,
          fromJson: _adminStudentItemBirthDateValue)
      this.birthDate,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentsCount,
          fromJson: _adminStudentItemEnrollmentsCountValue)
      this.enrollmentsCount,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentId,
          fromJson: _adminStudentItemEnrollmentIdValue)
      this.enrollmentId,
      @JsonKey(
          readValue: _adminStudentItemAttendanceStatusId,
          fromJson: _adminStudentItemAttendanceStatusIdValue)
      this.attendanceStatusId});

  factory _$AdminStudentItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminStudentItemModelImplFromJson(json);

  @override
  @JsonKey(readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _adminStudentItemFullName,
      fromJson: _adminStudentItemFullNameValue)
  final String? fullName;
  @override
  @JsonKey(
      readValue: _adminStudentItemStudentNumber,
      fromJson: _adminStudentItemStudentNumberValue)
  final String? studentNumber;
  @override
  @JsonKey(
      readValue: _adminStudentItemGradeLevel,
      fromJson: _adminStudentItemGradeLevelValue)
  final String? gradeLevel;
  @override
  @JsonKey(
      readValue: _adminStudentItemParent,
      fromJson: _adminStudentItemParentValue)
  final String? parent;
  @override
  @JsonKey(
      readValue: _adminStudentItemSchoolName,
      fromJson: _adminStudentItemSchoolNameValue)
  final String? schoolName;
  @override
  @JsonKey(
      readValue: _adminStudentItemCurrentJuz,
      fromJson: _adminStudentItemCurrentJuzValue)
  final int? currentJuz;
  @override
  @JsonKey(
      readValue: _adminStudentItemStatus,
      fromJson: _adminStudentItemStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _adminStudentItemBirthDate,
      fromJson: _adminStudentItemBirthDateValue)
  final String? birthDate;
  @override
  @JsonKey(
      readValue: _adminStudentItemEnrollmentsCount,
      fromJson: _adminStudentItemEnrollmentsCountValue)
  final int? enrollmentsCount;
  @override
  @JsonKey(
      readValue: _adminStudentItemEnrollmentId,
      fromJson: _adminStudentItemEnrollmentIdValue)
  final int? enrollmentId;
  @override
  @JsonKey(
      readValue: _adminStudentItemAttendanceStatusId,
      fromJson: _adminStudentItemAttendanceStatusIdValue)
  final String? attendanceStatusId;

  @override
  String toString() {
    return 'AdminStudentItemModel(id: $id, fullName: $fullName, studentNumber: $studentNumber, gradeLevel: $gradeLevel, parent: $parent, schoolName: $schoolName, currentJuz: $currentJuz, status: $status, birthDate: $birthDate, enrollmentsCount: $enrollmentsCount, enrollmentId: $enrollmentId, attendanceStatusId: $attendanceStatusId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStudentItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.gradeLevel, gradeLevel) ||
                other.gradeLevel == gradeLevel) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            (identical(other.currentJuz, currentJuz) ||
                other.currentJuz == currentJuz) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.enrollmentsCount, enrollmentsCount) ||
                other.enrollmentsCount == enrollmentsCount) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.attendanceStatusId, attendanceStatusId) ||
                other.attendanceStatusId == attendanceStatusId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      studentNumber,
      gradeLevel,
      parent,
      schoolName,
      currentJuz,
      status,
      birthDate,
      enrollmentsCount,
      enrollmentId,
      attendanceStatusId);

  /// Create a copy of AdminStudentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStudentItemModelImplCopyWith<_$AdminStudentItemModelImpl>
      get copyWith => __$$AdminStudentItemModelImplCopyWithImpl<
          _$AdminStudentItemModelImpl>(this, _$identity);
}

abstract class _AdminStudentItemModel implements AdminStudentItemModel {
  const factory _AdminStudentItemModel(
      {@JsonKey(
          readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _adminStudentItemFullName,
          fromJson: _adminStudentItemFullNameValue)
      final String? fullName,
      @JsonKey(
          readValue: _adminStudentItemStudentNumber,
          fromJson: _adminStudentItemStudentNumberValue)
      final String? studentNumber,
      @JsonKey(
          readValue: _adminStudentItemGradeLevel,
          fromJson: _adminStudentItemGradeLevelValue)
      final String? gradeLevel,
      @JsonKey(
          readValue: _adminStudentItemParent,
          fromJson: _adminStudentItemParentValue)
      final String? parent,
      @JsonKey(
          readValue: _adminStudentItemSchoolName,
          fromJson: _adminStudentItemSchoolNameValue)
      final String? schoolName,
      @JsonKey(
          readValue: _adminStudentItemCurrentJuz,
          fromJson: _adminStudentItemCurrentJuzValue)
      final int? currentJuz,
      @JsonKey(
          readValue: _adminStudentItemStatus,
          fromJson: _adminStudentItemStatusValue)
      final String? status,
      @JsonKey(
          readValue: _adminStudentItemBirthDate,
          fromJson: _adminStudentItemBirthDateValue)
      final String? birthDate,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentsCount,
          fromJson: _adminStudentItemEnrollmentsCountValue)
      final int? enrollmentsCount,
      @JsonKey(
          readValue: _adminStudentItemEnrollmentId,
          fromJson: _adminStudentItemEnrollmentIdValue)
      final int? enrollmentId,
      @JsonKey(
          readValue: _adminStudentItemAttendanceStatusId,
          fromJson: _adminStudentItemAttendanceStatusIdValue)
      final String? attendanceStatusId}) = _$AdminStudentItemModelImpl;

  factory _AdminStudentItemModel.fromJson(Map<String, dynamic> json) =
      _$AdminStudentItemModelImpl.fromJson;

  @override
  @JsonKey(readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _adminStudentItemFullName,
      fromJson: _adminStudentItemFullNameValue)
  String? get fullName;
  @override
  @JsonKey(
      readValue: _adminStudentItemStudentNumber,
      fromJson: _adminStudentItemStudentNumberValue)
  String? get studentNumber;
  @override
  @JsonKey(
      readValue: _adminStudentItemGradeLevel,
      fromJson: _adminStudentItemGradeLevelValue)
  String? get gradeLevel;
  @override
  @JsonKey(
      readValue: _adminStudentItemParent,
      fromJson: _adminStudentItemParentValue)
  String? get parent;
  @override
  @JsonKey(
      readValue: _adminStudentItemSchoolName,
      fromJson: _adminStudentItemSchoolNameValue)
  String? get schoolName;
  @override
  @JsonKey(
      readValue: _adminStudentItemCurrentJuz,
      fromJson: _adminStudentItemCurrentJuzValue)
  int? get currentJuz;
  @override
  @JsonKey(
      readValue: _adminStudentItemStatus,
      fromJson: _adminStudentItemStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _adminStudentItemBirthDate,
      fromJson: _adminStudentItemBirthDateValue)
  String? get birthDate;
  @override
  @JsonKey(
      readValue: _adminStudentItemEnrollmentsCount,
      fromJson: _adminStudentItemEnrollmentsCountValue)
  int? get enrollmentsCount;
  @override
  @JsonKey(
      readValue: _adminStudentItemEnrollmentId,
      fromJson: _adminStudentItemEnrollmentIdValue)
  int? get enrollmentId;
  @override
  @JsonKey(
      readValue: _adminStudentItemAttendanceStatusId,
      fromJson: _adminStudentItemAttendanceStatusIdValue)
  String? get attendanceStatusId;

  /// Create a copy of AdminStudentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminStudentItemModelImplCopyWith<_$AdminStudentItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdminEnrollmentItemModel _$AdminEnrollmentItemModelFromJson(
    Map<String, dynamic> json) {
  return _AdminEnrollmentItemModel.fromJson(json);
}

/// @nodoc
mixin _$AdminEnrollmentItemModel {
  @JsonKey(
      readValue: _adminEnrollmentItemId, fromJson: _adminEnrollmentItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemStudentName,
      fromJson: _adminEnrollmentItemStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemStudentId,
      fromJson: _adminEnrollmentItemStudentIdValue)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemParentName,
      fromJson: _adminEnrollmentItemParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemGroupName,
      fromJson: _adminEnrollmentItemGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemGroupId,
      fromJson: _adminEnrollmentItemGroupIdValue)
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemCourseName,
      fromJson: _adminEnrollmentItemCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemFinalPoints,
      fromJson: _adminEnrollmentItemFinalPointsValue)
  int? get finalPoints => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemMemorizedPages,
      fromJson: _adminEnrollmentItemMemorizedPagesValue)
  int? get memorizedPages => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemStatus,
      fromJson: _adminEnrollmentItemStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminEnrollmentItemEnrolledAt,
      fromJson: _adminEnrollmentItemEnrolledAtValue)
  String? get enrolledAt => throw _privateConstructorUsedError;

  /// Create a copy of AdminEnrollmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminEnrollmentItemModelCopyWith<AdminEnrollmentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminEnrollmentItemModelCopyWith<$Res> {
  factory $AdminEnrollmentItemModelCopyWith(AdminEnrollmentItemModel value,
          $Res Function(AdminEnrollmentItemModel) then) =
      _$AdminEnrollmentItemModelCopyWithImpl<$Res, AdminEnrollmentItemModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _adminEnrollmentItemId,
          fromJson: _adminEnrollmentItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentName,
          fromJson: _adminEnrollmentItemStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentId,
          fromJson: _adminEnrollmentItemStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _adminEnrollmentItemParentName,
          fromJson: _adminEnrollmentItemParentNameValue)
      String? parentName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupName,
          fromJson: _adminEnrollmentItemGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupId,
          fromJson: _adminEnrollmentItemGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _adminEnrollmentItemCourseName,
          fromJson: _adminEnrollmentItemCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _adminEnrollmentItemFinalPoints,
          fromJson: _adminEnrollmentItemFinalPointsValue)
      int? finalPoints,
      @JsonKey(
          readValue: _adminEnrollmentItemMemorizedPages,
          fromJson: _adminEnrollmentItemMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(
          readValue: _adminEnrollmentItemStatus,
          fromJson: _adminEnrollmentItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _adminEnrollmentItemEnrolledAt,
          fromJson: _adminEnrollmentItemEnrolledAtValue)
      String? enrolledAt});
}

/// @nodoc
class _$AdminEnrollmentItemModelCopyWithImpl<$Res,
        $Val extends AdminEnrollmentItemModel>
    implements $AdminEnrollmentItemModelCopyWith<$Res> {
  _$AdminEnrollmentItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminEnrollmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentName = freezed,
    Object? studentId = freezed,
    Object? parentName = freezed,
    Object? groupName = freezed,
    Object? groupId = freezed,
    Object? courseName = freezed,
    Object? finalPoints = freezed,
    Object? memorizedPages = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      finalPoints: freezed == finalPoints
          ? _value.finalPoints
          : finalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminEnrollmentItemModelImplCopyWith<$Res>
    implements $AdminEnrollmentItemModelCopyWith<$Res> {
  factory _$$AdminEnrollmentItemModelImplCopyWith(
          _$AdminEnrollmentItemModelImpl value,
          $Res Function(_$AdminEnrollmentItemModelImpl) then) =
      __$$AdminEnrollmentItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _adminEnrollmentItemId,
          fromJson: _adminEnrollmentItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentName,
          fromJson: _adminEnrollmentItemStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentId,
          fromJson: _adminEnrollmentItemStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _adminEnrollmentItemParentName,
          fromJson: _adminEnrollmentItemParentNameValue)
      String? parentName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupName,
          fromJson: _adminEnrollmentItemGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupId,
          fromJson: _adminEnrollmentItemGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _adminEnrollmentItemCourseName,
          fromJson: _adminEnrollmentItemCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _adminEnrollmentItemFinalPoints,
          fromJson: _adminEnrollmentItemFinalPointsValue)
      int? finalPoints,
      @JsonKey(
          readValue: _adminEnrollmentItemMemorizedPages,
          fromJson: _adminEnrollmentItemMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(
          readValue: _adminEnrollmentItemStatus,
          fromJson: _adminEnrollmentItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _adminEnrollmentItemEnrolledAt,
          fromJson: _adminEnrollmentItemEnrolledAtValue)
      String? enrolledAt});
}

/// @nodoc
class __$$AdminEnrollmentItemModelImplCopyWithImpl<$Res>
    extends _$AdminEnrollmentItemModelCopyWithImpl<$Res,
        _$AdminEnrollmentItemModelImpl>
    implements _$$AdminEnrollmentItemModelImplCopyWith<$Res> {
  __$$AdminEnrollmentItemModelImplCopyWithImpl(
      _$AdminEnrollmentItemModelImpl _value,
      $Res Function(_$AdminEnrollmentItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminEnrollmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentName = freezed,
    Object? studentId = freezed,
    Object? parentName = freezed,
    Object? groupName = freezed,
    Object? groupId = freezed,
    Object? courseName = freezed,
    Object? finalPoints = freezed,
    Object? memorizedPages = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
  }) {
    return _then(_$AdminEnrollmentItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      finalPoints: freezed == finalPoints
          ? _value.finalPoints
          : finalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AdminEnrollmentItemModelImpl implements _AdminEnrollmentItemModel {
  const _$AdminEnrollmentItemModelImpl(
      {@JsonKey(
          readValue: _adminEnrollmentItemId,
          fromJson: _adminEnrollmentItemIdValue)
      this.id,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentName,
          fromJson: _adminEnrollmentItemStudentNameValue)
      this.studentName,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentId,
          fromJson: _adminEnrollmentItemStudentIdValue)
      this.studentId,
      @JsonKey(
          readValue: _adminEnrollmentItemParentName,
          fromJson: _adminEnrollmentItemParentNameValue)
      this.parentName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupName,
          fromJson: _adminEnrollmentItemGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupId,
          fromJson: _adminEnrollmentItemGroupIdValue)
      this.groupId,
      @JsonKey(
          readValue: _adminEnrollmentItemCourseName,
          fromJson: _adminEnrollmentItemCourseNameValue)
      this.courseName,
      @JsonKey(
          readValue: _adminEnrollmentItemFinalPoints,
          fromJson: _adminEnrollmentItemFinalPointsValue)
      this.finalPoints,
      @JsonKey(
          readValue: _adminEnrollmentItemMemorizedPages,
          fromJson: _adminEnrollmentItemMemorizedPagesValue)
      this.memorizedPages,
      @JsonKey(
          readValue: _adminEnrollmentItemStatus,
          fromJson: _adminEnrollmentItemStatusValue)
      this.status,
      @JsonKey(
          readValue: _adminEnrollmentItemEnrolledAt,
          fromJson: _adminEnrollmentItemEnrolledAtValue)
      this.enrolledAt});

  factory _$AdminEnrollmentItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminEnrollmentItemModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _adminEnrollmentItemId, fromJson: _adminEnrollmentItemIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemStudentName,
      fromJson: _adminEnrollmentItemStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemStudentId,
      fromJson: _adminEnrollmentItemStudentIdValue)
  final int? studentId;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemParentName,
      fromJson: _adminEnrollmentItemParentNameValue)
  final String? parentName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemGroupName,
      fromJson: _adminEnrollmentItemGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemGroupId,
      fromJson: _adminEnrollmentItemGroupIdValue)
  final int? groupId;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemCourseName,
      fromJson: _adminEnrollmentItemCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemFinalPoints,
      fromJson: _adminEnrollmentItemFinalPointsValue)
  final int? finalPoints;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemMemorizedPages,
      fromJson: _adminEnrollmentItemMemorizedPagesValue)
  final int? memorizedPages;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemStatus,
      fromJson: _adminEnrollmentItemStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemEnrolledAt,
      fromJson: _adminEnrollmentItemEnrolledAtValue)
  final String? enrolledAt;

  @override
  String toString() {
    return 'AdminEnrollmentItemModel(id: $id, studentName: $studentName, studentId: $studentId, parentName: $parentName, groupName: $groupName, groupId: $groupId, courseName: $courseName, finalPoints: $finalPoints, memorizedPages: $memorizedPages, status: $status, enrolledAt: $enrolledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminEnrollmentItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.finalPoints, finalPoints) ||
                other.finalPoints == finalPoints) &&
            (identical(other.memorizedPages, memorizedPages) ||
                other.memorizedPages == memorizedPages) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      studentName,
      studentId,
      parentName,
      groupName,
      groupId,
      courseName,
      finalPoints,
      memorizedPages,
      status,
      enrolledAt);

  /// Create a copy of AdminEnrollmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminEnrollmentItemModelImplCopyWith<_$AdminEnrollmentItemModelImpl>
      get copyWith => __$$AdminEnrollmentItemModelImplCopyWithImpl<
          _$AdminEnrollmentItemModelImpl>(this, _$identity);
}

abstract class _AdminEnrollmentItemModel implements AdminEnrollmentItemModel {
  const factory _AdminEnrollmentItemModel(
      {@JsonKey(
          readValue: _adminEnrollmentItemId,
          fromJson: _adminEnrollmentItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentName,
          fromJson: _adminEnrollmentItemStudentNameValue)
      final String? studentName,
      @JsonKey(
          readValue: _adminEnrollmentItemStudentId,
          fromJson: _adminEnrollmentItemStudentIdValue)
      final int? studentId,
      @JsonKey(
          readValue: _adminEnrollmentItemParentName,
          fromJson: _adminEnrollmentItemParentNameValue)
      final String? parentName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupName,
          fromJson: _adminEnrollmentItemGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _adminEnrollmentItemGroupId,
          fromJson: _adminEnrollmentItemGroupIdValue)
      final int? groupId,
      @JsonKey(
          readValue: _adminEnrollmentItemCourseName,
          fromJson: _adminEnrollmentItemCourseNameValue)
      final String? courseName,
      @JsonKey(
          readValue: _adminEnrollmentItemFinalPoints,
          fromJson: _adminEnrollmentItemFinalPointsValue)
      final int? finalPoints,
      @JsonKey(
          readValue: _adminEnrollmentItemMemorizedPages,
          fromJson: _adminEnrollmentItemMemorizedPagesValue)
      final int? memorizedPages,
      @JsonKey(
          readValue: _adminEnrollmentItemStatus,
          fromJson: _adminEnrollmentItemStatusValue)
      final String? status,
      @JsonKey(
          readValue: _adminEnrollmentItemEnrolledAt,
          fromJson: _adminEnrollmentItemEnrolledAtValue)
      final String? enrolledAt}) = _$AdminEnrollmentItemModelImpl;

  factory _AdminEnrollmentItemModel.fromJson(Map<String, dynamic> json) =
      _$AdminEnrollmentItemModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _adminEnrollmentItemId, fromJson: _adminEnrollmentItemIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemStudentName,
      fromJson: _adminEnrollmentItemStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemStudentId,
      fromJson: _adminEnrollmentItemStudentIdValue)
  int? get studentId;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemParentName,
      fromJson: _adminEnrollmentItemParentNameValue)
  String? get parentName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemGroupName,
      fromJson: _adminEnrollmentItemGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemGroupId,
      fromJson: _adminEnrollmentItemGroupIdValue)
  int? get groupId;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemCourseName,
      fromJson: _adminEnrollmentItemCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemFinalPoints,
      fromJson: _adminEnrollmentItemFinalPointsValue)
  int? get finalPoints;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemMemorizedPages,
      fromJson: _adminEnrollmentItemMemorizedPagesValue)
  int? get memorizedPages;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemStatus,
      fromJson: _adminEnrollmentItemStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _adminEnrollmentItemEnrolledAt,
      fromJson: _adminEnrollmentItemEnrolledAtValue)
  String? get enrolledAt;

  /// Create a copy of AdminEnrollmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminEnrollmentItemModelImplCopyWith<_$AdminEnrollmentItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdminAssessmentItemModel _$AdminAssessmentItemModelFromJson(
    Map<String, dynamic> json) {
  return _AdminAssessmentItemModel.fromJson(json);
}

/// @nodoc
mixin _$AdminAssessmentItemModel {
  @JsonKey(
      readValue: _adminAssessmentItemId, fromJson: _adminAssessmentItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemTitle,
      fromJson: _adminAssessmentItemTitleValue)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemType,
      fromJson: _adminAssessmentItemTypeValue)
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemDescription,
      fromJson: _adminAssessmentItemDescriptionValue)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemGroupName,
      fromJson: _adminAssessmentItemGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemGroupId,
      fromJson: _adminAssessmentItemGroupIdValue)
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemCourseName,
      fromJson: _adminAssessmentItemCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemTotalMark,
      fromJson: _adminAssessmentItemTotalMarkValue)
  double? get totalMark => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemPassMark,
      fromJson: _adminAssessmentItemPassMarkValue)
  double? get passMark => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemResultsCount,
      fromJson: _adminAssessmentItemResultsCountValue)
  int? get resultsCount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemIsActive,
      fromJson: _adminAssessmentItemIsActiveValue)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemScheduledAt,
      fromJson: _adminAssessmentItemScheduledAtValue)
  String? get scheduledAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminAssessmentItemDueAt,
      fromJson: _adminAssessmentItemDueAtValue)
  String? get dueAt => throw _privateConstructorUsedError;

  /// Create a copy of AdminAssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminAssessmentItemModelCopyWith<AdminAssessmentItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminAssessmentItemModelCopyWith<$Res> {
  factory $AdminAssessmentItemModelCopyWith(AdminAssessmentItemModel value,
          $Res Function(AdminAssessmentItemModel) then) =
      _$AdminAssessmentItemModelCopyWithImpl<$Res, AdminAssessmentItemModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminAssessmentItemId, fromJson: _adminAssessmentItemIdValue)
      int? id,
      @JsonKey(readValue: _adminAssessmentItemTitle, fromJson: _adminAssessmentItemTitleValue)
      String? title,
      @JsonKey(readValue: _adminAssessmentItemType, fromJson: _adminAssessmentItemTypeValue)
      String? type,
      @JsonKey(
          readValue: _adminAssessmentItemDescription,
          fromJson: _adminAssessmentItemDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _adminAssessmentItemGroupName,
          fromJson: _adminAssessmentItemGroupNameValue)
      String? groupName,
      @JsonKey(readValue: _adminAssessmentItemGroupId, fromJson: _adminAssessmentItemGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _adminAssessmentItemCourseName,
          fromJson: _adminAssessmentItemCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _adminAssessmentItemTotalMark,
          fromJson: _adminAssessmentItemTotalMarkValue)
      double? totalMark,
      @JsonKey(readValue: _adminAssessmentItemPassMark, fromJson: _adminAssessmentItemPassMarkValue)
      double? passMark,
      @JsonKey(
          readValue: _adminAssessmentItemResultsCount,
          fromJson: _adminAssessmentItemResultsCountValue)
      int? resultsCount,
      @JsonKey(readValue: _adminAssessmentItemIsActive, fromJson: _adminAssessmentItemIsActiveValue)
      bool? isActive,
      @JsonKey(
          readValue: _adminAssessmentItemScheduledAt,
          fromJson: _adminAssessmentItemScheduledAtValue)
      String? scheduledAt,
      @JsonKey(readValue: _adminAssessmentItemDueAt, fromJson: _adminAssessmentItemDueAtValue) String? dueAt});
}

/// @nodoc
class _$AdminAssessmentItemModelCopyWithImpl<$Res,
        $Val extends AdminAssessmentItemModel>
    implements $AdminAssessmentItemModelCopyWith<$Res> {
  _$AdminAssessmentItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminAssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? groupName = freezed,
    Object? groupId = freezed,
    Object? courseName = freezed,
    Object? totalMark = freezed,
    Object? passMark = freezed,
    Object? resultsCount = freezed,
    Object? isActive = freezed,
    Object? scheduledAt = freezed,
    Object? dueAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMark: freezed == totalMark
          ? _value.totalMark
          : totalMark // ignore: cast_nullable_to_non_nullable
              as double?,
      passMark: freezed == passMark
          ? _value.passMark
          : passMark // ignore: cast_nullable_to_non_nullable
              as double?,
      resultsCount: freezed == resultsCount
          ? _value.resultsCount
          : resultsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminAssessmentItemModelImplCopyWith<$Res>
    implements $AdminAssessmentItemModelCopyWith<$Res> {
  factory _$$AdminAssessmentItemModelImplCopyWith(
          _$AdminAssessmentItemModelImpl value,
          $Res Function(_$AdminAssessmentItemModelImpl) then) =
      __$$AdminAssessmentItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminAssessmentItemId, fromJson: _adminAssessmentItemIdValue)
      int? id,
      @JsonKey(readValue: _adminAssessmentItemTitle, fromJson: _adminAssessmentItemTitleValue)
      String? title,
      @JsonKey(readValue: _adminAssessmentItemType, fromJson: _adminAssessmentItemTypeValue)
      String? type,
      @JsonKey(
          readValue: _adminAssessmentItemDescription,
          fromJson: _adminAssessmentItemDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _adminAssessmentItemGroupName,
          fromJson: _adminAssessmentItemGroupNameValue)
      String? groupName,
      @JsonKey(readValue: _adminAssessmentItemGroupId, fromJson: _adminAssessmentItemGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _adminAssessmentItemCourseName,
          fromJson: _adminAssessmentItemCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _adminAssessmentItemTotalMark,
          fromJson: _adminAssessmentItemTotalMarkValue)
      double? totalMark,
      @JsonKey(readValue: _adminAssessmentItemPassMark, fromJson: _adminAssessmentItemPassMarkValue)
      double? passMark,
      @JsonKey(
          readValue: _adminAssessmentItemResultsCount,
          fromJson: _adminAssessmentItemResultsCountValue)
      int? resultsCount,
      @JsonKey(readValue: _adminAssessmentItemIsActive, fromJson: _adminAssessmentItemIsActiveValue)
      bool? isActive,
      @JsonKey(
          readValue: _adminAssessmentItemScheduledAt,
          fromJson: _adminAssessmentItemScheduledAtValue)
      String? scheduledAt,
      @JsonKey(readValue: _adminAssessmentItemDueAt, fromJson: _adminAssessmentItemDueAtValue) String? dueAt});
}

/// @nodoc
class __$$AdminAssessmentItemModelImplCopyWithImpl<$Res>
    extends _$AdminAssessmentItemModelCopyWithImpl<$Res,
        _$AdminAssessmentItemModelImpl>
    implements _$$AdminAssessmentItemModelImplCopyWith<$Res> {
  __$$AdminAssessmentItemModelImplCopyWithImpl(
      _$AdminAssessmentItemModelImpl _value,
      $Res Function(_$AdminAssessmentItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminAssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? groupName = freezed,
    Object? groupId = freezed,
    Object? courseName = freezed,
    Object? totalMark = freezed,
    Object? passMark = freezed,
    Object? resultsCount = freezed,
    Object? isActive = freezed,
    Object? scheduledAt = freezed,
    Object? dueAt = freezed,
  }) {
    return _then(_$AdminAssessmentItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMark: freezed == totalMark
          ? _value.totalMark
          : totalMark // ignore: cast_nullable_to_non_nullable
              as double?,
      passMark: freezed == passMark
          ? _value.passMark
          : passMark // ignore: cast_nullable_to_non_nullable
              as double?,
      resultsCount: freezed == resultsCount
          ? _value.resultsCount
          : resultsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AdminAssessmentItemModelImpl implements _AdminAssessmentItemModel {
  const _$AdminAssessmentItemModelImpl(
      {@JsonKey(
          readValue: _adminAssessmentItemId,
          fromJson: _adminAssessmentItemIdValue)
      this.id,
      @JsonKey(
          readValue: _adminAssessmentItemTitle,
          fromJson: _adminAssessmentItemTitleValue)
      this.title,
      @JsonKey(
          readValue: _adminAssessmentItemType,
          fromJson: _adminAssessmentItemTypeValue)
      this.type,
      @JsonKey(
          readValue: _adminAssessmentItemDescription,
          fromJson: _adminAssessmentItemDescriptionValue)
      this.description,
      @JsonKey(
          readValue: _adminAssessmentItemGroupName,
          fromJson: _adminAssessmentItemGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _adminAssessmentItemGroupId,
          fromJson: _adminAssessmentItemGroupIdValue)
      this.groupId,
      @JsonKey(
          readValue: _adminAssessmentItemCourseName,
          fromJson: _adminAssessmentItemCourseNameValue)
      this.courseName,
      @JsonKey(
          readValue: _adminAssessmentItemTotalMark,
          fromJson: _adminAssessmentItemTotalMarkValue)
      this.totalMark,
      @JsonKey(
          readValue: _adminAssessmentItemPassMark,
          fromJson: _adminAssessmentItemPassMarkValue)
      this.passMark,
      @JsonKey(
          readValue: _adminAssessmentItemResultsCount,
          fromJson: _adminAssessmentItemResultsCountValue)
      this.resultsCount,
      @JsonKey(
          readValue: _adminAssessmentItemIsActive,
          fromJson: _adminAssessmentItemIsActiveValue)
      this.isActive,
      @JsonKey(
          readValue: _adminAssessmentItemScheduledAt,
          fromJson: _adminAssessmentItemScheduledAtValue)
      this.scheduledAt,
      @JsonKey(
          readValue: _adminAssessmentItemDueAt,
          fromJson: _adminAssessmentItemDueAtValue)
      this.dueAt});

  factory _$AdminAssessmentItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminAssessmentItemModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _adminAssessmentItemId, fromJson: _adminAssessmentItemIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemTitle,
      fromJson: _adminAssessmentItemTitleValue)
  final String? title;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemType,
      fromJson: _adminAssessmentItemTypeValue)
  final String? type;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemDescription,
      fromJson: _adminAssessmentItemDescriptionValue)
  final String? description;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemGroupName,
      fromJson: _adminAssessmentItemGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemGroupId,
      fromJson: _adminAssessmentItemGroupIdValue)
  final int? groupId;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemCourseName,
      fromJson: _adminAssessmentItemCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemTotalMark,
      fromJson: _adminAssessmentItemTotalMarkValue)
  final double? totalMark;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemPassMark,
      fromJson: _adminAssessmentItemPassMarkValue)
  final double? passMark;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemResultsCount,
      fromJson: _adminAssessmentItemResultsCountValue)
  final int? resultsCount;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemIsActive,
      fromJson: _adminAssessmentItemIsActiveValue)
  final bool? isActive;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemScheduledAt,
      fromJson: _adminAssessmentItemScheduledAtValue)
  final String? scheduledAt;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemDueAt,
      fromJson: _adminAssessmentItemDueAtValue)
  final String? dueAt;

  @override
  String toString() {
    return 'AdminAssessmentItemModel(id: $id, title: $title, type: $type, description: $description, groupName: $groupName, groupId: $groupId, courseName: $courseName, totalMark: $totalMark, passMark: $passMark, resultsCount: $resultsCount, isActive: $isActive, scheduledAt: $scheduledAt, dueAt: $dueAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminAssessmentItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.totalMark, totalMark) ||
                other.totalMark == totalMark) &&
            (identical(other.passMark, passMark) ||
                other.passMark == passMark) &&
            (identical(other.resultsCount, resultsCount) ||
                other.resultsCount == resultsCount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.dueAt, dueAt) || other.dueAt == dueAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      description,
      groupName,
      groupId,
      courseName,
      totalMark,
      passMark,
      resultsCount,
      isActive,
      scheduledAt,
      dueAt);

  /// Create a copy of AdminAssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminAssessmentItemModelImplCopyWith<_$AdminAssessmentItemModelImpl>
      get copyWith => __$$AdminAssessmentItemModelImplCopyWithImpl<
          _$AdminAssessmentItemModelImpl>(this, _$identity);
}

abstract class _AdminAssessmentItemModel implements AdminAssessmentItemModel {
  const factory _AdminAssessmentItemModel(
      {@JsonKey(
          readValue: _adminAssessmentItemId,
          fromJson: _adminAssessmentItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _adminAssessmentItemTitle,
          fromJson: _adminAssessmentItemTitleValue)
      final String? title,
      @JsonKey(
          readValue: _adminAssessmentItemType,
          fromJson: _adminAssessmentItemTypeValue)
      final String? type,
      @JsonKey(
          readValue: _adminAssessmentItemDescription,
          fromJson: _adminAssessmentItemDescriptionValue)
      final String? description,
      @JsonKey(
          readValue: _adminAssessmentItemGroupName,
          fromJson: _adminAssessmentItemGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _adminAssessmentItemGroupId,
          fromJson: _adminAssessmentItemGroupIdValue)
      final int? groupId,
      @JsonKey(
          readValue: _adminAssessmentItemCourseName,
          fromJson: _adminAssessmentItemCourseNameValue)
      final String? courseName,
      @JsonKey(
          readValue: _adminAssessmentItemTotalMark,
          fromJson: _adminAssessmentItemTotalMarkValue)
      final double? totalMark,
      @JsonKey(
          readValue: _adminAssessmentItemPassMark,
          fromJson: _adminAssessmentItemPassMarkValue)
      final double? passMark,
      @JsonKey(
          readValue: _adminAssessmentItemResultsCount,
          fromJson: _adminAssessmentItemResultsCountValue)
      final int? resultsCount,
      @JsonKey(
          readValue: _adminAssessmentItemIsActive,
          fromJson: _adminAssessmentItemIsActiveValue)
      final bool? isActive,
      @JsonKey(
          readValue: _adminAssessmentItemScheduledAt,
          fromJson: _adminAssessmentItemScheduledAtValue)
      final String? scheduledAt,
      @JsonKey(
          readValue: _adminAssessmentItemDueAt,
          fromJson: _adminAssessmentItemDueAtValue)
      final String? dueAt}) = _$AdminAssessmentItemModelImpl;

  factory _AdminAssessmentItemModel.fromJson(Map<String, dynamic> json) =
      _$AdminAssessmentItemModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _adminAssessmentItemId, fromJson: _adminAssessmentItemIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemTitle,
      fromJson: _adminAssessmentItemTitleValue)
  String? get title;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemType,
      fromJson: _adminAssessmentItemTypeValue)
  String? get type;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemDescription,
      fromJson: _adminAssessmentItemDescriptionValue)
  String? get description;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemGroupName,
      fromJson: _adminAssessmentItemGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemGroupId,
      fromJson: _adminAssessmentItemGroupIdValue)
  int? get groupId;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemCourseName,
      fromJson: _adminAssessmentItemCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemTotalMark,
      fromJson: _adminAssessmentItemTotalMarkValue)
  double? get totalMark;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemPassMark,
      fromJson: _adminAssessmentItemPassMarkValue)
  double? get passMark;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemResultsCount,
      fromJson: _adminAssessmentItemResultsCountValue)
  int? get resultsCount;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemIsActive,
      fromJson: _adminAssessmentItemIsActiveValue)
  bool? get isActive;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemScheduledAt,
      fromJson: _adminAssessmentItemScheduledAtValue)
  String? get scheduledAt;
  @override
  @JsonKey(
      readValue: _adminAssessmentItemDueAt,
      fromJson: _adminAssessmentItemDueAtValue)
  String? get dueAt;

  /// Create a copy of AdminAssessmentItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminAssessmentItemModelImplCopyWith<_$AdminAssessmentItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdminInvoiceItemModel _$AdminInvoiceItemModelFromJson(
    Map<String, dynamic> json) {
  return _AdminInvoiceItemModel.fromJson(json);
}

/// @nodoc
mixin _$AdminInvoiceItemModel {
  @JsonKey(readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemInvoiceNo,
      fromJson: _adminInvoiceItemInvoiceNoValue)
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemInvoiceType,
      fromJson: _adminInvoiceItemInvoiceTypeValue)
  String? get invoiceType => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemParentName,
      fromJson: _adminInvoiceItemParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemTotal, fromJson: _adminInvoiceItemTotalValue)
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemPaidTotal,
      fromJson: _adminInvoiceItemPaidTotalValue)
  double? get paidTotal => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemBalance,
      fromJson: _adminInvoiceItemBalanceValue)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemDiscount,
      fromJson: _adminInvoiceItemDiscountValue)
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemStatus,
      fromJson: _adminInvoiceItemStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemIssueDate,
      fromJson: _adminInvoiceItemIssueDateValue)
  String? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemDueDate,
      fromJson: _adminInvoiceItemDueDateValue)
  String? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminInvoiceItemItemsCount,
      fromJson: _adminInvoiceItemItemsCountValue)
  int? get itemsCount => throw _privateConstructorUsedError;

  /// Create a copy of AdminInvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminInvoiceItemModelCopyWith<AdminInvoiceItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminInvoiceItemModelCopyWith<$Res> {
  factory $AdminInvoiceItemModelCopyWith(AdminInvoiceItemModel value,
          $Res Function(AdminInvoiceItemModel) then) =
      _$AdminInvoiceItemModelCopyWithImpl<$Res, AdminInvoiceItemModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceNo,
          fromJson: _adminInvoiceItemInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceType,
          fromJson: _adminInvoiceItemInvoiceTypeValue)
      String? invoiceType,
      @JsonKey(
          readValue: _adminInvoiceItemParentName,
          fromJson: _adminInvoiceItemParentNameValue)
      String? parentName,
      @JsonKey(readValue: _adminInvoiceItemTotal, fromJson: _adminInvoiceItemTotalValue)
      double? total,
      @JsonKey(
          readValue: _adminInvoiceItemPaidTotal,
          fromJson: _adminInvoiceItemPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _adminInvoiceItemBalance,
          fromJson: _adminInvoiceItemBalanceValue)
      double? balance,
      @JsonKey(
          readValue: _adminInvoiceItemDiscount,
          fromJson: _adminInvoiceItemDiscountValue)
      double? discount,
      @JsonKey(
          readValue: _adminInvoiceItemStatus,
          fromJson: _adminInvoiceItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _adminInvoiceItemIssueDate,
          fromJson: _adminInvoiceItemIssueDateValue)
      String? issueDate,
      @JsonKey(
          readValue: _adminInvoiceItemDueDate,
          fromJson: _adminInvoiceItemDueDateValue)
      String? dueDate,
      @JsonKey(
          readValue: _adminInvoiceItemItemsCount,
          fromJson: _adminInvoiceItemItemsCountValue)
      int? itemsCount});
}

/// @nodoc
class _$AdminInvoiceItemModelCopyWithImpl<$Res,
        $Val extends AdminInvoiceItemModel>
    implements $AdminInvoiceItemModelCopyWith<$Res> {
  _$AdminInvoiceItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminInvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? invoiceType = freezed,
    Object? parentName = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? discount = freezed,
    Object? status = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? itemsCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceType: freezed == invoiceType
          ? _value.invoiceType
          : invoiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminInvoiceItemModelImplCopyWith<$Res>
    implements $AdminInvoiceItemModelCopyWith<$Res> {
  factory _$$AdminInvoiceItemModelImplCopyWith(
          _$AdminInvoiceItemModelImpl value,
          $Res Function(_$AdminInvoiceItemModelImpl) then) =
      __$$AdminInvoiceItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceNo,
          fromJson: _adminInvoiceItemInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceType,
          fromJson: _adminInvoiceItemInvoiceTypeValue)
      String? invoiceType,
      @JsonKey(
          readValue: _adminInvoiceItemParentName,
          fromJson: _adminInvoiceItemParentNameValue)
      String? parentName,
      @JsonKey(readValue: _adminInvoiceItemTotal, fromJson: _adminInvoiceItemTotalValue)
      double? total,
      @JsonKey(
          readValue: _adminInvoiceItemPaidTotal,
          fromJson: _adminInvoiceItemPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _adminInvoiceItemBalance,
          fromJson: _adminInvoiceItemBalanceValue)
      double? balance,
      @JsonKey(
          readValue: _adminInvoiceItemDiscount,
          fromJson: _adminInvoiceItemDiscountValue)
      double? discount,
      @JsonKey(
          readValue: _adminInvoiceItemStatus,
          fromJson: _adminInvoiceItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _adminInvoiceItemIssueDate,
          fromJson: _adminInvoiceItemIssueDateValue)
      String? issueDate,
      @JsonKey(
          readValue: _adminInvoiceItemDueDate,
          fromJson: _adminInvoiceItemDueDateValue)
      String? dueDate,
      @JsonKey(
          readValue: _adminInvoiceItemItemsCount,
          fromJson: _adminInvoiceItemItemsCountValue)
      int? itemsCount});
}

/// @nodoc
class __$$AdminInvoiceItemModelImplCopyWithImpl<$Res>
    extends _$AdminInvoiceItemModelCopyWithImpl<$Res,
        _$AdminInvoiceItemModelImpl>
    implements _$$AdminInvoiceItemModelImplCopyWith<$Res> {
  __$$AdminInvoiceItemModelImplCopyWithImpl(_$AdminInvoiceItemModelImpl _value,
      $Res Function(_$AdminInvoiceItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminInvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? invoiceType = freezed,
    Object? parentName = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? discount = freezed,
    Object? status = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? itemsCount = freezed,
  }) {
    return _then(_$AdminInvoiceItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceType: freezed == invoiceType
          ? _value.invoiceType
          : invoiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AdminInvoiceItemModelImpl implements _AdminInvoiceItemModel {
  const _$AdminInvoiceItemModelImpl(
      {@JsonKey(
          readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
      this.id,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceNo,
          fromJson: _adminInvoiceItemInvoiceNoValue)
      this.invoiceNo,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceType,
          fromJson: _adminInvoiceItemInvoiceTypeValue)
      this.invoiceType,
      @JsonKey(
          readValue: _adminInvoiceItemParentName,
          fromJson: _adminInvoiceItemParentNameValue)
      this.parentName,
      @JsonKey(
          readValue: _adminInvoiceItemTotal,
          fromJson: _adminInvoiceItemTotalValue)
      this.total,
      @JsonKey(
          readValue: _adminInvoiceItemPaidTotal,
          fromJson: _adminInvoiceItemPaidTotalValue)
      this.paidTotal,
      @JsonKey(
          readValue: _adminInvoiceItemBalance,
          fromJson: _adminInvoiceItemBalanceValue)
      this.balance,
      @JsonKey(
          readValue: _adminInvoiceItemDiscount,
          fromJson: _adminInvoiceItemDiscountValue)
      this.discount,
      @JsonKey(
          readValue: _adminInvoiceItemStatus,
          fromJson: _adminInvoiceItemStatusValue)
      this.status,
      @JsonKey(
          readValue: _adminInvoiceItemIssueDate,
          fromJson: _adminInvoiceItemIssueDateValue)
      this.issueDate,
      @JsonKey(
          readValue: _adminInvoiceItemDueDate,
          fromJson: _adminInvoiceItemDueDateValue)
      this.dueDate,
      @JsonKey(
          readValue: _adminInvoiceItemItemsCount,
          fromJson: _adminInvoiceItemItemsCountValue)
      this.itemsCount});

  factory _$AdminInvoiceItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminInvoiceItemModelImplFromJson(json);

  @override
  @JsonKey(readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemInvoiceNo,
      fromJson: _adminInvoiceItemInvoiceNoValue)
  final String? invoiceNo;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemInvoiceType,
      fromJson: _adminInvoiceItemInvoiceTypeValue)
  final String? invoiceType;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemParentName,
      fromJson: _adminInvoiceItemParentNameValue)
  final String? parentName;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemTotal, fromJson: _adminInvoiceItemTotalValue)
  final double? total;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemPaidTotal,
      fromJson: _adminInvoiceItemPaidTotalValue)
  final double? paidTotal;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemBalance,
      fromJson: _adminInvoiceItemBalanceValue)
  final double? balance;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemDiscount,
      fromJson: _adminInvoiceItemDiscountValue)
  final double? discount;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemStatus,
      fromJson: _adminInvoiceItemStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemIssueDate,
      fromJson: _adminInvoiceItemIssueDateValue)
  final String? issueDate;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemDueDate,
      fromJson: _adminInvoiceItemDueDateValue)
  final String? dueDate;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemItemsCount,
      fromJson: _adminInvoiceItemItemsCountValue)
  final int? itemsCount;

  @override
  String toString() {
    return 'AdminInvoiceItemModel(id: $id, invoiceNo: $invoiceNo, invoiceType: $invoiceType, parentName: $parentName, total: $total, paidTotal: $paidTotal, balance: $balance, discount: $discount, status: $status, issueDate: $issueDate, dueDate: $dueDate, itemsCount: $itemsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminInvoiceItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.invoiceType, invoiceType) ||
                other.invoiceType == invoiceType) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidTotal, paidTotal) ||
                other.paidTotal == paidTotal) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNo,
      invoiceType,
      parentName,
      total,
      paidTotal,
      balance,
      discount,
      status,
      issueDate,
      dueDate,
      itemsCount);

  /// Create a copy of AdminInvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminInvoiceItemModelImplCopyWith<_$AdminInvoiceItemModelImpl>
      get copyWith => __$$AdminInvoiceItemModelImplCopyWithImpl<
          _$AdminInvoiceItemModelImpl>(this, _$identity);
}

abstract class _AdminInvoiceItemModel implements AdminInvoiceItemModel {
  const factory _AdminInvoiceItemModel(
      {@JsonKey(
          readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceNo,
          fromJson: _adminInvoiceItemInvoiceNoValue)
      final String? invoiceNo,
      @JsonKey(
          readValue: _adminInvoiceItemInvoiceType,
          fromJson: _adminInvoiceItemInvoiceTypeValue)
      final String? invoiceType,
      @JsonKey(
          readValue: _adminInvoiceItemParentName,
          fromJson: _adminInvoiceItemParentNameValue)
      final String? parentName,
      @JsonKey(
          readValue: _adminInvoiceItemTotal,
          fromJson: _adminInvoiceItemTotalValue)
      final double? total,
      @JsonKey(
          readValue: _adminInvoiceItemPaidTotal,
          fromJson: _adminInvoiceItemPaidTotalValue)
      final double? paidTotal,
      @JsonKey(
          readValue: _adminInvoiceItemBalance,
          fromJson: _adminInvoiceItemBalanceValue)
      final double? balance,
      @JsonKey(
          readValue: _adminInvoiceItemDiscount,
          fromJson: _adminInvoiceItemDiscountValue)
      final double? discount,
      @JsonKey(
          readValue: _adminInvoiceItemStatus,
          fromJson: _adminInvoiceItemStatusValue)
      final String? status,
      @JsonKey(
          readValue: _adminInvoiceItemIssueDate,
          fromJson: _adminInvoiceItemIssueDateValue)
      final String? issueDate,
      @JsonKey(
          readValue: _adminInvoiceItemDueDate,
          fromJson: _adminInvoiceItemDueDateValue)
      final String? dueDate,
      @JsonKey(
          readValue: _adminInvoiceItemItemsCount,
          fromJson: _adminInvoiceItemItemsCountValue)
      final int? itemsCount}) = _$AdminInvoiceItemModelImpl;

  factory _AdminInvoiceItemModel.fromJson(Map<String, dynamic> json) =
      _$AdminInvoiceItemModelImpl.fromJson;

  @override
  @JsonKey(readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemInvoiceNo,
      fromJson: _adminInvoiceItemInvoiceNoValue)
  String? get invoiceNo;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemInvoiceType,
      fromJson: _adminInvoiceItemInvoiceTypeValue)
  String? get invoiceType;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemParentName,
      fromJson: _adminInvoiceItemParentNameValue)
  String? get parentName;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemTotal, fromJson: _adminInvoiceItemTotalValue)
  double? get total;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemPaidTotal,
      fromJson: _adminInvoiceItemPaidTotalValue)
  double? get paidTotal;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemBalance,
      fromJson: _adminInvoiceItemBalanceValue)
  double? get balance;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemDiscount,
      fromJson: _adminInvoiceItemDiscountValue)
  double? get discount;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemStatus,
      fromJson: _adminInvoiceItemStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemIssueDate,
      fromJson: _adminInvoiceItemIssueDateValue)
  String? get issueDate;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemDueDate,
      fromJson: _adminInvoiceItemDueDateValue)
  String? get dueDate;
  @override
  @JsonKey(
      readValue: _adminInvoiceItemItemsCount,
      fromJson: _adminInvoiceItemItemsCountValue)
  int? get itemsCount;

  /// Create a copy of AdminInvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminInvoiceItemModelImplCopyWith<_$AdminInvoiceItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdminStudentDetailModel _$AdminStudentDetailModelFromJson(
    Map<String, dynamic> json) {
  return _AdminStudentDetailModel.fromJson(json);
}

/// @nodoc
mixin _$AdminStudentDetailModel {
  @JsonKey(
      readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailFullName,
      fromJson: _adminStudentDetailFullNameValue)
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailStudentNumber,
      fromJson: _adminStudentDetailStudentNumberValue)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailGradeLevel,
      fromJson: _adminStudentDetailGradeLevelValue)
  String? get gradeLevel => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailSchoolName,
      fromJson: _adminStudentDetailSchoolNameValue)
  String? get schoolName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailStatus,
      fromJson: _adminStudentDetailStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailBirthDate,
      fromJson: _adminStudentDetailBirthDateValue)
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailCurrentJuz,
      fromJson: _adminStudentDetailCurrentJuzValue)
  int? get currentJuz => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailMemorizedPages,
      fromJson: _adminStudentDetailMemorizedPagesValue)
  int? get memorizedPages => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailTotalPoints,
      fromJson: _adminStudentDetailTotalPointsValue)
  int? get totalPoints => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailParentName,
      fromJson: _adminStudentDetailParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailParentPhone,
      fromJson: _adminStudentDetailParentPhoneValue)
  String? get parentPhone => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailParentEmail,
      fromJson: _adminStudentDetailParentEmailValue)
  String? get parentEmail => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailFatherName,
      fromJson: _adminStudentDetailFatherNameValue)
  String? get fatherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminStudentDetailMotherName,
      fromJson: _adminStudentDetailMotherNameValue)
  String? get motherName => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<AdminEnrollmentItemModel>? get enrollments =>
      throw _privateConstructorUsedError;

  /// Create a copy of AdminStudentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminStudentDetailModelCopyWith<AdminStudentDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStudentDetailModelCopyWith<$Res> {
  factory $AdminStudentDetailModelCopyWith(AdminStudentDetailModel value,
          $Res Function(AdminStudentDetailModel) then) =
      _$AdminStudentDetailModelCopyWithImpl<$Res, AdminStudentDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
      int? id,
      @JsonKey(readValue: _adminStudentDetailFullName, fromJson: _adminStudentDetailFullNameValue)
      String? fullName,
      @JsonKey(
          readValue: _adminStudentDetailStudentNumber,
          fromJson: _adminStudentDetailStudentNumberValue)
      String? studentNumber,
      @JsonKey(readValue: _adminStudentDetailGradeLevel, fromJson: _adminStudentDetailGradeLevelValue)
      String? gradeLevel,
      @JsonKey(readValue: _adminStudentDetailSchoolName, fromJson: _adminStudentDetailSchoolNameValue)
      String? schoolName,
      @JsonKey(readValue: _adminStudentDetailStatus, fromJson: _adminStudentDetailStatusValue)
      String? status,
      @JsonKey(readValue: _adminStudentDetailBirthDate, fromJson: _adminStudentDetailBirthDateValue)
      String? birthDate,
      @JsonKey(readValue: _adminStudentDetailCurrentJuz, fromJson: _adminStudentDetailCurrentJuzValue)
      int? currentJuz,
      @JsonKey(
          readValue: _adminStudentDetailMemorizedPages,
          fromJson: _adminStudentDetailMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(readValue: _adminStudentDetailTotalPoints, fromJson: _adminStudentDetailTotalPointsValue)
      int? totalPoints,
      @JsonKey(readValue: _adminStudentDetailParentName, fromJson: _adminStudentDetailParentNameValue)
      String? parentName,
      @JsonKey(
          readValue: _adminStudentDetailParentPhone,
          fromJson: _adminStudentDetailParentPhoneValue)
      String? parentPhone,
      @JsonKey(
          readValue: _adminStudentDetailParentEmail,
          fromJson: _adminStudentDetailParentEmailValue)
      String? parentEmail,
      @JsonKey(readValue: _adminStudentDetailFatherName, fromJson: _adminStudentDetailFatherNameValue)
      String? fatherName,
      @JsonKey(readValue: _adminStudentDetailMotherName, fromJson: _adminStudentDetailMotherNameValue)
      String? motherName,
      @JsonKey(readValue: readJsonList)
      List<AdminEnrollmentItemModel>? enrollments});
}

/// @nodoc
class _$AdminStudentDetailModelCopyWithImpl<$Res,
        $Val extends AdminStudentDetailModel>
    implements $AdminStudentDetailModelCopyWith<$Res> {
  _$AdminStudentDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminStudentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? studentNumber = freezed,
    Object? gradeLevel = freezed,
    Object? schoolName = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? currentJuz = freezed,
    Object? memorizedPages = freezed,
    Object? totalPoints = freezed,
    Object? parentName = freezed,
    Object? parentPhone = freezed,
    Object? parentEmail = freezed,
    Object? fatherName = freezed,
    Object? motherName = freezed,
    Object? enrollments = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currentJuz: freezed == currentJuz
          ? _value.currentJuz
          : currentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoints: freezed == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentPhone: freezed == parentPhone
          ? _value.parentPhone
          : parentPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      parentEmail: freezed == parentEmail
          ? _value.parentEmail
          : parentEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollments: freezed == enrollments
          ? _value.enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<AdminEnrollmentItemModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminStudentDetailModelImplCopyWith<$Res>
    implements $AdminStudentDetailModelCopyWith<$Res> {
  factory _$$AdminStudentDetailModelImplCopyWith(
          _$AdminStudentDetailModelImpl value,
          $Res Function(_$AdminStudentDetailModelImpl) then) =
      __$$AdminStudentDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
      int? id,
      @JsonKey(readValue: _adminStudentDetailFullName, fromJson: _adminStudentDetailFullNameValue)
      String? fullName,
      @JsonKey(
          readValue: _adminStudentDetailStudentNumber,
          fromJson: _adminStudentDetailStudentNumberValue)
      String? studentNumber,
      @JsonKey(readValue: _adminStudentDetailGradeLevel, fromJson: _adminStudentDetailGradeLevelValue)
      String? gradeLevel,
      @JsonKey(readValue: _adminStudentDetailSchoolName, fromJson: _adminStudentDetailSchoolNameValue)
      String? schoolName,
      @JsonKey(readValue: _adminStudentDetailStatus, fromJson: _adminStudentDetailStatusValue)
      String? status,
      @JsonKey(readValue: _adminStudentDetailBirthDate, fromJson: _adminStudentDetailBirthDateValue)
      String? birthDate,
      @JsonKey(readValue: _adminStudentDetailCurrentJuz, fromJson: _adminStudentDetailCurrentJuzValue)
      int? currentJuz,
      @JsonKey(
          readValue: _adminStudentDetailMemorizedPages,
          fromJson: _adminStudentDetailMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(readValue: _adminStudentDetailTotalPoints, fromJson: _adminStudentDetailTotalPointsValue)
      int? totalPoints,
      @JsonKey(readValue: _adminStudentDetailParentName, fromJson: _adminStudentDetailParentNameValue)
      String? parentName,
      @JsonKey(
          readValue: _adminStudentDetailParentPhone,
          fromJson: _adminStudentDetailParentPhoneValue)
      String? parentPhone,
      @JsonKey(
          readValue: _adminStudentDetailParentEmail,
          fromJson: _adminStudentDetailParentEmailValue)
      String? parentEmail,
      @JsonKey(readValue: _adminStudentDetailFatherName, fromJson: _adminStudentDetailFatherNameValue)
      String? fatherName,
      @JsonKey(readValue: _adminStudentDetailMotherName, fromJson: _adminStudentDetailMotherNameValue)
      String? motherName,
      @JsonKey(readValue: readJsonList)
      List<AdminEnrollmentItemModel>? enrollments});
}

/// @nodoc
class __$$AdminStudentDetailModelImplCopyWithImpl<$Res>
    extends _$AdminStudentDetailModelCopyWithImpl<$Res,
        _$AdminStudentDetailModelImpl>
    implements _$$AdminStudentDetailModelImplCopyWith<$Res> {
  __$$AdminStudentDetailModelImplCopyWithImpl(
      _$AdminStudentDetailModelImpl _value,
      $Res Function(_$AdminStudentDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminStudentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? studentNumber = freezed,
    Object? gradeLevel = freezed,
    Object? schoolName = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? currentJuz = freezed,
    Object? memorizedPages = freezed,
    Object? totalPoints = freezed,
    Object? parentName = freezed,
    Object? parentPhone = freezed,
    Object? parentEmail = freezed,
    Object? fatherName = freezed,
    Object? motherName = freezed,
    Object? enrollments = freezed,
  }) {
    return _then(_$AdminStudentDetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currentJuz: freezed == currentJuz
          ? _value.currentJuz
          : currentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoints: freezed == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentPhone: freezed == parentPhone
          ? _value.parentPhone
          : parentPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      parentEmail: freezed == parentEmail
          ? _value.parentEmail
          : parentEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollments: freezed == enrollments
          ? _value._enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<AdminEnrollmentItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AdminStudentDetailModelImpl implements _AdminStudentDetailModel {
  const _$AdminStudentDetailModelImpl(
      {@JsonKey(readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
      this.id,
      @JsonKey(readValue: _adminStudentDetailFullName, fromJson: _adminStudentDetailFullNameValue)
      this.fullName,
      @JsonKey(
          readValue: _adminStudentDetailStudentNumber,
          fromJson: _adminStudentDetailStudentNumberValue)
      this.studentNumber,
      @JsonKey(readValue: _adminStudentDetailGradeLevel, fromJson: _adminStudentDetailGradeLevelValue)
      this.gradeLevel,
      @JsonKey(
          readValue: _adminStudentDetailSchoolName,
          fromJson: _adminStudentDetailSchoolNameValue)
      this.schoolName,
      @JsonKey(readValue: _adminStudentDetailStatus, fromJson: _adminStudentDetailStatusValue)
      this.status,
      @JsonKey(
          readValue: _adminStudentDetailBirthDate,
          fromJson: _adminStudentDetailBirthDateValue)
      this.birthDate,
      @JsonKey(
          readValue: _adminStudentDetailCurrentJuz,
          fromJson: _adminStudentDetailCurrentJuzValue)
      this.currentJuz,
      @JsonKey(
          readValue: _adminStudentDetailMemorizedPages,
          fromJson: _adminStudentDetailMemorizedPagesValue)
      this.memorizedPages,
      @JsonKey(
          readValue: _adminStudentDetailTotalPoints,
          fromJson: _adminStudentDetailTotalPointsValue)
      this.totalPoints,
      @JsonKey(
          readValue: _adminStudentDetailParentName,
          fromJson: _adminStudentDetailParentNameValue)
      this.parentName,
      @JsonKey(
          readValue: _adminStudentDetailParentPhone,
          fromJson: _adminStudentDetailParentPhoneValue)
      this.parentPhone,
      @JsonKey(
          readValue: _adminStudentDetailParentEmail,
          fromJson: _adminStudentDetailParentEmailValue)
      this.parentEmail,
      @JsonKey(
          readValue: _adminStudentDetailFatherName,
          fromJson: _adminStudentDetailFatherNameValue)
      this.fatherName,
      @JsonKey(
          readValue: _adminStudentDetailMotherName,
          fromJson: _adminStudentDetailMotherNameValue)
      this.motherName,
      @JsonKey(readValue: readJsonList)
      final List<AdminEnrollmentItemModel>? enrollments})
      : _enrollments = enrollments;

  factory _$AdminStudentDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminStudentDetailModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _adminStudentDetailFullName,
      fromJson: _adminStudentDetailFullNameValue)
  final String? fullName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailStudentNumber,
      fromJson: _adminStudentDetailStudentNumberValue)
  final String? studentNumber;
  @override
  @JsonKey(
      readValue: _adminStudentDetailGradeLevel,
      fromJson: _adminStudentDetailGradeLevelValue)
  final String? gradeLevel;
  @override
  @JsonKey(
      readValue: _adminStudentDetailSchoolName,
      fromJson: _adminStudentDetailSchoolNameValue)
  final String? schoolName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailStatus,
      fromJson: _adminStudentDetailStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _adminStudentDetailBirthDate,
      fromJson: _adminStudentDetailBirthDateValue)
  final String? birthDate;
  @override
  @JsonKey(
      readValue: _adminStudentDetailCurrentJuz,
      fromJson: _adminStudentDetailCurrentJuzValue)
  final int? currentJuz;
  @override
  @JsonKey(
      readValue: _adminStudentDetailMemorizedPages,
      fromJson: _adminStudentDetailMemorizedPagesValue)
  final int? memorizedPages;
  @override
  @JsonKey(
      readValue: _adminStudentDetailTotalPoints,
      fromJson: _adminStudentDetailTotalPointsValue)
  final int? totalPoints;
  @override
  @JsonKey(
      readValue: _adminStudentDetailParentName,
      fromJson: _adminStudentDetailParentNameValue)
  final String? parentName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailParentPhone,
      fromJson: _adminStudentDetailParentPhoneValue)
  final String? parentPhone;
  @override
  @JsonKey(
      readValue: _adminStudentDetailParentEmail,
      fromJson: _adminStudentDetailParentEmailValue)
  final String? parentEmail;
  @override
  @JsonKey(
      readValue: _adminStudentDetailFatherName,
      fromJson: _adminStudentDetailFatherNameValue)
  final String? fatherName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailMotherName,
      fromJson: _adminStudentDetailMotherNameValue)
  final String? motherName;
  final List<AdminEnrollmentItemModel>? _enrollments;
  @override
  @JsonKey(readValue: readJsonList)
  List<AdminEnrollmentItemModel>? get enrollments {
    final value = _enrollments;
    if (value == null) return null;
    if (_enrollments is EqualUnmodifiableListView) return _enrollments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdminStudentDetailModel(id: $id, fullName: $fullName, studentNumber: $studentNumber, gradeLevel: $gradeLevel, schoolName: $schoolName, status: $status, birthDate: $birthDate, currentJuz: $currentJuz, memorizedPages: $memorizedPages, totalPoints: $totalPoints, parentName: $parentName, parentPhone: $parentPhone, parentEmail: $parentEmail, fatherName: $fatherName, motherName: $motherName, enrollments: $enrollments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStudentDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.gradeLevel, gradeLevel) ||
                other.gradeLevel == gradeLevel) &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.currentJuz, currentJuz) ||
                other.currentJuz == currentJuz) &&
            (identical(other.memorizedPages, memorizedPages) ||
                other.memorizedPages == memorizedPages) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.parentPhone, parentPhone) ||
                other.parentPhone == parentPhone) &&
            (identical(other.parentEmail, parentEmail) ||
                other.parentEmail == parentEmail) &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.motherName, motherName) ||
                other.motherName == motherName) &&
            const DeepCollectionEquality()
                .equals(other._enrollments, _enrollments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      studentNumber,
      gradeLevel,
      schoolName,
      status,
      birthDate,
      currentJuz,
      memorizedPages,
      totalPoints,
      parentName,
      parentPhone,
      parentEmail,
      fatherName,
      motherName,
      const DeepCollectionEquality().hash(_enrollments));

  /// Create a copy of AdminStudentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStudentDetailModelImplCopyWith<_$AdminStudentDetailModelImpl>
      get copyWith => __$$AdminStudentDetailModelImplCopyWithImpl<
          _$AdminStudentDetailModelImpl>(this, _$identity);
}

abstract class _AdminStudentDetailModel implements AdminStudentDetailModel {
  const factory _AdminStudentDetailModel(
      {@JsonKey(readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
      final int? id,
      @JsonKey(readValue: _adminStudentDetailFullName, fromJson: _adminStudentDetailFullNameValue)
      final String? fullName,
      @JsonKey(
          readValue: _adminStudentDetailStudentNumber,
          fromJson: _adminStudentDetailStudentNumberValue)
      final String? studentNumber,
      @JsonKey(readValue: _adminStudentDetailGradeLevel, fromJson: _adminStudentDetailGradeLevelValue)
      final String? gradeLevel,
      @JsonKey(readValue: _adminStudentDetailSchoolName, fromJson: _adminStudentDetailSchoolNameValue)
      final String? schoolName,
      @JsonKey(readValue: _adminStudentDetailStatus, fromJson: _adminStudentDetailStatusValue)
      final String? status,
      @JsonKey(readValue: _adminStudentDetailBirthDate, fromJson: _adminStudentDetailBirthDateValue)
      final String? birthDate,
      @JsonKey(readValue: _adminStudentDetailCurrentJuz, fromJson: _adminStudentDetailCurrentJuzValue)
      final int? currentJuz,
      @JsonKey(
          readValue: _adminStudentDetailMemorizedPages,
          fromJson: _adminStudentDetailMemorizedPagesValue)
      final int? memorizedPages,
      @JsonKey(
          readValue: _adminStudentDetailTotalPoints,
          fromJson: _adminStudentDetailTotalPointsValue)
      final int? totalPoints,
      @JsonKey(readValue: _adminStudentDetailParentName, fromJson: _adminStudentDetailParentNameValue)
      final String? parentName,
      @JsonKey(
          readValue: _adminStudentDetailParentPhone,
          fromJson: _adminStudentDetailParentPhoneValue)
      final String? parentPhone,
      @JsonKey(
          readValue: _adminStudentDetailParentEmail,
          fromJson: _adminStudentDetailParentEmailValue)
      final String? parentEmail,
      @JsonKey(readValue: _adminStudentDetailFatherName, fromJson: _adminStudentDetailFatherNameValue)
      final String? fatherName,
      @JsonKey(
          readValue: _adminStudentDetailMotherName,
          fromJson: _adminStudentDetailMotherNameValue)
      final String? motherName,
      @JsonKey(readValue: readJsonList)
      final List<AdminEnrollmentItemModel>? enrollments}) = _$AdminStudentDetailModelImpl;

  factory _AdminStudentDetailModel.fromJson(Map<String, dynamic> json) =
      _$AdminStudentDetailModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _adminStudentDetailFullName,
      fromJson: _adminStudentDetailFullNameValue)
  String? get fullName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailStudentNumber,
      fromJson: _adminStudentDetailStudentNumberValue)
  String? get studentNumber;
  @override
  @JsonKey(
      readValue: _adminStudentDetailGradeLevel,
      fromJson: _adminStudentDetailGradeLevelValue)
  String? get gradeLevel;
  @override
  @JsonKey(
      readValue: _adminStudentDetailSchoolName,
      fromJson: _adminStudentDetailSchoolNameValue)
  String? get schoolName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailStatus,
      fromJson: _adminStudentDetailStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _adminStudentDetailBirthDate,
      fromJson: _adminStudentDetailBirthDateValue)
  String? get birthDate;
  @override
  @JsonKey(
      readValue: _adminStudentDetailCurrentJuz,
      fromJson: _adminStudentDetailCurrentJuzValue)
  int? get currentJuz;
  @override
  @JsonKey(
      readValue: _adminStudentDetailMemorizedPages,
      fromJson: _adminStudentDetailMemorizedPagesValue)
  int? get memorizedPages;
  @override
  @JsonKey(
      readValue: _adminStudentDetailTotalPoints,
      fromJson: _adminStudentDetailTotalPointsValue)
  int? get totalPoints;
  @override
  @JsonKey(
      readValue: _adminStudentDetailParentName,
      fromJson: _adminStudentDetailParentNameValue)
  String? get parentName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailParentPhone,
      fromJson: _adminStudentDetailParentPhoneValue)
  String? get parentPhone;
  @override
  @JsonKey(
      readValue: _adminStudentDetailParentEmail,
      fromJson: _adminStudentDetailParentEmailValue)
  String? get parentEmail;
  @override
  @JsonKey(
      readValue: _adminStudentDetailFatherName,
      fromJson: _adminStudentDetailFatherNameValue)
  String? get fatherName;
  @override
  @JsonKey(
      readValue: _adminStudentDetailMotherName,
      fromJson: _adminStudentDetailMotherNameValue)
  String? get motherName;
  @override
  @JsonKey(readValue: readJsonList)
  List<AdminEnrollmentItemModel>? get enrollments;

  /// Create a copy of AdminStudentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminStudentDetailModelImplCopyWith<_$AdminStudentDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AdminActivityItemModel _$AdminActivityItemModelFromJson(
    Map<String, dynamic> json) {
  return _AdminActivityItemModel.fromJson(json);
}

/// @nodoc
mixin _$AdminActivityItemModel {
  @JsonKey(readValue: _adminActivityItemId, fromJson: _adminActivityItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemTitle,
      fromJson: _adminActivityItemTitleValue)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemDescription,
      fromJson: _adminActivityItemDescriptionValue)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemActivityDate,
      fromJson: _adminActivityItemActivityDateValue)
  String? get activityDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemGroupName,
      fromJson: _adminActivityItemGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemFeeAmount,
      fromJson: _adminActivityItemFeeAmountValue)
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemExpectedRevenue,
      fromJson: _adminActivityItemExpectedRevenueValue)
  double? get expectedRevenue => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemCollectedRevenue,
      fromJson: _adminActivityItemCollectedRevenueValue)
  double? get collectedRevenue => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemExpenseTotal,
      fromJson: _adminActivityItemExpenseTotalValue)
  double? get expenseTotal => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _adminActivityItemIsActive,
      fromJson: _adminActivityItemIsActiveValue)
  bool? get isActive => throw _privateConstructorUsedError;

  /// Create a copy of AdminActivityItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminActivityItemModelCopyWith<AdminActivityItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminActivityItemModelCopyWith<$Res> {
  factory $AdminActivityItemModelCopyWith(AdminActivityItemModel value,
          $Res Function(AdminActivityItemModel) then) =
      _$AdminActivityItemModelCopyWithImpl<$Res, AdminActivityItemModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _adminActivityItemId, fromJson: _adminActivityItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminActivityItemTitle,
          fromJson: _adminActivityItemTitleValue)
      String? title,
      @JsonKey(
          readValue: _adminActivityItemDescription,
          fromJson: _adminActivityItemDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _adminActivityItemActivityDate,
          fromJson: _adminActivityItemActivityDateValue)
      String? activityDate,
      @JsonKey(
          readValue: _adminActivityItemGroupName,
          fromJson: _adminActivityItemGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _adminActivityItemFeeAmount,
          fromJson: _adminActivityItemFeeAmountValue)
      double? feeAmount,
      @JsonKey(
          readValue: _adminActivityItemExpectedRevenue,
          fromJson: _adminActivityItemExpectedRevenueValue)
      double? expectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemCollectedRevenue,
          fromJson: _adminActivityItemCollectedRevenueValue)
      double? collectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemExpenseTotal,
          fromJson: _adminActivityItemExpenseTotalValue)
      double? expenseTotal,
      @JsonKey(
          readValue: _adminActivityItemIsActive,
          fromJson: _adminActivityItemIsActiveValue)
      bool? isActive});
}

/// @nodoc
class _$AdminActivityItemModelCopyWithImpl<$Res,
        $Val extends AdminActivityItemModel>
    implements $AdminActivityItemModelCopyWith<$Res> {
  _$AdminActivityItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminActivityItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? activityDate = freezed,
    Object? groupName = freezed,
    Object? feeAmount = freezed,
    Object? expectedRevenue = freezed,
    Object? collectedRevenue = freezed,
    Object? expenseTotal = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      expectedRevenue: freezed == expectedRevenue
          ? _value.expectedRevenue
          : expectedRevenue // ignore: cast_nullable_to_non_nullable
              as double?,
      collectedRevenue: freezed == collectedRevenue
          ? _value.collectedRevenue
          : collectedRevenue // ignore: cast_nullable_to_non_nullable
              as double?,
      expenseTotal: freezed == expenseTotal
          ? _value.expenseTotal
          : expenseTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminActivityItemModelImplCopyWith<$Res>
    implements $AdminActivityItemModelCopyWith<$Res> {
  factory _$$AdminActivityItemModelImplCopyWith(
          _$AdminActivityItemModelImpl value,
          $Res Function(_$AdminActivityItemModelImpl) then) =
      __$$AdminActivityItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _adminActivityItemId, fromJson: _adminActivityItemIdValue)
      int? id,
      @JsonKey(
          readValue: _adminActivityItemTitle,
          fromJson: _adminActivityItemTitleValue)
      String? title,
      @JsonKey(
          readValue: _adminActivityItemDescription,
          fromJson: _adminActivityItemDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _adminActivityItemActivityDate,
          fromJson: _adminActivityItemActivityDateValue)
      String? activityDate,
      @JsonKey(
          readValue: _adminActivityItemGroupName,
          fromJson: _adminActivityItemGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _adminActivityItemFeeAmount,
          fromJson: _adminActivityItemFeeAmountValue)
      double? feeAmount,
      @JsonKey(
          readValue: _adminActivityItemExpectedRevenue,
          fromJson: _adminActivityItemExpectedRevenueValue)
      double? expectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemCollectedRevenue,
          fromJson: _adminActivityItemCollectedRevenueValue)
      double? collectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemExpenseTotal,
          fromJson: _adminActivityItemExpenseTotalValue)
      double? expenseTotal,
      @JsonKey(
          readValue: _adminActivityItemIsActive,
          fromJson: _adminActivityItemIsActiveValue)
      bool? isActive});
}

/// @nodoc
class __$$AdminActivityItemModelImplCopyWithImpl<$Res>
    extends _$AdminActivityItemModelCopyWithImpl<$Res,
        _$AdminActivityItemModelImpl>
    implements _$$AdminActivityItemModelImplCopyWith<$Res> {
  __$$AdminActivityItemModelImplCopyWithImpl(
      _$AdminActivityItemModelImpl _value,
      $Res Function(_$AdminActivityItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminActivityItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? activityDate = freezed,
    Object? groupName = freezed,
    Object? feeAmount = freezed,
    Object? expectedRevenue = freezed,
    Object? collectedRevenue = freezed,
    Object? expenseTotal = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$AdminActivityItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      activityDate: freezed == activityDate
          ? _value.activityDate
          : activityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      expectedRevenue: freezed == expectedRevenue
          ? _value.expectedRevenue
          : expectedRevenue // ignore: cast_nullable_to_non_nullable
              as double?,
      collectedRevenue: freezed == collectedRevenue
          ? _value.collectedRevenue
          : collectedRevenue // ignore: cast_nullable_to_non_nullable
              as double?,
      expenseTotal: freezed == expenseTotal
          ? _value.expenseTotal
          : expenseTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AdminActivityItemModelImpl implements _AdminActivityItemModel {
  const _$AdminActivityItemModelImpl(
      {@JsonKey(
          readValue: _adminActivityItemId, fromJson: _adminActivityItemIdValue)
      this.id,
      @JsonKey(
          readValue: _adminActivityItemTitle,
          fromJson: _adminActivityItemTitleValue)
      this.title,
      @JsonKey(
          readValue: _adminActivityItemDescription,
          fromJson: _adminActivityItemDescriptionValue)
      this.description,
      @JsonKey(
          readValue: _adminActivityItemActivityDate,
          fromJson: _adminActivityItemActivityDateValue)
      this.activityDate,
      @JsonKey(
          readValue: _adminActivityItemGroupName,
          fromJson: _adminActivityItemGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _adminActivityItemFeeAmount,
          fromJson: _adminActivityItemFeeAmountValue)
      this.feeAmount,
      @JsonKey(
          readValue: _adminActivityItemExpectedRevenue,
          fromJson: _adminActivityItemExpectedRevenueValue)
      this.expectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemCollectedRevenue,
          fromJson: _adminActivityItemCollectedRevenueValue)
      this.collectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemExpenseTotal,
          fromJson: _adminActivityItemExpenseTotalValue)
      this.expenseTotal,
      @JsonKey(
          readValue: _adminActivityItemIsActive,
          fromJson: _adminActivityItemIsActiveValue)
      this.isActive});

  factory _$AdminActivityItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminActivityItemModelImplFromJson(json);

  @override
  @JsonKey(readValue: _adminActivityItemId, fromJson: _adminActivityItemIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _adminActivityItemTitle,
      fromJson: _adminActivityItemTitleValue)
  final String? title;
  @override
  @JsonKey(
      readValue: _adminActivityItemDescription,
      fromJson: _adminActivityItemDescriptionValue)
  final String? description;
  @override
  @JsonKey(
      readValue: _adminActivityItemActivityDate,
      fromJson: _adminActivityItemActivityDateValue)
  final String? activityDate;
  @override
  @JsonKey(
      readValue: _adminActivityItemGroupName,
      fromJson: _adminActivityItemGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _adminActivityItemFeeAmount,
      fromJson: _adminActivityItemFeeAmountValue)
  final double? feeAmount;
  @override
  @JsonKey(
      readValue: _adminActivityItemExpectedRevenue,
      fromJson: _adminActivityItemExpectedRevenueValue)
  final double? expectedRevenue;
  @override
  @JsonKey(
      readValue: _adminActivityItemCollectedRevenue,
      fromJson: _adminActivityItemCollectedRevenueValue)
  final double? collectedRevenue;
  @override
  @JsonKey(
      readValue: _adminActivityItemExpenseTotal,
      fromJson: _adminActivityItemExpenseTotalValue)
  final double? expenseTotal;
  @override
  @JsonKey(
      readValue: _adminActivityItemIsActive,
      fromJson: _adminActivityItemIsActiveValue)
  final bool? isActive;

  @override
  String toString() {
    return 'AdminActivityItemModel(id: $id, title: $title, description: $description, activityDate: $activityDate, groupName: $groupName, feeAmount: $feeAmount, expectedRevenue: $expectedRevenue, collectedRevenue: $collectedRevenue, expenseTotal: $expenseTotal, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminActivityItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.expectedRevenue, expectedRevenue) ||
                other.expectedRevenue == expectedRevenue) &&
            (identical(other.collectedRevenue, collectedRevenue) ||
                other.collectedRevenue == collectedRevenue) &&
            (identical(other.expenseTotal, expenseTotal) ||
                other.expenseTotal == expenseTotal) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      activityDate,
      groupName,
      feeAmount,
      expectedRevenue,
      collectedRevenue,
      expenseTotal,
      isActive);

  /// Create a copy of AdminActivityItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminActivityItemModelImplCopyWith<_$AdminActivityItemModelImpl>
      get copyWith => __$$AdminActivityItemModelImplCopyWithImpl<
          _$AdminActivityItemModelImpl>(this, _$identity);
}

abstract class _AdminActivityItemModel implements AdminActivityItemModel {
  const factory _AdminActivityItemModel(
      {@JsonKey(
          readValue: _adminActivityItemId, fromJson: _adminActivityItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _adminActivityItemTitle,
          fromJson: _adminActivityItemTitleValue)
      final String? title,
      @JsonKey(
          readValue: _adminActivityItemDescription,
          fromJson: _adminActivityItemDescriptionValue)
      final String? description,
      @JsonKey(
          readValue: _adminActivityItemActivityDate,
          fromJson: _adminActivityItemActivityDateValue)
      final String? activityDate,
      @JsonKey(
          readValue: _adminActivityItemGroupName,
          fromJson: _adminActivityItemGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _adminActivityItemFeeAmount,
          fromJson: _adminActivityItemFeeAmountValue)
      final double? feeAmount,
      @JsonKey(
          readValue: _adminActivityItemExpectedRevenue,
          fromJson: _adminActivityItemExpectedRevenueValue)
      final double? expectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemCollectedRevenue,
          fromJson: _adminActivityItemCollectedRevenueValue)
      final double? collectedRevenue,
      @JsonKey(
          readValue: _adminActivityItemExpenseTotal,
          fromJson: _adminActivityItemExpenseTotalValue)
      final double? expenseTotal,
      @JsonKey(
          readValue: _adminActivityItemIsActive,
          fromJson: _adminActivityItemIsActiveValue)
      final bool? isActive}) = _$AdminActivityItemModelImpl;

  factory _AdminActivityItemModel.fromJson(Map<String, dynamic> json) =
      _$AdminActivityItemModelImpl.fromJson;

  @override
  @JsonKey(readValue: _adminActivityItemId, fromJson: _adminActivityItemIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _adminActivityItemTitle,
      fromJson: _adminActivityItemTitleValue)
  String? get title;
  @override
  @JsonKey(
      readValue: _adminActivityItemDescription,
      fromJson: _adminActivityItemDescriptionValue)
  String? get description;
  @override
  @JsonKey(
      readValue: _adminActivityItemActivityDate,
      fromJson: _adminActivityItemActivityDateValue)
  String? get activityDate;
  @override
  @JsonKey(
      readValue: _adminActivityItemGroupName,
      fromJson: _adminActivityItemGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _adminActivityItemFeeAmount,
      fromJson: _adminActivityItemFeeAmountValue)
  double? get feeAmount;
  @override
  @JsonKey(
      readValue: _adminActivityItemExpectedRevenue,
      fromJson: _adminActivityItemExpectedRevenueValue)
  double? get expectedRevenue;
  @override
  @JsonKey(
      readValue: _adminActivityItemCollectedRevenue,
      fromJson: _adminActivityItemCollectedRevenueValue)
  double? get collectedRevenue;
  @override
  @JsonKey(
      readValue: _adminActivityItemExpenseTotal,
      fromJson: _adminActivityItemExpenseTotalValue)
  double? get expenseTotal;
  @override
  @JsonKey(
      readValue: _adminActivityItemIsActive,
      fromJson: _adminActivityItemIsActiveValue)
  bool? get isActive;

  /// Create a copy of AdminActivityItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminActivityItemModelImplCopyWith<_$AdminActivityItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ScanAttendanceResultModel _$ScanAttendanceResultModelFromJson(
    Map<String, dynamic> json) {
  return _ScanAttendanceResultModel.fromJson(json);
}

/// @nodoc
mixin _$ScanAttendanceResultModel {
  @JsonKey(
      readValue: _scanAttendanceResultAttendanceStatusId,
      fromJson: _scanAttendanceResultAttendanceStatusIdValue)
  String? get attendanceStatusId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _scanAttendanceResultAttendanceStatusName,
      fromJson: _scanAttendanceResultAttendanceStatusNameValue)
  String? get attendanceStatusName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _scanAttendanceResultEnrollmentId,
      fromJson: _scanAttendanceResultEnrollmentIdValue)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _scanAttendanceResultStudentId,
      fromJson: _scanAttendanceResultStudentIdValue)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _scanAttendanceResultStudentName,
      fromJson: _scanAttendanceResultStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _scanAttendanceResultGroupId,
      fromJson: _scanAttendanceResultGroupIdValue)
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _scanAttendanceResultGroupName,
      fromJson: _scanAttendanceResultGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;

  /// Create a copy of ScanAttendanceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScanAttendanceResultModelCopyWith<ScanAttendanceResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanAttendanceResultModelCopyWith<$Res> {
  factory $ScanAttendanceResultModelCopyWith(ScanAttendanceResultModel value,
          $Res Function(ScanAttendanceResultModel) then) =
      _$ScanAttendanceResultModelCopyWithImpl<$Res, ScanAttendanceResultModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusId,
          fromJson: _scanAttendanceResultAttendanceStatusIdValue)
      String? attendanceStatusId,
      @JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusName,
          fromJson: _scanAttendanceResultAttendanceStatusNameValue)
      String? attendanceStatusName,
      @JsonKey(
          readValue: _scanAttendanceResultEnrollmentId,
          fromJson: _scanAttendanceResultEnrollmentIdValue)
      int? enrollmentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentId,
          fromJson: _scanAttendanceResultStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentName,
          fromJson: _scanAttendanceResultStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _scanAttendanceResultGroupId,
          fromJson: _scanAttendanceResultGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _scanAttendanceResultGroupName,
          fromJson: _scanAttendanceResultGroupNameValue)
      String? groupName});
}

/// @nodoc
class _$ScanAttendanceResultModelCopyWithImpl<$Res,
        $Val extends ScanAttendanceResultModel>
    implements $ScanAttendanceResultModelCopyWith<$Res> {
  _$ScanAttendanceResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanAttendanceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceStatusId = freezed,
    Object? attendanceStatusName = freezed,
    Object? enrollmentId = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? groupId = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceStatusName: freezed == attendanceStatusName
          ? _value.attendanceStatusName
          : attendanceStatusName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanAttendanceResultModelImplCopyWith<$Res>
    implements $ScanAttendanceResultModelCopyWith<$Res> {
  factory _$$ScanAttendanceResultModelImplCopyWith(
          _$ScanAttendanceResultModelImpl value,
          $Res Function(_$ScanAttendanceResultModelImpl) then) =
      __$$ScanAttendanceResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusId,
          fromJson: _scanAttendanceResultAttendanceStatusIdValue)
      String? attendanceStatusId,
      @JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusName,
          fromJson: _scanAttendanceResultAttendanceStatusNameValue)
      String? attendanceStatusName,
      @JsonKey(
          readValue: _scanAttendanceResultEnrollmentId,
          fromJson: _scanAttendanceResultEnrollmentIdValue)
      int? enrollmentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentId,
          fromJson: _scanAttendanceResultStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentName,
          fromJson: _scanAttendanceResultStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _scanAttendanceResultGroupId,
          fromJson: _scanAttendanceResultGroupIdValue)
      int? groupId,
      @JsonKey(
          readValue: _scanAttendanceResultGroupName,
          fromJson: _scanAttendanceResultGroupNameValue)
      String? groupName});
}

/// @nodoc
class __$$ScanAttendanceResultModelImplCopyWithImpl<$Res>
    extends _$ScanAttendanceResultModelCopyWithImpl<$Res,
        _$ScanAttendanceResultModelImpl>
    implements _$$ScanAttendanceResultModelImplCopyWith<$Res> {
  __$$ScanAttendanceResultModelImplCopyWithImpl(
      _$ScanAttendanceResultModelImpl _value,
      $Res Function(_$ScanAttendanceResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanAttendanceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceStatusId = freezed,
    Object? attendanceStatusName = freezed,
    Object? enrollmentId = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? groupId = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_$ScanAttendanceResultModelImpl(
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceStatusName: freezed == attendanceStatusName
          ? _value.attendanceStatusName
          : attendanceStatusName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ScanAttendanceResultModelImpl implements _ScanAttendanceResultModel {
  const _$ScanAttendanceResultModelImpl(
      {@JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusId,
          fromJson: _scanAttendanceResultAttendanceStatusIdValue)
      this.attendanceStatusId,
      @JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusName,
          fromJson: _scanAttendanceResultAttendanceStatusNameValue)
      this.attendanceStatusName,
      @JsonKey(
          readValue: _scanAttendanceResultEnrollmentId,
          fromJson: _scanAttendanceResultEnrollmentIdValue)
      this.enrollmentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentId,
          fromJson: _scanAttendanceResultStudentIdValue)
      this.studentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentName,
          fromJson: _scanAttendanceResultStudentNameValue)
      this.studentName,
      @JsonKey(
          readValue: _scanAttendanceResultGroupId,
          fromJson: _scanAttendanceResultGroupIdValue)
      this.groupId,
      @JsonKey(
          readValue: _scanAttendanceResultGroupName,
          fromJson: _scanAttendanceResultGroupNameValue)
      this.groupName});

  factory _$ScanAttendanceResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanAttendanceResultModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _scanAttendanceResultAttendanceStatusId,
      fromJson: _scanAttendanceResultAttendanceStatusIdValue)
  final String? attendanceStatusId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultAttendanceStatusName,
      fromJson: _scanAttendanceResultAttendanceStatusNameValue)
  final String? attendanceStatusName;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultEnrollmentId,
      fromJson: _scanAttendanceResultEnrollmentIdValue)
  final int? enrollmentId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultStudentId,
      fromJson: _scanAttendanceResultStudentIdValue)
  final int? studentId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultStudentName,
      fromJson: _scanAttendanceResultStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultGroupId,
      fromJson: _scanAttendanceResultGroupIdValue)
  final int? groupId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultGroupName,
      fromJson: _scanAttendanceResultGroupNameValue)
  final String? groupName;

  @override
  String toString() {
    return 'ScanAttendanceResultModel(attendanceStatusId: $attendanceStatusId, attendanceStatusName: $attendanceStatusName, enrollmentId: $enrollmentId, studentId: $studentId, studentName: $studentName, groupId: $groupId, groupName: $groupName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanAttendanceResultModelImpl &&
            (identical(other.attendanceStatusId, attendanceStatusId) ||
                other.attendanceStatusId == attendanceStatusId) &&
            (identical(other.attendanceStatusName, attendanceStatusName) ||
                other.attendanceStatusName == attendanceStatusName) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      attendanceStatusId,
      attendanceStatusName,
      enrollmentId,
      studentId,
      studentName,
      groupId,
      groupName);

  /// Create a copy of ScanAttendanceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanAttendanceResultModelImplCopyWith<_$ScanAttendanceResultModelImpl>
      get copyWith => __$$ScanAttendanceResultModelImplCopyWithImpl<
          _$ScanAttendanceResultModelImpl>(this, _$identity);
}

abstract class _ScanAttendanceResultModel implements ScanAttendanceResultModel {
  const factory _ScanAttendanceResultModel(
      {@JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusId,
          fromJson: _scanAttendanceResultAttendanceStatusIdValue)
      final String? attendanceStatusId,
      @JsonKey(
          readValue: _scanAttendanceResultAttendanceStatusName,
          fromJson: _scanAttendanceResultAttendanceStatusNameValue)
      final String? attendanceStatusName,
      @JsonKey(
          readValue: _scanAttendanceResultEnrollmentId,
          fromJson: _scanAttendanceResultEnrollmentIdValue)
      final int? enrollmentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentId,
          fromJson: _scanAttendanceResultStudentIdValue)
      final int? studentId,
      @JsonKey(
          readValue: _scanAttendanceResultStudentName,
          fromJson: _scanAttendanceResultStudentNameValue)
      final String? studentName,
      @JsonKey(
          readValue: _scanAttendanceResultGroupId,
          fromJson: _scanAttendanceResultGroupIdValue)
      final int? groupId,
      @JsonKey(
          readValue: _scanAttendanceResultGroupName,
          fromJson: _scanAttendanceResultGroupNameValue)
      final String? groupName}) = _$ScanAttendanceResultModelImpl;

  factory _ScanAttendanceResultModel.fromJson(Map<String, dynamic> json) =
      _$ScanAttendanceResultModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _scanAttendanceResultAttendanceStatusId,
      fromJson: _scanAttendanceResultAttendanceStatusIdValue)
  String? get attendanceStatusId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultAttendanceStatusName,
      fromJson: _scanAttendanceResultAttendanceStatusNameValue)
  String? get attendanceStatusName;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultEnrollmentId,
      fromJson: _scanAttendanceResultEnrollmentIdValue)
  int? get enrollmentId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultStudentId,
      fromJson: _scanAttendanceResultStudentIdValue)
  int? get studentId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultStudentName,
      fromJson: _scanAttendanceResultStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultGroupId,
      fromJson: _scanAttendanceResultGroupIdValue)
  int? get groupId;
  @override
  @JsonKey(
      readValue: _scanAttendanceResultGroupName,
      fromJson: _scanAttendanceResultGroupNameValue)
  String? get groupName;

  /// Create a copy of ScanAttendanceResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanAttendanceResultModelImplCopyWith<_$ScanAttendanceResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
