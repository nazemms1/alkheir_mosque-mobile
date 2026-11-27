// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateGroupParams _$CreateGroupParamsFromJson(Map<String, dynamic> json) {
  return _CreateGroupParams.fromJson(json);
}

/// @nodoc
mixin _$CreateGroupParams {
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  int? get academicYearId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  int? get teacherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
  int? get assistantTeacherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  int? get gradeLevelId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  int? get monthlyFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this CreateGroupParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateGroupParamsCopyWith<CreateGroupParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupParamsCopyWith<$Res> {
  factory $CreateGroupParamsCopyWith(
          CreateGroupParams value, $Res Function(CreateGroupParams) then) =
      _$CreateGroupParamsCopyWithImpl<$Res, CreateGroupParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      int? academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
      @JsonKey(includeIfNull: true) int? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) int? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class _$CreateGroupParamsCopyWithImpl<$Res, $Val extends CreateGroupParams>
    implements $CreateGroupParamsCopyWith<$Res> {
  _$CreateGroupParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
              as int?,
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
abstract class _$$CreateGroupParamsImplCopyWith<$Res>
    implements $CreateGroupParamsCopyWith<$Res> {
  factory _$$CreateGroupParamsImplCopyWith(_$CreateGroupParamsImpl value,
          $Res Function(_$CreateGroupParamsImpl) then) =
      __$$CreateGroupParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      int? academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
      @JsonKey(includeIfNull: true) int? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) int? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class __$$CreateGroupParamsImplCopyWithImpl<$Res>
    extends _$CreateGroupParamsCopyWithImpl<$Res, _$CreateGroupParamsImpl>
    implements _$$CreateGroupParamsImplCopyWith<$Res> {
  __$$CreateGroupParamsImplCopyWithImpl(_$CreateGroupParamsImpl _value,
      $Res Function(_$CreateGroupParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    return _then(_$CreateGroupParamsImpl(
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
              as int?,
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

@JsonSerializable(includeIfNull: false)
class _$CreateGroupParamsImpl implements _CreateGroupParams {
  const _$CreateGroupParamsImpl(
      {@JsonKey(includeIfNull: true) this.name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      this.academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) this.courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) this.teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      this.assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) this.gradeLevelId,
      @JsonKey(includeIfNull: true) this.capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) this.monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) this.startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) this.endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) this.isActive});

  factory _$CreateGroupParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateGroupParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  final int? academicYearId;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  final int? courseId;
  @override
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  final int? teacherId;
  @override
  @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
  final int? assistantTeacherId;
  @override
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  final int? gradeLevelId;
  @override
  @JsonKey(includeIfNull: true)
  final int? capacity;
  @override
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  final int? monthlyFee;
  @override
  @JsonKey(name: 'starts_on', includeIfNull: true)
  final String? startsOn;
  @override
  @JsonKey(name: 'ends_on', includeIfNull: true)
  final String? endsOn;
  @override
  @JsonKey(name: 'is_active', includeIfNull: true)
  final bool? isActive;

  @override
  String toString() {
    return 'CreateGroupParams(name: $name, academicYearId: $academicYearId, courseId: $courseId, teacherId: $teacherId, assistantTeacherId: $assistantTeacherId, gradeLevelId: $gradeLevelId, capacity: $capacity, monthlyFee: $monthlyFee, startsOn: $startsOn, endsOn: $endsOn, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGroupParamsImpl &&
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

  /// Create a copy of CreateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGroupParamsImplCopyWith<_$CreateGroupParamsImpl> get copyWith =>
      __$$CreateGroupParamsImplCopyWithImpl<_$CreateGroupParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateGroupParamsImplToJson(
      this,
    );
  }
}

abstract class _CreateGroupParams implements CreateGroupParams {
  const factory _CreateGroupParams(
      {@JsonKey(includeIfNull: true) final String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      final int? academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) final int? courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) final int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      final int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true)
      final int? gradeLevelId,
      @JsonKey(includeIfNull: true) final int? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) final int? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) final String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) final String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true)
      final bool? isActive}) = _$CreateGroupParamsImpl;

  factory _CreateGroupParams.fromJson(Map<String, dynamic> json) =
      _$CreateGroupParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get name;
  @override
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  int? get academicYearId;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId;
  @override
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  int? get teacherId;
  @override
  @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
  int? get assistantTeacherId;
  @override
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  int? get gradeLevelId;
  @override
  @JsonKey(includeIfNull: true)
  int? get capacity;
  @override
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  int? get monthlyFee;
  @override
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn;
  @override
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn;
  @override
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive;

  /// Create a copy of CreateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateGroupParamsImplCopyWith<_$CreateGroupParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenStudentAttendanceDayParams _$OpenStudentAttendanceDayParamsFromJson(
    Map<String, dynamic> json) {
  return _OpenStudentAttendanceDayParams.fromJson(json);
}

