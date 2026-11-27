// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceDaySummaryModel _$AttendanceDaySummaryModelFromJson(
    Map<String, dynamic> json) {
  return _AttendanceDaySummaryModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDaySummaryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  String? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceDaySummaryCourseName,
      fromJson: _attendanceDaySummaryCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceDaySummaryCourseId,
      fromJson: _attendanceDaySummaryCourseIdValue)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  int? get groupsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'records_count', fromJson: jsonIntLenient)
  int? get recordsCount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceDaySummaryCourseFinished,
      fromJson: _attendanceDaySummaryCourseFinishedValue)
  bool? get courseFinished => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceDaySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceDaySummaryModelCopyWith<AttendanceDaySummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDaySummaryModelCopyWith<$Res> {
  factory $AttendanceDaySummaryModelCopyWith(AttendanceDaySummaryModel value,
          $Res Function(AttendanceDaySummaryModel) then) =
      _$AttendanceDaySummaryModelCopyWithImpl<$Res, AttendanceDaySummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      String? attendanceDate,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseName,
          fromJson: _attendanceDaySummaryCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseId,
          fromJson: _attendanceDaySummaryCourseIdValue)
      int? courseId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
      @JsonKey(name: 'records_count', fromJson: jsonIntLenient)
      int? recordsCount,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseFinished,
          fromJson: _attendanceDaySummaryCourseFinishedValue)
      bool? courseFinished});
}

/// @nodoc
class _$AttendanceDaySummaryModelCopyWithImpl<$Res,
        $Val extends AttendanceDaySummaryModel>
    implements $AttendanceDaySummaryModelCopyWith<$Res> {
  _$AttendanceDaySummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceDaySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attendanceDate = freezed,
    Object? courseName = freezed,
    Object? courseId = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? groupsCount = freezed,
    Object? recordsCount = freezed,
    Object? courseFinished = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      groupsCount: freezed == groupsCount
          ? _value.groupsCount
          : groupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recordsCount: freezed == recordsCount
          ? _value.recordsCount
          : recordsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      courseFinished: freezed == courseFinished
          ? _value.courseFinished
          : courseFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDaySummaryModelImplCopyWith<$Res>
    implements $AttendanceDaySummaryModelCopyWith<$Res> {
  factory _$$AttendanceDaySummaryModelImplCopyWith(
          _$AttendanceDaySummaryModelImpl value,
          $Res Function(_$AttendanceDaySummaryModelImpl) then) =
      __$$AttendanceDaySummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      String? attendanceDate,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseName,
          fromJson: _attendanceDaySummaryCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseId,
          fromJson: _attendanceDaySummaryCourseIdValue)
      int? courseId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
      @JsonKey(name: 'records_count', fromJson: jsonIntLenient)
      int? recordsCount,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseFinished,
          fromJson: _attendanceDaySummaryCourseFinishedValue)
      bool? courseFinished});
}

/// @nodoc
class __$$AttendanceDaySummaryModelImplCopyWithImpl<$Res>
    extends _$AttendanceDaySummaryModelCopyWithImpl<$Res,
        _$AttendanceDaySummaryModelImpl>
    implements _$$AttendanceDaySummaryModelImplCopyWith<$Res> {
  __$$AttendanceDaySummaryModelImplCopyWithImpl(
      _$AttendanceDaySummaryModelImpl _value,
      $Res Function(_$AttendanceDaySummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceDaySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attendanceDate = freezed,
    Object? courseName = freezed,
    Object? courseId = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? groupsCount = freezed,
    Object? recordsCount = freezed,
    Object? courseFinished = freezed,
  }) {
    return _then(_$AttendanceDaySummaryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      groupsCount: freezed == groupsCount
          ? _value.groupsCount
          : groupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recordsCount: freezed == recordsCount
          ? _value.recordsCount
          : recordsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      courseFinished: freezed == courseFinished
          ? _value.courseFinished
          : courseFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AttendanceDaySummaryModelImpl implements _AttendanceDaySummaryModel {
  const _$AttendanceDaySummaryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      this.attendanceDate,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseName,
          fromJson: _attendanceDaySummaryCourseNameValue)
      this.courseName,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseId,
          fromJson: _attendanceDaySummaryCourseIdValue)
      this.courseId,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) this.groupsCount,
      @JsonKey(name: 'records_count', fromJson: jsonIntLenient)
      this.recordsCount,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseFinished,
          fromJson: _attendanceDaySummaryCourseFinishedValue)
      this.courseFinished});

  factory _$AttendanceDaySummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDaySummaryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  final String? attendanceDate;
  @override
  @JsonKey(
      readValue: _attendanceDaySummaryCourseName,
      fromJson: _attendanceDaySummaryCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(
      readValue: _attendanceDaySummaryCourseId,
      fromJson: _attendanceDaySummaryCourseIdValue)
  final int? courseId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  final int? groupsCount;
  @override
  @JsonKey(name: 'records_count', fromJson: jsonIntLenient)
  final int? recordsCount;
  @override
  @JsonKey(
      readValue: _attendanceDaySummaryCourseFinished,
      fromJson: _attendanceDaySummaryCourseFinishedValue)
  final bool? courseFinished;

  @override
  String toString() {
    return 'AttendanceDaySummaryModel(id: $id, attendanceDate: $attendanceDate, courseName: $courseName, courseId: $courseId, status: $status, notes: $notes, groupsCount: $groupsCount, recordsCount: $recordsCount, courseFinished: $courseFinished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDaySummaryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.groupsCount, groupsCount) ||
                other.groupsCount == groupsCount) &&
            (identical(other.recordsCount, recordsCount) ||
                other.recordsCount == recordsCount) &&
            (identical(other.courseFinished, courseFinished) ||
                other.courseFinished == courseFinished));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, attendanceDate, courseName,
      courseId, status, notes, groupsCount, recordsCount, courseFinished);

  /// Create a copy of AttendanceDaySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDaySummaryModelImplCopyWith<_$AttendanceDaySummaryModelImpl>
      get copyWith => __$$AttendanceDaySummaryModelImplCopyWithImpl<
          _$AttendanceDaySummaryModelImpl>(this, _$identity);
}

abstract class _AttendanceDaySummaryModel implements AttendanceDaySummaryModel {
  const factory _AttendanceDaySummaryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      final String? attendanceDate,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseName,
          fromJson: _attendanceDaySummaryCourseNameValue)
      final String? courseName,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseId,
          fromJson: _attendanceDaySummaryCourseIdValue)
      final int? courseId,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
      final int? groupsCount,
      @JsonKey(name: 'records_count', fromJson: jsonIntLenient)
      final int? recordsCount,
      @JsonKey(
          readValue: _attendanceDaySummaryCourseFinished,
          fromJson: _attendanceDaySummaryCourseFinishedValue)
      final bool? courseFinished}) = _$AttendanceDaySummaryModelImpl;

  factory _AttendanceDaySummaryModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceDaySummaryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  String? get attendanceDate;
  @override
  @JsonKey(
      readValue: _attendanceDaySummaryCourseName,
      fromJson: _attendanceDaySummaryCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(
      readValue: _attendanceDaySummaryCourseId,
      fromJson: _attendanceDaySummaryCourseIdValue)
  int? get courseId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  int? get groupsCount;
  @override
  @JsonKey(name: 'records_count', fromJson: jsonIntLenient)
  int? get recordsCount;
  @override
  @JsonKey(
      readValue: _attendanceDaySummaryCourseFinished,
      fromJson: _attendanceDaySummaryCourseFinishedValue)
  bool? get courseFinished;

  /// Create a copy of AttendanceDaySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceDaySummaryModelImplCopyWith<_$AttendanceDaySummaryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceRecordItemModel _$AttendanceRecordItemModelFromJson(
    Map<String, dynamic> json) {
  return _AttendanceRecordItemModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRecordItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceRecordItemStudentName,
      fromJson: _attendanceRecordItemStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceRecordItemStatusName,
      fromJson: _attendanceRecordItemStatusNameValue)
  String? get statusName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceRecordItemStatusCode,
      fromJson: _attendanceRecordItemStatusCodeValue)
  String? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceRecordItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceRecordItemModelCopyWith<AttendanceRecordItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRecordItemModelCopyWith<$Res> {
  factory $AttendanceRecordItemModelCopyWith(AttendanceRecordItemModel value,
          $Res Function(AttendanceRecordItemModel) then) =
      _$AttendanceRecordItemModelCopyWithImpl<$Res, AttendanceRecordItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(
          readValue: _attendanceRecordItemStudentName,
          fromJson: _attendanceRecordItemStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _attendanceRecordItemStatusName,
          fromJson: _attendanceRecordItemStatusNameValue)
      String? statusName,
      @JsonKey(
          readValue: _attendanceRecordItemStatusCode,
          fromJson: _attendanceRecordItemStatusCodeValue)
      String? statusCode,
      @JsonKey(fromJson: jsonStringLenient) String? notes});
}

/// @nodoc
class _$AttendanceRecordItemModelCopyWithImpl<$Res,
        $Val extends AttendanceRecordItemModel>
    implements $AttendanceRecordItemModelCopyWith<$Res> {
  _$AttendanceRecordItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceRecordItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? studentName = freezed,
    Object? statusName = freezed,
    Object? statusCode = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceRecordItemModelImplCopyWith<$Res>
    implements $AttendanceRecordItemModelCopyWith<$Res> {
  factory _$$AttendanceRecordItemModelImplCopyWith(
          _$AttendanceRecordItemModelImpl value,
          $Res Function(_$AttendanceRecordItemModelImpl) then) =
      __$$AttendanceRecordItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(
          readValue: _attendanceRecordItemStudentName,
          fromJson: _attendanceRecordItemStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _attendanceRecordItemStatusName,
          fromJson: _attendanceRecordItemStatusNameValue)
      String? statusName,
      @JsonKey(
          readValue: _attendanceRecordItemStatusCode,
          fromJson: _attendanceRecordItemStatusCodeValue)
      String? statusCode,
      @JsonKey(fromJson: jsonStringLenient) String? notes});
}

/// @nodoc
class __$$AttendanceRecordItemModelImplCopyWithImpl<$Res>
    extends _$AttendanceRecordItemModelCopyWithImpl<$Res,
        _$AttendanceRecordItemModelImpl>
    implements _$$AttendanceRecordItemModelImplCopyWith<$Res> {
  __$$AttendanceRecordItemModelImplCopyWithImpl(
      _$AttendanceRecordItemModelImpl _value,
      $Res Function(_$AttendanceRecordItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceRecordItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? studentName = freezed,
    Object? statusName = freezed,
    Object? statusCode = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$AttendanceRecordItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AttendanceRecordItemModelImpl implements _AttendanceRecordItemModel {
  const _$AttendanceRecordItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(
          readValue: _attendanceRecordItemStudentName,
          fromJson: _attendanceRecordItemStudentNameValue)
      this.studentName,
      @JsonKey(
          readValue: _attendanceRecordItemStatusName,
          fromJson: _attendanceRecordItemStatusNameValue)
      this.statusName,
      @JsonKey(
          readValue: _attendanceRecordItemStatusCode,
          fromJson: _attendanceRecordItemStatusCodeValue)
      this.statusCode,
      @JsonKey(fromJson: jsonStringLenient) this.notes});

  factory _$AttendanceRecordItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRecordItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(
      readValue: _attendanceRecordItemStudentName,
      fromJson: _attendanceRecordItemStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(
      readValue: _attendanceRecordItemStatusName,
      fromJson: _attendanceRecordItemStatusNameValue)
  final String? statusName;
  @override
  @JsonKey(
      readValue: _attendanceRecordItemStatusCode,
      fromJson: _attendanceRecordItemStatusCodeValue)
  final String? statusCode;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;

  @override
  String toString() {
    return 'AttendanceRecordItemModel(id: $id, enrollmentId: $enrollmentId, studentName: $studentName, statusName: $statusName, statusCode: $statusCode, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRecordItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, enrollmentId, studentName,
      statusName, statusCode, notes);

  /// Create a copy of AttendanceRecordItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRecordItemModelImplCopyWith<_$AttendanceRecordItemModelImpl>
      get copyWith => __$$AttendanceRecordItemModelImplCopyWithImpl<
          _$AttendanceRecordItemModelImpl>(this, _$identity);
}

abstract class _AttendanceRecordItemModel implements AttendanceRecordItemModel {
  const factory _AttendanceRecordItemModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
          final int? enrollmentId,
          @JsonKey(
              readValue: _attendanceRecordItemStudentName,
              fromJson: _attendanceRecordItemStudentNameValue)
          final String? studentName,
          @JsonKey(
              readValue: _attendanceRecordItemStatusName,
              fromJson: _attendanceRecordItemStatusNameValue)
          final String? statusName,
          @JsonKey(
              readValue: _attendanceRecordItemStatusCode,
              fromJson: _attendanceRecordItemStatusCodeValue)
          final String? statusCode,
          @JsonKey(fromJson: jsonStringLenient) final String? notes}) =
      _$AttendanceRecordItemModelImpl;

  factory _AttendanceRecordItemModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceRecordItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(
      readValue: _attendanceRecordItemStudentName,
      fromJson: _attendanceRecordItemStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(
      readValue: _attendanceRecordItemStatusName,
      fromJson: _attendanceRecordItemStatusNameValue)
  String? get statusName;
  @override
  @JsonKey(
      readValue: _attendanceRecordItemStatusCode,
      fromJson: _attendanceRecordItemStatusCodeValue)
  String? get statusCode;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;

  /// Create a copy of AttendanceRecordItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceRecordItemModelImplCopyWith<_$AttendanceRecordItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceDayDetailModel _$AttendanceDayDetailModelFromJson(
    Map<String, dynamic> json) {
  return _AttendanceDayDetailModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDayDetailModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  String? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceDayDetailCourseName,
      fromJson: _attendanceDayDetailCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceDayDetailCourseFinished,
      fromJson: _attendanceDayDetailCourseFinishedValue)
  bool? get courseFinished => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<AttendanceGroupDayModel>? get groups =>
      throw _privateConstructorUsedError;

  /// Create a copy of AttendanceDayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceDayDetailModelCopyWith<AttendanceDayDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDayDetailModelCopyWith<$Res> {
  factory $AttendanceDayDetailModelCopyWith(AttendanceDayDetailModel value,
          $Res Function(AttendanceDayDetailModel) then) =
      _$AttendanceDayDetailModelCopyWithImpl<$Res, AttendanceDayDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      String? attendanceDate,
      @JsonKey(
          readValue: _attendanceDayDetailCourseName,
          fromJson: _attendanceDayDetailCourseNameValue)
      String? courseName,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _attendanceDayDetailCourseFinished,
          fromJson: _attendanceDayDetailCourseFinishedValue)
      bool? courseFinished,
      @JsonKey(readValue: readJsonList) List<AttendanceGroupDayModel>? groups});
}

/// @nodoc
class _$AttendanceDayDetailModelCopyWithImpl<$Res,
        $Val extends AttendanceDayDetailModel>
    implements $AttendanceDayDetailModelCopyWith<$Res> {
  _$AttendanceDayDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceDayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attendanceDate = freezed,
    Object? courseName = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? courseFinished = freezed,
    Object? groups = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      courseFinished: freezed == courseFinished
          ? _value.courseFinished
          : courseFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<AttendanceGroupDayModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDayDetailModelImplCopyWith<$Res>
    implements $AttendanceDayDetailModelCopyWith<$Res> {
  factory _$$AttendanceDayDetailModelImplCopyWith(
          _$AttendanceDayDetailModelImpl value,
          $Res Function(_$AttendanceDayDetailModelImpl) then) =
      __$$AttendanceDayDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      String? attendanceDate,
      @JsonKey(
          readValue: _attendanceDayDetailCourseName,
          fromJson: _attendanceDayDetailCourseNameValue)
      String? courseName,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _attendanceDayDetailCourseFinished,
          fromJson: _attendanceDayDetailCourseFinishedValue)
      bool? courseFinished,
      @JsonKey(readValue: readJsonList) List<AttendanceGroupDayModel>? groups});
}

/// @nodoc
class __$$AttendanceDayDetailModelImplCopyWithImpl<$Res>
    extends _$AttendanceDayDetailModelCopyWithImpl<$Res,
        _$AttendanceDayDetailModelImpl>
    implements _$$AttendanceDayDetailModelImplCopyWith<$Res> {
  __$$AttendanceDayDetailModelImplCopyWithImpl(
      _$AttendanceDayDetailModelImpl _value,
      $Res Function(_$AttendanceDayDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceDayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attendanceDate = freezed,
    Object? courseName = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? courseFinished = freezed,
    Object? groups = freezed,
  }) {
    return _then(_$AttendanceDayDetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      courseFinished: freezed == courseFinished
          ? _value.courseFinished
          : courseFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<AttendanceGroupDayModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AttendanceDayDetailModelImpl implements _AttendanceDayDetailModel {
  const _$AttendanceDayDetailModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      this.attendanceDate,
      @JsonKey(
          readValue: _attendanceDayDetailCourseName,
          fromJson: _attendanceDayDetailCourseNameValue)
      this.courseName,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(
          readValue: _attendanceDayDetailCourseFinished,
          fromJson: _attendanceDayDetailCourseFinishedValue)
      this.courseFinished,
      @JsonKey(readValue: readJsonList)
      final List<AttendanceGroupDayModel>? groups})
      : _groups = groups;

  factory _$AttendanceDayDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDayDetailModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  final String? attendanceDate;
  @override
  @JsonKey(
      readValue: _attendanceDayDetailCourseName,
      fromJson: _attendanceDayDetailCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(
      readValue: _attendanceDayDetailCourseFinished,
      fromJson: _attendanceDayDetailCourseFinishedValue)
  final bool? courseFinished;
  final List<AttendanceGroupDayModel>? _groups;
  @override
  @JsonKey(readValue: readJsonList)
  List<AttendanceGroupDayModel>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AttendanceDayDetailModel(id: $id, attendanceDate: $attendanceDate, courseName: $courseName, status: $status, notes: $notes, courseFinished: $courseFinished, groups: $groups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDayDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.courseFinished, courseFinished) ||
                other.courseFinished == courseFinished) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      attendanceDate,
      courseName,
      status,
      notes,
      courseFinished,
      const DeepCollectionEquality().hash(_groups));

  /// Create a copy of AttendanceDayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDayDetailModelImplCopyWith<_$AttendanceDayDetailModelImpl>
      get copyWith => __$$AttendanceDayDetailModelImplCopyWithImpl<
          _$AttendanceDayDetailModelImpl>(this, _$identity);
}

abstract class _AttendanceDayDetailModel implements AttendanceDayDetailModel {
  const factory _AttendanceDayDetailModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
          final String? attendanceDate,
          @JsonKey(
              readValue: _attendanceDayDetailCourseName,
              fromJson: _attendanceDayDetailCourseNameValue)
          final String? courseName,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(fromJson: jsonStringLenient) final String? notes,
          @JsonKey(
              readValue: _attendanceDayDetailCourseFinished,
              fromJson: _attendanceDayDetailCourseFinishedValue)
          final bool? courseFinished,
          @JsonKey(readValue: readJsonList)
          final List<AttendanceGroupDayModel>? groups}) =
      _$AttendanceDayDetailModelImpl;

  factory _AttendanceDayDetailModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceDayDetailModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  String? get attendanceDate;
  @override
  @JsonKey(
      readValue: _attendanceDayDetailCourseName,
      fromJson: _attendanceDayDetailCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(
      readValue: _attendanceDayDetailCourseFinished,
      fromJson: _attendanceDayDetailCourseFinishedValue)
  bool? get courseFinished;
  @override
  @JsonKey(readValue: readJsonList)
  List<AttendanceGroupDayModel>? get groups;

  /// Create a copy of AttendanceDayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceDayDetailModelImplCopyWith<_$AttendanceDayDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceGroupDayModel _$AttendanceGroupDayModelFromJson(
    Map<String, dynamic> json) {
  return _AttendanceGroupDayModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceGroupDayModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceGroupDayGroupName,
      fromJson: _attendanceGroupDayGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<AttendanceRecordItemModel>? get records =>
      throw _privateConstructorUsedError;

  /// Create a copy of AttendanceGroupDayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceGroupDayModelCopyWith<AttendanceGroupDayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceGroupDayModelCopyWith<$Res> {
  factory $AttendanceGroupDayModelCopyWith(AttendanceGroupDayModel value,
          $Res Function(AttendanceGroupDayModel) then) =
      _$AttendanceGroupDayModelCopyWithImpl<$Res, AttendanceGroupDayModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(
          readValue: _attendanceGroupDayGroupName,
          fromJson: _attendanceGroupDayGroupNameValue)
      String? groupName,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonList)
      List<AttendanceRecordItemModel>? records});
}

/// @nodoc
class _$AttendanceGroupDayModelCopyWithImpl<$Res,
        $Val extends AttendanceGroupDayModel>
    implements $AttendanceGroupDayModelCopyWith<$Res> {
  _$AttendanceGroupDayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceGroupDayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupName = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? records = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecordItemModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceGroupDayModelImplCopyWith<$Res>
    implements $AttendanceGroupDayModelCopyWith<$Res> {
  factory _$$AttendanceGroupDayModelImplCopyWith(
          _$AttendanceGroupDayModelImpl value,
          $Res Function(_$AttendanceGroupDayModelImpl) then) =
      __$$AttendanceGroupDayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(
          readValue: _attendanceGroupDayGroupName,
          fromJson: _attendanceGroupDayGroupNameValue)
      String? groupName,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonList)
      List<AttendanceRecordItemModel>? records});
}

/// @nodoc
class __$$AttendanceGroupDayModelImplCopyWithImpl<$Res>
    extends _$AttendanceGroupDayModelCopyWithImpl<$Res,
        _$AttendanceGroupDayModelImpl>
    implements _$$AttendanceGroupDayModelImplCopyWith<$Res> {
  __$$AttendanceGroupDayModelImplCopyWithImpl(
      _$AttendanceGroupDayModelImpl _value,
      $Res Function(_$AttendanceGroupDayModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceGroupDayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupName = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? records = freezed,
  }) {
    return _then(_$AttendanceGroupDayModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecordItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AttendanceGroupDayModelImpl implements _AttendanceGroupDayModel {
  const _$AttendanceGroupDayModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(
          readValue: _attendanceGroupDayGroupName,
          fromJson: _attendanceGroupDayGroupNameValue)
      this.groupName,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(readValue: readJsonList)
      final List<AttendanceRecordItemModel>? records})
      : _records = records;

  factory _$AttendanceGroupDayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceGroupDayModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(
      readValue: _attendanceGroupDayGroupName,
      fromJson: _attendanceGroupDayGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  final List<AttendanceRecordItemModel>? _records;
  @override
  @JsonKey(readValue: readJsonList)
  List<AttendanceRecordItemModel>? get records {
    final value = _records;
    if (value == null) return null;
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AttendanceGroupDayModel(id: $id, groupName: $groupName, status: $status, notes: $notes, records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceGroupDayModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupName, status, notes,
      const DeepCollectionEquality().hash(_records));

  /// Create a copy of AttendanceGroupDayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceGroupDayModelImplCopyWith<_$AttendanceGroupDayModelImpl>
      get copyWith => __$$AttendanceGroupDayModelImplCopyWithImpl<
          _$AttendanceGroupDayModelImpl>(this, _$identity);
}

abstract class _AttendanceGroupDayModel implements AttendanceGroupDayModel {
  const factory _AttendanceGroupDayModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(
              readValue: _attendanceGroupDayGroupName,
              fromJson: _attendanceGroupDayGroupNameValue)
          final String? groupName,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(fromJson: jsonStringLenient) final String? notes,
          @JsonKey(readValue: readJsonList)
          final List<AttendanceRecordItemModel>? records}) =
      _$AttendanceGroupDayModelImpl;

  factory _AttendanceGroupDayModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceGroupDayModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(
      readValue: _attendanceGroupDayGroupName,
      fromJson: _attendanceGroupDayGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(readValue: readJsonList)
  List<AttendanceRecordItemModel>? get records;

  /// Create a copy of AttendanceGroupDayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceGroupDayModelImplCopyWith<_$AttendanceGroupDayModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TeacherAttendanceRecordModel _$TeacherAttendanceRecordModelFromJson(
    Map<String, dynamic> json) {
  return _TeacherAttendanceRecordModel.fromJson(json);
}

/// @nodoc
mixin _$TeacherAttendanceRecordModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceRecordTeacherId,
      fromJson: _teacherAttendanceRecordTeacherIdValue)
  int? get teacherId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceRecordTeacherName,
      fromJson: _teacherAttendanceRecordTeacherNameValue)
  String? get teacherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusId,
      fromJson: _teacherAttendanceRecordStatusIdValue)
  int? get statusId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusName,
      fromJson: _teacherAttendanceRecordStatusNameValue)
  String? get statusName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusCode,
      fromJson: _teacherAttendanceRecordStatusCodeValue)
  String? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of TeacherAttendanceRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherAttendanceRecordModelCopyWith<TeacherAttendanceRecordModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherAttendanceRecordModelCopyWith<$Res> {
  factory $TeacherAttendanceRecordModelCopyWith(
          TeacherAttendanceRecordModel value,
          $Res Function(TeacherAttendanceRecordModel) then) =
      _$TeacherAttendanceRecordModelCopyWithImpl<$Res,
          TeacherAttendanceRecordModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(
          readValue: _teacherAttendanceRecordTeacherId,
          fromJson: _teacherAttendanceRecordTeacherIdValue)
      int? teacherId,
      @JsonKey(
          readValue: _teacherAttendanceRecordTeacherName,
          fromJson: _teacherAttendanceRecordTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusId,
          fromJson: _teacherAttendanceRecordStatusIdValue)
      int? statusId,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusName,
          fromJson: _teacherAttendanceRecordStatusNameValue)
      String? statusName,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusCode,
          fromJson: _teacherAttendanceRecordStatusCodeValue)
      String? statusCode,
      @JsonKey(fromJson: jsonStringLenient) String? notes});
}

/// @nodoc
class _$TeacherAttendanceRecordModelCopyWithImpl<$Res,
        $Val extends TeacherAttendanceRecordModel>
    implements $TeacherAttendanceRecordModelCopyWith<$Res> {
  _$TeacherAttendanceRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherAttendanceRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? teacherId = freezed,
    Object? teacherName = freezed,
    Object? statusId = freezed,
    Object? statusName = freezed,
    Object? statusCode = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherAttendanceRecordModelImplCopyWith<$Res>
    implements $TeacherAttendanceRecordModelCopyWith<$Res> {
  factory _$$TeacherAttendanceRecordModelImplCopyWith(
          _$TeacherAttendanceRecordModelImpl value,
          $Res Function(_$TeacherAttendanceRecordModelImpl) then) =
      __$$TeacherAttendanceRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(
          readValue: _teacherAttendanceRecordTeacherId,
          fromJson: _teacherAttendanceRecordTeacherIdValue)
      int? teacherId,
      @JsonKey(
          readValue: _teacherAttendanceRecordTeacherName,
          fromJson: _teacherAttendanceRecordTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusId,
          fromJson: _teacherAttendanceRecordStatusIdValue)
      int? statusId,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusName,
          fromJson: _teacherAttendanceRecordStatusNameValue)
      String? statusName,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusCode,
          fromJson: _teacherAttendanceRecordStatusCodeValue)
      String? statusCode,
      @JsonKey(fromJson: jsonStringLenient) String? notes});
}

/// @nodoc
class __$$TeacherAttendanceRecordModelImplCopyWithImpl<$Res>
    extends _$TeacherAttendanceRecordModelCopyWithImpl<$Res,
        _$TeacherAttendanceRecordModelImpl>
    implements _$$TeacherAttendanceRecordModelImplCopyWith<$Res> {
  __$$TeacherAttendanceRecordModelImplCopyWithImpl(
      _$TeacherAttendanceRecordModelImpl _value,
      $Res Function(_$TeacherAttendanceRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherAttendanceRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? teacherId = freezed,
    Object? teacherName = freezed,
    Object? statusId = freezed,
    Object? statusName = freezed,
    Object? statusCode = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$TeacherAttendanceRecordModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusId: freezed == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as int?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TeacherAttendanceRecordModelImpl
    implements _TeacherAttendanceRecordModel {
  const _$TeacherAttendanceRecordModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(
          readValue: _teacherAttendanceRecordTeacherId,
          fromJson: _teacherAttendanceRecordTeacherIdValue)
      this.teacherId,
      @JsonKey(
          readValue: _teacherAttendanceRecordTeacherName,
          fromJson: _teacherAttendanceRecordTeacherNameValue)
      this.teacherName,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusId,
          fromJson: _teacherAttendanceRecordStatusIdValue)
      this.statusId,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusName,
          fromJson: _teacherAttendanceRecordStatusNameValue)
      this.statusName,
      @JsonKey(
          readValue: _teacherAttendanceRecordStatusCode,
          fromJson: _teacherAttendanceRecordStatusCodeValue)
      this.statusCode,
      @JsonKey(fromJson: jsonStringLenient) this.notes});

  factory _$TeacherAttendanceRecordModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TeacherAttendanceRecordModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordTeacherId,
      fromJson: _teacherAttendanceRecordTeacherIdValue)
  final int? teacherId;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordTeacherName,
      fromJson: _teacherAttendanceRecordTeacherNameValue)
  final String? teacherName;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusId,
      fromJson: _teacherAttendanceRecordStatusIdValue)
  final int? statusId;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusName,
      fromJson: _teacherAttendanceRecordStatusNameValue)
  final String? statusName;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusCode,
      fromJson: _teacherAttendanceRecordStatusCodeValue)
  final String? statusCode;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;

  @override
  String toString() {
    return 'TeacherAttendanceRecordModel(id: $id, teacherId: $teacherId, teacherName: $teacherName, statusId: $statusId, statusName: $statusName, statusCode: $statusCode, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherAttendanceRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, teacherId, teacherName,
      statusId, statusName, statusCode, notes);

  /// Create a copy of TeacherAttendanceRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherAttendanceRecordModelImplCopyWith<
          _$TeacherAttendanceRecordModelImpl>
      get copyWith => __$$TeacherAttendanceRecordModelImplCopyWithImpl<
          _$TeacherAttendanceRecordModelImpl>(this, _$identity);
}

abstract class _TeacherAttendanceRecordModel
    implements TeacherAttendanceRecordModel {
  const factory _TeacherAttendanceRecordModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(
              readValue: _teacherAttendanceRecordTeacherId,
              fromJson: _teacherAttendanceRecordTeacherIdValue)
          final int? teacherId,
          @JsonKey(
              readValue: _teacherAttendanceRecordTeacherName,
              fromJson: _teacherAttendanceRecordTeacherNameValue)
          final String? teacherName,
          @JsonKey(
              readValue: _teacherAttendanceRecordStatusId,
              fromJson: _teacherAttendanceRecordStatusIdValue)
          final int? statusId,
          @JsonKey(
              readValue: _teacherAttendanceRecordStatusName,
              fromJson: _teacherAttendanceRecordStatusNameValue)
          final String? statusName,
          @JsonKey(
              readValue: _teacherAttendanceRecordStatusCode,
              fromJson: _teacherAttendanceRecordStatusCodeValue)
          final String? statusCode,
          @JsonKey(fromJson: jsonStringLenient) final String? notes}) =
      _$TeacherAttendanceRecordModelImpl;

  factory _TeacherAttendanceRecordModel.fromJson(Map<String, dynamic> json) =
      _$TeacherAttendanceRecordModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordTeacherId,
      fromJson: _teacherAttendanceRecordTeacherIdValue)
  int? get teacherId;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordTeacherName,
      fromJson: _teacherAttendanceRecordTeacherNameValue)
  String? get teacherName;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusId,
      fromJson: _teacherAttendanceRecordStatusIdValue)
  int? get statusId;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusName,
      fromJson: _teacherAttendanceRecordStatusNameValue)
  String? get statusName;
  @override
  @JsonKey(
      readValue: _teacherAttendanceRecordStatusCode,
      fromJson: _teacherAttendanceRecordStatusCodeValue)
  String? get statusCode;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;

  /// Create a copy of TeacherAttendanceRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherAttendanceRecordModelImplCopyWith<
          _$TeacherAttendanceRecordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TeacherAttendanceDayModel _$TeacherAttendanceDayModelFromJson(
    Map<String, dynamic> json) {
  return _TeacherAttendanceDayModel.fromJson(json);
}