/// @nodoc
mixin _$OpenStudentAttendanceDayParams {
  @JsonKey(name: 'group_id', includeIfNull: true)
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate => throw _privateConstructorUsedError;

  /// Serializes this OpenStudentAttendanceDayParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenStudentAttendanceDayParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenStudentAttendanceDayParamsCopyWith<OpenStudentAttendanceDayParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenStudentAttendanceDayParamsCopyWith<$Res> {
  factory $OpenStudentAttendanceDayParamsCopyWith(
          OpenStudentAttendanceDayParams value,
          $Res Function(OpenStudentAttendanceDayParams) then) =
      _$OpenStudentAttendanceDayParamsCopyWithImpl<$Res,
          OpenStudentAttendanceDayParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'group_id', includeIfNull: true) int? groupId,
      @JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate});
}

/// @nodoc
class _$OpenStudentAttendanceDayParamsCopyWithImpl<$Res,
        $Val extends OpenStudentAttendanceDayParams>
    implements $OpenStudentAttendanceDayParamsCopyWith<$Res> {
  _$OpenStudentAttendanceDayParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenStudentAttendanceDayParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = freezed,
    Object? attendanceDate = freezed,
  }) {
    return _then(_value.copyWith(
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenStudentAttendanceDayParamsImplCopyWith<$Res>
    implements $OpenStudentAttendanceDayParamsCopyWith<$Res> {
  factory _$$OpenStudentAttendanceDayParamsImplCopyWith(
          _$OpenStudentAttendanceDayParamsImpl value,
          $Res Function(_$OpenStudentAttendanceDayParamsImpl) then) =
      __$$OpenStudentAttendanceDayParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'group_id', includeIfNull: true) int? groupId,
      @JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate});
}