/// @nodoc
mixin _$TeacherAttendanceDayModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  String? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceDayCourseName,
      fromJson: _teacherAttendanceDayCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceDayCourseId,
      fromJson: _teacherAttendanceDayCourseIdValue)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _teacherAttendanceDayRecordsCount,
      fromJson: _teacherAttendanceDayRecordsCountValue)
  int? get recordsCount => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<TeacherAttendanceRecordModel>? get records =>
      throw _privateConstructorUsedError;

  /// Create a copy of TeacherAttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherAttendanceDayModelCopyWith<TeacherAttendanceDayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherAttendanceDayModelCopyWith<$Res> {
  factory $TeacherAttendanceDayModelCopyWith(TeacherAttendanceDayModel value,
          $Res Function(TeacherAttendanceDayModel) then) =
      _$TeacherAttendanceDayModelCopyWithImpl<$Res, TeacherAttendanceDayModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      String? attendanceDate,
      @JsonKey(
          readValue: _teacherAttendanceDayCourseName,
          fromJson: _teacherAttendanceDayCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _teacherAttendanceDayCourseId,
          fromJson: _teacherAttendanceDayCourseIdValue)
      int? courseId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _teacherAttendanceDayRecordsCount,
          fromJson: _teacherAttendanceDayRecordsCountValue)
      int? recordsCount,
      @JsonKey(readValue: readJsonList)
      List<TeacherAttendanceRecordModel>? records});
}

/// @nodoc
class _$TeacherAttendanceDayModelCopyWithImpl<$Res,
        $Val extends TeacherAttendanceDayModel>
    implements $TeacherAttendanceDayModelCopyWith<$Res> {
  _$TeacherAttendanceDayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherAttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attendanceDate = freezed,
    Object? courseName = freezed,
    Object? courseId = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? recordsCount = freezed,
    Object? records = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      recordsCount: freezed == recordsCount
          ? _value.recordsCount
          : recordsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      records: freezed == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<TeacherAttendanceRecordModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherAttendanceDayModelImplCopyWith<$Res>
    implements $TeacherAttendanceDayModelCopyWith<$Res> {
  factory _$$TeacherAttendanceDayModelImplCopyWith(
          _$TeacherAttendanceDayModelImpl value,
          $Res Function(_$TeacherAttendanceDayModelImpl) then) =
      __$$TeacherAttendanceDayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      String? attendanceDate,
      @JsonKey(
          readValue: _teacherAttendanceDayCourseName,
          fromJson: _teacherAttendanceDayCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _teacherAttendanceDayCourseId,
          fromJson: _teacherAttendanceDayCourseIdValue)
      int? courseId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(
          readValue: _teacherAttendanceDayRecordsCount,
          fromJson: _teacherAttendanceDayRecordsCountValue)
      int? recordsCount,
      @JsonKey(readValue: readJsonList)
      List<TeacherAttendanceRecordModel>? records});
}

/// @nodoc
class __$$TeacherAttendanceDayModelImplCopyWithImpl<$Res>
    extends _$TeacherAttendanceDayModelCopyWithImpl<$Res,
        _$TeacherAttendanceDayModelImpl>
    implements _$$TeacherAttendanceDayModelImplCopyWith<$Res> {
  __$$TeacherAttendanceDayModelImplCopyWithImpl(
      _$TeacherAttendanceDayModelImpl _value,
      $Res Function(_$TeacherAttendanceDayModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherAttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attendanceDate = freezed,
    Object? courseName = freezed,
    Object? courseId = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? recordsCount = freezed,
    Object? records = freezed,
  }) {
    return _then(_$TeacherAttendanceDayModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      recordsCount: freezed == recordsCount
          ? _value.recordsCount
          : recordsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      records: freezed == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<TeacherAttendanceRecordModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TeacherAttendanceDayModelImpl implements _TeacherAttendanceDayModel {
  const _$TeacherAttendanceDayModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
      this.attendanceDate,
      @JsonKey(
          readValue: _teacherAttendanceDayCourseName,
          fromJson: _teacherAttendanceDayCourseNameValue)
      this.courseName,
      @JsonKey(
          readValue: _teacherAttendanceDayCourseId,
          fromJson: _teacherAttendanceDayCourseIdValue)
      this.courseId,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(
          readValue: _teacherAttendanceDayRecordsCount,
          fromJson: _teacherAttendanceDayRecordsCountValue)
      this.recordsCount,
      @JsonKey(readValue: readJsonList)
      final List<TeacherAttendanceRecordModel>? records})
      : _records = records;

  factory _$TeacherAttendanceDayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherAttendanceDayModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  final String? attendanceDate;
  @override
  @JsonKey(
      readValue: _teacherAttendanceDayCourseName,
      fromJson: _teacherAttendanceDayCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(
      readValue: _teacherAttendanceDayCourseId,
      fromJson: _teacherAttendanceDayCourseIdValue)
  final int? courseId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(
      readValue: _teacherAttendanceDayRecordsCount,
      fromJson: _teacherAttendanceDayRecordsCountValue)
  final int? recordsCount;
  final List<TeacherAttendanceRecordModel>? _records;
  @override
  @JsonKey(readValue: readJsonList)
  List<TeacherAttendanceRecordModel>? get records {
    final value = _records;
    if (value == null) return null;
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TeacherAttendanceDayModel(id: $id, attendanceDate: $attendanceDate, courseName: $courseName, courseId: $courseId, status: $status, notes: $notes, recordsCount: $recordsCount, records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherAttendanceDayModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.recordsCount, recordsCount) ||
                other.recordsCount == recordsCount) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      attendanceDate,
      courseName,
      courseId,
      status,
      notes,
      recordsCount,
      const DeepCollectionEquality().hash(_records));

  /// Create a copy of TeacherAttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherAttendanceDayModelImplCopyWith<_$TeacherAttendanceDayModelImpl>
      get copyWith => __$$TeacherAttendanceDayModelImplCopyWithImpl<
          _$TeacherAttendanceDayModelImpl>(this, _$identity);
}

abstract class _TeacherAttendanceDayModel implements TeacherAttendanceDayModel {
  const factory _TeacherAttendanceDayModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
          final String? attendanceDate,
          @JsonKey(
              readValue: _teacherAttendanceDayCourseName,
              fromJson: _teacherAttendanceDayCourseNameValue)
          final String? courseName,
          @JsonKey(
              readValue: _teacherAttendanceDayCourseId,
              fromJson: _teacherAttendanceDayCourseIdValue)
          final int? courseId,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(fromJson: jsonStringLenient) final String? notes,
          @JsonKey(
              readValue: _teacherAttendanceDayRecordsCount,
              fromJson: _teacherAttendanceDayRecordsCountValue)
          final int? recordsCount,
          @JsonKey(readValue: readJsonList)
          final List<TeacherAttendanceRecordModel>? records}) =
      _$TeacherAttendanceDayModelImpl;

  factory _TeacherAttendanceDayModel.fromJson(Map<String, dynamic> json) =
      _$TeacherAttendanceDayModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'attendance_date', fromJson: jsonStringValue)
  String? get attendanceDate;
  @override
  @JsonKey(
      readValue: _teacherAttendanceDayCourseName,
      fromJson: _teacherAttendanceDayCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(
      readValue: _teacherAttendanceDayCourseId,
      fromJson: _teacherAttendanceDayCourseIdValue)
  int? get courseId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(
      readValue: _teacherAttendanceDayRecordsCount,
      fromJson: _teacherAttendanceDayRecordsCountValue)
  int? get recordsCount;
  @override
  @JsonKey(readValue: readJsonList)
  List<TeacherAttendanceRecordModel>? get records;

  /// Create a copy of TeacherAttendanceDayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherAttendanceDayModelImplCopyWith<_$TeacherAttendanceDayModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MemorizationEntryModel _$MemorizationEntryModelFromJson(
    Map<String, dynamic> json) {
  return _MemorizationEntryModel.fromJson(json);
}

/// @nodoc
mixin _$MemorizationEntryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_type', fromJson: jsonStringValue)
  String? get entryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_page', fromJson: jsonIntLenient)
  int? get fromPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_page', fromJson: jsonIntLenient)
  int? get toPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'pages_count', fromJson: jsonIntLenient)
  int? get pagesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_on', fromJson: jsonStringValue)
  String? get recordedOn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher => throw _privateConstructorUsedError;

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemorizationEntryModelCopyWith<MemorizationEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemorizationEntryModelCopyWith<$Res> {
  factory $MemorizationEntryModelCopyWith(MemorizationEntryModel value,
          $Res Function(MemorizationEntryModel) then) =
      _$MemorizationEntryModelCopyWithImpl<$Res, MemorizationEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'entry_type', fromJson: jsonStringValue) String? entryType,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) int? fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient) int? toPage,
      @JsonKey(name: 'pages_count', fromJson: jsonIntLenient) int? pagesCount,
      @JsonKey(name: 'recorded_on', fromJson: jsonStringValue)
      String? recordedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      String? courseName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  $NamedRefModelCopyWith<$Res>? get student;
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class _$MemorizationEntryModelCopyWithImpl<$Res,
        $Val extends MemorizationEntryModel>
    implements $MemorizationEntryModelCopyWith<$Res> {
  _$MemorizationEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? entryType = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
    Object? pagesCount = freezed,
    Object? recordedOn = freezed,
    Object? notes = freezed,
    Object? student = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
    Object? teacher = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      pagesCount: freezed == pagesCount
          ? _value.pagesCount
          : pagesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recordedOn: freezed == recordedOn
          ? _value.recordedOn
          : recordedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ) as $Val);
  }

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get student {
    if (_value.student == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.student!, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get teacher {
    if (_value.teacher == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.teacher!, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemorizationEntryModelImplCopyWith<$Res>
    implements $MemorizationEntryModelCopyWith<$Res> {
  factory _$$MemorizationEntryModelImplCopyWith(
          _$MemorizationEntryModelImpl value,
          $Res Function(_$MemorizationEntryModelImpl) then) =
      __$$MemorizationEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'entry_type', fromJson: jsonStringValue) String? entryType,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) int? fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient) int? toPage,
      @JsonKey(name: 'pages_count', fromJson: jsonIntLenient) int? pagesCount,
      @JsonKey(name: 'recorded_on', fromJson: jsonStringValue)
      String? recordedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      String? courseName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  @override
  $NamedRefModelCopyWith<$Res>? get student;
  @override
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class __$$MemorizationEntryModelImplCopyWithImpl<$Res>
    extends _$MemorizationEntryModelCopyWithImpl<$Res,
        _$MemorizationEntryModelImpl>
    implements _$$MemorizationEntryModelImplCopyWith<$Res> {
  __$$MemorizationEntryModelImplCopyWithImpl(
      _$MemorizationEntryModelImpl _value,
      $Res Function(_$MemorizationEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? entryType = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
    Object? pagesCount = freezed,
    Object? recordedOn = freezed,
    Object? notes = freezed,
    Object? student = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
    Object? teacher = freezed,
  }) {
    return _then(_$MemorizationEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      pagesCount: freezed == pagesCount
          ? _value.pagesCount
          : pagesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      recordedOn: freezed == recordedOn
          ? _value.recordedOn
          : recordedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MemorizationEntryModelImpl implements _MemorizationEntryModel {
  const _$MemorizationEntryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(name: 'entry_type', fromJson: jsonStringValue) this.entryType,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) this.fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient) this.toPage,
      @JsonKey(name: 'pages_count', fromJson: jsonIntLenient) this.pagesCount,
      @JsonKey(name: 'recorded_on', fromJson: jsonStringValue) this.recordedOn,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(readValue: readJsonMap) this.student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient) this.groupName,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      this.courseName,
      @JsonKey(readValue: readJsonMap) this.teacher});

  factory _$MemorizationEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemorizationEntryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(name: 'entry_type', fromJson: jsonStringValue)
  final String? entryType;
  @override
  @JsonKey(name: 'from_page', fromJson: jsonIntLenient)
  final int? fromPage;
  @override
  @JsonKey(name: 'to_page', fromJson: jsonIntLenient)
  final int? toPage;
  @override
  @JsonKey(name: 'pages_count', fromJson: jsonIntLenient)
  final int? pagesCount;
  @override
  @JsonKey(name: 'recorded_on', fromJson: jsonStringValue)
  final String? recordedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? student;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  final String? groupName;
  @override
  @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
  final String? courseName;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? teacher;

  @override
  String toString() {
    return 'MemorizationEntryModel(id: $id, enrollmentId: $enrollmentId, entryType: $entryType, fromPage: $fromPage, toPage: $toPage, pagesCount: $pagesCount, recordedOn: $recordedOn, notes: $notes, student: $student, groupName: $groupName, courseName: $courseName, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemorizationEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.fromPage, fromPage) ||
                other.fromPage == fromPage) &&
            (identical(other.toPage, toPage) || other.toPage == toPage) &&
            (identical(other.pagesCount, pagesCount) ||
                other.pagesCount == pagesCount) &&
            (identical(other.recordedOn, recordedOn) ||
                other.recordedOn == recordedOn) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      enrollmentId,
      entryType,
      fromPage,
      toPage,
      pagesCount,
      recordedOn,
      notes,
      student,
      groupName,
      courseName,
      teacher);

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemorizationEntryModelImplCopyWith<_$MemorizationEntryModelImpl>
      get copyWith => __$$MemorizationEntryModelImplCopyWithImpl<
          _$MemorizationEntryModelImpl>(this, _$identity);
}

abstract class _MemorizationEntryModel implements MemorizationEntryModel {
  const factory _MemorizationEntryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      final int? enrollmentId,
      @JsonKey(name: 'entry_type', fromJson: jsonStringValue)
      final String? entryType,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) final int? fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient) final int? toPage,
      @JsonKey(name: 'pages_count', fromJson: jsonIntLenient)
      final int? pagesCount,
      @JsonKey(name: 'recorded_on', fromJson: jsonStringValue)
      final String? recordedOn,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(readValue: readJsonMap) final NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      final String? groupName,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      final String? courseName,
      @JsonKey(readValue: readJsonMap)
      final NamedRefModel? teacher}) = _$MemorizationEntryModelImpl;

  factory _MemorizationEntryModel.fromJson(Map<String, dynamic> json) =
      _$MemorizationEntryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(name: 'entry_type', fromJson: jsonStringValue)
  String? get entryType;
  @override
  @JsonKey(name: 'from_page', fromJson: jsonIntLenient)
  int? get fromPage;
  @override
  @JsonKey(name: 'to_page', fromJson: jsonIntLenient)
  int? get toPage;
  @override
  @JsonKey(name: 'pages_count', fromJson: jsonIntLenient)
  int? get pagesCount;
  @override
  @JsonKey(name: 'recorded_on', fromJson: jsonStringValue)
  String? get recordedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName;
  @override
  @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
  String? get courseName;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher;

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemorizationEntryModelImplCopyWith<_$MemorizationEntryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AwqafTestModel _$AwqafTestModelFromJson(Map<String, dynamic> json) {
  return _AwqafTestModel.fromJson(json);
}

/// @nodoc
mixin _$AwqafTestModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  int? get attemptNo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'tested_on', fromJson: jsonStringValue)
  String? get testedOn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  Map<String, dynamic>? get juz => throw _privateConstructorUsedError;

  /// Create a copy of AwqafTestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AwqafTestModelCopyWith<AwqafTestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwqafTestModelCopyWith<$Res> {
  factory $AwqafTestModelCopyWith(
          AwqafTestModel value, $Res Function(AwqafTestModel) then) =
      _$AwqafTestModelCopyWithImpl<$Res, AwqafTestModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonDoubleLenient) double? score,
      @JsonKey(name: 'tested_on', fromJson: jsonStringValue) String? testedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
      String? typeName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher,
      @JsonKey(readValue: readJsonMap) Map<String, dynamic>? juz});

  $NamedRefModelCopyWith<$Res>? get student;
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class _$AwqafTestModelCopyWithImpl<$Res, $Val extends AwqafTestModel>
    implements $AwqafTestModelCopyWith<$Res> {
  _$AwqafTestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AwqafTestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? attemptNo = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? typeName = freezed,
    Object? student = freezed,
    Object? groupName = freezed,
    Object? teacher = freezed,
    Object? juz = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      juz: freezed == juz
          ? _value.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of AwqafTestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get student {
    if (_value.student == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.student!, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }

  /// Create a copy of AwqafTestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get teacher {
    if (_value.teacher == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.teacher!, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AwqafTestModelImplCopyWith<$Res>
    implements $AwqafTestModelCopyWith<$Res> {
  factory _$$AwqafTestModelImplCopyWith(_$AwqafTestModelImpl value,
          $Res Function(_$AwqafTestModelImpl) then) =
      __$$AwqafTestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonDoubleLenient) double? score,
      @JsonKey(name: 'tested_on', fromJson: jsonStringValue) String? testedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
      String? typeName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher,
      @JsonKey(readValue: readJsonMap) Map<String, dynamic>? juz});

  @override
  $NamedRefModelCopyWith<$Res>? get student;
  @override
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class __$$AwqafTestModelImplCopyWithImpl<$Res>
    extends _$AwqafTestModelCopyWithImpl<$Res, _$AwqafTestModelImpl>
    implements _$$AwqafTestModelImplCopyWith<$Res> {
  __$$AwqafTestModelImplCopyWithImpl(
      _$AwqafTestModelImpl _value, $Res Function(_$AwqafTestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AwqafTestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? attemptNo = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? typeName = freezed,
    Object? student = freezed,
    Object? groupName = freezed,
    Object? teacher = freezed,
    Object? juz = freezed,
  }) {
    return _then(_$AwqafTestModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      juz: freezed == juz
          ? _value._juz
          : juz // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AwqafTestModelImpl implements _AwqafTestModel {
  const _$AwqafTestModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) this.attemptNo,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonDoubleLenient) this.score,
      @JsonKey(name: 'tested_on', fromJson: jsonStringValue) this.testedOn,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
      this.typeName,
      @JsonKey(readValue: readJsonMap) this.student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient) this.groupName,
      @JsonKey(readValue: readJsonMap) this.teacher,
      @JsonKey(readValue: readJsonMap) final Map<String, dynamic>? juz})
      : _juz = juz;

  factory _$AwqafTestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwqafTestModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  final int? attemptNo;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? score;
  @override
  @JsonKey(name: 'tested_on', fromJson: jsonStringValue)
  final String? testedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
  final String? typeName;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? student;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  final String? groupName;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? teacher;
  final Map<String, dynamic>? _juz;
  @override
  @JsonKey(readValue: readJsonMap)
  Map<String, dynamic>? get juz {
    final value = _juz;
    if (value == null) return null;
    if (_juz is EqualUnmodifiableMapView) return _juz;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AwqafTestModel(id: $id, enrollmentId: $enrollmentId, attemptNo: $attemptNo, status: $status, score: $score, testedOn: $testedOn, notes: $notes, typeName: $typeName, student: $student, groupName: $groupName, teacher: $teacher, juz: $juz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwqafTestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.attemptNo, attemptNo) ||
                other.attemptNo == attemptNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.testedOn, testedOn) ||
                other.testedOn == testedOn) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            const DeepCollectionEquality().equals(other._juz, _juz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      enrollmentId,
      attemptNo,
      status,
      score,
      testedOn,
      notes,
      typeName,
      student,
      groupName,
      teacher,
      const DeepCollectionEquality().hash(_juz));

  /// Create a copy of AwqafTestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AwqafTestModelImplCopyWith<_$AwqafTestModelImpl> get copyWith =>
      __$$AwqafTestModelImplCopyWithImpl<_$AwqafTestModelImpl>(
          this, _$identity);
}

abstract class _AwqafTestModel implements AwqafTestModel {
  const factory _AwqafTestModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      final int? enrollmentId,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
      final int? attemptNo,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(fromJson: jsonDoubleLenient) final double? score,
      @JsonKey(name: 'tested_on', fromJson: jsonStringValue)
      final String? testedOn,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
      final String? typeName,
      @JsonKey(readValue: readJsonMap) final NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      final String? groupName,
      @JsonKey(readValue: readJsonMap) final NamedRefModel? teacher,
      @JsonKey(readValue: readJsonMap)
      final Map<String, dynamic>? juz}) = _$AwqafTestModelImpl;

  factory _AwqafTestModel.fromJson(Map<String, dynamic> json) =
      _$AwqafTestModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  int? get attemptNo;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get score;
  @override
  @JsonKey(name: 'tested_on', fromJson: jsonStringValue)
  String? get testedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(readValue: _awqafTestTypeName, fromJson: _awqafTestTypeNameValue)
  String? get typeName;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher;
  @override
  @JsonKey(readValue: readJsonMap)
  Map<String, dynamic>? get juz;

  /// Create a copy of AwqafTestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AwqafTestModelImplCopyWith<_$AwqafTestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PointEntryModel _$PointEntryModelFromJson(Map<String, dynamic> json) {
  return _PointEntryModel.fromJson(json);
}

/// @nodoc
mixin _$PointEntryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonIntLenient)
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntryPointTypeName,
      fromJson: _pointEntryPointTypeNameValue)
  String? get pointTypeName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntryPointTypeId, fromJson: _pointEntryPointTypeIdValue)
  int? get pointTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entered_at', fromJson: jsonStringValue)
  String? get enteredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
  String? get effectiveState => throw _privateConstructorUsedError;
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  String? get voidedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
  String? get voidReason => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_type', fromJson: jsonStringValue)
  String? get sourceType => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName => throw _privateConstructorUsedError;

  /// Create a copy of PointEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointEntryModelCopyWith<PointEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointEntryModelCopyWith<$Res> {
  factory $PointEntryModelCopyWith(
          PointEntryModel value, $Res Function(PointEntryModel) then) =
      _$PointEntryModelCopyWithImpl<$Res, PointEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(fromJson: jsonIntLenient) int? points,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      String? pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeId,
          fromJson: _pointEntryPointTypeIdValue)
      int? pointTypeId,
      @JsonKey(name: 'entered_at', fromJson: jsonStringValue) String? enteredAt,
      @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
      String? effectiveState,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) String? voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      String? voidReason,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'source_type', fromJson: jsonStringValue)
      String? sourceType,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName});

  $NamedRefModelCopyWith<$Res>? get student;
}

/// @nodoc
class _$PointEntryModelCopyWithImpl<$Res, $Val extends PointEntryModel>
    implements $PointEntryModelCopyWith<$Res> {
  _$PointEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? points = freezed,
    Object? pointTypeName = freezed,
    Object? pointTypeId = freezed,
    Object? enteredAt = freezed,
    Object? effectiveState = freezed,
    Object? voidedAt = freezed,
    Object? voidReason = freezed,
    Object? notes = freezed,
    Object? sourceType = freezed,
    Object? student = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      pointTypeName: freezed == pointTypeName
          ? _value.pointTypeName
          : pointTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeId: freezed == pointTypeId
          ? _value.pointTypeId
          : pointTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      enteredAt: freezed == enteredAt
          ? _value.enteredAt
          : enteredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveState: freezed == effectiveState
          ? _value.effectiveState
          : effectiveState // ignore: cast_nullable_to_non_nullable
              as String?,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      voidReason: freezed == voidReason
          ? _value.voidReason
          : voidReason // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PointEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get student {
    if (_value.student == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.student!, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PointEntryModelImplCopyWith<$Res>
    implements $PointEntryModelCopyWith<$Res> {
  factory _$$PointEntryModelImplCopyWith(_$PointEntryModelImpl value,
          $Res Function(_$PointEntryModelImpl) then) =
      __$$PointEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(fromJson: jsonIntLenient) int? points,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      String? pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeId,
          fromJson: _pointEntryPointTypeIdValue)
      int? pointTypeId,
      @JsonKey(name: 'entered_at', fromJson: jsonStringValue) String? enteredAt,
      @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
      String? effectiveState,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) String? voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      String? voidReason,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'source_type', fromJson: jsonStringValue)
      String? sourceType,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName});

  @override
  $NamedRefModelCopyWith<$Res>? get student;
}

/// @nodoc
class __$$PointEntryModelImplCopyWithImpl<$Res>
    extends _$PointEntryModelCopyWithImpl<$Res, _$PointEntryModelImpl>
    implements _$$PointEntryModelImplCopyWith<$Res> {
  __$$PointEntryModelImplCopyWithImpl(
      _$PointEntryModelImpl _value, $Res Function(_$PointEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? points = freezed,
    Object? pointTypeName = freezed,
    Object? pointTypeId = freezed,
    Object? enteredAt = freezed,
    Object? effectiveState = freezed,
    Object? voidedAt = freezed,
    Object? voidReason = freezed,
    Object? notes = freezed,
    Object? sourceType = freezed,
    Object? student = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_$PointEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      pointTypeName: freezed == pointTypeName
          ? _value.pointTypeName
          : pointTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeId: freezed == pointTypeId
          ? _value.pointTypeId
          : pointTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      enteredAt: freezed == enteredAt
          ? _value.enteredAt
          : enteredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      effectiveState: freezed == effectiveState
          ? _value.effectiveState
          : effectiveState // ignore: cast_nullable_to_non_nullable
              as String?,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      voidReason: freezed == voidReason
          ? _value.voidReason
          : voidReason // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$PointEntryModelImpl implements _PointEntryModel {
  const _$PointEntryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(fromJson: jsonIntLenient) this.points,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      this.pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeId,
          fromJson: _pointEntryPointTypeIdValue)
      this.pointTypeId,
      @JsonKey(name: 'entered_at', fromJson: jsonStringValue) this.enteredAt,
      @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
      this.effectiveState,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) this.voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      this.voidReason,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(name: 'source_type', fromJson: jsonStringValue) this.sourceType,
      @JsonKey(readValue: readJsonMap) this.student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      this.groupName});

  factory _$PointEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointEntryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? points;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeName,
      fromJson: _pointEntryPointTypeNameValue)
  final String? pointTypeName;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeId, fromJson: _pointEntryPointTypeIdValue)
  final int? pointTypeId;
  @override
  @JsonKey(name: 'entered_at', fromJson: jsonStringValue)
  final String? enteredAt;
  @override
  @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
  final String? effectiveState;
  @override
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  final String? voidedAt;
  @override
  @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
  final String? voidReason;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(name: 'source_type', fromJson: jsonStringValue)
  final String? sourceType;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? student;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  final String? groupName;

  @override
  String toString() {
    return 'PointEntryModel(id: $id, enrollmentId: $enrollmentId, points: $points, pointTypeName: $pointTypeName, pointTypeId: $pointTypeId, enteredAt: $enteredAt, effectiveState: $effectiveState, voidedAt: $voidedAt, voidReason: $voidReason, notes: $notes, sourceType: $sourceType, student: $student, groupName: $groupName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.pointTypeName, pointTypeName) ||
                other.pointTypeName == pointTypeName) &&
            (identical(other.pointTypeId, pointTypeId) ||
                other.pointTypeId == pointTypeId) &&
            (identical(other.enteredAt, enteredAt) ||
                other.enteredAt == enteredAt) &&
            (identical(other.effectiveState, effectiveState) ||
                other.effectiveState == effectiveState) &&
            (identical(other.voidedAt, voidedAt) ||
                other.voidedAt == voidedAt) &&
            (identical(other.voidReason, voidReason) ||
                other.voidReason == voidReason) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      enrollmentId,
      points,
      pointTypeName,
      pointTypeId,
      enteredAt,
      effectiveState,
      voidedAt,
      voidReason,
      notes,
      sourceType,
      student,
      groupName);

  /// Create a copy of PointEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointEntryModelImplCopyWith<_$PointEntryModelImpl> get copyWith =>
      __$$PointEntryModelImplCopyWithImpl<_$PointEntryModelImpl>(
          this, _$identity);
}

abstract class _PointEntryModel implements PointEntryModel {
  const factory _PointEntryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      final int? enrollmentId,
      @JsonKey(fromJson: jsonIntLenient) final int? points,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      final String? pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeId,
          fromJson: _pointEntryPointTypeIdValue)
      final int? pointTypeId,
      @JsonKey(name: 'entered_at', fromJson: jsonStringValue)
      final String? enteredAt,
      @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
      final String? effectiveState,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
      final String? voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      final String? voidReason,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(name: 'source_type', fromJson: jsonStringValue)
      final String? sourceType,
      @JsonKey(readValue: readJsonMap) final NamedRefModel? student,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      final String? groupName}) = _$PointEntryModelImpl;

  factory _PointEntryModel.fromJson(Map<String, dynamic> json) =
      _$PointEntryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get points;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeName,
      fromJson: _pointEntryPointTypeNameValue)
  String? get pointTypeName;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeId, fromJson: _pointEntryPointTypeIdValue)
  int? get pointTypeId;
  @override
  @JsonKey(name: 'entered_at', fromJson: jsonStringValue)
  String? get enteredAt;
  @override
  @JsonKey(name: 'effective_state', fromJson: jsonStringValue)
  String? get effectiveState;
  @override
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  String? get voidedAt;
  @override
  @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
  String? get voidReason;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(name: 'source_type', fromJson: jsonStringValue)
  String? get sourceType;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName;

  /// Create a copy of PointEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointEntryModelImplCopyWith<_$PointEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssessmentSummaryModel _$AssessmentSummaryModelFromJson(
    Map<String, dynamic> json) {
  return _AssessmentSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentSummaryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _assessmentSummaryTypeName,
      fromJson: _assessmentSummaryTypeNameValue)
  String? get typeName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _assessmentSummaryGroupName,
      fromJson: _assessmentSummaryGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _assessmentSummaryCourseName,
      fromJson: _assessmentSummaryCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
  String? get scheduledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_at', fromJson: jsonStringLenient)
  String? get dueAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient)
  double? get totalMark => throw _privateConstructorUsedError;
  @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient)
  double? get passMark => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'results_count', fromJson: jsonIntLenient)
  int? get resultsCount => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentSummaryModelCopyWith<AssessmentSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentSummaryModelCopyWith<$Res> {
  factory $AssessmentSummaryModelCopyWith(AssessmentSummaryModel value,
          $Res Function(AssessmentSummaryModel) then) =
      _$AssessmentSummaryModelCopyWithImpl<$Res, AssessmentSummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? title,
      @JsonKey(
          readValue: _assessmentSummaryTypeName,
          fromJson: _assessmentSummaryTypeNameValue)
      String? typeName,
      @JsonKey(
          readValue: _assessmentSummaryGroupName,
          fromJson: _assessmentSummaryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _assessmentSummaryCourseName,
          fromJson: _assessmentSummaryCourseNameValue)
      String? courseName,
      @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
      String? scheduledAt,
      @JsonKey(name: 'due_at', fromJson: jsonStringLenient) String? dueAt,
      @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient)
      double? totalMark,
      @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient) double? passMark,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'results_count', fromJson: jsonIntLenient)
      int? resultsCount});
}

/// @nodoc
class _$AssessmentSummaryModelCopyWithImpl<$Res,
        $Val extends AssessmentSummaryModel>
    implements $AssessmentSummaryModelCopyWith<$Res> {
  _$AssessmentSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? typeName = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
    Object? scheduledAt = freezed,
    Object? dueAt = freezed,
    Object? totalMark = freezed,
    Object? passMark = freezed,
    Object? isActive = freezed,
    Object? resultsCount = freezed,
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
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMark: freezed == totalMark
          ? _value.totalMark
          : totalMark // ignore: cast_nullable_to_non_nullable
              as double?,
      passMark: freezed == passMark
          ? _value.passMark
          : passMark // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      resultsCount: freezed == resultsCount
          ? _value.resultsCount
          : resultsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentSummaryModelImplCopyWith<$Res>
    implements $AssessmentSummaryModelCopyWith<$Res> {
  factory _$$AssessmentSummaryModelImplCopyWith(
          _$AssessmentSummaryModelImpl value,
          $Res Function(_$AssessmentSummaryModelImpl) then) =
      __$$AssessmentSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? title,
      @JsonKey(
          readValue: _assessmentSummaryTypeName,
          fromJson: _assessmentSummaryTypeNameValue)
      String? typeName,
      @JsonKey(
          readValue: _assessmentSummaryGroupName,
          fromJson: _assessmentSummaryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _assessmentSummaryCourseName,
          fromJson: _assessmentSummaryCourseNameValue)
      String? courseName,
      @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
      String? scheduledAt,
      @JsonKey(name: 'due_at', fromJson: jsonStringLenient) String? dueAt,
      @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient)
      double? totalMark,
      @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient) double? passMark,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(name: 'results_count', fromJson: jsonIntLenient)
      int? resultsCount});
}