/// @nodoc
class __$$OpenStudentAttendanceDayParamsImplCopyWithImpl<$Res>
    extends _$OpenStudentAttendanceDayParamsCopyWithImpl<$Res,
        _$OpenStudentAttendanceDayParamsImpl>
    implements _$$OpenStudentAttendanceDayParamsImplCopyWith<$Res> {
  __$$OpenStudentAttendanceDayParamsImplCopyWithImpl(
      _$OpenStudentAttendanceDayParamsImpl _value,
      $Res Function(_$OpenStudentAttendanceDayParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenStudentAttendanceDayParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = freezed,
    Object? attendanceDate = freezed,
  }) {
    return _then(_$OpenStudentAttendanceDayParamsImpl(
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$OpenStudentAttendanceDayParamsImpl
    implements _OpenStudentAttendanceDayParams {
  const _$OpenStudentAttendanceDayParamsImpl(
      {@JsonKey(name: 'group_id', includeIfNull: true) this.groupId,
      @JsonKey(name: 'attendance_date', includeIfNull: true)
      this.attendanceDate});

  factory _$OpenStudentAttendanceDayParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OpenStudentAttendanceDayParamsImplFromJson(json);

  @override
  @JsonKey(name: 'group_id', includeIfNull: true)
  final int? groupId;
  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  final String? attendanceDate;

  @override
  String toString() {
    return 'OpenStudentAttendanceDayParams(groupId: $groupId, attendanceDate: $attendanceDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenStudentAttendanceDayParamsImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, groupId, attendanceDate);

  /// Create a copy of OpenStudentAttendanceDayParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenStudentAttendanceDayParamsImplCopyWith<
          _$OpenStudentAttendanceDayParamsImpl>
      get copyWith => __$$OpenStudentAttendanceDayParamsImplCopyWithImpl<
          _$OpenStudentAttendanceDayParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenStudentAttendanceDayParamsImplToJson(
      this,
    );
  }
}

abstract class _OpenStudentAttendanceDayParams
    implements OpenStudentAttendanceDayParams {
  const factory _OpenStudentAttendanceDayParams(
      {@JsonKey(name: 'group_id', includeIfNull: true) final int? groupId,
      @JsonKey(name: 'attendance_date', includeIfNull: true)
      final String? attendanceDate}) = _$OpenStudentAttendanceDayParamsImpl;

  factory _OpenStudentAttendanceDayParams.fromJson(Map<String, dynamic> json) =
      _$OpenStudentAttendanceDayParamsImpl.fromJson;

  @override
  @JsonKey(name: 'group_id', includeIfNull: true)
  int? get groupId;
  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate;

  /// Create a copy of OpenStudentAttendanceDayParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenStudentAttendanceDayParamsImplCopyWith<
          _$OpenStudentAttendanceDayParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuickScanStudentAttendanceParams _$QuickScanStudentAttendanceParamsFromJson(
    Map<String, dynamic> json) {
  return _QuickScanStudentAttendanceParams.fromJson(json);
}

/// @nodoc
mixin _$QuickScanStudentAttendanceParams {
  @JsonKey(name: 'scan_value', includeIfNull: true)
  String? get scanValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_status_id', includeIfNull: true)
  int? get attendanceStatusId => throw _privateConstructorUsedError;

  /// Serializes this QuickScanStudentAttendanceParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuickScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuickScanStudentAttendanceParamsCopyWith<QuickScanStudentAttendanceParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickScanStudentAttendanceParamsCopyWith<$Res> {
  factory $QuickScanStudentAttendanceParamsCopyWith(
          QuickScanStudentAttendanceParams value,
          $Res Function(QuickScanStudentAttendanceParams) then) =
      _$QuickScanStudentAttendanceParamsCopyWithImpl<$Res,
          QuickScanStudentAttendanceParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'scan_value', includeIfNull: true) String? scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      int? attendanceStatusId});
}

/// @nodoc
class _$QuickScanStudentAttendanceParamsCopyWithImpl<$Res,
        $Val extends QuickScanStudentAttendanceParams>
    implements $QuickScanStudentAttendanceParamsCopyWith<$Res> {
  _$QuickScanStudentAttendanceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuickScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanValue = freezed,
    Object? attendanceStatusId = freezed,
  }) {
    return _then(_value.copyWith(
      scanValue: freezed == scanValue
          ? _value.scanValue
          : scanValue // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuickScanStudentAttendanceParamsImplCopyWith<$Res>
    implements $QuickScanStudentAttendanceParamsCopyWith<$Res> {
  factory _$$QuickScanStudentAttendanceParamsImplCopyWith(
          _$QuickScanStudentAttendanceParamsImpl value,
          $Res Function(_$QuickScanStudentAttendanceParamsImpl) then) =
      __$$QuickScanStudentAttendanceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'scan_value', includeIfNull: true) String? scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      int? attendanceStatusId});
}

/// @nodoc
class __$$QuickScanStudentAttendanceParamsImplCopyWithImpl<$Res>
    extends _$QuickScanStudentAttendanceParamsCopyWithImpl<$Res,
        _$QuickScanStudentAttendanceParamsImpl>
    implements _$$QuickScanStudentAttendanceParamsImplCopyWith<$Res> {
  __$$QuickScanStudentAttendanceParamsImplCopyWithImpl(
      _$QuickScanStudentAttendanceParamsImpl _value,
      $Res Function(_$QuickScanStudentAttendanceParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuickScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanValue = freezed,
    Object? attendanceStatusId = freezed,
  }) {
    return _then(_$QuickScanStudentAttendanceParamsImpl(
      scanValue: freezed == scanValue
          ? _value.scanValue
          : scanValue // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$QuickScanStudentAttendanceParamsImpl
    implements _QuickScanStudentAttendanceParams {
  const _$QuickScanStudentAttendanceParamsImpl(
      {@JsonKey(name: 'scan_value', includeIfNull: true) this.scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      this.attendanceStatusId});

  factory _$QuickScanStudentAttendanceParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$QuickScanStudentAttendanceParamsImplFromJson(json);

  @override
  @JsonKey(name: 'scan_value', includeIfNull: true)
  final String? scanValue;
  @override
  @JsonKey(name: 'attendance_status_id', includeIfNull: true)
  final int? attendanceStatusId;

  @override
  String toString() {
    return 'QuickScanStudentAttendanceParams(scanValue: $scanValue, attendanceStatusId: $attendanceStatusId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickScanStudentAttendanceParamsImpl &&
            (identical(other.scanValue, scanValue) ||
                other.scanValue == scanValue) &&
            (identical(other.attendanceStatusId, attendanceStatusId) ||
                other.attendanceStatusId == attendanceStatusId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scanValue, attendanceStatusId);

  /// Create a copy of QuickScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickScanStudentAttendanceParamsImplCopyWith<
          _$QuickScanStudentAttendanceParamsImpl>
      get copyWith => __$$QuickScanStudentAttendanceParamsImplCopyWithImpl<
          _$QuickScanStudentAttendanceParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickScanStudentAttendanceParamsImplToJson(
      this,
    );
  }
}

abstract class _QuickScanStudentAttendanceParams
    implements QuickScanStudentAttendanceParams {
  const factory _QuickScanStudentAttendanceParams(
      {@JsonKey(name: 'scan_value', includeIfNull: true)
      final String? scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      final int? attendanceStatusId}) = _$QuickScanStudentAttendanceParamsImpl;

  factory _QuickScanStudentAttendanceParams.fromJson(
          Map<String, dynamic> json) =
      _$QuickScanStudentAttendanceParamsImpl.fromJson;

  @override
  @JsonKey(name: 'scan_value', includeIfNull: true)
  String? get scanValue;
  @override
  @JsonKey(name: 'attendance_status_id', includeIfNull: true)
  int? get attendanceStatusId;

  /// Create a copy of QuickScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickScanStudentAttendanceParamsImplCopyWith<
          _$QuickScanStudentAttendanceParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecordGroupAttendanceParams _$RecordGroupAttendanceParamsFromJson(
    Map<String, dynamic> json) {
  return _RecordGroupAttendanceParams.fromJson(json);
}

/// @nodoc
mixin _$RecordGroupAttendanceParams {
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  Object? get records => throw _privateConstructorUsedError;

  /// Serializes this RecordGroupAttendanceParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordGroupAttendanceParamsCopyWith<RecordGroupAttendanceParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordGroupAttendanceParamsCopyWith<$Res> {
  factory $RecordGroupAttendanceParamsCopyWith(
          RecordGroupAttendanceParams value,
          $Res Function(RecordGroupAttendanceParams) then) =
      _$RecordGroupAttendanceParamsCopyWithImpl<$Res,
          RecordGroupAttendanceParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate,
      @JsonKey(includeIfNull: true) String? notes,
      @JsonKey(includeIfNull: true) Object? records});
}

/// @nodoc
class _$RecordGroupAttendanceParamsCopyWithImpl<$Res,
        $Val extends RecordGroupAttendanceParams>
    implements $RecordGroupAttendanceParamsCopyWith<$Res> {
  _$RecordGroupAttendanceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? notes = freezed,
    Object? records = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records ? _value.records : records,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordGroupAttendanceParamsImplCopyWith<$Res>
    implements $RecordGroupAttendanceParamsCopyWith<$Res> {
  factory _$$RecordGroupAttendanceParamsImplCopyWith(
          _$RecordGroupAttendanceParamsImpl value,
          $Res Function(_$RecordGroupAttendanceParamsImpl) then) =
      __$$RecordGroupAttendanceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate,
      @JsonKey(includeIfNull: true) String? notes,
      @JsonKey(includeIfNull: true) Object? records});
}

/// @nodoc
class __$$RecordGroupAttendanceParamsImplCopyWithImpl<$Res>
    extends _$RecordGroupAttendanceParamsCopyWithImpl<$Res,
        _$RecordGroupAttendanceParamsImpl>
    implements _$$RecordGroupAttendanceParamsImplCopyWith<$Res> {
  __$$RecordGroupAttendanceParamsImplCopyWithImpl(
      _$RecordGroupAttendanceParamsImpl _value,
      $Res Function(_$RecordGroupAttendanceParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? notes = freezed,
    Object? records = freezed,
  }) {
    return _then(_$RecordGroupAttendanceParamsImpl(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records ? _value.records : records,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RecordGroupAttendanceParamsImpl
    implements _RecordGroupAttendanceParams {
  const _$RecordGroupAttendanceParamsImpl(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      this.attendanceDate,
      @JsonKey(includeIfNull: true) this.notes,
      @JsonKey(includeIfNull: true) this.records});

  factory _$RecordGroupAttendanceParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RecordGroupAttendanceParamsImplFromJson(json);

  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  final String? attendanceDate;
  @override
  @JsonKey(includeIfNull: true)
  final String? notes;
  @override
  @JsonKey(includeIfNull: true)
  final Object? records;

  @override
  String toString() {
    return 'RecordGroupAttendanceParams(attendanceDate: $attendanceDate, notes: $notes, records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordGroupAttendanceParamsImpl &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other.records, records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attendanceDate, notes,
      const DeepCollectionEquality().hash(records));

  /// Create a copy of RecordGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordGroupAttendanceParamsImplCopyWith<_$RecordGroupAttendanceParamsImpl>
      get copyWith => __$$RecordGroupAttendanceParamsImplCopyWithImpl<
          _$RecordGroupAttendanceParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordGroupAttendanceParamsImplToJson(
      this,
    );
  }
}

abstract class _RecordGroupAttendanceParams
    implements RecordGroupAttendanceParams {
  const factory _RecordGroupAttendanceParams(
          {@JsonKey(name: 'attendance_date', includeIfNull: true)
          final String? attendanceDate,
          @JsonKey(includeIfNull: true) final String? notes,
          @JsonKey(includeIfNull: true) final Object? records}) =
      _$RecordGroupAttendanceParamsImpl;

  factory _RecordGroupAttendanceParams.fromJson(Map<String, dynamic> json) =
      _$RecordGroupAttendanceParamsImpl.fromJson;

  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate;
  @override
  @JsonKey(includeIfNull: true)
  String? get notes;
  @override
  @JsonKey(includeIfNull: true)
  Object? get records;

  /// Create a copy of RecordGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordGroupAttendanceParamsImplCopyWith<_$RecordGroupAttendanceParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecordMemorizationParams _$RecordMemorizationParamsFromJson(
    Map<String, dynamic> json) {
  return _RecordMemorizationParams.fromJson(json);
}

/// @nodoc
mixin _$RecordMemorizationParams {
  @JsonKey(name: 'entry_type', includeIfNull: true)
  String? get entryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_page', includeIfNull: true)
  int? get fromPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_page', includeIfNull: true)
  int? get toPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_on', includeIfNull: true)
  String? get recordedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  String? get teacherId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this RecordMemorizationParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordMemorizationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordMemorizationParamsCopyWith<RecordMemorizationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordMemorizationParamsCopyWith<$Res> {
  factory $RecordMemorizationParamsCopyWith(RecordMemorizationParams value,
          $Res Function(RecordMemorizationParams) then) =
      _$RecordMemorizationParamsCopyWithImpl<$Res, RecordMemorizationParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'entry_type', includeIfNull: true) String? entryType,
      @JsonKey(name: 'from_page', includeIfNull: true) int? fromPage,
      @JsonKey(name: 'to_page', includeIfNull: true) int? toPage,
      @JsonKey(name: 'recorded_on', includeIfNull: true) String? recordedOn,
      @JsonKey(name: 'teacher_id', includeIfNull: true) String? teacherId,
      @JsonKey(includeIfNull: true) String? notes});
}

/// @nodoc
class _$RecordMemorizationParamsCopyWithImpl<$Res,
        $Val extends RecordMemorizationParams>
    implements $RecordMemorizationParamsCopyWith<$Res> {
  _$RecordMemorizationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordMemorizationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryType = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
    Object? recordedOn = freezed,
    Object? teacherId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      fromPage: freezed == fromPage
          ? _value.fromPage
          : fromPage // ignore: cast_nullable_to_non_nullable
              as int?,
      toPage: freezed == toPage
          ? _value.toPage
          : toPage // ignore: cast_nullable_to_non_nullable
              as int?,
      recordedOn: freezed == recordedOn
          ? _value.recordedOn
          : recordedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordMemorizationParamsImplCopyWith<$Res>
    implements $RecordMemorizationParamsCopyWith<$Res> {
  factory _$$RecordMemorizationParamsImplCopyWith(
          _$RecordMemorizationParamsImpl value,
          $Res Function(_$RecordMemorizationParamsImpl) then) =
      __$$RecordMemorizationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'entry_type', includeIfNull: true) String? entryType,
      @JsonKey(name: 'from_page', includeIfNull: true) int? fromPage,
      @JsonKey(name: 'to_page', includeIfNull: true) int? toPage,
      @JsonKey(name: 'recorded_on', includeIfNull: true) String? recordedOn,
      @JsonKey(name: 'teacher_id', includeIfNull: true) String? teacherId,
      @JsonKey(includeIfNull: true) String? notes});
}

/// @nodoc
class __$$RecordMemorizationParamsImplCopyWithImpl<$Res>
    extends _$RecordMemorizationParamsCopyWithImpl<$Res,
        _$RecordMemorizationParamsImpl>
    implements _$$RecordMemorizationParamsImplCopyWith<$Res> {
  __$$RecordMemorizationParamsImplCopyWithImpl(
      _$RecordMemorizationParamsImpl _value,
      $Res Function(_$RecordMemorizationParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordMemorizationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryType = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
    Object? recordedOn = freezed,
    Object? teacherId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$RecordMemorizationParamsImpl(
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      fromPage: freezed == fromPage
          ? _value.fromPage
          : fromPage // ignore: cast_nullable_to_non_nullable
              as int?,
      toPage: freezed == toPage
          ? _value.toPage
          : toPage // ignore: cast_nullable_to_non_nullable
              as int?,
      recordedOn: freezed == recordedOn
          ? _value.recordedOn
          : recordedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RecordMemorizationParamsImpl implements _RecordMemorizationParams {
  const _$RecordMemorizationParamsImpl(
      {@JsonKey(name: 'entry_type', includeIfNull: true) this.entryType,
      @JsonKey(name: 'from_page', includeIfNull: true) this.fromPage,
      @JsonKey(name: 'to_page', includeIfNull: true) this.toPage,
      @JsonKey(name: 'recorded_on', includeIfNull: true) this.recordedOn,
      @JsonKey(name: 'teacher_id', includeIfNull: true) this.teacherId,
      @JsonKey(includeIfNull: true) this.notes});

  factory _$RecordMemorizationParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordMemorizationParamsImplFromJson(json);

  @override
  @JsonKey(name: 'entry_type', includeIfNull: true)
  final String? entryType;
  @override
  @JsonKey(name: 'from_page', includeIfNull: true)
  final int? fromPage;
  @override
  @JsonKey(name: 'to_page', includeIfNull: true)
  final int? toPage;
  @override
  @JsonKey(name: 'recorded_on', includeIfNull: true)
  final String? recordedOn;
  @override
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  final String? teacherId;
  @override
  @JsonKey(includeIfNull: true)
  final String? notes;

  @override
  String toString() {
    return 'RecordMemorizationParams(entryType: $entryType, fromPage: $fromPage, toPage: $toPage, recordedOn: $recordedOn, teacherId: $teacherId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordMemorizationParamsImpl &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.fromPage, fromPage) ||
                other.fromPage == fromPage) &&
            (identical(other.toPage, toPage) || other.toPage == toPage) &&
            (identical(other.recordedOn, recordedOn) ||
                other.recordedOn == recordedOn) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, entryType, fromPage, toPage, recordedOn, teacherId, notes);

  /// Create a copy of RecordMemorizationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordMemorizationParamsImplCopyWith<_$RecordMemorizationParamsImpl>
      get copyWith => __$$RecordMemorizationParamsImplCopyWithImpl<
          _$RecordMemorizationParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordMemorizationParamsImplToJson(
      this,
    );
  }
}

abstract class _RecordMemorizationParams implements RecordMemorizationParams {
  const factory _RecordMemorizationParams(
      {@JsonKey(name: 'entry_type', includeIfNull: true)
      final String? entryType,
      @JsonKey(name: 'from_page', includeIfNull: true) final int? fromPage,
      @JsonKey(name: 'to_page', includeIfNull: true) final int? toPage,
      @JsonKey(name: 'recorded_on', includeIfNull: true)
      final String? recordedOn,
      @JsonKey(name: 'teacher_id', includeIfNull: true) final String? teacherId,
      @JsonKey(includeIfNull: true)
      final String? notes}) = _$RecordMemorizationParamsImpl;

  factory _RecordMemorizationParams.fromJson(Map<String, dynamic> json) =
      _$RecordMemorizationParamsImpl.fromJson;

  @override
  @JsonKey(name: 'entry_type', includeIfNull: true)
  String? get entryType;
  @override
  @JsonKey(name: 'from_page', includeIfNull: true)
  int? get fromPage;
  @override
  @JsonKey(name: 'to_page', includeIfNull: true)
  int? get toPage;
  @override
  @JsonKey(name: 'recorded_on', includeIfNull: true)
  String? get recordedOn;
  @override
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  String? get teacherId;
  @override
  @JsonKey(includeIfNull: true)
  String? get notes;

  /// Create a copy of RecordMemorizationParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordMemorizationParamsImplCopyWith<_$RecordMemorizationParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ScanStudentAttendanceParams _$ScanStudentAttendanceParamsFromJson(
    Map<String, dynamic> json) {
  return _ScanStudentAttendanceParams.fromJson(json);
}

/// @nodoc
mixin _$ScanStudentAttendanceParams {
  @JsonKey(name: 'scan_value', includeIfNull: true)
  String? get scanValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_status_id', includeIfNull: true)
  int? get attendanceStatusId => throw _privateConstructorUsedError;

  /// Serializes this ScanStudentAttendanceParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScanStudentAttendanceParamsCopyWith<ScanStudentAttendanceParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanStudentAttendanceParamsCopyWith<$Res> {
  factory $ScanStudentAttendanceParamsCopyWith(
          ScanStudentAttendanceParams value,
          $Res Function(ScanStudentAttendanceParams) then) =
      _$ScanStudentAttendanceParamsCopyWithImpl<$Res,
          ScanStudentAttendanceParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'scan_value', includeIfNull: true) String? scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      int? attendanceStatusId});
}