/// @nodoc
class __$$AssessmentSummaryModelImplCopyWithImpl<$Res>
    extends _$AssessmentSummaryModelCopyWithImpl<$Res,
        _$AssessmentSummaryModelImpl>
    implements _$$AssessmentSummaryModelImplCopyWith<$Res> {
  __$$AssessmentSummaryModelImplCopyWithImpl(
      _$AssessmentSummaryModelImpl _value,
      $Res Function(_$AssessmentSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? typeName = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
    Object? scheduledAt = freezed,
    Object? dueAt = freezed,
    Object? totalMark = freezed,
    Object? passMark = freezed,
    Object? isActive = freezed,
    Object? resultsCount = freezed,
  }) {
    return _then(_$AssessmentSummaryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      typeName: freezed == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMark: freezed == totalMark
          ? _value.totalMark
          : totalMark // ignore: cast_nullable_to_non_nullable
              as double?,
      passMark: freezed == passMark
          ? _value.passMark
          : passMark // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      resultsCount: freezed == resultsCount
          ? _value.resultsCount
          : resultsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AssessmentSummaryModelImpl implements _AssessmentSummaryModel {
  const _$AssessmentSummaryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.title,
      @JsonKey(
          readValue: _assessmentSummaryTypeName,
          fromJson: _assessmentSummaryTypeNameValue)
      this.typeName,
      @JsonKey(
          readValue: _assessmentSummaryGroupName,
          fromJson: _assessmentSummaryGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _assessmentSummaryCourseName,
          fromJson: _assessmentSummaryCourseNameValue)
      this.courseName,
      @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
      this.scheduledAt,
      @JsonKey(name: 'due_at', fromJson: jsonStringLenient) this.dueAt,
      @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient) this.totalMark,
      @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient) this.passMark,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(name: 'results_count', fromJson: jsonIntLenient)
      this.resultsCount});

  factory _$AssessmentSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentSummaryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? title;
  @override
  @JsonKey(
      readValue: _assessmentSummaryTypeName,
      fromJson: _assessmentSummaryTypeNameValue)
  final String? typeName;
  @override
  @JsonKey(
      readValue: _assessmentSummaryGroupName,
      fromJson: _assessmentSummaryGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _assessmentSummaryCourseName,
      fromJson: _assessmentSummaryCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
  final String? scheduledAt;
  @override
  @JsonKey(name: 'due_at', fromJson: jsonStringLenient)
  final String? dueAt;
  @override
  @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient)
  final double? totalMark;
  @override
  @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient)
  final double? passMark;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(name: 'results_count', fromJson: jsonIntLenient)
  final int? resultsCount;

  @override
  String toString() {
    return 'AssessmentSummaryModel(id: $id, title: $title, typeName: $typeName, groupName: $groupName, courseName: $courseName, scheduledAt: $scheduledAt, dueAt: $dueAt, totalMark: $totalMark, passMark: $passMark, isActive: $isActive, resultsCount: $resultsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentSummaryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.dueAt, dueAt) || other.dueAt == dueAt) &&
            (identical(other.totalMark, totalMark) ||
                other.totalMark == totalMark) &&
            (identical(other.passMark, passMark) ||
                other.passMark == passMark) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.resultsCount, resultsCount) ||
                other.resultsCount == resultsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      typeName,
      groupName,
      courseName,
      scheduledAt,
      dueAt,
      totalMark,
      passMark,
      isActive,
      resultsCount);

  /// Create a copy of AssessmentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentSummaryModelImplCopyWith<_$AssessmentSummaryModelImpl>
      get copyWith => __$$AssessmentSummaryModelImplCopyWithImpl<
          _$AssessmentSummaryModelImpl>(this, _$identity);
}

abstract class _AssessmentSummaryModel implements AssessmentSummaryModel {
  const factory _AssessmentSummaryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? title,
      @JsonKey(
          readValue: _assessmentSummaryTypeName,
          fromJson: _assessmentSummaryTypeNameValue)
      final String? typeName,
      @JsonKey(
          readValue: _assessmentSummaryGroupName,
          fromJson: _assessmentSummaryGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _assessmentSummaryCourseName,
          fromJson: _assessmentSummaryCourseNameValue)
      final String? courseName,
      @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
      final String? scheduledAt,
      @JsonKey(name: 'due_at', fromJson: jsonStringLenient) final String? dueAt,
      @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient)
      final double? totalMark,
      @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient)
      final double? passMark,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive,
      @JsonKey(name: 'results_count', fromJson: jsonIntLenient)
      final int? resultsCount}) = _$AssessmentSummaryModelImpl;

  factory _AssessmentSummaryModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentSummaryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get title;
  @override
  @JsonKey(
      readValue: _assessmentSummaryTypeName,
      fromJson: _assessmentSummaryTypeNameValue)
  String? get typeName;
  @override
  @JsonKey(
      readValue: _assessmentSummaryGroupName,
      fromJson: _assessmentSummaryGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _assessmentSummaryCourseName,
      fromJson: _assessmentSummaryCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(name: 'scheduled_at', fromJson: jsonStringLenient)
  String? get scheduledAt;
  @override
  @JsonKey(name: 'due_at', fromJson: jsonStringLenient)
  String? get dueAt;
  @override
  @JsonKey(name: 'total_mark', fromJson: jsonDoubleLenient)
  double? get totalMark;
  @override
  @JsonKey(name: 'pass_mark', fromJson: jsonDoubleLenient)
  double? get passMark;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(name: 'results_count', fromJson: jsonIntLenient)
  int? get resultsCount;

  /// Create a copy of AssessmentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentSummaryModelImplCopyWith<_$AssessmentSummaryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AssessmentResultItemModel _$AssessmentResultItemModelFromJson(
    Map<String, dynamic> json) {
  return _AssessmentResultItemModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentResultItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_name', fromJson: jsonStringValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  int? get attemptNo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
  String? get teacherName => throw _privateConstructorUsedError;

  /// Create a copy of AssessmentResultItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentResultItemModelCopyWith<AssessmentResultItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentResultItemModelCopyWith<$Res> {
  factory $AssessmentResultItemModelCopyWith(AssessmentResultItemModel value,
          $Res Function(AssessmentResultItemModel) then) =
      _$AssessmentResultItemModelCopyWithImpl<$Res, AssessmentResultItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient) int? studentId,
      @JsonKey(name: 'student_name', fromJson: jsonStringValue)
      String? studentName,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(fromJson: jsonDoubleLenient) double? score,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
      String? teacherName});
}

/// @nodoc
class _$AssessmentResultItemModelCopyWithImpl<$Res,
        $Val extends AssessmentResultItemModel>
    implements $AssessmentResultItemModelCopyWith<$Res> {
  _$AssessmentResultItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentResultItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? attemptNo = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? teacherName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssessmentResultItemModelImplCopyWith<$Res>
    implements $AssessmentResultItemModelCopyWith<$Res> {
  factory _$$AssessmentResultItemModelImplCopyWith(
          _$AssessmentResultItemModelImpl value,
          $Res Function(_$AssessmentResultItemModelImpl) then) =
      __$$AssessmentResultItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient) int? studentId,
      @JsonKey(name: 'student_name', fromJson: jsonStringValue)
      String? studentName,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(fromJson: jsonDoubleLenient) double? score,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
      String? teacherName});
}

/// @nodoc
class __$$AssessmentResultItemModelImplCopyWithImpl<$Res>
    extends _$AssessmentResultItemModelCopyWithImpl<$Res,
        _$AssessmentResultItemModelImpl>
    implements _$$AssessmentResultItemModelImplCopyWith<$Res> {
  __$$AssessmentResultItemModelImplCopyWithImpl(
      _$AssessmentResultItemModelImpl _value,
      $Res Function(_$AssessmentResultItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentResultItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? attemptNo = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? notes = freezed,
    Object? teacherName = freezed,
  }) {
    return _then(_$AssessmentResultItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AssessmentResultItemModelImpl implements _AssessmentResultItemModel {
  const _$AssessmentResultItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient) this.studentId,
      @JsonKey(name: 'student_name', fromJson: jsonStringValue)
      this.studentName,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) this.attemptNo,
      @JsonKey(fromJson: jsonDoubleLenient) this.score,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
      this.teacherName});

  factory _$AssessmentResultItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentResultItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
  final int? studentId;
  @override
  @JsonKey(name: 'student_name', fromJson: jsonStringValue)
  final String? studentName;
  @override
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  final int? attemptNo;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? score;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
  final String? teacherName;

  @override
  String toString() {
    return 'AssessmentResultItemModel(id: $id, enrollmentId: $enrollmentId, studentId: $studentId, studentName: $studentName, attemptNo: $attemptNo, score: $score, status: $status, notes: $notes, teacherName: $teacherName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentResultItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.attemptNo, attemptNo) ||
                other.attemptNo == attemptNo) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, enrollmentId, studentId,
      studentName, attemptNo, score, status, notes, teacherName);

  /// Create a copy of AssessmentResultItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentResultItemModelImplCopyWith<_$AssessmentResultItemModelImpl>
      get copyWith => __$$AssessmentResultItemModelImplCopyWithImpl<
          _$AssessmentResultItemModelImpl>(this, _$identity);
}

abstract class _AssessmentResultItemModel implements AssessmentResultItemModel {
  const factory _AssessmentResultItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      final int? enrollmentId,
      @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
      final int? studentId,
      @JsonKey(name: 'student_name', fromJson: jsonStringValue)
      final String? studentName,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
      final int? attemptNo,
      @JsonKey(fromJson: jsonDoubleLenient) final double? score,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
      final String? teacherName}) = _$AssessmentResultItemModelImpl;

  factory _AssessmentResultItemModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentResultItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(name: 'student_id', fromJson: jsonIntLenient)
  int? get studentId;
  @override
  @JsonKey(name: 'student_name', fromJson: jsonStringValue)
  String? get studentName;
  @override
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  int? get attemptNo;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get score;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(name: 'teacher_name', fromJson: jsonStringLenient)
  String? get teacherName;

  /// Create a copy of AssessmentResultItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentResultItemModelImplCopyWith<_$AssessmentResultItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AssessmentDetailModel _$AssessmentDetailModelFromJson(
    Map<String, dynamic> json) {
  return _AssessmentDetailModel.fromJson(json);
}

/// @nodoc
mixin _$AssessmentDetailModel {
  @JsonKey(readValue: _assessmentDetailSummary)
  AssessmentSummaryModel? get summary => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<NamedRefModel>? get groups => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<AssessmentResultItemModel>? get results =>
      throw _privateConstructorUsedError;

  /// Create a copy of AssessmentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssessmentDetailModelCopyWith<AssessmentDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentDetailModelCopyWith<$Res> {
  factory $AssessmentDetailModelCopyWith(AssessmentDetailModel value,
          $Res Function(AssessmentDetailModel) then) =
      _$AssessmentDetailModelCopyWithImpl<$Res, AssessmentDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _assessmentDetailSummary)
      AssessmentSummaryModel? summary,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(readValue: readJsonList) List<NamedRefModel>? groups,
      @JsonKey(readValue: readJsonList)
      List<AssessmentResultItemModel>? results});

  $AssessmentSummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class _$AssessmentDetailModelCopyWithImpl<$Res,
        $Val extends AssessmentDetailModel>
    implements $AssessmentDetailModelCopyWith<$Res> {
  _$AssessmentDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssessmentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? description = freezed,
    Object? groups = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as AssessmentSummaryModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<NamedRefModel>?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AssessmentResultItemModel>?,
    ) as $Val);
  }

  /// Create a copy of AssessmentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssessmentSummaryModelCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $AssessmentSummaryModelCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssessmentDetailModelImplCopyWith<$Res>
    implements $AssessmentDetailModelCopyWith<$Res> {
  factory _$$AssessmentDetailModelImplCopyWith(
          _$AssessmentDetailModelImpl value,
          $Res Function(_$AssessmentDetailModelImpl) then) =
      __$$AssessmentDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _assessmentDetailSummary)
      AssessmentSummaryModel? summary,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(readValue: readJsonList) List<NamedRefModel>? groups,
      @JsonKey(readValue: readJsonList)
      List<AssessmentResultItemModel>? results});

  @override
  $AssessmentSummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$AssessmentDetailModelImplCopyWithImpl<$Res>
    extends _$AssessmentDetailModelCopyWithImpl<$Res,
        _$AssessmentDetailModelImpl>
    implements _$$AssessmentDetailModelImplCopyWith<$Res> {
  __$$AssessmentDetailModelImplCopyWithImpl(_$AssessmentDetailModelImpl _value,
      $Res Function(_$AssessmentDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssessmentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? description = freezed,
    Object? groups = freezed,
    Object? results = freezed,
  }) {
    return _then(_$AssessmentDetailModelImpl(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as AssessmentSummaryModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<NamedRefModel>?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AssessmentResultItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AssessmentDetailModelImpl implements _AssessmentDetailModel {
  const _$AssessmentDetailModelImpl(
      {@JsonKey(readValue: _assessmentDetailSummary) this.summary,
      @JsonKey(fromJson: jsonStringLenient) this.description,
      @JsonKey(readValue: readJsonList) final List<NamedRefModel>? groups,
      @JsonKey(readValue: readJsonList)
      final List<AssessmentResultItemModel>? results})
      : _groups = groups,
        _results = results;

  factory _$AssessmentDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssessmentDetailModelImplFromJson(json);

  @override
  @JsonKey(readValue: _assessmentDetailSummary)
  final AssessmentSummaryModel? summary;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? description;
  final List<NamedRefModel>? _groups;
  @override
  @JsonKey(readValue: readJsonList)
  List<NamedRefModel>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AssessmentResultItemModel>? _results;
  @override
  @JsonKey(readValue: readJsonList)
  List<AssessmentResultItemModel>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AssessmentDetailModel(summary: $summary, description: $description, groups: $groups, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssessmentDetailModelImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      description,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of AssessmentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssessmentDetailModelImplCopyWith<_$AssessmentDetailModelImpl>
      get copyWith => __$$AssessmentDetailModelImplCopyWithImpl<
          _$AssessmentDetailModelImpl>(this, _$identity);
}

abstract class _AssessmentDetailModel implements AssessmentDetailModel {
  const factory _AssessmentDetailModel(
          {@JsonKey(readValue: _assessmentDetailSummary)
          final AssessmentSummaryModel? summary,
          @JsonKey(fromJson: jsonStringLenient) final String? description,
          @JsonKey(readValue: readJsonList) final List<NamedRefModel>? groups,
          @JsonKey(readValue: readJsonList)
          final List<AssessmentResultItemModel>? results}) =
      _$AssessmentDetailModelImpl;

  factory _AssessmentDetailModel.fromJson(Map<String, dynamic> json) =
      _$AssessmentDetailModelImpl.fromJson;

  @override
  @JsonKey(readValue: _assessmentDetailSummary)
  AssessmentSummaryModel? get summary;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get description;
  @override
  @JsonKey(readValue: readJsonList)
  List<NamedRefModel>? get groups;
  @override
  @JsonKey(readValue: readJsonList)
  List<AssessmentResultItemModel>? get results;

  /// Create a copy of AssessmentDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssessmentDetailModelImplCopyWith<_$AssessmentDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentNoteItemModel _$StudentNoteItemModelFromJson(Map<String, dynamic> json) {
  return _StudentNoteItemModel.fromJson(json);
}

/// @nodoc
mixin _$StudentNoteItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'noted_at', fromJson: jsonStringValue)
  String? get notedAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get author => throw _privateConstructorUsedError;

  /// Create a copy of StudentNoteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentNoteItemModelCopyWith<StudentNoteItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentNoteItemModelCopyWith<$Res> {
  factory $StudentNoteItemModelCopyWith(StudentNoteItemModel value,
          $Res Function(StudentNoteItemModel) then) =
      _$StudentNoteItemModelCopyWithImpl<$Res, StudentNoteItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? body,
      @JsonKey(name: 'noted_at', fromJson: jsonStringValue) String? notedAt,
      @JsonKey(fromJson: jsonStringValue) String? source,
      @JsonKey(fromJson: jsonStringValue) String? visibility,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(readValue: readJsonMap) NamedRefModel? author});

  $NamedRefModelCopyWith<$Res>? get student;
  $NamedRefModelCopyWith<$Res>? get author;
}

/// @nodoc
class _$StudentNoteItemModelCopyWithImpl<$Res,
        $Val extends StudentNoteItemModel>
    implements $StudentNoteItemModelCopyWith<$Res> {
  _$StudentNoteItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentNoteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? notedAt = freezed,
    Object? source = freezed,
    Object? visibility = freezed,
    Object? enrollmentId = freezed,
    Object? groupName = freezed,
    Object? student = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      notedAt: freezed == notedAt
          ? _value.notedAt
          : notedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ) as $Val);
  }

  /// Create a copy of StudentNoteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get student {
    if (_value.student == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.student!, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }

  /// Create a copy of StudentNoteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentNoteItemModelImplCopyWith<$Res>
    implements $StudentNoteItemModelCopyWith<$Res> {
  factory _$$StudentNoteItemModelImplCopyWith(_$StudentNoteItemModelImpl value,
          $Res Function(_$StudentNoteItemModelImpl) then) =
      __$$StudentNoteItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? body,
      @JsonKey(name: 'noted_at', fromJson: jsonStringValue) String? notedAt,
      @JsonKey(fromJson: jsonStringValue) String? source,
      @JsonKey(fromJson: jsonStringValue) String? visibility,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(readValue: readJsonMap) NamedRefModel? author});

  @override
  $NamedRefModelCopyWith<$Res>? get student;
  @override
  $NamedRefModelCopyWith<$Res>? get author;
}

/// @nodoc
class __$$StudentNoteItemModelImplCopyWithImpl<$Res>
    extends _$StudentNoteItemModelCopyWithImpl<$Res, _$StudentNoteItemModelImpl>
    implements _$$StudentNoteItemModelImplCopyWith<$Res> {
  __$$StudentNoteItemModelImplCopyWithImpl(_$StudentNoteItemModelImpl _value,
      $Res Function(_$StudentNoteItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentNoteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? notedAt = freezed,
    Object? source = freezed,
    Object? visibility = freezed,
    Object? enrollmentId = freezed,
    Object? groupName = freezed,
    Object? student = freezed,
    Object? author = freezed,
  }) {
    return _then(_$StudentNoteItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      notedAt: freezed == notedAt
          ? _value.notedAt
          : notedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentNoteItemModelImpl implements _StudentNoteItemModel {
  const _$StudentNoteItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.body,
      @JsonKey(name: 'noted_at', fromJson: jsonStringValue) this.notedAt,
      @JsonKey(fromJson: jsonStringValue) this.source,
      @JsonKey(fromJson: jsonStringValue) this.visibility,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient) this.groupName,
      @JsonKey(readValue: readJsonMap) this.student,
      @JsonKey(readValue: readJsonMap) this.author});

  factory _$StudentNoteItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentNoteItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? body;
  @override
  @JsonKey(name: 'noted_at', fromJson: jsonStringValue)
  final String? notedAt;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? source;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? visibility;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  final String? groupName;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? student;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? author;

  @override
  String toString() {
    return 'StudentNoteItemModel(id: $id, body: $body, notedAt: $notedAt, source: $source, visibility: $visibility, enrollmentId: $enrollmentId, groupName: $groupName, student: $student, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentNoteItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.notedAt, notedAt) || other.notedAt == notedAt) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, body, notedAt, source,
      visibility, enrollmentId, groupName, student, author);

  /// Create a copy of StudentNoteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentNoteItemModelImplCopyWith<_$StudentNoteItemModelImpl>
      get copyWith =>
          __$$StudentNoteItemModelImplCopyWithImpl<_$StudentNoteItemModelImpl>(
              this, _$identity);
}

abstract class _StudentNoteItemModel implements StudentNoteItemModel {
  const factory _StudentNoteItemModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? body,
          @JsonKey(name: 'noted_at', fromJson: jsonStringValue)
          final String? notedAt,
          @JsonKey(fromJson: jsonStringValue) final String? source,
          @JsonKey(fromJson: jsonStringValue) final String? visibility,
          @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
          final int? enrollmentId,
          @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
          final String? groupName,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? student,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? author}) =
      _$StudentNoteItemModelImpl;

  factory _StudentNoteItemModel.fromJson(Map<String, dynamic> json) =
      _$StudentNoteItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get body;
  @override
  @JsonKey(name: 'noted_at', fromJson: jsonStringValue)
  String? get notedAt;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get source;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get visibility;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get author;

  /// Create a copy of StudentNoteItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentNoteItemModelImplCopyWith<_$StudentNoteItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurriculumResourceModel _$CurriculumResourceModelFromJson(
    Map<String, dynamic> json) {
  return _CurriculumResourceModel.fromJson(json);
}

/// @nodoc
mixin _$CurriculumResourceModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'book_name', fromJson: jsonStringValue)
  String? get bookName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get publisher => throw _privateConstructorUsedError;
  @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
  String? get editionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
  String? get publishedOn => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _curriculumResourceDownloadable,
      fromJson: _curriculumResourceDownloadableValue)
  bool? get downloadable => throw _privateConstructorUsedError;

  /// Create a copy of CurriculumResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumResourceModelCopyWith<CurriculumResourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumResourceModelCopyWith<$Res> {
  factory $CurriculumResourceModelCopyWith(CurriculumResourceModel value,
          $Res Function(CurriculumResourceModel) then) =
      _$CurriculumResourceModelCopyWithImpl<$Res, CurriculumResourceModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'book_name', fromJson: jsonStringValue) String? bookName,
      @JsonKey(fromJson: jsonStringLenient) String? author,
      @JsonKey(fromJson: jsonStringLenient) String? publisher,
      @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
      String? editionNumber,
      @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
      String? publishedOn,
      @JsonKey(
          readValue: _curriculumResourceDownloadable,
          fromJson: _curriculumResourceDownloadableValue)
      bool? downloadable});
}

/// @nodoc
class _$CurriculumResourceModelCopyWithImpl<$Res,
        $Val extends CurriculumResourceModel>
    implements $CurriculumResourceModelCopyWith<$Res> {
  _$CurriculumResourceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurriculumResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookName = freezed,
    Object? author = freezed,
    Object? publisher = freezed,
    Object? editionNumber = freezed,
    Object? publishedOn = freezed,
    Object? downloadable = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookName: freezed == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      editionNumber: freezed == editionNumber
          ? _value.editionNumber
          : editionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadable: freezed == downloadable
          ? _value.downloadable
          : downloadable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumResourceModelImplCopyWith<$Res>
    implements $CurriculumResourceModelCopyWith<$Res> {
  factory _$$CurriculumResourceModelImplCopyWith(
          _$CurriculumResourceModelImpl value,
          $Res Function(_$CurriculumResourceModelImpl) then) =
      __$$CurriculumResourceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'book_name', fromJson: jsonStringValue) String? bookName,
      @JsonKey(fromJson: jsonStringLenient) String? author,
      @JsonKey(fromJson: jsonStringLenient) String? publisher,
      @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
      String? editionNumber,
      @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
      String? publishedOn,
      @JsonKey(
          readValue: _curriculumResourceDownloadable,
          fromJson: _curriculumResourceDownloadableValue)
      bool? downloadable});
}

/// @nodoc
class __$$CurriculumResourceModelImplCopyWithImpl<$Res>
    extends _$CurriculumResourceModelCopyWithImpl<$Res,
        _$CurriculumResourceModelImpl>
    implements _$$CurriculumResourceModelImplCopyWith<$Res> {
  __$$CurriculumResourceModelImplCopyWithImpl(
      _$CurriculumResourceModelImpl _value,
      $Res Function(_$CurriculumResourceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurriculumResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bookName = freezed,
    Object? author = freezed,
    Object? publisher = freezed,
    Object? editionNumber = freezed,
    Object? publishedOn = freezed,
    Object? downloadable = freezed,
  }) {
    return _then(_$CurriculumResourceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bookName: freezed == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      editionNumber: freezed == editionNumber
          ? _value.editionNumber
          : editionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedOn: freezed == publishedOn
          ? _value.publishedOn
          : publishedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadable: freezed == downloadable
          ? _value.downloadable
          : downloadable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurriculumResourceModelImpl implements _CurriculumResourceModel {
  const _$CurriculumResourceModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'book_name', fromJson: jsonStringValue) this.bookName,
      @JsonKey(fromJson: jsonStringLenient) this.author,
      @JsonKey(fromJson: jsonStringLenient) this.publisher,
      @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
      this.editionNumber,
      @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
      this.publishedOn,
      @JsonKey(
          readValue: _curriculumResourceDownloadable,
          fromJson: _curriculumResourceDownloadableValue)
      this.downloadable});

  factory _$CurriculumResourceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumResourceModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'book_name', fromJson: jsonStringValue)
  final String? bookName;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? author;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? publisher;
  @override
  @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
  final String? editionNumber;
  @override
  @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
  final String? publishedOn;
  @override
  @JsonKey(
      readValue: _curriculumResourceDownloadable,
      fromJson: _curriculumResourceDownloadableValue)
  final bool? downloadable;

  @override
  String toString() {
    return 'CurriculumResourceModel(id: $id, bookName: $bookName, author: $author, publisher: $publisher, editionNumber: $editionNumber, publishedOn: $publishedOn, downloadable: $downloadable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumResourceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.editionNumber, editionNumber) ||
                other.editionNumber == editionNumber) &&
            (identical(other.publishedOn, publishedOn) ||
                other.publishedOn == publishedOn) &&
            (identical(other.downloadable, downloadable) ||
                other.downloadable == downloadable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, bookName, author, publisher,
      editionNumber, publishedOn, downloadable);

  /// Create a copy of CurriculumResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumResourceModelImplCopyWith<_$CurriculumResourceModelImpl>
      get copyWith => __$$CurriculumResourceModelImplCopyWithImpl<
          _$CurriculumResourceModelImpl>(this, _$identity);
}

abstract class _CurriculumResourceModel implements CurriculumResourceModel {
  const factory _CurriculumResourceModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'book_name', fromJson: jsonStringValue)
      final String? bookName,
      @JsonKey(fromJson: jsonStringLenient) final String? author,
      @JsonKey(fromJson: jsonStringLenient) final String? publisher,
      @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
      final String? editionNumber,
      @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
      final String? publishedOn,
      @JsonKey(
          readValue: _curriculumResourceDownloadable,
          fromJson: _curriculumResourceDownloadableValue)
      final bool? downloadable}) = _$CurriculumResourceModelImpl;

  factory _CurriculumResourceModel.fromJson(Map<String, dynamic> json) =
      _$CurriculumResourceModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'book_name', fromJson: jsonStringValue)
  String? get bookName;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get author;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get publisher;
  @override
  @JsonKey(name: 'edition_number', fromJson: jsonStringLenient)
  String? get editionNumber;
  @override
  @JsonKey(name: 'published_on', fromJson: jsonStringLenient)
  String? get publishedOn;
  @override
  @JsonKey(
      readValue: _curriculumResourceDownloadable,
      fromJson: _curriculumResourceDownloadableValue)
  bool? get downloadable;

  /// Create a copy of CurriculumResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumResourceModelImplCopyWith<_$CurriculumResourceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurriculumSummaryModel _$CurriculumSummaryModelFromJson(
    Map<String, dynamic> json) {
  return _CurriculumSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$CurriculumSummaryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _curriculumSummaryCourseName,
      fromJson: _curriculumSummaryCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _curriculumSummaryGradeLevelName,
      fromJson: _curriculumSummaryGradeLevelNameValue)
  String? get gradeLevelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  int? get groupsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
  int? get subjectsCount => throw _privateConstructorUsedError;

  /// Create a copy of CurriculumSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumSummaryModelCopyWith<CurriculumSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumSummaryModelCopyWith<$Res> {
  factory $CurriculumSummaryModelCopyWith(CurriculumSummaryModel value,
          $Res Function(CurriculumSummaryModel) then) =
      _$CurriculumSummaryModelCopyWithImpl<$Res, CurriculumSummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(
          readValue: _curriculumSummaryCourseName,
          fromJson: _curriculumSummaryCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _curriculumSummaryGradeLevelName,
          fromJson: _curriculumSummaryGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
      @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
      int? subjectsCount});
}

/// @nodoc
class _$CurriculumSummaryModelCopyWithImpl<$Res,
        $Val extends CurriculumSummaryModel>
    implements $CurriculumSummaryModelCopyWith<$Res> {
  _$CurriculumSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurriculumSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? courseName = freezed,
    Object? gradeLevelName = freezed,
    Object? groupsCount = freezed,
    Object? subjectsCount = freezed,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupsCount: freezed == groupsCount
          ? _value.groupsCount
          : groupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectsCount: freezed == subjectsCount
          ? _value.subjectsCount
          : subjectsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumSummaryModelImplCopyWith<$Res>
    implements $CurriculumSummaryModelCopyWith<$Res> {
  factory _$$CurriculumSummaryModelImplCopyWith(
          _$CurriculumSummaryModelImpl value,
          $Res Function(_$CurriculumSummaryModelImpl) then) =
      __$$CurriculumSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(
          readValue: _curriculumSummaryCourseName,
          fromJson: _curriculumSummaryCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _curriculumSummaryGradeLevelName,
          fromJson: _curriculumSummaryGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) int? groupsCount,
      @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
      int? subjectsCount});
}

/// @nodoc
class __$$CurriculumSummaryModelImplCopyWithImpl<$Res>
    extends _$CurriculumSummaryModelCopyWithImpl<$Res,
        _$CurriculumSummaryModelImpl>
    implements _$$CurriculumSummaryModelImplCopyWith<$Res> {
  __$$CurriculumSummaryModelImplCopyWithImpl(
      _$CurriculumSummaryModelImpl _value,
      $Res Function(_$CurriculumSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurriculumSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? courseName = freezed,
    Object? gradeLevelName = freezed,
    Object? groupsCount = freezed,
    Object? subjectsCount = freezed,
  }) {
    return _then(_$CurriculumSummaryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupsCount: freezed == groupsCount
          ? _value.groupsCount
          : groupsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      subjectsCount: freezed == subjectsCount
          ? _value.subjectsCount
          : subjectsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurriculumSummaryModelImpl implements _CurriculumSummaryModel {
  const _$CurriculumSummaryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(
          readValue: _curriculumSummaryCourseName,
          fromJson: _curriculumSummaryCourseNameValue)
      this.courseName,
      @JsonKey(
          readValue: _curriculumSummaryGradeLevelName,
          fromJson: _curriculumSummaryGradeLevelNameValue)
      this.gradeLevelName,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient) this.groupsCount,
      @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
      this.subjectsCount});

  factory _$CurriculumSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumSummaryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(
      readValue: _curriculumSummaryCourseName,
      fromJson: _curriculumSummaryCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(
      readValue: _curriculumSummaryGradeLevelName,
      fromJson: _curriculumSummaryGradeLevelNameValue)
  final String? gradeLevelName;
  @override
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  final int? groupsCount;
  @override
  @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
  final int? subjectsCount;

  @override
  String toString() {
    return 'CurriculumSummaryModel(id: $id, name: $name, isActive: $isActive, courseName: $courseName, gradeLevelName: $gradeLevelName, groupsCount: $groupsCount, subjectsCount: $subjectsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumSummaryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.gradeLevelName, gradeLevelName) ||
                other.gradeLevelName == gradeLevelName) &&
            (identical(other.groupsCount, groupsCount) ||
                other.groupsCount == groupsCount) &&
            (identical(other.subjectsCount, subjectsCount) ||
                other.subjectsCount == subjectsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isActive, courseName,
      gradeLevelName, groupsCount, subjectsCount);

  /// Create a copy of CurriculumSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumSummaryModelImplCopyWith<_$CurriculumSummaryModelImpl>
      get copyWith => __$$CurriculumSummaryModelImplCopyWithImpl<
          _$CurriculumSummaryModelImpl>(this, _$identity);
}

abstract class _CurriculumSummaryModel implements CurriculumSummaryModel {
  const factory _CurriculumSummaryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive,
      @JsonKey(
          readValue: _curriculumSummaryCourseName,
          fromJson: _curriculumSummaryCourseNameValue)
      final String? courseName,
      @JsonKey(
          readValue: _curriculumSummaryGradeLevelName,
          fromJson: _curriculumSummaryGradeLevelNameValue)
      final String? gradeLevelName,
      @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
      final int? groupsCount,
      @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
      final int? subjectsCount}) = _$CurriculumSummaryModelImpl;

  factory _CurriculumSummaryModel.fromJson(Map<String, dynamic> json) =
      _$CurriculumSummaryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(
      readValue: _curriculumSummaryCourseName,
      fromJson: _curriculumSummaryCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(
      readValue: _curriculumSummaryGradeLevelName,
      fromJson: _curriculumSummaryGradeLevelNameValue)
  String? get gradeLevelName;
  @override
  @JsonKey(name: 'groups_count', fromJson: jsonIntLenient)
  int? get groupsCount;
  @override
  @JsonKey(name: 'subjects_count', fromJson: jsonIntLenient)
  int? get subjectsCount;

  /// Create a copy of CurriculumSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumSummaryModelImplCopyWith<_$CurriculumSummaryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurriculumLessonModel _$CurriculumLessonModelFromJson(
    Map<String, dynamic> json) {
  return _CurriculumLessonModel.fromJson(json);
}