/// @nodoc
class _$ScanStudentAttendanceParamsCopyWithImpl<$Res,
        $Val extends ScanStudentAttendanceParams>
    implements $ScanStudentAttendanceParamsCopyWith<$Res> {
  _$ScanStudentAttendanceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanValue = freezed,
    Object? attendanceStatusId = freezed,
  }) {
    return _then(_value.copyWith(
      scanValue: freezed == scanValue
          ? _value.scanValue
          : scanValue // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanStudentAttendanceParamsImplCopyWith<$Res>
    implements $ScanStudentAttendanceParamsCopyWith<$Res> {
  factory _$$ScanStudentAttendanceParamsImplCopyWith(
          _$ScanStudentAttendanceParamsImpl value,
          $Res Function(_$ScanStudentAttendanceParamsImpl) then) =
      __$$ScanStudentAttendanceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'scan_value', includeIfNull: true) String? scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      int? attendanceStatusId});
}

/// @nodoc
class __$$ScanStudentAttendanceParamsImplCopyWithImpl<$Res>
    extends _$ScanStudentAttendanceParamsCopyWithImpl<$Res,
        _$ScanStudentAttendanceParamsImpl>
    implements _$$ScanStudentAttendanceParamsImplCopyWith<$Res> {
  __$$ScanStudentAttendanceParamsImplCopyWithImpl(
      _$ScanStudentAttendanceParamsImpl _value,
      $Res Function(_$ScanStudentAttendanceParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanValue = freezed,
    Object? attendanceStatusId = freezed,
  }) {
    return _then(_$ScanStudentAttendanceParamsImpl(
      scanValue: freezed == scanValue
          ? _value.scanValue
          : scanValue // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceStatusId: freezed == attendanceStatusId
          ? _value.attendanceStatusId
          : attendanceStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ScanStudentAttendanceParamsImpl
    implements _ScanStudentAttendanceParams {
  const _$ScanStudentAttendanceParamsImpl(
      {@JsonKey(name: 'scan_value', includeIfNull: true) this.scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      this.attendanceStatusId});

  factory _$ScanStudentAttendanceParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ScanStudentAttendanceParamsImplFromJson(json);

  @override
  @JsonKey(name: 'scan_value', includeIfNull: true)
  final String? scanValue;
  @override
  @JsonKey(name: 'attendance_status_id', includeIfNull: true)
  final int? attendanceStatusId;

  @override
  String toString() {
    return 'ScanStudentAttendanceParams(scanValue: $scanValue, attendanceStatusId: $attendanceStatusId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanStudentAttendanceParamsImpl &&
            (identical(other.scanValue, scanValue) ||
                other.scanValue == scanValue) &&
            (identical(other.attendanceStatusId, attendanceStatusId) ||
                other.attendanceStatusId == attendanceStatusId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scanValue, attendanceStatusId);

  /// Create a copy of ScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanStudentAttendanceParamsImplCopyWith<_$ScanStudentAttendanceParamsImpl>
      get copyWith => __$$ScanStudentAttendanceParamsImplCopyWithImpl<
          _$ScanStudentAttendanceParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanStudentAttendanceParamsImplToJson(
      this,
    );
  }
}

abstract class _ScanStudentAttendanceParams
    implements ScanStudentAttendanceParams {
  const factory _ScanStudentAttendanceParams(
      {@JsonKey(name: 'scan_value', includeIfNull: true)
      final String? scanValue,
      @JsonKey(name: 'attendance_status_id', includeIfNull: true)
      final int? attendanceStatusId}) = _$ScanStudentAttendanceParamsImpl;

  factory _ScanStudentAttendanceParams.fromJson(Map<String, dynamic> json) =
      _$ScanStudentAttendanceParamsImpl.fromJson;

  @override
  @JsonKey(name: 'scan_value', includeIfNull: true)
  String? get scanValue;
  @override
  @JsonKey(name: 'attendance_status_id', includeIfNull: true)
  int? get attendanceStatusId;

  /// Create a copy of ScanStudentAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanStudentAttendanceParamsImplCopyWith<_$ScanStudentAttendanceParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateGroupParams _$UpdateGroupParamsFromJson(Map<String, dynamic> json) {
  return _UpdateGroupParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateGroupParams {
  @JsonKey(includeIfNull: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  int? get academicYearId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  int? get teacherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
  int? get assistantTeacherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  int? get gradeLevelId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  int? get monthlyFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this UpdateGroupParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateGroupParamsCopyWith<UpdateGroupParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateGroupParamsCopyWith<$Res> {
  factory $UpdateGroupParamsCopyWith(
          UpdateGroupParams value, $Res Function(UpdateGroupParams) then) =
      _$UpdateGroupParamsCopyWithImpl<$Res, UpdateGroupParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      int? academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
      @JsonKey(includeIfNull: true) int? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) int? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class _$UpdateGroupParamsCopyWithImpl<$Res, $Val extends UpdateGroupParams>
    implements $UpdateGroupParamsCopyWith<$Res> {
  _$UpdateGroupParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
              as int?,
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
abstract class _$$UpdateGroupParamsImplCopyWith<$Res>
    implements $UpdateGroupParamsCopyWith<$Res> {
  factory _$$UpdateGroupParamsImplCopyWith(_$UpdateGroupParamsImpl value,
          $Res Function(_$UpdateGroupParamsImpl) then) =
      __$$UpdateGroupParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      int? academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
      @JsonKey(includeIfNull: true) int? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) int? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class __$$UpdateGroupParamsImplCopyWithImpl<$Res>
    extends _$UpdateGroupParamsCopyWithImpl<$Res, _$UpdateGroupParamsImpl>
    implements _$$UpdateGroupParamsImplCopyWith<$Res> {
  __$$UpdateGroupParamsImplCopyWithImpl(_$UpdateGroupParamsImpl _value,
      $Res Function(_$UpdateGroupParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    return _then(_$UpdateGroupParamsImpl(
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
              as int?,
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

@JsonSerializable(includeIfNull: false)
class _$UpdateGroupParamsImpl implements _UpdateGroupParams {
  const _$UpdateGroupParamsImpl(
      {@JsonKey(includeIfNull: true) this.name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      this.academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) this.courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) this.teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      this.assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) this.gradeLevelId,
      @JsonKey(includeIfNull: true) this.capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) this.monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) this.startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) this.endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) this.isActive});

  factory _$UpdateGroupParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateGroupParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? name;
  @override
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  final int? academicYearId;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  final int? courseId;
  @override
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  final int? teacherId;
  @override
  @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
  final int? assistantTeacherId;
  @override
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  final int? gradeLevelId;
  @override
  @JsonKey(includeIfNull: true)
  final int? capacity;
  @override
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  final int? monthlyFee;
  @override
  @JsonKey(name: 'starts_on', includeIfNull: true)
  final String? startsOn;
  @override
  @JsonKey(name: 'ends_on', includeIfNull: true)
  final String? endsOn;
  @override
  @JsonKey(name: 'is_active', includeIfNull: true)
  final bool? isActive;

  @override
  String toString() {
    return 'UpdateGroupParams(name: $name, academicYearId: $academicYearId, courseId: $courseId, teacherId: $teacherId, assistantTeacherId: $assistantTeacherId, gradeLevelId: $gradeLevelId, capacity: $capacity, monthlyFee: $monthlyFee, startsOn: $startsOn, endsOn: $endsOn, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateGroupParamsImpl &&
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

  /// Create a copy of UpdateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateGroupParamsImplCopyWith<_$UpdateGroupParamsImpl> get copyWith =>
      __$$UpdateGroupParamsImplCopyWithImpl<_$UpdateGroupParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateGroupParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateGroupParams implements UpdateGroupParams {
  const factory _UpdateGroupParams(
      {@JsonKey(includeIfNull: true) final String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      final int? academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) final int? courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) final int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      final int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true)
      final int? gradeLevelId,
      @JsonKey(includeIfNull: true) final int? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) final int? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) final String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) final String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true)
      final bool? isActive}) = _$UpdateGroupParamsImpl;

  factory _UpdateGroupParams.fromJson(Map<String, dynamic> json) =
      _$UpdateGroupParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get name;
  @override
  @JsonKey(name: 'academic_year_id', includeIfNull: true)
  int? get academicYearId;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId;
  @override
  @JsonKey(name: 'teacher_id', includeIfNull: true)
  int? get teacherId;
  @override
  @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
  int? get assistantTeacherId;
  @override
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  int? get gradeLevelId;
  @override
  @JsonKey(includeIfNull: true)
  int? get capacity;
  @override
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  int? get monthlyFee;
  @override
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn;
  @override
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn;
  @override
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive;

  /// Create a copy of UpdateGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateGroupParamsImplCopyWith<_$UpdateGroupParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