/// @nodoc
mixin _$CurriculumLessonModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
  int? get chapterNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get importance => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
  int? get pageCount => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<NamedRefModel>? get topics => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  CurriculumResourceModel? get resource => throw _privateConstructorUsedError;

  /// Create a copy of CurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumLessonModelCopyWith<CurriculumLessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumLessonModelCopyWith<$Res> {
  factory $CurriculumLessonModelCopyWith(CurriculumLessonModel value,
          $Res Function(CurriculumLessonModel) then) =
      _$CurriculumLessonModelCopyWithImpl<$Res, CurriculumLessonModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
      int? chapterNumber,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? importance,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient) int? pageCount,
      @JsonKey(readValue: readJsonList) List<NamedRefModel>? topics,
      @JsonKey(readValue: readJsonMap) CurriculumResourceModel? resource});

  $CurriculumResourceModelCopyWith<$Res>? get resource;
}

/// @nodoc
class _$CurriculumLessonModelCopyWithImpl<$Res,
        $Val extends CurriculumLessonModel>
    implements $CurriculumLessonModelCopyWith<$Res> {
  _$CurriculumLessonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chapterNumber = freezed,
    Object? name = freezed,
    Object? importance = freezed,
    Object? pageCount = freezed,
    Object? topics = freezed,
    Object? resource = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      chapterNumber: freezed == chapterNumber
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      topics: freezed == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<NamedRefModel>?,
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as CurriculumResourceModel?,
    ) as $Val);
  }

  /// Create a copy of CurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumResourceModelCopyWith<$Res>? get resource {
    if (_value.resource == null) {
      return null;
    }

    return $CurriculumResourceModelCopyWith<$Res>(_value.resource!, (value) {
      return _then(_value.copyWith(resource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurriculumLessonModelImplCopyWith<$Res>
    implements $CurriculumLessonModelCopyWith<$Res> {
  factory _$$CurriculumLessonModelImplCopyWith(
          _$CurriculumLessonModelImpl value,
          $Res Function(_$CurriculumLessonModelImpl) then) =
      __$$CurriculumLessonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
      int? chapterNumber,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? importance,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient) int? pageCount,
      @JsonKey(readValue: readJsonList) List<NamedRefModel>? topics,
      @JsonKey(readValue: readJsonMap) CurriculumResourceModel? resource});

  @override
  $CurriculumResourceModelCopyWith<$Res>? get resource;
}

/// @nodoc
class __$$CurriculumLessonModelImplCopyWithImpl<$Res>
    extends _$CurriculumLessonModelCopyWithImpl<$Res,
        _$CurriculumLessonModelImpl>
    implements _$$CurriculumLessonModelImplCopyWith<$Res> {
  __$$CurriculumLessonModelImplCopyWithImpl(_$CurriculumLessonModelImpl _value,
      $Res Function(_$CurriculumLessonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chapterNumber = freezed,
    Object? name = freezed,
    Object? importance = freezed,
    Object? pageCount = freezed,
    Object? topics = freezed,
    Object? resource = freezed,
  }) {
    return _then(_$CurriculumLessonModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      chapterNumber: freezed == chapterNumber
          ? _value.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      topics: freezed == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<NamedRefModel>?,
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as CurriculumResourceModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurriculumLessonModelImpl implements _CurriculumLessonModel {
  const _$CurriculumLessonModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
      this.chapterNumber,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(fromJson: jsonStringValue) this.importance,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient) this.pageCount,
      @JsonKey(readValue: readJsonList) final List<NamedRefModel>? topics,
      @JsonKey(readValue: readJsonMap) this.resource})
      : _topics = topics;

  factory _$CurriculumLessonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumLessonModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
  final int? chapterNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? importance;
  @override
  @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
  final int? pageCount;
  final List<NamedRefModel>? _topics;
  @override
  @JsonKey(readValue: readJsonList)
  List<NamedRefModel>? get topics {
    final value = _topics;
    if (value == null) return null;
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(readValue: readJsonMap)
  final CurriculumResourceModel? resource;

  @override
  String toString() {
    return 'CurriculumLessonModel(id: $id, chapterNumber: $chapterNumber, name: $name, importance: $importance, pageCount: $pageCount, topics: $topics, resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumLessonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      chapterNumber,
      name,
      importance,
      pageCount,
      const DeepCollectionEquality().hash(_topics),
      resource);

  /// Create a copy of CurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumLessonModelImplCopyWith<_$CurriculumLessonModelImpl>
      get copyWith => __$$CurriculumLessonModelImplCopyWithImpl<
          _$CurriculumLessonModelImpl>(this, _$identity);
}

abstract class _CurriculumLessonModel implements CurriculumLessonModel {
  const factory _CurriculumLessonModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
      final int? chapterNumber,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(fromJson: jsonStringValue) final String? importance,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
      final int? pageCount,
      @JsonKey(readValue: readJsonList) final List<NamedRefModel>? topics,
      @JsonKey(readValue: readJsonMap)
      final CurriculumResourceModel? resource}) = _$CurriculumLessonModelImpl;

  factory _CurriculumLessonModel.fromJson(Map<String, dynamic> json) =
      _$CurriculumLessonModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'chapter_number', fromJson: jsonIntLenient)
  int? get chapterNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get importance;
  @override
  @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
  int? get pageCount;
  @override
  @JsonKey(readValue: readJsonList)
  List<NamedRefModel>? get topics;
  @override
  @JsonKey(readValue: readJsonMap)
  CurriculumResourceModel? get resource;

  /// Create a copy of CurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumLessonModelImplCopyWith<_$CurriculumLessonModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurriculumSubjectModel _$CurriculumSubjectModelFromJson(
    Map<String, dynamic> json) {
  return _CurriculumSubjectModel.fromJson(json);
}

/// @nodoc
mixin _$CurriculumSubjectModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<CurriculumLessonModel>? get lessons =>
      throw _privateConstructorUsedError;

  /// Create a copy of CurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumSubjectModelCopyWith<CurriculumSubjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumSubjectModelCopyWith<$Res> {
  factory $CurriculumSubjectModelCopyWith(CurriculumSubjectModel value,
          $Res Function(CurriculumSubjectModel) then) =
      _$CurriculumSubjectModelCopyWithImpl<$Res, CurriculumSubjectModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(readValue: readJsonList) List<CurriculumLessonModel>? lessons});
}

/// @nodoc
class _$CurriculumSubjectModelCopyWithImpl<$Res,
        $Val extends CurriculumSubjectModel>
    implements $CurriculumSubjectModelCopyWith<$Res> {
  _$CurriculumSubjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lessons = freezed,
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
      lessons: freezed == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<CurriculumLessonModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurriculumSubjectModelImplCopyWith<$Res>
    implements $CurriculumSubjectModelCopyWith<$Res> {
  factory _$$CurriculumSubjectModelImplCopyWith(
          _$CurriculumSubjectModelImpl value,
          $Res Function(_$CurriculumSubjectModelImpl) then) =
      __$$CurriculumSubjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(readValue: readJsonList) List<CurriculumLessonModel>? lessons});
}

/// @nodoc
class __$$CurriculumSubjectModelImplCopyWithImpl<$Res>
    extends _$CurriculumSubjectModelCopyWithImpl<$Res,
        _$CurriculumSubjectModelImpl>
    implements _$$CurriculumSubjectModelImplCopyWith<$Res> {
  __$$CurriculumSubjectModelImplCopyWithImpl(
      _$CurriculumSubjectModelImpl _value,
      $Res Function(_$CurriculumSubjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lessons = freezed,
  }) {
    return _then(_$CurriculumSubjectModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lessons: freezed == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<CurriculumLessonModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurriculumSubjectModelImpl implements _CurriculumSubjectModel {
  const _$CurriculumSubjectModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(readValue: readJsonList)
      final List<CurriculumLessonModel>? lessons})
      : _lessons = lessons;

  factory _$CurriculumSubjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumSubjectModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  final List<CurriculumLessonModel>? _lessons;
  @override
  @JsonKey(readValue: readJsonList)
  List<CurriculumLessonModel>? get lessons {
    final value = _lessons;
    if (value == null) return null;
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurriculumSubjectModel(id: $id, name: $name, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumSubjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_lessons));

  /// Create a copy of CurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumSubjectModelImplCopyWith<_$CurriculumSubjectModelImpl>
      get copyWith => __$$CurriculumSubjectModelImplCopyWithImpl<
          _$CurriculumSubjectModelImpl>(this, _$identity);
}

abstract class _CurriculumSubjectModel implements CurriculumSubjectModel {
  const factory _CurriculumSubjectModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? name,
          @JsonKey(readValue: readJsonList)
          final List<CurriculumLessonModel>? lessons}) =
      _$CurriculumSubjectModelImpl;

  factory _CurriculumSubjectModel.fromJson(Map<String, dynamic> json) =
      _$CurriculumSubjectModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(readValue: readJsonList)
  List<CurriculumLessonModel>? get lessons;

  /// Create a copy of CurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumSubjectModelImplCopyWith<_$CurriculumSubjectModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurriculumDetailModel _$CurriculumDetailModelFromJson(
    Map<String, dynamic> json) {
  return _CurriculumDetailModel.fromJson(json);
}

/// @nodoc
mixin _$CurriculumDetailModel {
  @JsonKey(readValue: _curriculumDetailSummary)
  CurriculumSummaryModel? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'standalone_resources', readValue: readJsonList)
  List<CurriculumResourceModel>? get standaloneResources =>
      throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<CurriculumSubjectModel>? get subjects =>
      throw _privateConstructorUsedError;

  /// Create a copy of CurriculumDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurriculumDetailModelCopyWith<CurriculumDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurriculumDetailModelCopyWith<$Res> {
  factory $CurriculumDetailModelCopyWith(CurriculumDetailModel value,
          $Res Function(CurriculumDetailModel) then) =
      _$CurriculumDetailModelCopyWithImpl<$Res, CurriculumDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _curriculumDetailSummary)
      CurriculumSummaryModel? summary,
      @JsonKey(name: 'standalone_resources', readValue: readJsonList)
      List<CurriculumResourceModel>? standaloneResources,
      @JsonKey(readValue: readJsonList)
      List<CurriculumSubjectModel>? subjects});

  $CurriculumSummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class _$CurriculumDetailModelCopyWithImpl<$Res,
        $Val extends CurriculumDetailModel>
    implements $CurriculumDetailModelCopyWith<$Res> {
  _$CurriculumDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurriculumDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? standaloneResources = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CurriculumSummaryModel?,
      standaloneResources: freezed == standaloneResources
          ? _value.standaloneResources
          : standaloneResources // ignore: cast_nullable_to_non_nullable
              as List<CurriculumResourceModel>?,
      subjects: freezed == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<CurriculumSubjectModel>?,
    ) as $Val);
  }

  /// Create a copy of CurriculumDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumSummaryModelCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $CurriculumSummaryModelCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurriculumDetailModelImplCopyWith<$Res>
    implements $CurriculumDetailModelCopyWith<$Res> {
  factory _$$CurriculumDetailModelImplCopyWith(
          _$CurriculumDetailModelImpl value,
          $Res Function(_$CurriculumDetailModelImpl) then) =
      __$$CurriculumDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _curriculumDetailSummary)
      CurriculumSummaryModel? summary,
      @JsonKey(name: 'standalone_resources', readValue: readJsonList)
      List<CurriculumResourceModel>? standaloneResources,
      @JsonKey(readValue: readJsonList)
      List<CurriculumSubjectModel>? subjects});

  @override
  $CurriculumSummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$CurriculumDetailModelImplCopyWithImpl<$Res>
    extends _$CurriculumDetailModelCopyWithImpl<$Res,
        _$CurriculumDetailModelImpl>
    implements _$$CurriculumDetailModelImplCopyWith<$Res> {
  __$$CurriculumDetailModelImplCopyWithImpl(_$CurriculumDetailModelImpl _value,
      $Res Function(_$CurriculumDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurriculumDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? standaloneResources = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_$CurriculumDetailModelImpl(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as CurriculumSummaryModel?,
      standaloneResources: freezed == standaloneResources
          ? _value._standaloneResources
          : standaloneResources // ignore: cast_nullable_to_non_nullable
              as List<CurriculumResourceModel>?,
      subjects: freezed == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<CurriculumSubjectModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CurriculumDetailModelImpl implements _CurriculumDetailModel {
  const _$CurriculumDetailModelImpl(
      {@JsonKey(readValue: _curriculumDetailSummary) this.summary,
      @JsonKey(name: 'standalone_resources', readValue: readJsonList)
      final List<CurriculumResourceModel>? standaloneResources,
      @JsonKey(readValue: readJsonList)
      final List<CurriculumSubjectModel>? subjects})
      : _standaloneResources = standaloneResources,
        _subjects = subjects;

  factory _$CurriculumDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurriculumDetailModelImplFromJson(json);

  @override
  @JsonKey(readValue: _curriculumDetailSummary)
  final CurriculumSummaryModel? summary;
  final List<CurriculumResourceModel>? _standaloneResources;
  @override
  @JsonKey(name: 'standalone_resources', readValue: readJsonList)
  List<CurriculumResourceModel>? get standaloneResources {
    final value = _standaloneResources;
    if (value == null) return null;
    if (_standaloneResources is EqualUnmodifiableListView)
      return _standaloneResources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CurriculumSubjectModel>? _subjects;
  @override
  @JsonKey(readValue: readJsonList)
  List<CurriculumSubjectModel>? get subjects {
    final value = _subjects;
    if (value == null) return null;
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurriculumDetailModel(summary: $summary, standaloneResources: $standaloneResources, subjects: $subjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurriculumDetailModelImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._standaloneResources, _standaloneResources) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      const DeepCollectionEquality().hash(_standaloneResources),
      const DeepCollectionEquality().hash(_subjects));

  /// Create a copy of CurriculumDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurriculumDetailModelImplCopyWith<_$CurriculumDetailModelImpl>
      get copyWith => __$$CurriculumDetailModelImplCopyWithImpl<
          _$CurriculumDetailModelImpl>(this, _$identity);
}

abstract class _CurriculumDetailModel implements CurriculumDetailModel {
  const factory _CurriculumDetailModel(
          {@JsonKey(readValue: _curriculumDetailSummary)
          final CurriculumSummaryModel? summary,
          @JsonKey(name: 'standalone_resources', readValue: readJsonList)
          final List<CurriculumResourceModel>? standaloneResources,
          @JsonKey(readValue: readJsonList)
          final List<CurriculumSubjectModel>? subjects}) =
      _$CurriculumDetailModelImpl;

  factory _CurriculumDetailModel.fromJson(Map<String, dynamic> json) =
      _$CurriculumDetailModelImpl.fromJson;

  @override
  @JsonKey(readValue: _curriculumDetailSummary)
  CurriculumSummaryModel? get summary;
  @override
  @JsonKey(name: 'standalone_resources', readValue: readJsonList)
  List<CurriculumResourceModel>? get standaloneResources;
  @override
  @JsonKey(readValue: readJsonList)
  List<CurriculumSubjectModel>? get subjects;

  /// Create a copy of CurriculumDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurriculumDetailModelImplCopyWith<_$CurriculumDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GroupCurriculumLessonModel _$GroupCurriculumLessonModelFromJson(
    Map<String, dynamic> json) {
  return _GroupCurriculumLessonModel.fromJson(json);
}

/// @nodoc
mixin _$GroupCurriculumLessonModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'taught_on', fromJson: jsonStringLenient)
  String? get taughtOn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get teacher => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
  int? get pageCount => throw _privateConstructorUsedError;

  /// Create a copy of GroupCurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupCurriculumLessonModelCopyWith<GroupCurriculumLessonModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCurriculumLessonModelCopyWith<$Res> {
  factory $GroupCurriculumLessonModelCopyWith(GroupCurriculumLessonModel value,
          $Res Function(GroupCurriculumLessonModel) then) =
      _$GroupCurriculumLessonModelCopyWithImpl<$Res,
          GroupCurriculumLessonModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'taught_on', fromJson: jsonStringLenient) String? taughtOn,
      @JsonKey(fromJson: jsonStringLenient) String? teacher,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient) int? pageCount});
}

/// @nodoc
class _$GroupCurriculumLessonModelCopyWithImpl<$Res,
        $Val extends GroupCurriculumLessonModel>
    implements $GroupCurriculumLessonModelCopyWith<$Res> {
  _$GroupCurriculumLessonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupCurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? taughtOn = freezed,
    Object? teacher = freezed,
    Object? pageCount = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      taughtOn: freezed == taughtOn
          ? _value.taughtOn
          : taughtOn // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupCurriculumLessonModelImplCopyWith<$Res>
    implements $GroupCurriculumLessonModelCopyWith<$Res> {
  factory _$$GroupCurriculumLessonModelImplCopyWith(
          _$GroupCurriculumLessonModelImpl value,
          $Res Function(_$GroupCurriculumLessonModelImpl) then) =
      __$$GroupCurriculumLessonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'taught_on', fromJson: jsonStringLenient) String? taughtOn,
      @JsonKey(fromJson: jsonStringLenient) String? teacher,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient) int? pageCount});
}

/// @nodoc
class __$$GroupCurriculumLessonModelImplCopyWithImpl<$Res>
    extends _$GroupCurriculumLessonModelCopyWithImpl<$Res,
        _$GroupCurriculumLessonModelImpl>
    implements _$$GroupCurriculumLessonModelImplCopyWith<$Res> {
  __$$GroupCurriculumLessonModelImplCopyWithImpl(
      _$GroupCurriculumLessonModelImpl _value,
      $Res Function(_$GroupCurriculumLessonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupCurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? taughtOn = freezed,
    Object? teacher = freezed,
    Object? pageCount = freezed,
  }) {
    return _then(_$GroupCurriculumLessonModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      taughtOn: freezed == taughtOn
          ? _value.taughtOn
          : taughtOn // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GroupCurriculumLessonModelImpl implements _GroupCurriculumLessonModel {
  const _$GroupCurriculumLessonModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'taught_on', fromJson: jsonStringLenient) this.taughtOn,
      @JsonKey(fromJson: jsonStringLenient) this.teacher,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient) this.pageCount});

  factory _$GroupCurriculumLessonModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GroupCurriculumLessonModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'taught_on', fromJson: jsonStringLenient)
  final String? taughtOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? teacher;
  @override
  @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
  final int? pageCount;

  @override
  String toString() {
    return 'GroupCurriculumLessonModel(id: $id, name: $name, status: $status, taughtOn: $taughtOn, teacher: $teacher, pageCount: $pageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupCurriculumLessonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.taughtOn, taughtOn) ||
                other.taughtOn == taughtOn) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, status, taughtOn, teacher, pageCount);

  /// Create a copy of GroupCurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupCurriculumLessonModelImplCopyWith<_$GroupCurriculumLessonModelImpl>
      get copyWith => __$$GroupCurriculumLessonModelImplCopyWithImpl<
          _$GroupCurriculumLessonModelImpl>(this, _$identity);
}

abstract class _GroupCurriculumLessonModel
    implements GroupCurriculumLessonModel {
  const factory _GroupCurriculumLessonModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'taught_on', fromJson: jsonStringLenient)
      final String? taughtOn,
      @JsonKey(fromJson: jsonStringLenient) final String? teacher,
      @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
      final int? pageCount}) = _$GroupCurriculumLessonModelImpl;

  factory _GroupCurriculumLessonModel.fromJson(Map<String, dynamic> json) =
      _$GroupCurriculumLessonModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'taught_on', fromJson: jsonStringLenient)
  String? get taughtOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get teacher;
  @override
  @JsonKey(name: 'page_count', fromJson: jsonIntLenient)
  int? get pageCount;

  /// Create a copy of GroupCurriculumLessonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupCurriculumLessonModelImplCopyWith<_$GroupCurriculumLessonModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GroupCurriculumSubjectModel _$GroupCurriculumSubjectModelFromJson(
    Map<String, dynamic> json) {
  return _GroupCurriculumSubjectModel.fromJson(json);
}

/// @nodoc
mixin _$GroupCurriculumSubjectModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get percentage => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<GroupCurriculumLessonModel>? get lessons =>
      throw _privateConstructorUsedError;

  /// Create a copy of GroupCurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupCurriculumSubjectModelCopyWith<GroupCurriculumSubjectModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCurriculumSubjectModelCopyWith<$Res> {
  factory $GroupCurriculumSubjectModelCopyWith(
          GroupCurriculumSubjectModel value,
          $Res Function(GroupCurriculumSubjectModel) then) =
      _$GroupCurriculumSubjectModelCopyWithImpl<$Res,
          GroupCurriculumSubjectModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonDoubleLenient) double? percentage,
      @JsonKey(readValue: readJsonList)
      List<GroupCurriculumLessonModel>? lessons});
}

/// @nodoc
class _$GroupCurriculumSubjectModelCopyWithImpl<$Res,
        $Val extends GroupCurriculumSubjectModel>
    implements $GroupCurriculumSubjectModelCopyWith<$Res> {
  _$GroupCurriculumSubjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupCurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? percentage = freezed,
    Object? lessons = freezed,
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
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      lessons: freezed == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<GroupCurriculumLessonModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupCurriculumSubjectModelImplCopyWith<$Res>
    implements $GroupCurriculumSubjectModelCopyWith<$Res> {
  factory _$$GroupCurriculumSubjectModelImplCopyWith(
          _$GroupCurriculumSubjectModelImpl value,
          $Res Function(_$GroupCurriculumSubjectModelImpl) then) =
      __$$GroupCurriculumSubjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(fromJson: jsonDoubleLenient) double? percentage,
      @JsonKey(readValue: readJsonList)
      List<GroupCurriculumLessonModel>? lessons});
}

/// @nodoc
class __$$GroupCurriculumSubjectModelImplCopyWithImpl<$Res>
    extends _$GroupCurriculumSubjectModelCopyWithImpl<$Res,
        _$GroupCurriculumSubjectModelImpl>
    implements _$$GroupCurriculumSubjectModelImplCopyWith<$Res> {
  __$$GroupCurriculumSubjectModelImplCopyWithImpl(
      _$GroupCurriculumSubjectModelImpl _value,
      $Res Function(_$GroupCurriculumSubjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupCurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? percentage = freezed,
    Object? lessons = freezed,
  }) {
    return _then(_$GroupCurriculumSubjectModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      lessons: freezed == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<GroupCurriculumLessonModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GroupCurriculumSubjectModelImpl
    implements _GroupCurriculumSubjectModel {
  const _$GroupCurriculumSubjectModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(fromJson: jsonDoubleLenient) this.percentage,
      @JsonKey(readValue: readJsonList)
      final List<GroupCurriculumLessonModel>? lessons})
      : _lessons = lessons;

  factory _$GroupCurriculumSubjectModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GroupCurriculumSubjectModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? percentage;
  final List<GroupCurriculumLessonModel>? _lessons;
  @override
  @JsonKey(readValue: readJsonList)
  List<GroupCurriculumLessonModel>? get lessons {
    final value = _lessons;
    if (value == null) return null;
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GroupCurriculumSubjectModel(id: $id, name: $name, percentage: $percentage, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupCurriculumSubjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, percentage,
      const DeepCollectionEquality().hash(_lessons));

  /// Create a copy of GroupCurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupCurriculumSubjectModelImplCopyWith<_$GroupCurriculumSubjectModelImpl>
      get copyWith => __$$GroupCurriculumSubjectModelImplCopyWithImpl<
          _$GroupCurriculumSubjectModelImpl>(this, _$identity);
}

abstract class _GroupCurriculumSubjectModel
    implements GroupCurriculumSubjectModel {
  const factory _GroupCurriculumSubjectModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? name,
          @JsonKey(fromJson: jsonDoubleLenient) final double? percentage,
          @JsonKey(readValue: readJsonList)
          final List<GroupCurriculumLessonModel>? lessons}) =
      _$GroupCurriculumSubjectModelImpl;

  factory _GroupCurriculumSubjectModel.fromJson(Map<String, dynamic> json) =
      _$GroupCurriculumSubjectModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get percentage;
  @override
  @JsonKey(readValue: readJsonList)
  List<GroupCurriculumLessonModel>? get lessons;

  /// Create a copy of GroupCurriculumSubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupCurriculumSubjectModelImplCopyWith<_$GroupCurriculumSubjectModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GroupCurriculumModel _$GroupCurriculumModelFromJson(Map<String, dynamic> json) {
  return _GroupCurriculumModel.fromJson(json);
}

/// @nodoc
mixin _$GroupCurriculumModel {
  @JsonKey(
      readValue: _groupCurriculumCurriculumName,
      fromJson: _groupCurriculumCurriculumNameValue)
  String? get curriculumName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _groupCurriculumGroupName,
      fromJson: _groupCurriculumGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _groupCurriculumPercentage,
      fromJson: _groupCurriculumPercentageValue)
  double? get percentage => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _groupCurriculumTotal, fromJson: _groupCurriculumTotalValue)
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _groupCurriculumCompleted,
      fromJson: _groupCurriculumCompletedValue)
  double? get completed => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<GroupCurriculumSubjectModel>? get subjects =>
      throw _privateConstructorUsedError;

  /// Create a copy of GroupCurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupCurriculumModelCopyWith<GroupCurriculumModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCurriculumModelCopyWith<$Res> {
  factory $GroupCurriculumModelCopyWith(GroupCurriculumModel value,
          $Res Function(GroupCurriculumModel) then) =
      _$GroupCurriculumModelCopyWithImpl<$Res, GroupCurriculumModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _groupCurriculumCurriculumName,
          fromJson: _groupCurriculumCurriculumNameValue)
      String? curriculumName,
      @JsonKey(
          readValue: _groupCurriculumGroupName,
          fromJson: _groupCurriculumGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _groupCurriculumPercentage,
          fromJson: _groupCurriculumPercentageValue)
      double? percentage,
      @JsonKey(
          readValue: _groupCurriculumTotal,
          fromJson: _groupCurriculumTotalValue)
      int? total,
      @JsonKey(
          readValue: _groupCurriculumCompleted,
          fromJson: _groupCurriculumCompletedValue)
      double? completed,
      @JsonKey(readValue: readJsonList)
      List<GroupCurriculumSubjectModel>? subjects});
}

/// @nodoc
class _$GroupCurriculumModelCopyWithImpl<$Res,
        $Val extends GroupCurriculumModel>
    implements $GroupCurriculumModelCopyWith<$Res> {
  _$GroupCurriculumModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupCurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curriculumName = freezed,
    Object? groupName = freezed,
    Object? percentage = freezed,
    Object? total = freezed,
    Object? completed = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      curriculumName: freezed == curriculumName
          ? _value.curriculumName
          : curriculumName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as double?,
      subjects: freezed == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<GroupCurriculumSubjectModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupCurriculumModelImplCopyWith<$Res>
    implements $GroupCurriculumModelCopyWith<$Res> {
  factory _$$GroupCurriculumModelImplCopyWith(_$GroupCurriculumModelImpl value,
          $Res Function(_$GroupCurriculumModelImpl) then) =
      __$$GroupCurriculumModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _groupCurriculumCurriculumName,
          fromJson: _groupCurriculumCurriculumNameValue)
      String? curriculumName,
      @JsonKey(
          readValue: _groupCurriculumGroupName,
          fromJson: _groupCurriculumGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _groupCurriculumPercentage,
          fromJson: _groupCurriculumPercentageValue)
      double? percentage,
      @JsonKey(
          readValue: _groupCurriculumTotal,
          fromJson: _groupCurriculumTotalValue)
      int? total,
      @JsonKey(
          readValue: _groupCurriculumCompleted,
          fromJson: _groupCurriculumCompletedValue)
      double? completed,
      @JsonKey(readValue: readJsonList)
      List<GroupCurriculumSubjectModel>? subjects});
}

/// @nodoc
class __$$GroupCurriculumModelImplCopyWithImpl<$Res>
    extends _$GroupCurriculumModelCopyWithImpl<$Res, _$GroupCurriculumModelImpl>
    implements _$$GroupCurriculumModelImplCopyWith<$Res> {
  __$$GroupCurriculumModelImplCopyWithImpl(_$GroupCurriculumModelImpl _value,
      $Res Function(_$GroupCurriculumModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupCurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curriculumName = freezed,
    Object? groupName = freezed,
    Object? percentage = freezed,
    Object? total = freezed,
    Object? completed = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_$GroupCurriculumModelImpl(
      curriculumName: freezed == curriculumName
          ? _value.curriculumName
          : curriculumName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as double?,
      subjects: freezed == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<GroupCurriculumSubjectModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GroupCurriculumModelImpl implements _GroupCurriculumModel {
  const _$GroupCurriculumModelImpl(
      {@JsonKey(
          readValue: _groupCurriculumCurriculumName,
          fromJson: _groupCurriculumCurriculumNameValue)
      this.curriculumName,
      @JsonKey(
          readValue: _groupCurriculumGroupName,
          fromJson: _groupCurriculumGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _groupCurriculumPercentage,
          fromJson: _groupCurriculumPercentageValue)
      this.percentage,
      @JsonKey(
          readValue: _groupCurriculumTotal,
          fromJson: _groupCurriculumTotalValue)
      this.total,
      @JsonKey(
          readValue: _groupCurriculumCompleted,
          fromJson: _groupCurriculumCompletedValue)
      this.completed,
      @JsonKey(readValue: readJsonList)
      final List<GroupCurriculumSubjectModel>? subjects})
      : _subjects = subjects;

  factory _$GroupCurriculumModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupCurriculumModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _groupCurriculumCurriculumName,
      fromJson: _groupCurriculumCurriculumNameValue)
  final String? curriculumName;
  @override
  @JsonKey(
      readValue: _groupCurriculumGroupName,
      fromJson: _groupCurriculumGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _groupCurriculumPercentage,
      fromJson: _groupCurriculumPercentageValue)
  final double? percentage;
  @override
  @JsonKey(
      readValue: _groupCurriculumTotal, fromJson: _groupCurriculumTotalValue)
  final int? total;
  @override
  @JsonKey(
      readValue: _groupCurriculumCompleted,
      fromJson: _groupCurriculumCompletedValue)
  final double? completed;
  final List<GroupCurriculumSubjectModel>? _subjects;
  @override
  @JsonKey(readValue: readJsonList)
  List<GroupCurriculumSubjectModel>? get subjects {
    final value = _subjects;
    if (value == null) return null;
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GroupCurriculumModel(curriculumName: $curriculumName, groupName: $groupName, percentage: $percentage, total: $total, completed: $completed, subjects: $subjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupCurriculumModelImpl &&
            (identical(other.curriculumName, curriculumName) ||
                other.curriculumName == curriculumName) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      curriculumName,
      groupName,
      percentage,
      total,
      completed,
      const DeepCollectionEquality().hash(_subjects));

  /// Create a copy of GroupCurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupCurriculumModelImplCopyWith<_$GroupCurriculumModelImpl>
      get copyWith =>
          __$$GroupCurriculumModelImplCopyWithImpl<_$GroupCurriculumModelImpl>(
              this, _$identity);
}

abstract class _GroupCurriculumModel implements GroupCurriculumModel {
  const factory _GroupCurriculumModel(
          {@JsonKey(
              readValue: _groupCurriculumCurriculumName,
              fromJson: _groupCurriculumCurriculumNameValue)
          final String? curriculumName,
          @JsonKey(
              readValue: _groupCurriculumGroupName,
              fromJson: _groupCurriculumGroupNameValue)
          final String? groupName,
          @JsonKey(
              readValue: _groupCurriculumPercentage,
              fromJson: _groupCurriculumPercentageValue)
          final double? percentage,
          @JsonKey(
              readValue: _groupCurriculumTotal,
              fromJson: _groupCurriculumTotalValue)
          final int? total,
          @JsonKey(
              readValue: _groupCurriculumCompleted,
              fromJson: _groupCurriculumCompletedValue)
          final double? completed,
          @JsonKey(readValue: readJsonList)
          final List<GroupCurriculumSubjectModel>? subjects}) =
      _$GroupCurriculumModelImpl;

  factory _GroupCurriculumModel.fromJson(Map<String, dynamic> json) =
      _$GroupCurriculumModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _groupCurriculumCurriculumName,
      fromJson: _groupCurriculumCurriculumNameValue)
  String? get curriculumName;
  @override
  @JsonKey(
      readValue: _groupCurriculumGroupName,
      fromJson: _groupCurriculumGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _groupCurriculumPercentage,
      fromJson: _groupCurriculumPercentageValue)
  double? get percentage;
  @override
  @JsonKey(
      readValue: _groupCurriculumTotal, fromJson: _groupCurriculumTotalValue)
  int? get total;
  @override
  @JsonKey(
      readValue: _groupCurriculumCompleted,
      fromJson: _groupCurriculumCompletedValue)
  double? get completed;
  @override
  @JsonKey(readValue: readJsonList)
  List<GroupCurriculumSubjectModel>? get subjects;

  /// Create a copy of GroupCurriculumModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupCurriculumModelImplCopyWith<_$GroupCurriculumModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
