// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceEntryModel _$AttendanceEntryModelFromJson(Map<String, dynamic> json) {
  return _AttendanceEntryModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceEntryModel {
  @JsonKey(readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _attendanceEntryDate, fromJson: _attendanceEntryDateValue)
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceEntryDayStatus,
      fromJson: _attendanceEntryDayStatusValue)
  String? get dayStatus => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceEntryStatusCode,
      fromJson: _attendanceEntryStatusCodeValue)
  String? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceEntryStatusName,
      fromJson: _attendanceEntryStatusNameValue)
  String? get statusName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceEntryNotes, fromJson: _attendanceEntryNotesValue)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceEntryGroupName,
      fromJson: _attendanceEntryGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _attendanceEntryTeacherName,
      fromJson: _attendanceEntryTeacherNameValue)
  String? get teacherName => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceEntryModelCopyWith<AttendanceEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceEntryModelCopyWith<$Res> {
  factory $AttendanceEntryModelCopyWith(AttendanceEntryModel value,
          $Res Function(AttendanceEntryModel) then) =
      _$AttendanceEntryModelCopyWithImpl<$Res, AttendanceEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _attendanceEntryDate, fromJson: _attendanceEntryDateValue)
      DateTime? date,
      @JsonKey(
          readValue: _attendanceEntryDayStatus,
          fromJson: _attendanceEntryDayStatusValue)
      String? dayStatus,
      @JsonKey(
          readValue: _attendanceEntryStatusCode,
          fromJson: _attendanceEntryStatusCodeValue)
      String? statusCode,
      @JsonKey(
          readValue: _attendanceEntryStatusName,
          fromJson: _attendanceEntryStatusNameValue)
      String? statusName,
      @JsonKey(
          readValue: _attendanceEntryNotes,
          fromJson: _attendanceEntryNotesValue)
      String? notes,
      @JsonKey(
          readValue: _attendanceEntryGroupName,
          fromJson: _attendanceEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _attendanceEntryTeacherName,
          fromJson: _attendanceEntryTeacherNameValue)
      String? teacherName});
}

/// @nodoc
class _$AttendanceEntryModelCopyWithImpl<$Res,
        $Val extends AttendanceEntryModel>
    implements $AttendanceEntryModelCopyWith<$Res> {
  _$AttendanceEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? dayStatus = freezed,
    Object? statusCode = freezed,
    Object? statusName = freezed,
    Object? notes = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayStatus: freezed == dayStatus
          ? _value.dayStatus
          : dayStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceEntryModelImplCopyWith<$Res>
    implements $AttendanceEntryModelCopyWith<$Res> {
  factory _$$AttendanceEntryModelImplCopyWith(_$AttendanceEntryModelImpl value,
          $Res Function(_$AttendanceEntryModelImpl) then) =
      __$$AttendanceEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _attendanceEntryDate, fromJson: _attendanceEntryDateValue)
      DateTime? date,
      @JsonKey(
          readValue: _attendanceEntryDayStatus,
          fromJson: _attendanceEntryDayStatusValue)
      String? dayStatus,
      @JsonKey(
          readValue: _attendanceEntryStatusCode,
          fromJson: _attendanceEntryStatusCodeValue)
      String? statusCode,
      @JsonKey(
          readValue: _attendanceEntryStatusName,
          fromJson: _attendanceEntryStatusNameValue)
      String? statusName,
      @JsonKey(
          readValue: _attendanceEntryNotes,
          fromJson: _attendanceEntryNotesValue)
      String? notes,
      @JsonKey(
          readValue: _attendanceEntryGroupName,
          fromJson: _attendanceEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _attendanceEntryTeacherName,
          fromJson: _attendanceEntryTeacherNameValue)
      String? teacherName});
}

/// @nodoc
class __$$AttendanceEntryModelImplCopyWithImpl<$Res>
    extends _$AttendanceEntryModelCopyWithImpl<$Res, _$AttendanceEntryModelImpl>
    implements _$$AttendanceEntryModelImplCopyWith<$Res> {
  __$$AttendanceEntryModelImplCopyWithImpl(_$AttendanceEntryModelImpl _value,
      $Res Function(_$AttendanceEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? dayStatus = freezed,
    Object? statusCode = freezed,
    Object? statusName = freezed,
    Object? notes = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
  }) {
    return _then(_$AttendanceEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dayStatus: freezed == dayStatus
          ? _value.dayStatus
          : dayStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusName: freezed == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
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
class _$AttendanceEntryModelImpl implements _AttendanceEntryModel {
  const _$AttendanceEntryModelImpl(
      {@JsonKey(
          readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
      this.id,
      @JsonKey(
          readValue: _attendanceEntryDate, fromJson: _attendanceEntryDateValue)
      this.date,
      @JsonKey(
          readValue: _attendanceEntryDayStatus,
          fromJson: _attendanceEntryDayStatusValue)
      this.dayStatus,
      @JsonKey(
          readValue: _attendanceEntryStatusCode,
          fromJson: _attendanceEntryStatusCodeValue)
      this.statusCode,
      @JsonKey(
          readValue: _attendanceEntryStatusName,
          fromJson: _attendanceEntryStatusNameValue)
      this.statusName,
      @JsonKey(
          readValue: _attendanceEntryNotes,
          fromJson: _attendanceEntryNotesValue)
      this.notes,
      @JsonKey(
          readValue: _attendanceEntryGroupName,
          fromJson: _attendanceEntryGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _attendanceEntryTeacherName,
          fromJson: _attendanceEntryTeacherNameValue)
      this.teacherName});

  factory _$AttendanceEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceEntryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _attendanceEntryDate, fromJson: _attendanceEntryDateValue)
  final DateTime? date;
  @override
  @JsonKey(
      readValue: _attendanceEntryDayStatus,
      fromJson: _attendanceEntryDayStatusValue)
  final String? dayStatus;
  @override
  @JsonKey(
      readValue: _attendanceEntryStatusCode,
      fromJson: _attendanceEntryStatusCodeValue)
  final String? statusCode;
  @override
  @JsonKey(
      readValue: _attendanceEntryStatusName,
      fromJson: _attendanceEntryStatusNameValue)
  final String? statusName;
  @override
  @JsonKey(
      readValue: _attendanceEntryNotes, fromJson: _attendanceEntryNotesValue)
  final String? notes;
  @override
  @JsonKey(
      readValue: _attendanceEntryGroupName,
      fromJson: _attendanceEntryGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _attendanceEntryTeacherName,
      fromJson: _attendanceEntryTeacherNameValue)
  final String? teacherName;

  @override
  String toString() {
    return 'AttendanceEntryModel(id: $id, date: $date, dayStatus: $dayStatus, statusCode: $statusCode, statusName: $statusName, notes: $notes, groupName: $groupName, teacherName: $teacherName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayStatus, dayStatus) ||
                other.dayStatus == dayStatus) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, dayStatus, statusCode,
      statusName, notes, groupName, teacherName);

  /// Create a copy of AttendanceEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceEntryModelImplCopyWith<_$AttendanceEntryModelImpl>
      get copyWith =>
          __$$AttendanceEntryModelImplCopyWithImpl<_$AttendanceEntryModelImpl>(
              this, _$identity);
}

abstract class _AttendanceEntryModel implements AttendanceEntryModel {
  const factory _AttendanceEntryModel(
      {@JsonKey(
          readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
      final int? id,
      @JsonKey(
          readValue: _attendanceEntryDate, fromJson: _attendanceEntryDateValue)
      final DateTime? date,
      @JsonKey(
          readValue: _attendanceEntryDayStatus,
          fromJson: _attendanceEntryDayStatusValue)
      final String? dayStatus,
      @JsonKey(
          readValue: _attendanceEntryStatusCode,
          fromJson: _attendanceEntryStatusCodeValue)
      final String? statusCode,
      @JsonKey(
          readValue: _attendanceEntryStatusName,
          fromJson: _attendanceEntryStatusNameValue)
      final String? statusName,
      @JsonKey(
          readValue: _attendanceEntryNotes,
          fromJson: _attendanceEntryNotesValue)
      final String? notes,
      @JsonKey(
          readValue: _attendanceEntryGroupName,
          fromJson: _attendanceEntryGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _attendanceEntryTeacherName,
          fromJson: _attendanceEntryTeacherNameValue)
      final String? teacherName}) = _$AttendanceEntryModelImpl;

  factory _AttendanceEntryModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceEntryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _attendanceEntryDate, fromJson: _attendanceEntryDateValue)
  DateTime? get date;
  @override
  @JsonKey(
      readValue: _attendanceEntryDayStatus,
      fromJson: _attendanceEntryDayStatusValue)
  String? get dayStatus;
  @override
  @JsonKey(
      readValue: _attendanceEntryStatusCode,
      fromJson: _attendanceEntryStatusCodeValue)
  String? get statusCode;
  @override
  @JsonKey(
      readValue: _attendanceEntryStatusName,
      fromJson: _attendanceEntryStatusNameValue)
  String? get statusName;
  @override
  @JsonKey(
      readValue: _attendanceEntryNotes, fromJson: _attendanceEntryNotesValue)
  String? get notes;
  @override
  @JsonKey(
      readValue: _attendanceEntryGroupName,
      fromJson: _attendanceEntryGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _attendanceEntryTeacherName,
      fromJson: _attendanceEntryTeacherNameValue)
  String? get teacherName;

  /// Create a copy of AttendanceEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceEntryModelImplCopyWith<_$AttendanceEntryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MemorizationEntryModel _$MemorizationEntryModelFromJson(
    Map<String, dynamic> json) {
  return _MemorizationEntryModel.fromJson(json);
}

/// @nodoc
mixin _$MemorizationEntryModel {
  @JsonKey(readValue: _memorizationEntryId, fromJson: _memorizationEntryIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryDate, fromJson: _memorizationEntryDateValue)
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryEntryType,
      fromJson: _memorizationEntryEntryTypeValue)
  String? get entryType => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryFromPage,
      fromJson: _memorizationEntryFromPageValue)
  int? get fromPage => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryToPage,
      fromJson: _memorizationEntryToPageValue)
  int? get toPage => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryPagesCount,
      fromJson: _memorizationEntryPagesCountValue)
  int? get pagesCount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryPages,
      fromJson: _memorizationEntryPagesValue)
  List<int>? get pages => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryGroupName,
      fromJson: _memorizationEntryGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryTeacherName,
      fromJson: _memorizationEntryTeacherNameValue)
  String? get teacherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _memorizationEntryNotes,
      fromJson: _memorizationEntryNotesValue)
  String? get notes => throw _privateConstructorUsedError;

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
      {@JsonKey(
          readValue: _memorizationEntryId, fromJson: _memorizationEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _memorizationEntryDate,
          fromJson: _memorizationEntryDateValue)
      DateTime? date,
      @JsonKey(
          readValue: _memorizationEntryEntryType,
          fromJson: _memorizationEntryEntryTypeValue)
      String? entryType,
      @JsonKey(
          readValue: _memorizationEntryFromPage,
          fromJson: _memorizationEntryFromPageValue)
      int? fromPage,
      @JsonKey(
          readValue: _memorizationEntryToPage,
          fromJson: _memorizationEntryToPageValue)
      int? toPage,
      @JsonKey(
          readValue: _memorizationEntryPagesCount,
          fromJson: _memorizationEntryPagesCountValue)
      int? pagesCount,
      @JsonKey(
          readValue: _memorizationEntryPages,
          fromJson: _memorizationEntryPagesValue)
      List<int>? pages,
      @JsonKey(
          readValue: _memorizationEntryGroupName,
          fromJson: _memorizationEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _memorizationEntryTeacherName,
          fromJson: _memorizationEntryTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _memorizationEntryNotes,
          fromJson: _memorizationEntryNotesValue)
      String? notes});
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
    Object? date = freezed,
    Object? entryType = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
    Object? pagesCount = freezed,
    Object? pages = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {@JsonKey(
          readValue: _memorizationEntryId, fromJson: _memorizationEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _memorizationEntryDate,
          fromJson: _memorizationEntryDateValue)
      DateTime? date,
      @JsonKey(
          readValue: _memorizationEntryEntryType,
          fromJson: _memorizationEntryEntryTypeValue)
      String? entryType,
      @JsonKey(
          readValue: _memorizationEntryFromPage,
          fromJson: _memorizationEntryFromPageValue)
      int? fromPage,
      @JsonKey(
          readValue: _memorizationEntryToPage,
          fromJson: _memorizationEntryToPageValue)
      int? toPage,
      @JsonKey(
          readValue: _memorizationEntryPagesCount,
          fromJson: _memorizationEntryPagesCountValue)
      int? pagesCount,
      @JsonKey(
          readValue: _memorizationEntryPages,
          fromJson: _memorizationEntryPagesValue)
      List<int>? pages,
      @JsonKey(
          readValue: _memorizationEntryGroupName,
          fromJson: _memorizationEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _memorizationEntryTeacherName,
          fromJson: _memorizationEntryTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _memorizationEntryNotes,
          fromJson: _memorizationEntryNotesValue)
      String? notes});
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
    Object? date = freezed,
    Object? entryType = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
    Object? pagesCount = freezed,
    Object? pages = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$MemorizationEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      pages: freezed == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
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
class _$MemorizationEntryModelImpl implements _MemorizationEntryModel {
  const _$MemorizationEntryModelImpl(
      {@JsonKey(
          readValue: _memorizationEntryId, fromJson: _memorizationEntryIdValue)
      this.id,
      @JsonKey(
          readValue: _memorizationEntryDate,
          fromJson: _memorizationEntryDateValue)
      this.date,
      @JsonKey(
          readValue: _memorizationEntryEntryType,
          fromJson: _memorizationEntryEntryTypeValue)
      this.entryType,
      @JsonKey(
          readValue: _memorizationEntryFromPage,
          fromJson: _memorizationEntryFromPageValue)
      this.fromPage,
      @JsonKey(
          readValue: _memorizationEntryToPage,
          fromJson: _memorizationEntryToPageValue)
      this.toPage,
      @JsonKey(
          readValue: _memorizationEntryPagesCount,
          fromJson: _memorizationEntryPagesCountValue)
      this.pagesCount,
      @JsonKey(
          readValue: _memorizationEntryPages,
          fromJson: _memorizationEntryPagesValue)
      final List<int>? pages,
      @JsonKey(
          readValue: _memorizationEntryGroupName,
          fromJson: _memorizationEntryGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _memorizationEntryTeacherName,
          fromJson: _memorizationEntryTeacherNameValue)
      this.teacherName,
      @JsonKey(
          readValue: _memorizationEntryNotes,
          fromJson: _memorizationEntryNotesValue)
      this.notes})
      : _pages = pages;

  factory _$MemorizationEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemorizationEntryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _memorizationEntryId, fromJson: _memorizationEntryIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _memorizationEntryDate, fromJson: _memorizationEntryDateValue)
  final DateTime? date;
  @override
  @JsonKey(
      readValue: _memorizationEntryEntryType,
      fromJson: _memorizationEntryEntryTypeValue)
  final String? entryType;
  @override
  @JsonKey(
      readValue: _memorizationEntryFromPage,
      fromJson: _memorizationEntryFromPageValue)
  final int? fromPage;
  @override
  @JsonKey(
      readValue: _memorizationEntryToPage,
      fromJson: _memorizationEntryToPageValue)
  final int? toPage;
  @override
  @JsonKey(
      readValue: _memorizationEntryPagesCount,
      fromJson: _memorizationEntryPagesCountValue)
  final int? pagesCount;
  final List<int>? _pages;
  @override
  @JsonKey(
      readValue: _memorizationEntryPages,
      fromJson: _memorizationEntryPagesValue)
  List<int>? get pages {
    final value = _pages;
    if (value == null) return null;
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(
      readValue: _memorizationEntryGroupName,
      fromJson: _memorizationEntryGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _memorizationEntryTeacherName,
      fromJson: _memorizationEntryTeacherNameValue)
  final String? teacherName;
  @override
  @JsonKey(
      readValue: _memorizationEntryNotes,
      fromJson: _memorizationEntryNotesValue)
  final String? notes;

  @override
  String toString() {
    return 'MemorizationEntryModel(id: $id, date: $date, entryType: $entryType, fromPage: $fromPage, toPage: $toPage, pagesCount: $pagesCount, pages: $pages, groupName: $groupName, teacherName: $teacherName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemorizationEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.fromPage, fromPage) ||
                other.fromPage == fromPage) &&
            (identical(other.toPage, toPage) || other.toPage == toPage) &&
            (identical(other.pagesCount, pagesCount) ||
                other.pagesCount == pagesCount) &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      entryType,
      fromPage,
      toPage,
      pagesCount,
      const DeepCollectionEquality().hash(_pages),
      groupName,
      teacherName,
      notes);

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
      {@JsonKey(
          readValue: _memorizationEntryId, fromJson: _memorizationEntryIdValue)
      final int? id,
      @JsonKey(
          readValue: _memorizationEntryDate,
          fromJson: _memorizationEntryDateValue)
      final DateTime? date,
      @JsonKey(
          readValue: _memorizationEntryEntryType,
          fromJson: _memorizationEntryEntryTypeValue)
      final String? entryType,
      @JsonKey(
          readValue: _memorizationEntryFromPage,
          fromJson: _memorizationEntryFromPageValue)
      final int? fromPage,
      @JsonKey(
          readValue: _memorizationEntryToPage,
          fromJson: _memorizationEntryToPageValue)
      final int? toPage,
      @JsonKey(
          readValue: _memorizationEntryPagesCount,
          fromJson: _memorizationEntryPagesCountValue)
      final int? pagesCount,
      @JsonKey(
          readValue: _memorizationEntryPages,
          fromJson: _memorizationEntryPagesValue)
      final List<int>? pages,
      @JsonKey(
          readValue: _memorizationEntryGroupName,
          fromJson: _memorizationEntryGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _memorizationEntryTeacherName,
          fromJson: _memorizationEntryTeacherNameValue)
      final String? teacherName,
      @JsonKey(
          readValue: _memorizationEntryNotes,
          fromJson: _memorizationEntryNotesValue)
      final String? notes}) = _$MemorizationEntryModelImpl;

  factory _MemorizationEntryModel.fromJson(Map<String, dynamic> json) =
      _$MemorizationEntryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _memorizationEntryId, fromJson: _memorizationEntryIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _memorizationEntryDate, fromJson: _memorizationEntryDateValue)
  DateTime? get date;
  @override
  @JsonKey(
      readValue: _memorizationEntryEntryType,
      fromJson: _memorizationEntryEntryTypeValue)
  String? get entryType;
  @override
  @JsonKey(
      readValue: _memorizationEntryFromPage,
      fromJson: _memorizationEntryFromPageValue)
  int? get fromPage;
  @override
  @JsonKey(
      readValue: _memorizationEntryToPage,
      fromJson: _memorizationEntryToPageValue)
  int? get toPage;
  @override
  @JsonKey(
      readValue: _memorizationEntryPagesCount,
      fromJson: _memorizationEntryPagesCountValue)
  int? get pagesCount;
  @override
  @JsonKey(
      readValue: _memorizationEntryPages,
      fromJson: _memorizationEntryPagesValue)
  List<int>? get pages;
  @override
  @JsonKey(
      readValue: _memorizationEntryGroupName,
      fromJson: _memorizationEntryGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _memorizationEntryTeacherName,
      fromJson: _memorizationEntryTeacherNameValue)
  String? get teacherName;
  @override
  @JsonKey(
      readValue: _memorizationEntryNotes,
      fromJson: _memorizationEntryNotesValue)
  String? get notes;

  /// Create a copy of MemorizationEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemorizationEntryModelImplCopyWith<_$MemorizationEntryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ParentUserModel _$ParentUserModelFromJson(Map<String, dynamic> json) {
  return _ParentUserModel.fromJson(json);
}

/// @nodoc
mixin _$ParentUserModel {
  @JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
  String? get phone => throw _privateConstructorUsedError;

  /// Create a copy of ParentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentUserModelCopyWith<ParentUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentUserModelCopyWith<$Res> {
  factory $ParentUserModelCopyWith(
          ParentUserModel value, $Res Function(ParentUserModel) then) =
      _$ParentUserModelCopyWithImpl<$Res, ParentUserModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue) int? id,
      @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
      String? name,
      @JsonKey(
          readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
      String? username,
      @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
      String? email,
      @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
      String? phone});
}

/// @nodoc
class _$ParentUserModelCopyWithImpl<$Res, $Val extends ParentUserModel>
    implements $ParentUserModelCopyWith<$Res> {
  _$ParentUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentUserModelImplCopyWith<$Res>
    implements $ParentUserModelCopyWith<$Res> {
  factory _$$ParentUserModelImplCopyWith(_$ParentUserModelImpl value,
          $Res Function(_$ParentUserModelImpl) then) =
      __$$ParentUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue) int? id,
      @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
      String? name,
      @JsonKey(
          readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
      String? username,
      @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
      String? email,
      @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
      String? phone});
}

/// @nodoc
class __$$ParentUserModelImplCopyWithImpl<$Res>
    extends _$ParentUserModelCopyWithImpl<$Res, _$ParentUserModelImpl>
    implements _$$ParentUserModelImplCopyWith<$Res> {
  __$$ParentUserModelImplCopyWithImpl(
      _$ParentUserModelImpl _value, $Res Function(_$ParentUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$ParentUserModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ParentUserModelImpl implements _ParentUserModel {
  const _$ParentUserModelImpl(
      {@JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue) this.id,
      @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
      this.name,
      @JsonKey(
          readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
      this.username,
      @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
      this.email,
      @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
      this.phone});

  factory _$ParentUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentUserModelImplFromJson(json);

  @override
  @JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
  final String? name;
  @override
  @JsonKey(readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
  final String? username;
  @override
  @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
  final String? email;
  @override
  @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
  final String? phone;

  @override
  String toString() {
    return 'ParentUserModel(id: $id, name: $name, username: $username, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, username, email, phone);

  /// Create a copy of ParentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentUserModelImplCopyWith<_$ParentUserModelImpl> get copyWith =>
      __$$ParentUserModelImplCopyWithImpl<_$ParentUserModelImpl>(
          this, _$identity);
}

abstract class _ParentUserModel implements ParentUserModel {
  const factory _ParentUserModel(
      {@JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue)
      final int? id,
      @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
      final String? name,
      @JsonKey(
          readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
      final String? username,
      @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
      final String? email,
      @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
      final String? phone}) = _$ParentUserModelImpl;

  factory _ParentUserModel.fromJson(Map<String, dynamic> json) =
      _$ParentUserModelImpl.fromJson;

  @override
  @JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
  String? get name;
  @override
  @JsonKey(readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
  String? get username;
  @override
  @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
  String? get email;
  @override
  @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
  String? get phone;

  /// Create a copy of ParentUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentUserModelImplCopyWith<_$ParentUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChildSummaryModel _$ChildSummaryModelFromJson(Map<String, dynamic> json) {
  return _ChildSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$ChildSummaryModel {
  @JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childSummaryStudentNumber,
      fromJson: _childSummaryStudentNumberValue)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childSummaryFullName, fromJson: _childSummaryFullNameValue)
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childSummaryFirstName, fromJson: _childSummaryFirstNameValue)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childSummaryLastName, fromJson: _childSummaryLastNameValue)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childSummaryBirthDate, fromJson: _childSummaryBirthDateValue)
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childSummaryGradeLevelName,
      fromJson: _childSummaryGradeLevelNameValue)
  String? get gradeLevelName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childSummaryQuranCurrentJuz,
      fromJson: _childSummaryQuranCurrentJuzValue)
  int? get quranCurrentJuz => throw _privateConstructorUsedError;

  /// Create a copy of ChildSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChildSummaryModelCopyWith<ChildSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildSummaryModelCopyWith<$Res> {
  factory $ChildSummaryModelCopyWith(
          ChildSummaryModel value, $Res Function(ChildSummaryModel) then) =
      _$ChildSummaryModelCopyWithImpl<$Res, ChildSummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
      int? id,
      @JsonKey(
          readValue: _childSummaryStudentNumber,
          fromJson: _childSummaryStudentNumberValue)
      String? studentNumber,
      @JsonKey(
          readValue: _childSummaryFullName,
          fromJson: _childSummaryFullNameValue)
      String? fullName,
      @JsonKey(
          readValue: _childSummaryFirstName,
          fromJson: _childSummaryFirstNameValue)
      String? firstName,
      @JsonKey(
          readValue: _childSummaryLastName,
          fromJson: _childSummaryLastNameValue)
      String? lastName,
      @JsonKey(
          readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
      String? status,
      @JsonKey(
          readValue: _childSummaryBirthDate,
          fromJson: _childSummaryBirthDateValue)
      String? birthDate,
      @JsonKey(
          readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
      String? gender,
      @JsonKey(
          readValue: _childSummaryGradeLevelName,
          fromJson: _childSummaryGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(
          readValue: _childSummaryQuranCurrentJuz,
          fromJson: _childSummaryQuranCurrentJuzValue)
      int? quranCurrentJuz});
}

/// @nodoc
class _$ChildSummaryModelCopyWithImpl<$Res, $Val extends ChildSummaryModel>
    implements $ChildSummaryModelCopyWith<$Res> {
  _$ChildSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChildSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentNumber = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? gradeLevelName = freezed,
    Object? quranCurrentJuz = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChildSummaryModelImplCopyWith<$Res>
    implements $ChildSummaryModelCopyWith<$Res> {
  factory _$$ChildSummaryModelImplCopyWith(_$ChildSummaryModelImpl value,
          $Res Function(_$ChildSummaryModelImpl) then) =
      __$$ChildSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
      int? id,
      @JsonKey(
          readValue: _childSummaryStudentNumber,
          fromJson: _childSummaryStudentNumberValue)
      String? studentNumber,
      @JsonKey(
          readValue: _childSummaryFullName,
          fromJson: _childSummaryFullNameValue)
      String? fullName,
      @JsonKey(
          readValue: _childSummaryFirstName,
          fromJson: _childSummaryFirstNameValue)
      String? firstName,
      @JsonKey(
          readValue: _childSummaryLastName,
          fromJson: _childSummaryLastNameValue)
      String? lastName,
      @JsonKey(
          readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
      String? status,
      @JsonKey(
          readValue: _childSummaryBirthDate,
          fromJson: _childSummaryBirthDateValue)
      String? birthDate,
      @JsonKey(
          readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
      String? gender,
      @JsonKey(
          readValue: _childSummaryGradeLevelName,
          fromJson: _childSummaryGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(
          readValue: _childSummaryQuranCurrentJuz,
          fromJson: _childSummaryQuranCurrentJuzValue)
      int? quranCurrentJuz});
}

/// @nodoc
class __$$ChildSummaryModelImplCopyWithImpl<$Res>
    extends _$ChildSummaryModelCopyWithImpl<$Res, _$ChildSummaryModelImpl>
    implements _$$ChildSummaryModelImplCopyWith<$Res> {
  __$$ChildSummaryModelImplCopyWithImpl(_$ChildSummaryModelImpl _value,
      $Res Function(_$ChildSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChildSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentNumber = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? gradeLevelName = freezed,
    Object? quranCurrentJuz = freezed,
  }) {
    return _then(_$ChildSummaryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ChildSummaryModelImpl implements _ChildSummaryModel {
  const _$ChildSummaryModelImpl(
      {@JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
      this.id,
      @JsonKey(
          readValue: _childSummaryStudentNumber,
          fromJson: _childSummaryStudentNumberValue)
      this.studentNumber,
      @JsonKey(
          readValue: _childSummaryFullName,
          fromJson: _childSummaryFullNameValue)
      this.fullName,
      @JsonKey(
          readValue: _childSummaryFirstName,
          fromJson: _childSummaryFirstNameValue)
      this.firstName,
      @JsonKey(
          readValue: _childSummaryLastName,
          fromJson: _childSummaryLastNameValue)
      this.lastName,
      @JsonKey(
          readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
      this.status,
      @JsonKey(
          readValue: _childSummaryBirthDate,
          fromJson: _childSummaryBirthDateValue)
      this.birthDate,
      @JsonKey(
          readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
      this.gender,
      @JsonKey(
          readValue: _childSummaryGradeLevelName,
          fromJson: _childSummaryGradeLevelNameValue)
      this.gradeLevelName,
      @JsonKey(
          readValue: _childSummaryQuranCurrentJuz,
          fromJson: _childSummaryQuranCurrentJuzValue)
      this.quranCurrentJuz});

  factory _$ChildSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChildSummaryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _childSummaryStudentNumber,
      fromJson: _childSummaryStudentNumberValue)
  final String? studentNumber;
  @override
  @JsonKey(
      readValue: _childSummaryFullName, fromJson: _childSummaryFullNameValue)
  final String? fullName;
  @override
  @JsonKey(
      readValue: _childSummaryFirstName, fromJson: _childSummaryFirstNameValue)
  final String? firstName;
  @override
  @JsonKey(
      readValue: _childSummaryLastName, fromJson: _childSummaryLastNameValue)
  final String? lastName;
  @override
  @JsonKey(readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _childSummaryBirthDate, fromJson: _childSummaryBirthDateValue)
  final String? birthDate;
  @override
  @JsonKey(readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
  final String? gender;
  @override
  @JsonKey(
      readValue: _childSummaryGradeLevelName,
      fromJson: _childSummaryGradeLevelNameValue)
  final String? gradeLevelName;
  @override
  @JsonKey(
      readValue: _childSummaryQuranCurrentJuz,
      fromJson: _childSummaryQuranCurrentJuzValue)
  final int? quranCurrentJuz;

  @override
  String toString() {
    return 'ChildSummaryModel(id: $id, studentNumber: $studentNumber, fullName: $fullName, firstName: $firstName, lastName: $lastName, status: $status, birthDate: $birthDate, gender: $gender, gradeLevelName: $gradeLevelName, quranCurrentJuz: $quranCurrentJuz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChildSummaryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.gradeLevelName, gradeLevelName) ||
                other.gradeLevelName == gradeLevelName) &&
            (identical(other.quranCurrentJuz, quranCurrentJuz) ||
                other.quranCurrentJuz == quranCurrentJuz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      studentNumber,
      fullName,
      firstName,
      lastName,
      status,
      birthDate,
      gender,
      gradeLevelName,
      quranCurrentJuz);

  /// Create a copy of ChildSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChildSummaryModelImplCopyWith<_$ChildSummaryModelImpl> get copyWith =>
      __$$ChildSummaryModelImplCopyWithImpl<_$ChildSummaryModelImpl>(
          this, _$identity);
}

abstract class _ChildSummaryModel implements ChildSummaryModel {
  const factory _ChildSummaryModel(
      {@JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
      final int? id,
      @JsonKey(
          readValue: _childSummaryStudentNumber,
          fromJson: _childSummaryStudentNumberValue)
      final String? studentNumber,
      @JsonKey(
          readValue: _childSummaryFullName,
          fromJson: _childSummaryFullNameValue)
      final String? fullName,
      @JsonKey(
          readValue: _childSummaryFirstName,
          fromJson: _childSummaryFirstNameValue)
      final String? firstName,
      @JsonKey(
          readValue: _childSummaryLastName,
          fromJson: _childSummaryLastNameValue)
      final String? lastName,
      @JsonKey(
          readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
      final String? status,
      @JsonKey(
          readValue: _childSummaryBirthDate,
          fromJson: _childSummaryBirthDateValue)
      final String? birthDate,
      @JsonKey(
          readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
      final String? gender,
      @JsonKey(
          readValue: _childSummaryGradeLevelName,
          fromJson: _childSummaryGradeLevelNameValue)
      final String? gradeLevelName,
      @JsonKey(
          readValue: _childSummaryQuranCurrentJuz,
          fromJson: _childSummaryQuranCurrentJuzValue)
      final int? quranCurrentJuz}) = _$ChildSummaryModelImpl;

  factory _ChildSummaryModel.fromJson(Map<String, dynamic> json) =
      _$ChildSummaryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _childSummaryStudentNumber,
      fromJson: _childSummaryStudentNumberValue)
  String? get studentNumber;
  @override
  @JsonKey(
      readValue: _childSummaryFullName, fromJson: _childSummaryFullNameValue)
  String? get fullName;
  @override
  @JsonKey(
      readValue: _childSummaryFirstName, fromJson: _childSummaryFirstNameValue)
  String? get firstName;
  @override
  @JsonKey(
      readValue: _childSummaryLastName, fromJson: _childSummaryLastNameValue)
  String? get lastName;
  @override
  @JsonKey(readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _childSummaryBirthDate, fromJson: _childSummaryBirthDateValue)
  String? get birthDate;
  @override
  @JsonKey(readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
  String? get gender;
  @override
  @JsonKey(
      readValue: _childSummaryGradeLevelName,
      fromJson: _childSummaryGradeLevelNameValue)
  String? get gradeLevelName;
  @override
  @JsonKey(
      readValue: _childSummaryQuranCurrentJuz,
      fromJson: _childSummaryQuranCurrentJuzValue)
  int? get quranCurrentJuz;

  /// Create a copy of ChildSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChildSummaryModelImplCopyWith<_$ChildSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParentProfileModel _$ParentProfileModelFromJson(Map<String, dynamic> json) {
  return _ParentProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ParentProfileModel {
  @JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileParentNumber,
      fromJson: _parentProfileParentNumberValue)
  String? get parentNumber => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileFatherName,
      fromJson: _parentProfileFatherNameValue)
  String? get fatherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileFatherWork,
      fromJson: _parentProfileFatherWorkValue)
  String? get fatherWork => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileFatherPhone,
      fromJson: _parentProfileFatherPhoneValue)
  String? get fatherPhone => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileMotherName,
      fromJson: _parentProfileMotherNameValue)
  String? get motherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileMotherPhone,
      fromJson: _parentProfileMotherPhoneValue)
  String? get motherPhone => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileHomePhone,
      fromJson: _parentProfileHomePhoneValue)
  String? get homePhone => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileAddress, fromJson: _parentProfileAddressValue)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileIsActive, fromJson: _parentProfileIsActiveValue)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  ParentUserModel? get user => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentProfileChildrenCount,
      fromJson: _parentProfileChildrenCountValue)
  int? get childrenCount => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<ChildSummaryModel>? get children => throw _privateConstructorUsedError;

  /// Create a copy of ParentProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentProfileModelCopyWith<ParentProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentProfileModelCopyWith<$Res> {
  factory $ParentProfileModelCopyWith(
          ParentProfileModel value, $Res Function(ParentProfileModel) then) =
      _$ParentProfileModelCopyWithImpl<$Res, ParentProfileModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
      int? id,
      @JsonKey(
          readValue: _parentProfileParentNumber,
          fromJson: _parentProfileParentNumberValue)
      String? parentNumber,
      @JsonKey(
          readValue: _parentProfileFatherName,
          fromJson: _parentProfileFatherNameValue)
      String? fatherName,
      @JsonKey(
          readValue: _parentProfileFatherWork,
          fromJson: _parentProfileFatherWorkValue)
      String? fatherWork,
      @JsonKey(
          readValue: _parentProfileFatherPhone,
          fromJson: _parentProfileFatherPhoneValue)
      String? fatherPhone,
      @JsonKey(
          readValue: _parentProfileMotherName,
          fromJson: _parentProfileMotherNameValue)
      String? motherName,
      @JsonKey(
          readValue: _parentProfileMotherPhone,
          fromJson: _parentProfileMotherPhoneValue)
      String? motherPhone,
      @JsonKey(
          readValue: _parentProfileHomePhone,
          fromJson: _parentProfileHomePhoneValue)
      String? homePhone,
      @JsonKey(
          readValue: _parentProfileAddress,
          fromJson: _parentProfileAddressValue)
      String? address,
      @JsonKey(
          readValue: _parentProfileIsActive,
          fromJson: _parentProfileIsActiveValue)
      bool? isActive,
      @JsonKey(readValue: readJsonMap) ParentUserModel? user,
      @JsonKey(
          readValue: _parentProfileChildrenCount,
          fromJson: _parentProfileChildrenCountValue)
      int? childrenCount,
      @JsonKey(readValue: readJsonList) List<ChildSummaryModel>? children});

  $ParentUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ParentProfileModelCopyWithImpl<$Res, $Val extends ParentProfileModel>
    implements $ParentProfileModelCopyWith<$Res> {
  _$ParentProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentProfileModel
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
    Object? isActive = freezed,
    Object? user = freezed,
    Object? childrenCount = freezed,
    Object? children = freezed,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ParentUserModel?,
      childrenCount: freezed == childrenCount
          ? _value.childrenCount
          : childrenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ChildSummaryModel>?,
    ) as $Val);
  }

  /// Create a copy of ParentProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParentUserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ParentUserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParentProfileModelImplCopyWith<$Res>
    implements $ParentProfileModelCopyWith<$Res> {
  factory _$$ParentProfileModelImplCopyWith(_$ParentProfileModelImpl value,
          $Res Function(_$ParentProfileModelImpl) then) =
      __$$ParentProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
      int? id,
      @JsonKey(
          readValue: _parentProfileParentNumber,
          fromJson: _parentProfileParentNumberValue)
      String? parentNumber,
      @JsonKey(
          readValue: _parentProfileFatherName,
          fromJson: _parentProfileFatherNameValue)
      String? fatherName,
      @JsonKey(
          readValue: _parentProfileFatherWork,
          fromJson: _parentProfileFatherWorkValue)
      String? fatherWork,
      @JsonKey(
          readValue: _parentProfileFatherPhone,
          fromJson: _parentProfileFatherPhoneValue)
      String? fatherPhone,
      @JsonKey(
          readValue: _parentProfileMotherName,
          fromJson: _parentProfileMotherNameValue)
      String? motherName,
      @JsonKey(
          readValue: _parentProfileMotherPhone,
          fromJson: _parentProfileMotherPhoneValue)
      String? motherPhone,
      @JsonKey(
          readValue: _parentProfileHomePhone,
          fromJson: _parentProfileHomePhoneValue)
      String? homePhone,
      @JsonKey(
          readValue: _parentProfileAddress,
          fromJson: _parentProfileAddressValue)
      String? address,
      @JsonKey(
          readValue: _parentProfileIsActive,
          fromJson: _parentProfileIsActiveValue)
      bool? isActive,
      @JsonKey(readValue: readJsonMap) ParentUserModel? user,
      @JsonKey(
          readValue: _parentProfileChildrenCount,
          fromJson: _parentProfileChildrenCountValue)
      int? childrenCount,
      @JsonKey(readValue: readJsonList) List<ChildSummaryModel>? children});

  @override
  $ParentUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ParentProfileModelImplCopyWithImpl<$Res>
    extends _$ParentProfileModelCopyWithImpl<$Res, _$ParentProfileModelImpl>
    implements _$$ParentProfileModelImplCopyWith<$Res> {
  __$$ParentProfileModelImplCopyWithImpl(_$ParentProfileModelImpl _value,
      $Res Function(_$ParentProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentProfileModel
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
    Object? isActive = freezed,
    Object? user = freezed,
    Object? childrenCount = freezed,
    Object? children = freezed,
  }) {
    return _then(_$ParentProfileModelImpl(
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ParentUserModel?,
      childrenCount: freezed == childrenCount
          ? _value.childrenCount
          : childrenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ChildSummaryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ParentProfileModelImpl implements _ParentProfileModel {
  const _$ParentProfileModelImpl(
      {@JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
      this.id,
      @JsonKey(
          readValue: _parentProfileParentNumber,
          fromJson: _parentProfileParentNumberValue)
      this.parentNumber,
      @JsonKey(
          readValue: _parentProfileFatherName,
          fromJson: _parentProfileFatherNameValue)
      this.fatherName,
      @JsonKey(
          readValue: _parentProfileFatherWork,
          fromJson: _parentProfileFatherWorkValue)
      this.fatherWork,
      @JsonKey(
          readValue: _parentProfileFatherPhone,
          fromJson: _parentProfileFatherPhoneValue)
      this.fatherPhone,
      @JsonKey(
          readValue: _parentProfileMotherName,
          fromJson: _parentProfileMotherNameValue)
      this.motherName,
      @JsonKey(
          readValue: _parentProfileMotherPhone,
          fromJson: _parentProfileMotherPhoneValue)
      this.motherPhone,
      @JsonKey(
          readValue: _parentProfileHomePhone,
          fromJson: _parentProfileHomePhoneValue)
      this.homePhone,
      @JsonKey(
          readValue: _parentProfileAddress,
          fromJson: _parentProfileAddressValue)
      this.address,
      @JsonKey(
          readValue: _parentProfileIsActive,
          fromJson: _parentProfileIsActiveValue)
      this.isActive,
      @JsonKey(readValue: readJsonMap) this.user,
      @JsonKey(
          readValue: _parentProfileChildrenCount,
          fromJson: _parentProfileChildrenCountValue)
      this.childrenCount,
      @JsonKey(readValue: readJsonList)
      final List<ChildSummaryModel>? children})
      : _children = children;

  factory _$ParentProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentProfileModelImplFromJson(json);

  @override
  @JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _parentProfileParentNumber,
      fromJson: _parentProfileParentNumberValue)
  final String? parentNumber;
  @override
  @JsonKey(
      readValue: _parentProfileFatherName,
      fromJson: _parentProfileFatherNameValue)
  final String? fatherName;
  @override
  @JsonKey(
      readValue: _parentProfileFatherWork,
      fromJson: _parentProfileFatherWorkValue)
  final String? fatherWork;
  @override
  @JsonKey(
      readValue: _parentProfileFatherPhone,
      fromJson: _parentProfileFatherPhoneValue)
  final String? fatherPhone;
  @override
  @JsonKey(
      readValue: _parentProfileMotherName,
      fromJson: _parentProfileMotherNameValue)
  final String? motherName;
  @override
  @JsonKey(
      readValue: _parentProfileMotherPhone,
      fromJson: _parentProfileMotherPhoneValue)
  final String? motherPhone;
  @override
  @JsonKey(
      readValue: _parentProfileHomePhone,
      fromJson: _parentProfileHomePhoneValue)
  final String? homePhone;
  @override
  @JsonKey(
      readValue: _parentProfileAddress, fromJson: _parentProfileAddressValue)
  final String? address;
  @override
  @JsonKey(
      readValue: _parentProfileIsActive, fromJson: _parentProfileIsActiveValue)
  final bool? isActive;
  @override
  @JsonKey(readValue: readJsonMap)
  final ParentUserModel? user;
  @override
  @JsonKey(
      readValue: _parentProfileChildrenCount,
      fromJson: _parentProfileChildrenCountValue)
  final int? childrenCount;
  final List<ChildSummaryModel>? _children;
  @override
  @JsonKey(readValue: readJsonList)
  List<ChildSummaryModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ParentProfileModel(id: $id, parentNumber: $parentNumber, fatherName: $fatherName, fatherWork: $fatherWork, fatherPhone: $fatherPhone, motherName: $motherName, motherPhone: $motherPhone, homePhone: $homePhone, address: $address, isActive: $isActive, user: $user, childrenCount: $childrenCount, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentProfileModelImpl &&
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
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.childrenCount, childrenCount) ||
                other.childrenCount == childrenCount) &&
            const DeepCollectionEquality().equals(other._children, _children));
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
      isActive,
      user,
      childrenCount,
      const DeepCollectionEquality().hash(_children));

  /// Create a copy of ParentProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentProfileModelImplCopyWith<_$ParentProfileModelImpl> get copyWith =>
      __$$ParentProfileModelImplCopyWithImpl<_$ParentProfileModelImpl>(
          this, _$identity);
}

abstract class _ParentProfileModel implements ParentProfileModel {
  const factory _ParentProfileModel(
      {@JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
      final int? id,
      @JsonKey(
          readValue: _parentProfileParentNumber,
          fromJson: _parentProfileParentNumberValue)
      final String? parentNumber,
      @JsonKey(
          readValue: _parentProfileFatherName,
          fromJson: _parentProfileFatherNameValue)
      final String? fatherName,
      @JsonKey(
          readValue: _parentProfileFatherWork,
          fromJson: _parentProfileFatherWorkValue)
      final String? fatherWork,
      @JsonKey(
          readValue: _parentProfileFatherPhone,
          fromJson: _parentProfileFatherPhoneValue)
      final String? fatherPhone,
      @JsonKey(
          readValue: _parentProfileMotherName,
          fromJson: _parentProfileMotherNameValue)
      final String? motherName,
      @JsonKey(
          readValue: _parentProfileMotherPhone,
          fromJson: _parentProfileMotherPhoneValue)
      final String? motherPhone,
      @JsonKey(
          readValue: _parentProfileHomePhone,
          fromJson: _parentProfileHomePhoneValue)
      final String? homePhone,
      @JsonKey(
          readValue: _parentProfileAddress,
          fromJson: _parentProfileAddressValue)
      final String? address,
      @JsonKey(
          readValue: _parentProfileIsActive,
          fromJson: _parentProfileIsActiveValue)
      final bool? isActive,
      @JsonKey(readValue: readJsonMap) final ParentUserModel? user,
      @JsonKey(
          readValue: _parentProfileChildrenCount,
          fromJson: _parentProfileChildrenCountValue)
      final int? childrenCount,
      @JsonKey(readValue: readJsonList)
      final List<ChildSummaryModel>? children}) = _$ParentProfileModelImpl;

  factory _ParentProfileModel.fromJson(Map<String, dynamic> json) =
      _$ParentProfileModelImpl.fromJson;

  @override
  @JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _parentProfileParentNumber,
      fromJson: _parentProfileParentNumberValue)
  String? get parentNumber;
  @override
  @JsonKey(
      readValue: _parentProfileFatherName,
      fromJson: _parentProfileFatherNameValue)
  String? get fatherName;
  @override
  @JsonKey(
      readValue: _parentProfileFatherWork,
      fromJson: _parentProfileFatherWorkValue)
  String? get fatherWork;
  @override
  @JsonKey(
      readValue: _parentProfileFatherPhone,
      fromJson: _parentProfileFatherPhoneValue)
  String? get fatherPhone;
  @override
  @JsonKey(
      readValue: _parentProfileMotherName,
      fromJson: _parentProfileMotherNameValue)
  String? get motherName;
  @override
  @JsonKey(
      readValue: _parentProfileMotherPhone,
      fromJson: _parentProfileMotherPhoneValue)
  String? get motherPhone;
  @override
  @JsonKey(
      readValue: _parentProfileHomePhone,
      fromJson: _parentProfileHomePhoneValue)
  String? get homePhone;
  @override
  @JsonKey(
      readValue: _parentProfileAddress, fromJson: _parentProfileAddressValue)
  String? get address;
  @override
  @JsonKey(
      readValue: _parentProfileIsActive, fromJson: _parentProfileIsActiveValue)
  bool? get isActive;
  @override
  @JsonKey(readValue: readJsonMap)
  ParentUserModel? get user;
  @override
  @JsonKey(
      readValue: _parentProfileChildrenCount,
      fromJson: _parentProfileChildrenCountValue)
  int? get childrenCount;
  @override
  @JsonKey(readValue: readJsonList)
  List<ChildSummaryModel>? get children;

  /// Create a copy of ParentProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentProfileModelImplCopyWith<_$ParentProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParentSummaryModel _$ParentSummaryModelFromJson(Map<String, dynamic> json) {
  return _ParentSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$ParentSummaryModel {
  @JsonKey(
      readValue: _parentSummaryChildren, fromJson: _parentSummaryChildrenValue)
  int? get children => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentSummaryActiveEnrollments,
      fromJson: _parentSummaryActiveEnrollmentsValue)
  int? get activeEnrollments => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentSummaryMemorizedPages,
      fromJson: _parentSummaryMemorizedPagesValue)
  int? get memorizedPages => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parentSummaryPoints, fromJson: _parentSummaryPointsValue)
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentSummaryInvoiceTotal,
      fromJson: _parentSummaryInvoiceTotalValue)
  double? get invoiceTotal => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentSummaryPaidTotal,
      fromJson: _parentSummaryPaidTotalValue)
  double? get paidTotal => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentSummaryBalance, fromJson: _parentSummaryBalanceValue)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentSummaryUnreadNotes,
      fromJson: _parentSummaryUnreadNotesValue)
  int? get unreadNotes => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentSummaryAvailableActivityResponses,
      fromJson: _parentSummaryAvailableActivityResponsesValue)
  int? get availableActivityResponses => throw _privateConstructorUsedError;

  /// Create a copy of ParentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentSummaryModelCopyWith<ParentSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentSummaryModelCopyWith<$Res> {
  factory $ParentSummaryModelCopyWith(
          ParentSummaryModel value, $Res Function(ParentSummaryModel) then) =
      _$ParentSummaryModelCopyWithImpl<$Res, ParentSummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _parentSummaryChildren,
          fromJson: _parentSummaryChildrenValue)
      int? children,
      @JsonKey(
          readValue: _parentSummaryActiveEnrollments,
          fromJson: _parentSummaryActiveEnrollmentsValue)
      int? activeEnrollments,
      @JsonKey(
          readValue: _parentSummaryMemorizedPages,
          fromJson: _parentSummaryMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(
          readValue: _parentSummaryPoints, fromJson: _parentSummaryPointsValue)
      int? points,
      @JsonKey(
          readValue: _parentSummaryInvoiceTotal,
          fromJson: _parentSummaryInvoiceTotalValue)
      double? invoiceTotal,
      @JsonKey(
          readValue: _parentSummaryPaidTotal,
          fromJson: _parentSummaryPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _parentSummaryBalance,
          fromJson: _parentSummaryBalanceValue)
      double? balance,
      @JsonKey(
          readValue: _parentSummaryUnreadNotes,
          fromJson: _parentSummaryUnreadNotesValue)
      int? unreadNotes,
      @JsonKey(
          readValue: _parentSummaryAvailableActivityResponses,
          fromJson: _parentSummaryAvailableActivityResponsesValue)
      int? availableActivityResponses});
}

/// @nodoc
class _$ParentSummaryModelCopyWithImpl<$Res, $Val extends ParentSummaryModel>
    implements $ParentSummaryModelCopyWith<$Res> {
  _$ParentSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = freezed,
    Object? activeEnrollments = freezed,
    Object? memorizedPages = freezed,
    Object? points = freezed,
    Object? invoiceTotal = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? unreadNotes = freezed,
    Object? availableActivityResponses = freezed,
  }) {
    return _then(_value.copyWith(
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as int?,
      activeEnrollments: freezed == activeEnrollments
          ? _value.activeEnrollments
          : activeEnrollments // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceTotal: freezed == invoiceTotal
          ? _value.invoiceTotal
          : invoiceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      unreadNotes: freezed == unreadNotes
          ? _value.unreadNotes
          : unreadNotes // ignore: cast_nullable_to_non_nullable
              as int?,
      availableActivityResponses: freezed == availableActivityResponses
          ? _value.availableActivityResponses
          : availableActivityResponses // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentSummaryModelImplCopyWith<$Res>
    implements $ParentSummaryModelCopyWith<$Res> {
  factory _$$ParentSummaryModelImplCopyWith(_$ParentSummaryModelImpl value,
          $Res Function(_$ParentSummaryModelImpl) then) =
      __$$ParentSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _parentSummaryChildren,
          fromJson: _parentSummaryChildrenValue)
      int? children,
      @JsonKey(
          readValue: _parentSummaryActiveEnrollments,
          fromJson: _parentSummaryActiveEnrollmentsValue)
      int? activeEnrollments,
      @JsonKey(
          readValue: _parentSummaryMemorizedPages,
          fromJson: _parentSummaryMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(
          readValue: _parentSummaryPoints, fromJson: _parentSummaryPointsValue)
      int? points,
      @JsonKey(
          readValue: _parentSummaryInvoiceTotal,
          fromJson: _parentSummaryInvoiceTotalValue)
      double? invoiceTotal,
      @JsonKey(
          readValue: _parentSummaryPaidTotal,
          fromJson: _parentSummaryPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _parentSummaryBalance,
          fromJson: _parentSummaryBalanceValue)
      double? balance,
      @JsonKey(
          readValue: _parentSummaryUnreadNotes,
          fromJson: _parentSummaryUnreadNotesValue)
      int? unreadNotes,
      @JsonKey(
          readValue: _parentSummaryAvailableActivityResponses,
          fromJson: _parentSummaryAvailableActivityResponsesValue)
      int? availableActivityResponses});
}

/// @nodoc
class __$$ParentSummaryModelImplCopyWithImpl<$Res>
    extends _$ParentSummaryModelCopyWithImpl<$Res, _$ParentSummaryModelImpl>
    implements _$$ParentSummaryModelImplCopyWith<$Res> {
  __$$ParentSummaryModelImplCopyWithImpl(_$ParentSummaryModelImpl _value,
      $Res Function(_$ParentSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = freezed,
    Object? activeEnrollments = freezed,
    Object? memorizedPages = freezed,
    Object? points = freezed,
    Object? invoiceTotal = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? unreadNotes = freezed,
    Object? availableActivityResponses = freezed,
  }) {
    return _then(_$ParentSummaryModelImpl(
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as int?,
      activeEnrollments: freezed == activeEnrollments
          ? _value.activeEnrollments
          : activeEnrollments // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceTotal: freezed == invoiceTotal
          ? _value.invoiceTotal
          : invoiceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      unreadNotes: freezed == unreadNotes
          ? _value.unreadNotes
          : unreadNotes // ignore: cast_nullable_to_non_nullable
              as int?,
      availableActivityResponses: freezed == availableActivityResponses
          ? _value.availableActivityResponses
          : availableActivityResponses // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ParentSummaryModelImpl implements _ParentSummaryModel {
  const _$ParentSummaryModelImpl(
      {@JsonKey(
          readValue: _parentSummaryChildren,
          fromJson: _parentSummaryChildrenValue)
      this.children,
      @JsonKey(
          readValue: _parentSummaryActiveEnrollments,
          fromJson: _parentSummaryActiveEnrollmentsValue)
      this.activeEnrollments,
      @JsonKey(
          readValue: _parentSummaryMemorizedPages,
          fromJson: _parentSummaryMemorizedPagesValue)
      this.memorizedPages,
      @JsonKey(
          readValue: _parentSummaryPoints, fromJson: _parentSummaryPointsValue)
      this.points,
      @JsonKey(
          readValue: _parentSummaryInvoiceTotal,
          fromJson: _parentSummaryInvoiceTotalValue)
      this.invoiceTotal,
      @JsonKey(
          readValue: _parentSummaryPaidTotal,
          fromJson: _parentSummaryPaidTotalValue)
      this.paidTotal,
      @JsonKey(
          readValue: _parentSummaryBalance,
          fromJson: _parentSummaryBalanceValue)
      this.balance,
      @JsonKey(
          readValue: _parentSummaryUnreadNotes,
          fromJson: _parentSummaryUnreadNotesValue)
      this.unreadNotes,
      @JsonKey(
          readValue: _parentSummaryAvailableActivityResponses,
          fromJson: _parentSummaryAvailableActivityResponsesValue)
      this.availableActivityResponses});

  factory _$ParentSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentSummaryModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _parentSummaryChildren, fromJson: _parentSummaryChildrenValue)
  final int? children;
  @override
  @JsonKey(
      readValue: _parentSummaryActiveEnrollments,
      fromJson: _parentSummaryActiveEnrollmentsValue)
  final int? activeEnrollments;
  @override
  @JsonKey(
      readValue: _parentSummaryMemorizedPages,
      fromJson: _parentSummaryMemorizedPagesValue)
  final int? memorizedPages;
  @override
  @JsonKey(readValue: _parentSummaryPoints, fromJson: _parentSummaryPointsValue)
  final int? points;
  @override
  @JsonKey(
      readValue: _parentSummaryInvoiceTotal,
      fromJson: _parentSummaryInvoiceTotalValue)
  final double? invoiceTotal;
  @override
  @JsonKey(
      readValue: _parentSummaryPaidTotal,
      fromJson: _parentSummaryPaidTotalValue)
  final double? paidTotal;
  @override
  @JsonKey(
      readValue: _parentSummaryBalance, fromJson: _parentSummaryBalanceValue)
  final double? balance;
  @override
  @JsonKey(
      readValue: _parentSummaryUnreadNotes,
      fromJson: _parentSummaryUnreadNotesValue)
  final int? unreadNotes;
  @override
  @JsonKey(
      readValue: _parentSummaryAvailableActivityResponses,
      fromJson: _parentSummaryAvailableActivityResponsesValue)
  final int? availableActivityResponses;

  @override
  String toString() {
    return 'ParentSummaryModel(children: $children, activeEnrollments: $activeEnrollments, memorizedPages: $memorizedPages, points: $points, invoiceTotal: $invoiceTotal, paidTotal: $paidTotal, balance: $balance, unreadNotes: $unreadNotes, availableActivityResponses: $availableActivityResponses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentSummaryModelImpl &&
            (identical(other.children, children) ||
                other.children == children) &&
            (identical(other.activeEnrollments, activeEnrollments) ||
                other.activeEnrollments == activeEnrollments) &&
            (identical(other.memorizedPages, memorizedPages) ||
                other.memorizedPages == memorizedPages) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.invoiceTotal, invoiceTotal) ||
                other.invoiceTotal == invoiceTotal) &&
            (identical(other.paidTotal, paidTotal) ||
                other.paidTotal == paidTotal) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.unreadNotes, unreadNotes) ||
                other.unreadNotes == unreadNotes) &&
            (identical(other.availableActivityResponses,
                    availableActivityResponses) ||
                other.availableActivityResponses ==
                    availableActivityResponses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      children,
      activeEnrollments,
      memorizedPages,
      points,
      invoiceTotal,
      paidTotal,
      balance,
      unreadNotes,
      availableActivityResponses);

  /// Create a copy of ParentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentSummaryModelImplCopyWith<_$ParentSummaryModelImpl> get copyWith =>
      __$$ParentSummaryModelImplCopyWithImpl<_$ParentSummaryModelImpl>(
          this, _$identity);
}

abstract class _ParentSummaryModel implements ParentSummaryModel {
  const factory _ParentSummaryModel(
      {@JsonKey(
          readValue: _parentSummaryChildren,
          fromJson: _parentSummaryChildrenValue)
      final int? children,
      @JsonKey(
          readValue: _parentSummaryActiveEnrollments,
          fromJson: _parentSummaryActiveEnrollmentsValue)
      final int? activeEnrollments,
      @JsonKey(
          readValue: _parentSummaryMemorizedPages,
          fromJson: _parentSummaryMemorizedPagesValue)
      final int? memorizedPages,
      @JsonKey(
          readValue: _parentSummaryPoints, fromJson: _parentSummaryPointsValue)
      final int? points,
      @JsonKey(
          readValue: _parentSummaryInvoiceTotal,
          fromJson: _parentSummaryInvoiceTotalValue)
      final double? invoiceTotal,
      @JsonKey(
          readValue: _parentSummaryPaidTotal,
          fromJson: _parentSummaryPaidTotalValue)
      final double? paidTotal,
      @JsonKey(
          readValue: _parentSummaryBalance,
          fromJson: _parentSummaryBalanceValue)
      final double? balance,
      @JsonKey(
          readValue: _parentSummaryUnreadNotes,
          fromJson: _parentSummaryUnreadNotesValue)
      final int? unreadNotes,
      @JsonKey(
          readValue: _parentSummaryAvailableActivityResponses,
          fromJson: _parentSummaryAvailableActivityResponsesValue)
      final int? availableActivityResponses}) = _$ParentSummaryModelImpl;

  factory _ParentSummaryModel.fromJson(Map<String, dynamic> json) =
      _$ParentSummaryModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _parentSummaryChildren, fromJson: _parentSummaryChildrenValue)
  int? get children;
  @override
  @JsonKey(
      readValue: _parentSummaryActiveEnrollments,
      fromJson: _parentSummaryActiveEnrollmentsValue)
  int? get activeEnrollments;
  @override
  @JsonKey(
      readValue: _parentSummaryMemorizedPages,
      fromJson: _parentSummaryMemorizedPagesValue)
  int? get memorizedPages;
  @override
  @JsonKey(readValue: _parentSummaryPoints, fromJson: _parentSummaryPointsValue)
  int? get points;
  @override
  @JsonKey(
      readValue: _parentSummaryInvoiceTotal,
      fromJson: _parentSummaryInvoiceTotalValue)
  double? get invoiceTotal;
  @override
  @JsonKey(
      readValue: _parentSummaryPaidTotal,
      fromJson: _parentSummaryPaidTotalValue)
  double? get paidTotal;
  @override
  @JsonKey(
      readValue: _parentSummaryBalance, fromJson: _parentSummaryBalanceValue)
  double? get balance;
  @override
  @JsonKey(
      readValue: _parentSummaryUnreadNotes,
      fromJson: _parentSummaryUnreadNotesValue)
  int? get unreadNotes;
  @override
  @JsonKey(
      readValue: _parentSummaryAvailableActivityResponses,
      fromJson: _parentSummaryAvailableActivityResponsesValue)
  int? get availableActivityResponses;

  /// Create a copy of ParentSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentSummaryModelImplCopyWith<_$ParentSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityChildEligibilityModel _$ActivityChildEligibilityModelFromJson(
    Map<String, dynamic> json) {
  return _ActivityChildEligibilityModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityChildEligibilityModel {
  @JsonKey(
      readValue: _activityChildEligibilityStudentId,
      fromJson: _activityChildEligibilityStudentIdValue)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityChildEligibilityStudentName,
      fromJson: _activityChildEligibilityStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityChildEligibilityResponseStatus,
      fromJson: _activityChildEligibilityResponseStatusValue)
  String? get responseStatus => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityChildEligibilityCanRespond,
      fromJson: _activityChildEligibilityCanRespondValue)
  bool? get canRespond => throw _privateConstructorUsedError;

  /// Create a copy of ActivityChildEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityChildEligibilityModelCopyWith<ActivityChildEligibilityModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityChildEligibilityModelCopyWith<$Res> {
  factory $ActivityChildEligibilityModelCopyWith(
          ActivityChildEligibilityModel value,
          $Res Function(ActivityChildEligibilityModel) then) =
      _$ActivityChildEligibilityModelCopyWithImpl<$Res,
          ActivityChildEligibilityModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _activityChildEligibilityStudentId,
          fromJson: _activityChildEligibilityStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _activityChildEligibilityStudentName,
          fromJson: _activityChildEligibilityStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _activityChildEligibilityResponseStatus,
          fromJson: _activityChildEligibilityResponseStatusValue)
      String? responseStatus,
      @JsonKey(
          readValue: _activityChildEligibilityCanRespond,
          fromJson: _activityChildEligibilityCanRespondValue)
      bool? canRespond});
}

/// @nodoc
class _$ActivityChildEligibilityModelCopyWithImpl<$Res,
        $Val extends ActivityChildEligibilityModel>
    implements $ActivityChildEligibilityModelCopyWith<$Res> {
  _$ActivityChildEligibilityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityChildEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? responseStatus = freezed,
    Object? canRespond = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      responseStatus: freezed == responseStatus
          ? _value.responseStatus
          : responseStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      canRespond: freezed == canRespond
          ? _value.canRespond
          : canRespond // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityChildEligibilityModelImplCopyWith<$Res>
    implements $ActivityChildEligibilityModelCopyWith<$Res> {
  factory _$$ActivityChildEligibilityModelImplCopyWith(
          _$ActivityChildEligibilityModelImpl value,
          $Res Function(_$ActivityChildEligibilityModelImpl) then) =
      __$$ActivityChildEligibilityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _activityChildEligibilityStudentId,
          fromJson: _activityChildEligibilityStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _activityChildEligibilityStudentName,
          fromJson: _activityChildEligibilityStudentNameValue)
      String? studentName,
      @JsonKey(
          readValue: _activityChildEligibilityResponseStatus,
          fromJson: _activityChildEligibilityResponseStatusValue)
      String? responseStatus,
      @JsonKey(
          readValue: _activityChildEligibilityCanRespond,
          fromJson: _activityChildEligibilityCanRespondValue)
      bool? canRespond});
}

/// @nodoc
class __$$ActivityChildEligibilityModelImplCopyWithImpl<$Res>
    extends _$ActivityChildEligibilityModelCopyWithImpl<$Res,
        _$ActivityChildEligibilityModelImpl>
    implements _$$ActivityChildEligibilityModelImplCopyWith<$Res> {
  __$$ActivityChildEligibilityModelImplCopyWithImpl(
      _$ActivityChildEligibilityModelImpl _value,
      $Res Function(_$ActivityChildEligibilityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityChildEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? responseStatus = freezed,
    Object? canRespond = freezed,
  }) {
    return _then(_$ActivityChildEligibilityModelImpl(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      responseStatus: freezed == responseStatus
          ? _value.responseStatus
          : responseStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      canRespond: freezed == canRespond
          ? _value.canRespond
          : canRespond // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ActivityChildEligibilityModelImpl
    implements _ActivityChildEligibilityModel {
  const _$ActivityChildEligibilityModelImpl(
      {@JsonKey(
          readValue: _activityChildEligibilityStudentId,
          fromJson: _activityChildEligibilityStudentIdValue)
      this.studentId,
      @JsonKey(
          readValue: _activityChildEligibilityStudentName,
          fromJson: _activityChildEligibilityStudentNameValue)
      this.studentName,
      @JsonKey(
          readValue: _activityChildEligibilityResponseStatus,
          fromJson: _activityChildEligibilityResponseStatusValue)
      this.responseStatus,
      @JsonKey(
          readValue: _activityChildEligibilityCanRespond,
          fromJson: _activityChildEligibilityCanRespondValue)
      this.canRespond});

  factory _$ActivityChildEligibilityModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ActivityChildEligibilityModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _activityChildEligibilityStudentId,
      fromJson: _activityChildEligibilityStudentIdValue)
  final int? studentId;
  @override
  @JsonKey(
      readValue: _activityChildEligibilityStudentName,
      fromJson: _activityChildEligibilityStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(
      readValue: _activityChildEligibilityResponseStatus,
      fromJson: _activityChildEligibilityResponseStatusValue)
  final String? responseStatus;
  @override
  @JsonKey(
      readValue: _activityChildEligibilityCanRespond,
      fromJson: _activityChildEligibilityCanRespondValue)
  final bool? canRespond;

  @override
  String toString() {
    return 'ActivityChildEligibilityModel(studentId: $studentId, studentName: $studentName, responseStatus: $responseStatus, canRespond: $canRespond)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityChildEligibilityModelImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.responseStatus, responseStatus) ||
                other.responseStatus == responseStatus) &&
            (identical(other.canRespond, canRespond) ||
                other.canRespond == canRespond));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, studentId, studentName, responseStatus, canRespond);

  /// Create a copy of ActivityChildEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityChildEligibilityModelImplCopyWith<
          _$ActivityChildEligibilityModelImpl>
      get copyWith => __$$ActivityChildEligibilityModelImplCopyWithImpl<
          _$ActivityChildEligibilityModelImpl>(this, _$identity);
}

abstract class _ActivityChildEligibilityModel
    implements ActivityChildEligibilityModel {
  const factory _ActivityChildEligibilityModel(
      {@JsonKey(
          readValue: _activityChildEligibilityStudentId,
          fromJson: _activityChildEligibilityStudentIdValue)
      final int? studentId,
      @JsonKey(
          readValue: _activityChildEligibilityStudentName,
          fromJson: _activityChildEligibilityStudentNameValue)
      final String? studentName,
      @JsonKey(
          readValue: _activityChildEligibilityResponseStatus,
          fromJson: _activityChildEligibilityResponseStatusValue)
      final String? responseStatus,
      @JsonKey(
          readValue: _activityChildEligibilityCanRespond,
          fromJson: _activityChildEligibilityCanRespondValue)
      final bool? canRespond}) = _$ActivityChildEligibilityModelImpl;

  factory _ActivityChildEligibilityModel.fromJson(Map<String, dynamic> json) =
      _$ActivityChildEligibilityModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _activityChildEligibilityStudentId,
      fromJson: _activityChildEligibilityStudentIdValue)
  int? get studentId;
  @override
  @JsonKey(
      readValue: _activityChildEligibilityStudentName,
      fromJson: _activityChildEligibilityStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(
      readValue: _activityChildEligibilityResponseStatus,
      fromJson: _activityChildEligibilityResponseStatusValue)
  String? get responseStatus;
  @override
  @JsonKey(
      readValue: _activityChildEligibilityCanRespond,
      fromJson: _activityChildEligibilityCanRespondValue)
  bool? get canRespond;

  /// Create a copy of ActivityChildEligibilityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityChildEligibilityModelImplCopyWith<
          _$ActivityChildEligibilityModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ParentActivityModel _$ParentActivityModelFromJson(Map<String, dynamic> json) {
  return _ParentActivityModel.fromJson(json);
}

/// @nodoc
mixin _$ParentActivityModel {
  @JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _parentActivityTitle, fromJson: _parentActivityTitleValue)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentActivityDescription,
      fromJson: _parentActivityDescriptionValue)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentActivityActivityDate,
      fromJson: _parentActivityActivityDateValue)
  DateTime? get activityDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentActivityFeeAmount,
      fromJson: _parentActivityFeeAmountValue)
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentActivityIsActive,
      fromJson: _parentActivityIsActiveValue)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _parentActivityGroupName,
      fromJson: _parentActivityGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<ActivityChildEligibilityModel>? get children =>
      throw _privateConstructorUsedError;

  /// Create a copy of ParentActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentActivityModelCopyWith<ParentActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentActivityModelCopyWith<$Res> {
  factory $ParentActivityModelCopyWith(
          ParentActivityModel value, $Res Function(ParentActivityModel) then) =
      _$ParentActivityModelCopyWithImpl<$Res, ParentActivityModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
      int? id,
      @JsonKey(
          readValue: _parentActivityTitle, fromJson: _parentActivityTitleValue)
      String? title,
      @JsonKey(
          readValue: _parentActivityDescription,
          fromJson: _parentActivityDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _parentActivityActivityDate,
          fromJson: _parentActivityActivityDateValue)
      DateTime? activityDate,
      @JsonKey(
          readValue: _parentActivityFeeAmount,
          fromJson: _parentActivityFeeAmountValue)
      double? feeAmount,
      @JsonKey(
          readValue: _parentActivityIsActive,
          fromJson: _parentActivityIsActiveValue)
      bool? isActive,
      @JsonKey(
          readValue: _parentActivityGroupName,
          fromJson: _parentActivityGroupNameValue)
      String? groupName,
      @JsonKey(readValue: readJsonList)
      List<ActivityChildEligibilityModel>? children});
}

/// @nodoc
class _$ParentActivityModelCopyWithImpl<$Res, $Val extends ParentActivityModel>
    implements $ParentActivityModelCopyWith<$Res> {
  _$ParentActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? activityDate = freezed,
    Object? feeAmount = freezed,
    Object? isActive = freezed,
    Object? groupName = freezed,
    Object? children = freezed,
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
              as DateTime?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ActivityChildEligibilityModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentActivityModelImplCopyWith<$Res>
    implements $ParentActivityModelCopyWith<$Res> {
  factory _$$ParentActivityModelImplCopyWith(_$ParentActivityModelImpl value,
          $Res Function(_$ParentActivityModelImpl) then) =
      __$$ParentActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
      int? id,
      @JsonKey(
          readValue: _parentActivityTitle, fromJson: _parentActivityTitleValue)
      String? title,
      @JsonKey(
          readValue: _parentActivityDescription,
          fromJson: _parentActivityDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _parentActivityActivityDate,
          fromJson: _parentActivityActivityDateValue)
      DateTime? activityDate,
      @JsonKey(
          readValue: _parentActivityFeeAmount,
          fromJson: _parentActivityFeeAmountValue)
      double? feeAmount,
      @JsonKey(
          readValue: _parentActivityIsActive,
          fromJson: _parentActivityIsActiveValue)
      bool? isActive,
      @JsonKey(
          readValue: _parentActivityGroupName,
          fromJson: _parentActivityGroupNameValue)
      String? groupName,
      @JsonKey(readValue: readJsonList)
      List<ActivityChildEligibilityModel>? children});
}

/// @nodoc
class __$$ParentActivityModelImplCopyWithImpl<$Res>
    extends _$ParentActivityModelCopyWithImpl<$Res, _$ParentActivityModelImpl>
    implements _$$ParentActivityModelImplCopyWith<$Res> {
  __$$ParentActivityModelImplCopyWithImpl(_$ParentActivityModelImpl _value,
      $Res Function(_$ParentActivityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? activityDate = freezed,
    Object? feeAmount = freezed,
    Object? isActive = freezed,
    Object? groupName = freezed,
    Object? children = freezed,
  }) {
    return _then(_$ParentActivityModelImpl(
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
              as DateTime?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ActivityChildEligibilityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ParentActivityModelImpl implements _ParentActivityModel {
  const _$ParentActivityModelImpl(
      {@JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
      this.id,
      @JsonKey(
          readValue: _parentActivityTitle, fromJson: _parentActivityTitleValue)
      this.title,
      @JsonKey(
          readValue: _parentActivityDescription,
          fromJson: _parentActivityDescriptionValue)
      this.description,
      @JsonKey(
          readValue: _parentActivityActivityDate,
          fromJson: _parentActivityActivityDateValue)
      this.activityDate,
      @JsonKey(
          readValue: _parentActivityFeeAmount,
          fromJson: _parentActivityFeeAmountValue)
      this.feeAmount,
      @JsonKey(
          readValue: _parentActivityIsActive,
          fromJson: _parentActivityIsActiveValue)
      this.isActive,
      @JsonKey(
          readValue: _parentActivityGroupName,
          fromJson: _parentActivityGroupNameValue)
      this.groupName,
      @JsonKey(readValue: readJsonList)
      final List<ActivityChildEligibilityModel>? children})
      : _children = children;

  factory _$ParentActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentActivityModelImplFromJson(json);

  @override
  @JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _parentActivityTitle, fromJson: _parentActivityTitleValue)
  final String? title;
  @override
  @JsonKey(
      readValue: _parentActivityDescription,
      fromJson: _parentActivityDescriptionValue)
  final String? description;
  @override
  @JsonKey(
      readValue: _parentActivityActivityDate,
      fromJson: _parentActivityActivityDateValue)
  final DateTime? activityDate;
  @override
  @JsonKey(
      readValue: _parentActivityFeeAmount,
      fromJson: _parentActivityFeeAmountValue)
  final double? feeAmount;
  @override
  @JsonKey(
      readValue: _parentActivityIsActive,
      fromJson: _parentActivityIsActiveValue)
  final bool? isActive;
  @override
  @JsonKey(
      readValue: _parentActivityGroupName,
      fromJson: _parentActivityGroupNameValue)
  final String? groupName;
  final List<ActivityChildEligibilityModel>? _children;
  @override
  @JsonKey(readValue: readJsonList)
  List<ActivityChildEligibilityModel>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ParentActivityModel(id: $id, title: $title, description: $description, activityDate: $activityDate, feeAmount: $feeAmount, isActive: $isActive, groupName: $groupName, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentActivityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      activityDate,
      feeAmount,
      isActive,
      groupName,
      const DeepCollectionEquality().hash(_children));

  /// Create a copy of ParentActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentActivityModelImplCopyWith<_$ParentActivityModelImpl> get copyWith =>
      __$$ParentActivityModelImplCopyWithImpl<_$ParentActivityModelImpl>(
          this, _$identity);
}

abstract class _ParentActivityModel implements ParentActivityModel {
  const factory _ParentActivityModel(
      {@JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
      final int? id,
      @JsonKey(
          readValue: _parentActivityTitle, fromJson: _parentActivityTitleValue)
      final String? title,
      @JsonKey(
          readValue: _parentActivityDescription,
          fromJson: _parentActivityDescriptionValue)
      final String? description,
      @JsonKey(
          readValue: _parentActivityActivityDate,
          fromJson: _parentActivityActivityDateValue)
      final DateTime? activityDate,
      @JsonKey(
          readValue: _parentActivityFeeAmount,
          fromJson: _parentActivityFeeAmountValue)
      final double? feeAmount,
      @JsonKey(
          readValue: _parentActivityIsActive,
          fromJson: _parentActivityIsActiveValue)
      final bool? isActive,
      @JsonKey(
          readValue: _parentActivityGroupName,
          fromJson: _parentActivityGroupNameValue)
      final String? groupName,
      @JsonKey(readValue: readJsonList)
      final List<ActivityChildEligibilityModel>?
          children}) = _$ParentActivityModelImpl;

  factory _ParentActivityModel.fromJson(Map<String, dynamic> json) =
      _$ParentActivityModelImpl.fromJson;

  @override
  @JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _parentActivityTitle, fromJson: _parentActivityTitleValue)
  String? get title;
  @override
  @JsonKey(
      readValue: _parentActivityDescription,
      fromJson: _parentActivityDescriptionValue)
  String? get description;
  @override
  @JsonKey(
      readValue: _parentActivityActivityDate,
      fromJson: _parentActivityActivityDateValue)
  DateTime? get activityDate;
  @override
  @JsonKey(
      readValue: _parentActivityFeeAmount,
      fromJson: _parentActivityFeeAmountValue)
  double? get feeAmount;
  @override
  @JsonKey(
      readValue: _parentActivityIsActive,
      fromJson: _parentActivityIsActiveValue)
  bool? get isActive;
  @override
  @JsonKey(
      readValue: _parentActivityGroupName,
      fromJson: _parentActivityGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(readValue: readJsonList)
  List<ActivityChildEligibilityModel>? get children;

  /// Create a copy of ParentActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentActivityModelImplCopyWith<_$ParentActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceListItemModel _$InvoiceListItemModelFromJson(Map<String, dynamic> json) {
  return _InvoiceListItemModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceListItemModel {
  @JsonKey(readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceListItemInvoiceNo,
      fromJson: _invoiceListItemInvoiceNoValue)
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceListItemStatus, fromJson: _invoiceListItemStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceListItemIssueDate,
      fromJson: _invoiceListItemIssueDateValue)
  String? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceListItemDueDate,
      fromJson: _invoiceListItemDueDateValue)
  String? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceListItemTotal, fromJson: _invoiceListItemTotalValue)
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceListItemPaidTotal,
      fromJson: _invoiceListItemPaidTotalValue)
  double? get paidTotal => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceListItemBalance,
      fromJson: _invoiceListItemBalanceValue)
  double? get balance => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceListItemModelCopyWith<InvoiceListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceListItemModelCopyWith<$Res> {
  factory $InvoiceListItemModelCopyWith(InvoiceListItemModel value,
          $Res Function(InvoiceListItemModel) then) =
      _$InvoiceListItemModelCopyWithImpl<$Res, InvoiceListItemModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
      int? id,
      @JsonKey(
          readValue: _invoiceListItemInvoiceNo,
          fromJson: _invoiceListItemInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _invoiceListItemStatus,
          fromJson: _invoiceListItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _invoiceListItemIssueDate,
          fromJson: _invoiceListItemIssueDateValue)
      String? issueDate,
      @JsonKey(
          readValue: _invoiceListItemDueDate,
          fromJson: _invoiceListItemDueDateValue)
      String? dueDate,
      @JsonKey(
          readValue: _invoiceListItemTotal,
          fromJson: _invoiceListItemTotalValue)
      double? total,
      @JsonKey(
          readValue: _invoiceListItemPaidTotal,
          fromJson: _invoiceListItemPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _invoiceListItemBalance,
          fromJson: _invoiceListItemBalanceValue)
      double? balance});
}

/// @nodoc
class _$InvoiceListItemModelCopyWithImpl<$Res,
        $Val extends InvoiceListItemModel>
    implements $InvoiceListItemModelCopyWith<$Res> {
  _$InvoiceListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? status = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceListItemModelImplCopyWith<$Res>
    implements $InvoiceListItemModelCopyWith<$Res> {
  factory _$$InvoiceListItemModelImplCopyWith(_$InvoiceListItemModelImpl value,
          $Res Function(_$InvoiceListItemModelImpl) then) =
      __$$InvoiceListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
      int? id,
      @JsonKey(
          readValue: _invoiceListItemInvoiceNo,
          fromJson: _invoiceListItemInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _invoiceListItemStatus,
          fromJson: _invoiceListItemStatusValue)
      String? status,
      @JsonKey(
          readValue: _invoiceListItemIssueDate,
          fromJson: _invoiceListItemIssueDateValue)
      String? issueDate,
      @JsonKey(
          readValue: _invoiceListItemDueDate,
          fromJson: _invoiceListItemDueDateValue)
      String? dueDate,
      @JsonKey(
          readValue: _invoiceListItemTotal,
          fromJson: _invoiceListItemTotalValue)
      double? total,
      @JsonKey(
          readValue: _invoiceListItemPaidTotal,
          fromJson: _invoiceListItemPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _invoiceListItemBalance,
          fromJson: _invoiceListItemBalanceValue)
      double? balance});
}

/// @nodoc
class __$$InvoiceListItemModelImplCopyWithImpl<$Res>
    extends _$InvoiceListItemModelCopyWithImpl<$Res, _$InvoiceListItemModelImpl>
    implements _$$InvoiceListItemModelImplCopyWith<$Res> {
  __$$InvoiceListItemModelImplCopyWithImpl(_$InvoiceListItemModelImpl _value,
      $Res Function(_$InvoiceListItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? status = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$InvoiceListItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InvoiceListItemModelImpl implements _InvoiceListItemModel {
  const _$InvoiceListItemModelImpl(
      {@JsonKey(
          readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
      this.id,
      @JsonKey(
          readValue: _invoiceListItemInvoiceNo,
          fromJson: _invoiceListItemInvoiceNoValue)
      this.invoiceNo,
      @JsonKey(
          readValue: _invoiceListItemStatus,
          fromJson: _invoiceListItemStatusValue)
      this.status,
      @JsonKey(
          readValue: _invoiceListItemIssueDate,
          fromJson: _invoiceListItemIssueDateValue)
      this.issueDate,
      @JsonKey(
          readValue: _invoiceListItemDueDate,
          fromJson: _invoiceListItemDueDateValue)
      this.dueDate,
      @JsonKey(
          readValue: _invoiceListItemTotal,
          fromJson: _invoiceListItemTotalValue)
      this.total,
      @JsonKey(
          readValue: _invoiceListItemPaidTotal,
          fromJson: _invoiceListItemPaidTotalValue)
      this.paidTotal,
      @JsonKey(
          readValue: _invoiceListItemBalance,
          fromJson: _invoiceListItemBalanceValue)
      this.balance});

  factory _$InvoiceListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceListItemModelImplFromJson(json);

  @override
  @JsonKey(readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _invoiceListItemInvoiceNo,
      fromJson: _invoiceListItemInvoiceNoValue)
  final String? invoiceNo;
  @override
  @JsonKey(
      readValue: _invoiceListItemStatus, fromJson: _invoiceListItemStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _invoiceListItemIssueDate,
      fromJson: _invoiceListItemIssueDateValue)
  final String? issueDate;
  @override
  @JsonKey(
      readValue: _invoiceListItemDueDate,
      fromJson: _invoiceListItemDueDateValue)
  final String? dueDate;
  @override
  @JsonKey(
      readValue: _invoiceListItemTotal, fromJson: _invoiceListItemTotalValue)
  final double? total;
  @override
  @JsonKey(
      readValue: _invoiceListItemPaidTotal,
      fromJson: _invoiceListItemPaidTotalValue)
  final double? paidTotal;
  @override
  @JsonKey(
      readValue: _invoiceListItemBalance,
      fromJson: _invoiceListItemBalanceValue)
  final double? balance;

  @override
  String toString() {
    return 'InvoiceListItemModel(id: $id, invoiceNo: $invoiceNo, status: $status, issueDate: $issueDate, dueDate: $dueDate, total: $total, paidTotal: $paidTotal, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidTotal, paidTotal) ||
                other.paidTotal == paidTotal) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, invoiceNo, status, issueDate,
      dueDate, total, paidTotal, balance);

  /// Create a copy of InvoiceListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceListItemModelImplCopyWith<_$InvoiceListItemModelImpl>
      get copyWith =>
          __$$InvoiceListItemModelImplCopyWithImpl<_$InvoiceListItemModelImpl>(
              this, _$identity);
}

abstract class _InvoiceListItemModel implements InvoiceListItemModel {
  const factory _InvoiceListItemModel(
      {@JsonKey(
          readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _invoiceListItemInvoiceNo,
          fromJson: _invoiceListItemInvoiceNoValue)
      final String? invoiceNo,
      @JsonKey(
          readValue: _invoiceListItemStatus,
          fromJson: _invoiceListItemStatusValue)
      final String? status,
      @JsonKey(
          readValue: _invoiceListItemIssueDate,
          fromJson: _invoiceListItemIssueDateValue)
      final String? issueDate,
      @JsonKey(
          readValue: _invoiceListItemDueDate,
          fromJson: _invoiceListItemDueDateValue)
      final String? dueDate,
      @JsonKey(
          readValue: _invoiceListItemTotal,
          fromJson: _invoiceListItemTotalValue)
      final double? total,
      @JsonKey(
          readValue: _invoiceListItemPaidTotal,
          fromJson: _invoiceListItemPaidTotalValue)
      final double? paidTotal,
      @JsonKey(
          readValue: _invoiceListItemBalance,
          fromJson: _invoiceListItemBalanceValue)
      final double? balance}) = _$InvoiceListItemModelImpl;

  factory _InvoiceListItemModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceListItemModelImpl.fromJson;

  @override
  @JsonKey(readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _invoiceListItemInvoiceNo,
      fromJson: _invoiceListItemInvoiceNoValue)
  String? get invoiceNo;
  @override
  @JsonKey(
      readValue: _invoiceListItemStatus, fromJson: _invoiceListItemStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _invoiceListItemIssueDate,
      fromJson: _invoiceListItemIssueDateValue)
  String? get issueDate;
  @override
  @JsonKey(
      readValue: _invoiceListItemDueDate,
      fromJson: _invoiceListItemDueDateValue)
  String? get dueDate;
  @override
  @JsonKey(
      readValue: _invoiceListItemTotal, fromJson: _invoiceListItemTotalValue)
  double? get total;
  @override
  @JsonKey(
      readValue: _invoiceListItemPaidTotal,
      fromJson: _invoiceListItemPaidTotalValue)
  double? get paidTotal;
  @override
  @JsonKey(
      readValue: _invoiceListItemBalance,
      fromJson: _invoiceListItemBalanceValue)
  double? get balance;

  /// Create a copy of InvoiceListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceListItemModelImplCopyWith<_$InvoiceListItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvoiceLineItemModel _$InvoiceLineItemModelFromJson(Map<String, dynamic> json) {
  return _InvoiceLineItemModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceLineItemModel {
  @JsonKey(readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceLineItemDescription,
      fromJson: _invoiceLineItemDescriptionValue)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceLineItemQuantity,
      fromJson: _invoiceLineItemQuantityValue)
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceLineItemUnitPrice,
      fromJson: _invoiceLineItemUnitPriceValue)
  double? get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceLineItemLineTotal,
      fromJson: _invoiceLineItemLineTotalValue)
  double? get lineTotal => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceLineItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceLineItemModelCopyWith<InvoiceLineItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceLineItemModelCopyWith<$Res> {
  factory $InvoiceLineItemModelCopyWith(InvoiceLineItemModel value,
          $Res Function(InvoiceLineItemModel) then) =
      _$InvoiceLineItemModelCopyWithImpl<$Res, InvoiceLineItemModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
      int? id,
      @JsonKey(
          readValue: _invoiceLineItemDescription,
          fromJson: _invoiceLineItemDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _invoiceLineItemQuantity,
          fromJson: _invoiceLineItemQuantityValue)
      double? quantity,
      @JsonKey(
          readValue: _invoiceLineItemUnitPrice,
          fromJson: _invoiceLineItemUnitPriceValue)
      double? unitPrice,
      @JsonKey(
          readValue: _invoiceLineItemLineTotal,
          fromJson: _invoiceLineItemLineTotalValue)
      double? lineTotal});
}

/// @nodoc
class _$InvoiceLineItemModelCopyWithImpl<$Res,
        $Val extends InvoiceLineItemModel>
    implements $InvoiceLineItemModelCopyWith<$Res> {
  _$InvoiceLineItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceLineItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? lineTotal = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      lineTotal: freezed == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceLineItemModelImplCopyWith<$Res>
    implements $InvoiceLineItemModelCopyWith<$Res> {
  factory _$$InvoiceLineItemModelImplCopyWith(_$InvoiceLineItemModelImpl value,
          $Res Function(_$InvoiceLineItemModelImpl) then) =
      __$$InvoiceLineItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
      int? id,
      @JsonKey(
          readValue: _invoiceLineItemDescription,
          fromJson: _invoiceLineItemDescriptionValue)
      String? description,
      @JsonKey(
          readValue: _invoiceLineItemQuantity,
          fromJson: _invoiceLineItemQuantityValue)
      double? quantity,
      @JsonKey(
          readValue: _invoiceLineItemUnitPrice,
          fromJson: _invoiceLineItemUnitPriceValue)
      double? unitPrice,
      @JsonKey(
          readValue: _invoiceLineItemLineTotal,
          fromJson: _invoiceLineItemLineTotalValue)
      double? lineTotal});
}

/// @nodoc
class __$$InvoiceLineItemModelImplCopyWithImpl<$Res>
    extends _$InvoiceLineItemModelCopyWithImpl<$Res, _$InvoiceLineItemModelImpl>
    implements _$$InvoiceLineItemModelImplCopyWith<$Res> {
  __$$InvoiceLineItemModelImplCopyWithImpl(_$InvoiceLineItemModelImpl _value,
      $Res Function(_$InvoiceLineItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceLineItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? lineTotal = freezed,
  }) {
    return _then(_$InvoiceLineItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      lineTotal: freezed == lineTotal
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InvoiceLineItemModelImpl implements _InvoiceLineItemModel {
  const _$InvoiceLineItemModelImpl(
      {@JsonKey(
          readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
      this.id,
      @JsonKey(
          readValue: _invoiceLineItemDescription,
          fromJson: _invoiceLineItemDescriptionValue)
      this.description,
      @JsonKey(
          readValue: _invoiceLineItemQuantity,
          fromJson: _invoiceLineItemQuantityValue)
      this.quantity,
      @JsonKey(
          readValue: _invoiceLineItemUnitPrice,
          fromJson: _invoiceLineItemUnitPriceValue)
      this.unitPrice,
      @JsonKey(
          readValue: _invoiceLineItemLineTotal,
          fromJson: _invoiceLineItemLineTotalValue)
      this.lineTotal});

  factory _$InvoiceLineItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceLineItemModelImplFromJson(json);

  @override
  @JsonKey(readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _invoiceLineItemDescription,
      fromJson: _invoiceLineItemDescriptionValue)
  final String? description;
  @override
  @JsonKey(
      readValue: _invoiceLineItemQuantity,
      fromJson: _invoiceLineItemQuantityValue)
  final double? quantity;
  @override
  @JsonKey(
      readValue: _invoiceLineItemUnitPrice,
      fromJson: _invoiceLineItemUnitPriceValue)
  final double? unitPrice;
  @override
  @JsonKey(
      readValue: _invoiceLineItemLineTotal,
      fromJson: _invoiceLineItemLineTotalValue)
  final double? lineTotal;

  @override
  String toString() {
    return 'InvoiceLineItemModel(id: $id, description: $description, quantity: $quantity, unitPrice: $unitPrice, lineTotal: $lineTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceLineItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.lineTotal, lineTotal) ||
                other.lineTotal == lineTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, quantity, unitPrice, lineTotal);

  /// Create a copy of InvoiceLineItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceLineItemModelImplCopyWith<_$InvoiceLineItemModelImpl>
      get copyWith =>
          __$$InvoiceLineItemModelImplCopyWithImpl<_$InvoiceLineItemModelImpl>(
              this, _$identity);
}

abstract class _InvoiceLineItemModel implements InvoiceLineItemModel {
  const factory _InvoiceLineItemModel(
      {@JsonKey(
          readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
      final int? id,
      @JsonKey(
          readValue: _invoiceLineItemDescription,
          fromJson: _invoiceLineItemDescriptionValue)
      final String? description,
      @JsonKey(
          readValue: _invoiceLineItemQuantity,
          fromJson: _invoiceLineItemQuantityValue)
      final double? quantity,
      @JsonKey(
          readValue: _invoiceLineItemUnitPrice,
          fromJson: _invoiceLineItemUnitPriceValue)
      final double? unitPrice,
      @JsonKey(
          readValue: _invoiceLineItemLineTotal,
          fromJson: _invoiceLineItemLineTotalValue)
      final double? lineTotal}) = _$InvoiceLineItemModelImpl;

  factory _InvoiceLineItemModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceLineItemModelImpl.fromJson;

  @override
  @JsonKey(readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _invoiceLineItemDescription,
      fromJson: _invoiceLineItemDescriptionValue)
  String? get description;
  @override
  @JsonKey(
      readValue: _invoiceLineItemQuantity,
      fromJson: _invoiceLineItemQuantityValue)
  double? get quantity;
  @override
  @JsonKey(
      readValue: _invoiceLineItemUnitPrice,
      fromJson: _invoiceLineItemUnitPriceValue)
  double? get unitPrice;
  @override
  @JsonKey(
      readValue: _invoiceLineItemLineTotal,
      fromJson: _invoiceLineItemLineTotalValue)
  double? get lineTotal;

  /// Create a copy of InvoiceLineItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceLineItemModelImplCopyWith<_$InvoiceLineItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvoicePaymentEntryModel _$InvoicePaymentEntryModelFromJson(
    Map<String, dynamic> json) {
  return _InvoicePaymentEntryModel.fromJson(json);
}

/// @nodoc
mixin _$InvoicePaymentEntryModel {
  @JsonKey(
      readValue: _invoicePaymentEntryId, fromJson: _invoicePaymentEntryIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentEntryAmount,
      fromJson: _invoicePaymentEntryAmountValue)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentEntryPaidAt,
      fromJson: _invoicePaymentEntryPaidAtValue)
  String? get paidAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentEntryReferenceNo,
      fromJson: _invoicePaymentEntryReferenceNoValue)
  String? get referenceNo => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentEntryMethodName,
      fromJson: _invoicePaymentEntryMethodNameValue)
  String? get methodName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentEntryIsVoided,
      fromJson: _invoicePaymentEntryIsVoidedValue)
  bool? get isVoided => throw _privateConstructorUsedError;

  /// Create a copy of InvoicePaymentEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoicePaymentEntryModelCopyWith<InvoicePaymentEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoicePaymentEntryModelCopyWith<$Res> {
  factory $InvoicePaymentEntryModelCopyWith(InvoicePaymentEntryModel value,
          $Res Function(InvoicePaymentEntryModel) then) =
      _$InvoicePaymentEntryModelCopyWithImpl<$Res, InvoicePaymentEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _invoicePaymentEntryId,
          fromJson: _invoicePaymentEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _invoicePaymentEntryAmount,
          fromJson: _invoicePaymentEntryAmountValue)
      double? amount,
      @JsonKey(
          readValue: _invoicePaymentEntryPaidAt,
          fromJson: _invoicePaymentEntryPaidAtValue)
      String? paidAt,
      @JsonKey(
          readValue: _invoicePaymentEntryReferenceNo,
          fromJson: _invoicePaymentEntryReferenceNoValue)
      String? referenceNo,
      @JsonKey(
          readValue: _invoicePaymentEntryMethodName,
          fromJson: _invoicePaymentEntryMethodNameValue)
      String? methodName,
      @JsonKey(
          readValue: _invoicePaymentEntryIsVoided,
          fromJson: _invoicePaymentEntryIsVoidedValue)
      bool? isVoided});
}

/// @nodoc
class _$InvoicePaymentEntryModelCopyWithImpl<$Res,
        $Val extends InvoicePaymentEntryModel>
    implements $InvoicePaymentEntryModelCopyWith<$Res> {
  _$InvoicePaymentEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoicePaymentEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? referenceNo = freezed,
    Object? methodName = freezed,
    Object? isVoided = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      methodName: freezed == methodName
          ? _value.methodName
          : methodName // ignore: cast_nullable_to_non_nullable
              as String?,
      isVoided: freezed == isVoided
          ? _value.isVoided
          : isVoided // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoicePaymentEntryModelImplCopyWith<$Res>
    implements $InvoicePaymentEntryModelCopyWith<$Res> {
  factory _$$InvoicePaymentEntryModelImplCopyWith(
          _$InvoicePaymentEntryModelImpl value,
          $Res Function(_$InvoicePaymentEntryModelImpl) then) =
      __$$InvoicePaymentEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _invoicePaymentEntryId,
          fromJson: _invoicePaymentEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _invoicePaymentEntryAmount,
          fromJson: _invoicePaymentEntryAmountValue)
      double? amount,
      @JsonKey(
          readValue: _invoicePaymentEntryPaidAt,
          fromJson: _invoicePaymentEntryPaidAtValue)
      String? paidAt,
      @JsonKey(
          readValue: _invoicePaymentEntryReferenceNo,
          fromJson: _invoicePaymentEntryReferenceNoValue)
      String? referenceNo,
      @JsonKey(
          readValue: _invoicePaymentEntryMethodName,
          fromJson: _invoicePaymentEntryMethodNameValue)
      String? methodName,
      @JsonKey(
          readValue: _invoicePaymentEntryIsVoided,
          fromJson: _invoicePaymentEntryIsVoidedValue)
      bool? isVoided});
}

/// @nodoc
class __$$InvoicePaymentEntryModelImplCopyWithImpl<$Res>
    extends _$InvoicePaymentEntryModelCopyWithImpl<$Res,
        _$InvoicePaymentEntryModelImpl>
    implements _$$InvoicePaymentEntryModelImplCopyWith<$Res> {
  __$$InvoicePaymentEntryModelImplCopyWithImpl(
      _$InvoicePaymentEntryModelImpl _value,
      $Res Function(_$InvoicePaymentEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoicePaymentEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? referenceNo = freezed,
    Object? methodName = freezed,
    Object? isVoided = freezed,
  }) {
    return _then(_$InvoicePaymentEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      methodName: freezed == methodName
          ? _value.methodName
          : methodName // ignore: cast_nullable_to_non_nullable
              as String?,
      isVoided: freezed == isVoided
          ? _value.isVoided
          : isVoided // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InvoicePaymentEntryModelImpl implements _InvoicePaymentEntryModel {
  const _$InvoicePaymentEntryModelImpl(
      {@JsonKey(
          readValue: _invoicePaymentEntryId,
          fromJson: _invoicePaymentEntryIdValue)
      this.id,
      @JsonKey(
          readValue: _invoicePaymentEntryAmount,
          fromJson: _invoicePaymentEntryAmountValue)
      this.amount,
      @JsonKey(
          readValue: _invoicePaymentEntryPaidAt,
          fromJson: _invoicePaymentEntryPaidAtValue)
      this.paidAt,
      @JsonKey(
          readValue: _invoicePaymentEntryReferenceNo,
          fromJson: _invoicePaymentEntryReferenceNoValue)
      this.referenceNo,
      @JsonKey(
          readValue: _invoicePaymentEntryMethodName,
          fromJson: _invoicePaymentEntryMethodNameValue)
      this.methodName,
      @JsonKey(
          readValue: _invoicePaymentEntryIsVoided,
          fromJson: _invoicePaymentEntryIsVoidedValue)
      this.isVoided});

  factory _$InvoicePaymentEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoicePaymentEntryModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _invoicePaymentEntryId, fromJson: _invoicePaymentEntryIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryAmount,
      fromJson: _invoicePaymentEntryAmountValue)
  final double? amount;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryPaidAt,
      fromJson: _invoicePaymentEntryPaidAtValue)
  final String? paidAt;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryReferenceNo,
      fromJson: _invoicePaymentEntryReferenceNoValue)
  final String? referenceNo;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryMethodName,
      fromJson: _invoicePaymentEntryMethodNameValue)
  final String? methodName;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryIsVoided,
      fromJson: _invoicePaymentEntryIsVoidedValue)
  final bool? isVoided;

  @override
  String toString() {
    return 'InvoicePaymentEntryModel(id: $id, amount: $amount, paidAt: $paidAt, referenceNo: $referenceNo, methodName: $methodName, isVoided: $isVoided)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoicePaymentEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.methodName, methodName) ||
                other.methodName == methodName) &&
            (identical(other.isVoided, isVoided) ||
                other.isVoided == isVoided));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, paidAt, referenceNo, methodName, isVoided);

  /// Create a copy of InvoicePaymentEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoicePaymentEntryModelImplCopyWith<_$InvoicePaymentEntryModelImpl>
      get copyWith => __$$InvoicePaymentEntryModelImplCopyWithImpl<
          _$InvoicePaymentEntryModelImpl>(this, _$identity);
}

abstract class _InvoicePaymentEntryModel implements InvoicePaymentEntryModel {
  const factory _InvoicePaymentEntryModel(
      {@JsonKey(
          readValue: _invoicePaymentEntryId,
          fromJson: _invoicePaymentEntryIdValue)
      final int? id,
      @JsonKey(
          readValue: _invoicePaymentEntryAmount,
          fromJson: _invoicePaymentEntryAmountValue)
      final double? amount,
      @JsonKey(
          readValue: _invoicePaymentEntryPaidAt,
          fromJson: _invoicePaymentEntryPaidAtValue)
      final String? paidAt,
      @JsonKey(
          readValue: _invoicePaymentEntryReferenceNo,
          fromJson: _invoicePaymentEntryReferenceNoValue)
      final String? referenceNo,
      @JsonKey(
          readValue: _invoicePaymentEntryMethodName,
          fromJson: _invoicePaymentEntryMethodNameValue)
      final String? methodName,
      @JsonKey(
          readValue: _invoicePaymentEntryIsVoided,
          fromJson: _invoicePaymentEntryIsVoidedValue)
      final bool? isVoided}) = _$InvoicePaymentEntryModelImpl;

  factory _InvoicePaymentEntryModel.fromJson(Map<String, dynamic> json) =
      _$InvoicePaymentEntryModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _invoicePaymentEntryId, fromJson: _invoicePaymentEntryIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryAmount,
      fromJson: _invoicePaymentEntryAmountValue)
  double? get amount;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryPaidAt,
      fromJson: _invoicePaymentEntryPaidAtValue)
  String? get paidAt;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryReferenceNo,
      fromJson: _invoicePaymentEntryReferenceNoValue)
  String? get referenceNo;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryMethodName,
      fromJson: _invoicePaymentEntryMethodNameValue)
  String? get methodName;
  @override
  @JsonKey(
      readValue: _invoicePaymentEntryIsVoided,
      fromJson: _invoicePaymentEntryIsVoidedValue)
  bool? get isVoided;

  /// Create a copy of InvoicePaymentEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoicePaymentEntryModelImplCopyWith<_$InvoicePaymentEntryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) {
  return _InvoiceDetailModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetailModel {
  @JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailInvoiceNo,
      fromJson: _invoiceDetailInvoiceNoValue)
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(readValue: _invoiceDetailStatus, fromJson: _invoiceDetailStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailIssueDate,
      fromJson: _invoiceDetailIssueDateValue)
  String? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailDueDate, fromJson: _invoiceDetailDueDateValue)
  String? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailSubtotal, fromJson: _invoiceDetailSubtotalValue)
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailDiscount, fromJson: _invoiceDetailDiscountValue)
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailPaidTotal,
      fromJson: _invoiceDetailPaidTotalValue)
  double? get paidTotal => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailBalance, fromJson: _invoiceDetailBalanceValue)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<InvoiceLineItemModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<InvoicePaymentEntryModel>? get payments =>
      throw _privateConstructorUsedError;

  /// Create a copy of InvoiceDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceDetailModelCopyWith<InvoiceDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailModelCopyWith<$Res> {
  factory $InvoiceDetailModelCopyWith(
          InvoiceDetailModel value, $Res Function(InvoiceDetailModel) then) =
      _$InvoiceDetailModelCopyWithImpl<$Res, InvoiceDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
      int? id,
      @JsonKey(
          readValue: _invoiceDetailInvoiceNo,
          fromJson: _invoiceDetailInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _invoiceDetailStatus, fromJson: _invoiceDetailStatusValue)
      String? status,
      @JsonKey(
          readValue: _invoiceDetailIssueDate,
          fromJson: _invoiceDetailIssueDateValue)
      String? issueDate,
      @JsonKey(
          readValue: _invoiceDetailDueDate,
          fromJson: _invoiceDetailDueDateValue)
      String? dueDate,
      @JsonKey(
          readValue: _invoiceDetailSubtotal,
          fromJson: _invoiceDetailSubtotalValue)
      double? subtotal,
      @JsonKey(
          readValue: _invoiceDetailDiscount,
          fromJson: _invoiceDetailDiscountValue)
      double? discount,
      @JsonKey(
          readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
      double? total,
      @JsonKey(
          readValue: _invoiceDetailPaidTotal,
          fromJson: _invoiceDetailPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _invoiceDetailBalance,
          fromJson: _invoiceDetailBalanceValue)
      double? balance,
      @JsonKey(readValue: readJsonList) List<InvoiceLineItemModel>? items,
      @JsonKey(readValue: readJsonList)
      List<InvoicePaymentEntryModel>? payments});
}

/// @nodoc
class _$InvoiceDetailModelCopyWithImpl<$Res, $Val extends InvoiceDetailModel>
    implements $InvoiceDetailModelCopyWith<$Res> {
  _$InvoiceDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? status = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? subtotal = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? items = freezed,
    Object? payments = freezed,
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
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
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
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceLineItemModel>?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<InvoicePaymentEntryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDetailModelImplCopyWith<$Res>
    implements $InvoiceDetailModelCopyWith<$Res> {
  factory _$$InvoiceDetailModelImplCopyWith(_$InvoiceDetailModelImpl value,
          $Res Function(_$InvoiceDetailModelImpl) then) =
      __$$InvoiceDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
      int? id,
      @JsonKey(
          readValue: _invoiceDetailInvoiceNo,
          fromJson: _invoiceDetailInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _invoiceDetailStatus, fromJson: _invoiceDetailStatusValue)
      String? status,
      @JsonKey(
          readValue: _invoiceDetailIssueDate,
          fromJson: _invoiceDetailIssueDateValue)
      String? issueDate,
      @JsonKey(
          readValue: _invoiceDetailDueDate,
          fromJson: _invoiceDetailDueDateValue)
      String? dueDate,
      @JsonKey(
          readValue: _invoiceDetailSubtotal,
          fromJson: _invoiceDetailSubtotalValue)
      double? subtotal,
      @JsonKey(
          readValue: _invoiceDetailDiscount,
          fromJson: _invoiceDetailDiscountValue)
      double? discount,
      @JsonKey(
          readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
      double? total,
      @JsonKey(
          readValue: _invoiceDetailPaidTotal,
          fromJson: _invoiceDetailPaidTotalValue)
      double? paidTotal,
      @JsonKey(
          readValue: _invoiceDetailBalance,
          fromJson: _invoiceDetailBalanceValue)
      double? balance,
      @JsonKey(readValue: readJsonList) List<InvoiceLineItemModel>? items,
      @JsonKey(readValue: readJsonList)
      List<InvoicePaymentEntryModel>? payments});
}

/// @nodoc
class __$$InvoiceDetailModelImplCopyWithImpl<$Res>
    extends _$InvoiceDetailModelCopyWithImpl<$Res, _$InvoiceDetailModelImpl>
    implements _$$InvoiceDetailModelImplCopyWith<$Res> {
  __$$InvoiceDetailModelImplCopyWithImpl(_$InvoiceDetailModelImpl _value,
      $Res Function(_$InvoiceDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? status = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? subtotal = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? items = freezed,
    Object? payments = freezed,
  }) {
    return _then(_$InvoiceDetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
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
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceLineItemModel>?,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<InvoicePaymentEntryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InvoiceDetailModelImpl implements _InvoiceDetailModel {
  const _$InvoiceDetailModelImpl(
      {@JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
      this.id,
      @JsonKey(
          readValue: _invoiceDetailInvoiceNo,
          fromJson: _invoiceDetailInvoiceNoValue)
      this.invoiceNo,
      @JsonKey(
          readValue: _invoiceDetailStatus, fromJson: _invoiceDetailStatusValue)
      this.status,
      @JsonKey(
          readValue: _invoiceDetailIssueDate,
          fromJson: _invoiceDetailIssueDateValue)
      this.issueDate,
      @JsonKey(
          readValue: _invoiceDetailDueDate,
          fromJson: _invoiceDetailDueDateValue)
      this.dueDate,
      @JsonKey(
          readValue: _invoiceDetailSubtotal,
          fromJson: _invoiceDetailSubtotalValue)
      this.subtotal,
      @JsonKey(
          readValue: _invoiceDetailDiscount,
          fromJson: _invoiceDetailDiscountValue)
      this.discount,
      @JsonKey(
          readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
      this.total,
      @JsonKey(
          readValue: _invoiceDetailPaidTotal,
          fromJson: _invoiceDetailPaidTotalValue)
      this.paidTotal,
      @JsonKey(
          readValue: _invoiceDetailBalance,
          fromJson: _invoiceDetailBalanceValue)
      this.balance,
      @JsonKey(readValue: readJsonList) final List<InvoiceLineItemModel>? items,
      @JsonKey(readValue: readJsonList)
      final List<InvoicePaymentEntryModel>? payments})
      : _items = items,
        _payments = payments;

  factory _$InvoiceDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailModelImplFromJson(json);

  @override
  @JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _invoiceDetailInvoiceNo,
      fromJson: _invoiceDetailInvoiceNoValue)
  final String? invoiceNo;
  @override
  @JsonKey(readValue: _invoiceDetailStatus, fromJson: _invoiceDetailStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _invoiceDetailIssueDate,
      fromJson: _invoiceDetailIssueDateValue)
  final String? issueDate;
  @override
  @JsonKey(
      readValue: _invoiceDetailDueDate, fromJson: _invoiceDetailDueDateValue)
  final String? dueDate;
  @override
  @JsonKey(
      readValue: _invoiceDetailSubtotal, fromJson: _invoiceDetailSubtotalValue)
  final double? subtotal;
  @override
  @JsonKey(
      readValue: _invoiceDetailDiscount, fromJson: _invoiceDetailDiscountValue)
  final double? discount;
  @override
  @JsonKey(readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
  final double? total;
  @override
  @JsonKey(
      readValue: _invoiceDetailPaidTotal,
      fromJson: _invoiceDetailPaidTotalValue)
  final double? paidTotal;
  @override
  @JsonKey(
      readValue: _invoiceDetailBalance, fromJson: _invoiceDetailBalanceValue)
  final double? balance;
  final List<InvoiceLineItemModel>? _items;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoiceLineItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<InvoicePaymentEntryModel>? _payments;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoicePaymentEntryModel>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InvoiceDetailModel(id: $id, invoiceNo: $invoiceNo, status: $status, issueDate: $issueDate, dueDate: $dueDate, subtotal: $subtotal, discount: $discount, total: $total, paidTotal: $paidTotal, balance: $balance, items: $items, payments: $payments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidTotal, paidTotal) ||
                other.paidTotal == paidTotal) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNo,
      status,
      issueDate,
      dueDate,
      subtotal,
      discount,
      total,
      paidTotal,
      balance,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_payments));

  /// Create a copy of InvoiceDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailModelImplCopyWith<_$InvoiceDetailModelImpl> get copyWith =>
      __$$InvoiceDetailModelImplCopyWithImpl<_$InvoiceDetailModelImpl>(
          this, _$identity);
}

abstract class _InvoiceDetailModel implements InvoiceDetailModel {
  const factory _InvoiceDetailModel(
      {@JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
      final int? id,
      @JsonKey(
          readValue: _invoiceDetailInvoiceNo,
          fromJson: _invoiceDetailInvoiceNoValue)
      final String? invoiceNo,
      @JsonKey(
          readValue: _invoiceDetailStatus, fromJson: _invoiceDetailStatusValue)
      final String? status,
      @JsonKey(
          readValue: _invoiceDetailIssueDate,
          fromJson: _invoiceDetailIssueDateValue)
      final String? issueDate,
      @JsonKey(
          readValue: _invoiceDetailDueDate,
          fromJson: _invoiceDetailDueDateValue)
      final String? dueDate,
      @JsonKey(
          readValue: _invoiceDetailSubtotal,
          fromJson: _invoiceDetailSubtotalValue)
      final double? subtotal,
      @JsonKey(
          readValue: _invoiceDetailDiscount,
          fromJson: _invoiceDetailDiscountValue)
      final double? discount,
      @JsonKey(
          readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
      final double? total,
      @JsonKey(
          readValue: _invoiceDetailPaidTotal,
          fromJson: _invoiceDetailPaidTotalValue)
      final double? paidTotal,
      @JsonKey(
          readValue: _invoiceDetailBalance,
          fromJson: _invoiceDetailBalanceValue)
      final double? balance,
      @JsonKey(readValue: readJsonList) final List<InvoiceLineItemModel>? items,
      @JsonKey(readValue: readJsonList)
      final List<InvoicePaymentEntryModel>?
          payments}) = _$InvoiceDetailModelImpl;

  factory _InvoiceDetailModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailModelImpl.fromJson;

  @override
  @JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _invoiceDetailInvoiceNo,
      fromJson: _invoiceDetailInvoiceNoValue)
  String? get invoiceNo;
  @override
  @JsonKey(readValue: _invoiceDetailStatus, fromJson: _invoiceDetailStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _invoiceDetailIssueDate,
      fromJson: _invoiceDetailIssueDateValue)
  String? get issueDate;
  @override
  @JsonKey(
      readValue: _invoiceDetailDueDate, fromJson: _invoiceDetailDueDateValue)
  String? get dueDate;
  @override
  @JsonKey(
      readValue: _invoiceDetailSubtotal, fromJson: _invoiceDetailSubtotalValue)
  double? get subtotal;
  @override
  @JsonKey(
      readValue: _invoiceDetailDiscount, fromJson: _invoiceDetailDiscountValue)
  double? get discount;
  @override
  @JsonKey(readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
  double? get total;
  @override
  @JsonKey(
      readValue: _invoiceDetailPaidTotal,
      fromJson: _invoiceDetailPaidTotalValue)
  double? get paidTotal;
  @override
  @JsonKey(
      readValue: _invoiceDetailBalance, fromJson: _invoiceDetailBalanceValue)
  double? get balance;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoiceLineItemModel>? get items;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoicePaymentEntryModel>? get payments;

  /// Create a copy of InvoiceDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceDetailModelImplCopyWith<_$InvoiceDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudentParentInfoModel _$StudentParentInfoModelFromJson(
    Map<String, dynamic> json) {
  return _StudentParentInfoModel.fromJson(json);
}

/// @nodoc
mixin _$StudentParentInfoModel {
  @JsonKey(
      readValue: _studentParentInfoFatherName,
      fromJson: _studentParentInfoFatherNameValue)
  String? get fatherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentParentInfoMotherName,
      fromJson: _studentParentInfoMotherNameValue)
  String? get motherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentParentInfoFatherPhone,
      fromJson: _studentParentInfoFatherPhoneValue)
  String? get fatherPhone => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentParentInfoMotherPhone,
      fromJson: _studentParentInfoMotherPhoneValue)
  String? get motherPhone => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentParentInfoHomePhone,
      fromJson: _studentParentInfoHomePhoneValue)
  String? get homePhone => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentParentInfoAddress,
      fromJson: _studentParentInfoAddressValue)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentParentInfoEmail,
      fromJson: _studentParentInfoEmailValue)
  String? get email => throw _privateConstructorUsedError;

  /// Create a copy of StudentParentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentParentInfoModelCopyWith<StudentParentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentParentInfoModelCopyWith<$Res> {
  factory $StudentParentInfoModelCopyWith(StudentParentInfoModel value,
          $Res Function(StudentParentInfoModel) then) =
      _$StudentParentInfoModelCopyWithImpl<$Res, StudentParentInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _studentParentInfoFatherName,
          fromJson: _studentParentInfoFatherNameValue)
      String? fatherName,
      @JsonKey(
          readValue: _studentParentInfoMotherName,
          fromJson: _studentParentInfoMotherNameValue)
      String? motherName,
      @JsonKey(
          readValue: _studentParentInfoFatherPhone,
          fromJson: _studentParentInfoFatherPhoneValue)
      String? fatherPhone,
      @JsonKey(
          readValue: _studentParentInfoMotherPhone,
          fromJson: _studentParentInfoMotherPhoneValue)
      String? motherPhone,
      @JsonKey(
          readValue: _studentParentInfoHomePhone,
          fromJson: _studentParentInfoHomePhoneValue)
      String? homePhone,
      @JsonKey(
          readValue: _studentParentInfoAddress,
          fromJson: _studentParentInfoAddressValue)
      String? address,
      @JsonKey(
          readValue: _studentParentInfoEmail,
          fromJson: _studentParentInfoEmailValue)
      String? email});
}

/// @nodoc
class _$StudentParentInfoModelCopyWithImpl<$Res,
        $Val extends StudentParentInfoModel>
    implements $StudentParentInfoModelCopyWith<$Res> {
  _$StudentParentInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentParentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatherName = freezed,
    Object? motherName = freezed,
    Object? fatherPhone = freezed,
    Object? motherPhone = freezed,
    Object? homePhone = freezed,
    Object? address = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherPhone: freezed == fatherPhone
          ? _value.fatherPhone
          : fatherPhone // ignore: cast_nullable_to_non_nullable
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentParentInfoModelImplCopyWith<$Res>
    implements $StudentParentInfoModelCopyWith<$Res> {
  factory _$$StudentParentInfoModelImplCopyWith(
          _$StudentParentInfoModelImpl value,
          $Res Function(_$StudentParentInfoModelImpl) then) =
      __$$StudentParentInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _studentParentInfoFatherName,
          fromJson: _studentParentInfoFatherNameValue)
      String? fatherName,
      @JsonKey(
          readValue: _studentParentInfoMotherName,
          fromJson: _studentParentInfoMotherNameValue)
      String? motherName,
      @JsonKey(
          readValue: _studentParentInfoFatherPhone,
          fromJson: _studentParentInfoFatherPhoneValue)
      String? fatherPhone,
      @JsonKey(
          readValue: _studentParentInfoMotherPhone,
          fromJson: _studentParentInfoMotherPhoneValue)
      String? motherPhone,
      @JsonKey(
          readValue: _studentParentInfoHomePhone,
          fromJson: _studentParentInfoHomePhoneValue)
      String? homePhone,
      @JsonKey(
          readValue: _studentParentInfoAddress,
          fromJson: _studentParentInfoAddressValue)
      String? address,
      @JsonKey(
          readValue: _studentParentInfoEmail,
          fromJson: _studentParentInfoEmailValue)
      String? email});
}

/// @nodoc
class __$$StudentParentInfoModelImplCopyWithImpl<$Res>
    extends _$StudentParentInfoModelCopyWithImpl<$Res,
        _$StudentParentInfoModelImpl>
    implements _$$StudentParentInfoModelImplCopyWith<$Res> {
  __$$StudentParentInfoModelImplCopyWithImpl(
      _$StudentParentInfoModelImpl _value,
      $Res Function(_$StudentParentInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentParentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatherName = freezed,
    Object? motherName = freezed,
    Object? fatherPhone = freezed,
    Object? motherPhone = freezed,
    Object? homePhone = freezed,
    Object? address = freezed,
    Object? email = freezed,
  }) {
    return _then(_$StudentParentInfoModelImpl(
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      motherName: freezed == motherName
          ? _value.motherName
          : motherName // ignore: cast_nullable_to_non_nullable
              as String?,
      fatherPhone: freezed == fatherPhone
          ? _value.fatherPhone
          : fatherPhone // ignore: cast_nullable_to_non_nullable
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentParentInfoModelImpl implements _StudentParentInfoModel {
  const _$StudentParentInfoModelImpl(
      {@JsonKey(
          readValue: _studentParentInfoFatherName,
          fromJson: _studentParentInfoFatherNameValue)
      this.fatherName,
      @JsonKey(
          readValue: _studentParentInfoMotherName,
          fromJson: _studentParentInfoMotherNameValue)
      this.motherName,
      @JsonKey(
          readValue: _studentParentInfoFatherPhone,
          fromJson: _studentParentInfoFatherPhoneValue)
      this.fatherPhone,
      @JsonKey(
          readValue: _studentParentInfoMotherPhone,
          fromJson: _studentParentInfoMotherPhoneValue)
      this.motherPhone,
      @JsonKey(
          readValue: _studentParentInfoHomePhone,
          fromJson: _studentParentInfoHomePhoneValue)
      this.homePhone,
      @JsonKey(
          readValue: _studentParentInfoAddress,
          fromJson: _studentParentInfoAddressValue)
      this.address,
      @JsonKey(
          readValue: _studentParentInfoEmail,
          fromJson: _studentParentInfoEmailValue)
      this.email});

  factory _$StudentParentInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentParentInfoModelImplFromJson(json);

  @override
  @JsonKey(
      readValue: _studentParentInfoFatherName,
      fromJson: _studentParentInfoFatherNameValue)
  final String? fatherName;
  @override
  @JsonKey(
      readValue: _studentParentInfoMotherName,
      fromJson: _studentParentInfoMotherNameValue)
  final String? motherName;
  @override
  @JsonKey(
      readValue: _studentParentInfoFatherPhone,
      fromJson: _studentParentInfoFatherPhoneValue)
  final String? fatherPhone;
  @override
  @JsonKey(
      readValue: _studentParentInfoMotherPhone,
      fromJson: _studentParentInfoMotherPhoneValue)
  final String? motherPhone;
  @override
  @JsonKey(
      readValue: _studentParentInfoHomePhone,
      fromJson: _studentParentInfoHomePhoneValue)
  final String? homePhone;
  @override
  @JsonKey(
      readValue: _studentParentInfoAddress,
      fromJson: _studentParentInfoAddressValue)
  final String? address;
  @override
  @JsonKey(
      readValue: _studentParentInfoEmail,
      fromJson: _studentParentInfoEmailValue)
  final String? email;

  @override
  String toString() {
    return 'StudentParentInfoModel(fatherName: $fatherName, motherName: $motherName, fatherPhone: $fatherPhone, motherPhone: $motherPhone, homePhone: $homePhone, address: $address, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentParentInfoModelImpl &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.motherName, motherName) ||
                other.motherName == motherName) &&
            (identical(other.fatherPhone, fatherPhone) ||
                other.fatherPhone == fatherPhone) &&
            (identical(other.motherPhone, motherPhone) ||
                other.motherPhone == motherPhone) &&
            (identical(other.homePhone, homePhone) ||
                other.homePhone == homePhone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fatherName, motherName,
      fatherPhone, motherPhone, homePhone, address, email);

  /// Create a copy of StudentParentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentParentInfoModelImplCopyWith<_$StudentParentInfoModelImpl>
      get copyWith => __$$StudentParentInfoModelImplCopyWithImpl<
          _$StudentParentInfoModelImpl>(this, _$identity);
}

abstract class _StudentParentInfoModel implements StudentParentInfoModel {
  const factory _StudentParentInfoModel(
      {@JsonKey(
          readValue: _studentParentInfoFatherName,
          fromJson: _studentParentInfoFatherNameValue)
      final String? fatherName,
      @JsonKey(
          readValue: _studentParentInfoMotherName,
          fromJson: _studentParentInfoMotherNameValue)
      final String? motherName,
      @JsonKey(
          readValue: _studentParentInfoFatherPhone,
          fromJson: _studentParentInfoFatherPhoneValue)
      final String? fatherPhone,
      @JsonKey(
          readValue: _studentParentInfoMotherPhone,
          fromJson: _studentParentInfoMotherPhoneValue)
      final String? motherPhone,
      @JsonKey(
          readValue: _studentParentInfoHomePhone,
          fromJson: _studentParentInfoHomePhoneValue)
      final String? homePhone,
      @JsonKey(
          readValue: _studentParentInfoAddress,
          fromJson: _studentParentInfoAddressValue)
      final String? address,
      @JsonKey(
          readValue: _studentParentInfoEmail,
          fromJson: _studentParentInfoEmailValue)
      final String? email}) = _$StudentParentInfoModelImpl;

  factory _StudentParentInfoModel.fromJson(Map<String, dynamic> json) =
      _$StudentParentInfoModelImpl.fromJson;

  @override
  @JsonKey(
      readValue: _studentParentInfoFatherName,
      fromJson: _studentParentInfoFatherNameValue)
  String? get fatherName;
  @override
  @JsonKey(
      readValue: _studentParentInfoMotherName,
      fromJson: _studentParentInfoMotherNameValue)
  String? get motherName;
  @override
  @JsonKey(
      readValue: _studentParentInfoFatherPhone,
      fromJson: _studentParentInfoFatherPhoneValue)
  String? get fatherPhone;
  @override
  @JsonKey(
      readValue: _studentParentInfoMotherPhone,
      fromJson: _studentParentInfoMotherPhoneValue)
  String? get motherPhone;
  @override
  @JsonKey(
      readValue: _studentParentInfoHomePhone,
      fromJson: _studentParentInfoHomePhoneValue)
  String? get homePhone;
  @override
  @JsonKey(
      readValue: _studentParentInfoAddress,
      fromJson: _studentParentInfoAddressValue)
  String? get address;
  @override
  @JsonKey(
      readValue: _studentParentInfoEmail,
      fromJson: _studentParentInfoEmailValue)
  String? get email;

  /// Create a copy of StudentParentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentParentInfoModelImplCopyWith<_$StudentParentInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EnrollmentGroupModel _$EnrollmentGroupModelFromJson(Map<String, dynamic> json) {
  return _EnrollmentGroupModel.fromJson(json);
}

/// @nodoc
mixin _$EnrollmentGroupModel {
  @JsonKey(readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _enrollmentGroupName, fromJson: _enrollmentGroupNameValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentGroupCourseName,
      fromJson: _enrollmentGroupCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentGroupTeacherName,
      fromJson: _enrollmentGroupTeacherNameValue)
  String? get teacherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _enrollmentGroupTeacherPhone,
      fromJson: _enrollmentGroupTeacherPhoneValue)
  String? get teacherPhone => throw _privateConstructorUsedError;

  /// Create a copy of EnrollmentGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentGroupModelCopyWith<EnrollmentGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentGroupModelCopyWith<$Res> {
  factory $EnrollmentGroupModelCopyWith(EnrollmentGroupModel value,
          $Res Function(EnrollmentGroupModel) then) =
      _$EnrollmentGroupModelCopyWithImpl<$Res, EnrollmentGroupModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
      int? id,
      @JsonKey(
          readValue: _enrollmentGroupName, fromJson: _enrollmentGroupNameValue)
      String? name,
      @JsonKey(
          readValue: _enrollmentGroupCourseName,
          fromJson: _enrollmentGroupCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherName,
          fromJson: _enrollmentGroupTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherPhone,
          fromJson: _enrollmentGroupTeacherPhoneValue)
      String? teacherPhone});
}

/// @nodoc
class _$EnrollmentGroupModelCopyWithImpl<$Res,
        $Val extends EnrollmentGroupModel>
    implements $EnrollmentGroupModelCopyWith<$Res> {
  _$EnrollmentGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollmentGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? courseName = freezed,
    Object? teacherName = freezed,
    Object? teacherPhone = freezed,
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
      teacherPhone: freezed == teacherPhone
          ? _value.teacherPhone
          : teacherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnrollmentGroupModelImplCopyWith<$Res>
    implements $EnrollmentGroupModelCopyWith<$Res> {
  factory _$$EnrollmentGroupModelImplCopyWith(_$EnrollmentGroupModelImpl value,
          $Res Function(_$EnrollmentGroupModelImpl) then) =
      __$$EnrollmentGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
      int? id,
      @JsonKey(
          readValue: _enrollmentGroupName, fromJson: _enrollmentGroupNameValue)
      String? name,
      @JsonKey(
          readValue: _enrollmentGroupCourseName,
          fromJson: _enrollmentGroupCourseNameValue)
      String? courseName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherName,
          fromJson: _enrollmentGroupTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherPhone,
          fromJson: _enrollmentGroupTeacherPhoneValue)
      String? teacherPhone});
}

/// @nodoc
class __$$EnrollmentGroupModelImplCopyWithImpl<$Res>
    extends _$EnrollmentGroupModelCopyWithImpl<$Res, _$EnrollmentGroupModelImpl>
    implements _$$EnrollmentGroupModelImplCopyWith<$Res> {
  __$$EnrollmentGroupModelImplCopyWithImpl(_$EnrollmentGroupModelImpl _value,
      $Res Function(_$EnrollmentGroupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnrollmentGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? courseName = freezed,
    Object? teacherName = freezed,
    Object? teacherPhone = freezed,
  }) {
    return _then(_$EnrollmentGroupModelImpl(
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
      teacherPhone: freezed == teacherPhone
          ? _value.teacherPhone
          : teacherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EnrollmentGroupModelImpl implements _EnrollmentGroupModel {
  const _$EnrollmentGroupModelImpl(
      {@JsonKey(
          readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
      this.id,
      @JsonKey(
          readValue: _enrollmentGroupName, fromJson: _enrollmentGroupNameValue)
      this.name,
      @JsonKey(
          readValue: _enrollmentGroupCourseName,
          fromJson: _enrollmentGroupCourseNameValue)
      this.courseName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherName,
          fromJson: _enrollmentGroupTeacherNameValue)
      this.teacherName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherPhone,
          fromJson: _enrollmentGroupTeacherPhoneValue)
      this.teacherPhone});

  factory _$EnrollmentGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentGroupModelImplFromJson(json);

  @override
  @JsonKey(readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _enrollmentGroupName, fromJson: _enrollmentGroupNameValue)
  final String? name;
  @override
  @JsonKey(
      readValue: _enrollmentGroupCourseName,
      fromJson: _enrollmentGroupCourseNameValue)
  final String? courseName;
  @override
  @JsonKey(
      readValue: _enrollmentGroupTeacherName,
      fromJson: _enrollmentGroupTeacherNameValue)
  final String? teacherName;
  @override
  @JsonKey(
      readValue: _enrollmentGroupTeacherPhone,
      fromJson: _enrollmentGroupTeacherPhoneValue)
  final String? teacherPhone;

  @override
  String toString() {
    return 'EnrollmentGroupModel(id: $id, name: $name, courseName: $courseName, teacherName: $teacherName, teacherPhone: $teacherPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentGroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.teacherPhone, teacherPhone) ||
                other.teacherPhone == teacherPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, courseName, teacherName, teacherPhone);

  /// Create a copy of EnrollmentGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentGroupModelImplCopyWith<_$EnrollmentGroupModelImpl>
      get copyWith =>
          __$$EnrollmentGroupModelImplCopyWithImpl<_$EnrollmentGroupModelImpl>(
              this, _$identity);
}

abstract class _EnrollmentGroupModel implements EnrollmentGroupModel {
  const factory _EnrollmentGroupModel(
      {@JsonKey(
          readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
      final int? id,
      @JsonKey(
          readValue: _enrollmentGroupName, fromJson: _enrollmentGroupNameValue)
      final String? name,
      @JsonKey(
          readValue: _enrollmentGroupCourseName,
          fromJson: _enrollmentGroupCourseNameValue)
      final String? courseName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherName,
          fromJson: _enrollmentGroupTeacherNameValue)
      final String? teacherName,
      @JsonKey(
          readValue: _enrollmentGroupTeacherPhone,
          fromJson: _enrollmentGroupTeacherPhoneValue)
      final String? teacherPhone}) = _$EnrollmentGroupModelImpl;

  factory _EnrollmentGroupModel.fromJson(Map<String, dynamic> json) =
      _$EnrollmentGroupModelImpl.fromJson;

  @override
  @JsonKey(readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _enrollmentGroupName, fromJson: _enrollmentGroupNameValue)
  String? get name;
  @override
  @JsonKey(
      readValue: _enrollmentGroupCourseName,
      fromJson: _enrollmentGroupCourseNameValue)
  String? get courseName;
  @override
  @JsonKey(
      readValue: _enrollmentGroupTeacherName,
      fromJson: _enrollmentGroupTeacherNameValue)
  String? get teacherName;
  @override
  @JsonKey(
      readValue: _enrollmentGroupTeacherPhone,
      fromJson: _enrollmentGroupTeacherPhoneValue)
  String? get teacherPhone;

  /// Create a copy of EnrollmentGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentGroupModelImplCopyWith<_$EnrollmentGroupModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ActiveEnrollmentModel _$ActiveEnrollmentModelFromJson(
    Map<String, dynamic> json) {
  return _ActiveEnrollmentModel.fromJson(json);
}

/// @nodoc
mixin _$ActiveEnrollmentModel {
  @JsonKey(readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activeEnrollmentStatus,
      fromJson: _activeEnrollmentStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activeEnrollmentEnrolledAt,
      fromJson: _activeEnrollmentEnrolledAtValue)
  String? get enrolledAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activeEnrollmentLeftAt,
      fromJson: _activeEnrollmentLeftAtValue)
  String? get leftAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activeEnrollmentMemorizedPages,
      fromJson: _activeEnrollmentMemorizedPagesValue)
  int? get memorizedPages => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activeEnrollmentPoints,
      fromJson: _activeEnrollmentPointsValue)
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  EnrollmentGroupModel? get group => throw _privateConstructorUsedError;

  /// Create a copy of ActiveEnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveEnrollmentModelCopyWith<ActiveEnrollmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveEnrollmentModelCopyWith<$Res> {
  factory $ActiveEnrollmentModelCopyWith(ActiveEnrollmentModel value,
          $Res Function(ActiveEnrollmentModel) then) =
      _$ActiveEnrollmentModelCopyWithImpl<$Res, ActiveEnrollmentModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
      int? id,
      @JsonKey(
          readValue: _activeEnrollmentStatus,
          fromJson: _activeEnrollmentStatusValue)
      String? status,
      @JsonKey(
          readValue: _activeEnrollmentEnrolledAt,
          fromJson: _activeEnrollmentEnrolledAtValue)
      String? enrolledAt,
      @JsonKey(
          readValue: _activeEnrollmentLeftAt,
          fromJson: _activeEnrollmentLeftAtValue)
      String? leftAt,
      @JsonKey(
          readValue: _activeEnrollmentMemorizedPages,
          fromJson: _activeEnrollmentMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(
          readValue: _activeEnrollmentPoints,
          fromJson: _activeEnrollmentPointsValue)
      int? points,
      @JsonKey(readValue: readJsonMap) EnrollmentGroupModel? group});

  $EnrollmentGroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class _$ActiveEnrollmentModelCopyWithImpl<$Res,
        $Val extends ActiveEnrollmentModel>
    implements $ActiveEnrollmentModelCopyWith<$Res> {
  _$ActiveEnrollmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveEnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
    Object? leftAt = freezed,
    Object? memorizedPages = freezed,
    Object? points = freezed,
    Object? group = freezed,
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
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as EnrollmentGroupModel?,
    ) as $Val);
  }

  /// Create a copy of ActiveEnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EnrollmentGroupModelCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $EnrollmentGroupModelCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActiveEnrollmentModelImplCopyWith<$Res>
    implements $ActiveEnrollmentModelCopyWith<$Res> {
  factory _$$ActiveEnrollmentModelImplCopyWith(
          _$ActiveEnrollmentModelImpl value,
          $Res Function(_$ActiveEnrollmentModelImpl) then) =
      __$$ActiveEnrollmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
      int? id,
      @JsonKey(
          readValue: _activeEnrollmentStatus,
          fromJson: _activeEnrollmentStatusValue)
      String? status,
      @JsonKey(
          readValue: _activeEnrollmentEnrolledAt,
          fromJson: _activeEnrollmentEnrolledAtValue)
      String? enrolledAt,
      @JsonKey(
          readValue: _activeEnrollmentLeftAt,
          fromJson: _activeEnrollmentLeftAtValue)
      String? leftAt,
      @JsonKey(
          readValue: _activeEnrollmentMemorizedPages,
          fromJson: _activeEnrollmentMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(
          readValue: _activeEnrollmentPoints,
          fromJson: _activeEnrollmentPointsValue)
      int? points,
      @JsonKey(readValue: readJsonMap) EnrollmentGroupModel? group});

  @override
  $EnrollmentGroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class __$$ActiveEnrollmentModelImplCopyWithImpl<$Res>
    extends _$ActiveEnrollmentModelCopyWithImpl<$Res,
        _$ActiveEnrollmentModelImpl>
    implements _$$ActiveEnrollmentModelImplCopyWith<$Res> {
  __$$ActiveEnrollmentModelImplCopyWithImpl(_$ActiveEnrollmentModelImpl _value,
      $Res Function(_$ActiveEnrollmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActiveEnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
    Object? leftAt = freezed,
    Object? memorizedPages = freezed,
    Object? points = freezed,
    Object? group = freezed,
  }) {
    return _then(_$ActiveEnrollmentModelImpl(
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
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as EnrollmentGroupModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ActiveEnrollmentModelImpl implements _ActiveEnrollmentModel {
  const _$ActiveEnrollmentModelImpl(
      {@JsonKey(
          readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
      this.id,
      @JsonKey(
          readValue: _activeEnrollmentStatus,
          fromJson: _activeEnrollmentStatusValue)
      this.status,
      @JsonKey(
          readValue: _activeEnrollmentEnrolledAt,
          fromJson: _activeEnrollmentEnrolledAtValue)
      this.enrolledAt,
      @JsonKey(
          readValue: _activeEnrollmentLeftAt,
          fromJson: _activeEnrollmentLeftAtValue)
      this.leftAt,
      @JsonKey(
          readValue: _activeEnrollmentMemorizedPages,
          fromJson: _activeEnrollmentMemorizedPagesValue)
      this.memorizedPages,
      @JsonKey(
          readValue: _activeEnrollmentPoints,
          fromJson: _activeEnrollmentPointsValue)
      this.points,
      @JsonKey(readValue: readJsonMap) this.group});

  factory _$ActiveEnrollmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveEnrollmentModelImplFromJson(json);

  @override
  @JsonKey(readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _activeEnrollmentStatus,
      fromJson: _activeEnrollmentStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _activeEnrollmentEnrolledAt,
      fromJson: _activeEnrollmentEnrolledAtValue)
  final String? enrolledAt;
  @override
  @JsonKey(
      readValue: _activeEnrollmentLeftAt,
      fromJson: _activeEnrollmentLeftAtValue)
  final String? leftAt;
  @override
  @JsonKey(
      readValue: _activeEnrollmentMemorizedPages,
      fromJson: _activeEnrollmentMemorizedPagesValue)
  final int? memorizedPages;
  @override
  @JsonKey(
      readValue: _activeEnrollmentPoints,
      fromJson: _activeEnrollmentPointsValue)
  final int? points;
  @override
  @JsonKey(readValue: readJsonMap)
  final EnrollmentGroupModel? group;

  @override
  String toString() {
    return 'ActiveEnrollmentModel(id: $id, status: $status, enrolledAt: $enrolledAt, leftAt: $leftAt, memorizedPages: $memorizedPages, points: $points, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveEnrollmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.memorizedPages, memorizedPages) ||
                other.memorizedPages == memorizedPages) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, enrolledAt, leftAt,
      memorizedPages, points, group);

  /// Create a copy of ActiveEnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveEnrollmentModelImplCopyWith<_$ActiveEnrollmentModelImpl>
      get copyWith => __$$ActiveEnrollmentModelImplCopyWithImpl<
          _$ActiveEnrollmentModelImpl>(this, _$identity);
}

abstract class _ActiveEnrollmentModel implements ActiveEnrollmentModel {
  const factory _ActiveEnrollmentModel(
      {@JsonKey(
          readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
      final int? id,
      @JsonKey(
          readValue: _activeEnrollmentStatus,
          fromJson: _activeEnrollmentStatusValue)
      final String? status,
      @JsonKey(
          readValue: _activeEnrollmentEnrolledAt,
          fromJson: _activeEnrollmentEnrolledAtValue)
      final String? enrolledAt,
      @JsonKey(
          readValue: _activeEnrollmentLeftAt,
          fromJson: _activeEnrollmentLeftAtValue)
      final String? leftAt,
      @JsonKey(
          readValue: _activeEnrollmentMemorizedPages,
          fromJson: _activeEnrollmentMemorizedPagesValue)
      final int? memorizedPages,
      @JsonKey(
          readValue: _activeEnrollmentPoints,
          fromJson: _activeEnrollmentPointsValue)
      final int? points,
      @JsonKey(readValue: readJsonMap)
      final EnrollmentGroupModel? group}) = _$ActiveEnrollmentModelImpl;

  factory _ActiveEnrollmentModel.fromJson(Map<String, dynamic> json) =
      _$ActiveEnrollmentModelImpl.fromJson;

  @override
  @JsonKey(readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _activeEnrollmentStatus,
      fromJson: _activeEnrollmentStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _activeEnrollmentEnrolledAt,
      fromJson: _activeEnrollmentEnrolledAtValue)
  String? get enrolledAt;
  @override
  @JsonKey(
      readValue: _activeEnrollmentLeftAt,
      fromJson: _activeEnrollmentLeftAtValue)
  String? get leftAt;
  @override
  @JsonKey(
      readValue: _activeEnrollmentMemorizedPages,
      fromJson: _activeEnrollmentMemorizedPagesValue)
  int? get memorizedPages;
  @override
  @JsonKey(
      readValue: _activeEnrollmentPoints,
      fromJson: _activeEnrollmentPointsValue)
  int? get points;
  @override
  @JsonKey(readValue: readJsonMap)
  EnrollmentGroupModel? get group;

  /// Create a copy of ActiveEnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveEnrollmentModelImplCopyWith<_$ActiveEnrollmentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChildDetailModel _$ChildDetailModelFromJson(Map<String, dynamic> json) {
  return _ChildDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ChildDetailModel {
  @JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childDetailStudentNumber,
      fromJson: _childDetailStudentNumberValue)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childDetailFirstName, fromJson: _childDetailFirstNameValue)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childDetailBirthDate, fromJson: _childDetailBirthDateValue)
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childDetailGender, fromJson: _childDetailGenderValue)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childDetailGradeLevelName,
      fromJson: _childDetailGradeLevelNameValue)
  String? get gradeLevelName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childDetailQuranCurrentJuz,
      fromJson: _childDetailQuranCurrentJuzValue)
  int? get quranCurrentJuz => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childDetailSchoolName, fromJson: _childDetailSchoolNameValue)
  String? get schoolName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
  String? get joinedAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _childDetailMemorizedPages,
      fromJson: _childDetailMemorizedPagesValue)
  int? get memorizedPages => throw _privateConstructorUsedError;
  @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_enrollments', readValue: readJsonList)
  List<ActiveEnrollmentModel>? get activeEnrollments =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChildDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChildDetailModelCopyWith<ChildDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildDetailModelCopyWith<$Res> {
  factory $ChildDetailModelCopyWith(
          ChildDetailModel value, $Res Function(ChildDetailModel) then) =
      _$ChildDetailModelCopyWithImpl<$Res, ChildDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue)
      int? id,
      @JsonKey(
          readValue: _childDetailStudentNumber,
          fromJson: _childDetailStudentNumberValue)
      String? studentNumber,
      @JsonKey(readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
      String? fullName,
      @JsonKey(readValue: _childDetailFirstName, fromJson: _childDetailFirstNameValue)
      String? firstName,
      @JsonKey(readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
      String? lastName,
      @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
      String? status,
      @JsonKey(
          readValue: _childDetailBirthDate,
          fromJson: _childDetailBirthDateValue)
      String? birthDate,
      @JsonKey(readValue: _childDetailGender, fromJson: _childDetailGenderValue)
      String? gender,
      @JsonKey(
          readValue: _childDetailGradeLevelName,
          fromJson: _childDetailGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(
          readValue: _childDetailQuranCurrentJuz,
          fromJson: _childDetailQuranCurrentJuzValue)
      int? quranCurrentJuz,
      @JsonKey(
          readValue: _childDetailSchoolName,
          fromJson: _childDetailSchoolNameValue)
      String? schoolName,
      @JsonKey(readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
      String? joinedAt,
      @JsonKey(
          readValue: _childDetailMemorizedPages,
          fromJson: _childDetailMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
      int? points,
      @JsonKey(name: 'active_enrollments', readValue: readJsonList)
      List<ActiveEnrollmentModel>? activeEnrollments});
}

/// @nodoc
class _$ChildDetailModelCopyWithImpl<$Res, $Val extends ChildDetailModel>
    implements $ChildDetailModelCopyWith<$Res> {
  _$ChildDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChildDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentNumber = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? gradeLevelName = freezed,
    Object? quranCurrentJuz = freezed,
    Object? schoolName = freezed,
    Object? joinedAt = freezed,
    Object? memorizedPages = freezed,
    Object? points = freezed,
    Object? activeEnrollments = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      activeEnrollments: freezed == activeEnrollments
          ? _value.activeEnrollments
          : activeEnrollments // ignore: cast_nullable_to_non_nullable
              as List<ActiveEnrollmentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChildDetailModelImplCopyWith<$Res>
    implements $ChildDetailModelCopyWith<$Res> {
  factory _$$ChildDetailModelImplCopyWith(_$ChildDetailModelImpl value,
          $Res Function(_$ChildDetailModelImpl) then) =
      __$$ChildDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue)
      int? id,
      @JsonKey(
          readValue: _childDetailStudentNumber,
          fromJson: _childDetailStudentNumberValue)
      String? studentNumber,
      @JsonKey(readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
      String? fullName,
      @JsonKey(readValue: _childDetailFirstName, fromJson: _childDetailFirstNameValue)
      String? firstName,
      @JsonKey(readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
      String? lastName,
      @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
      String? status,
      @JsonKey(
          readValue: _childDetailBirthDate,
          fromJson: _childDetailBirthDateValue)
      String? birthDate,
      @JsonKey(readValue: _childDetailGender, fromJson: _childDetailGenderValue)
      String? gender,
      @JsonKey(
          readValue: _childDetailGradeLevelName,
          fromJson: _childDetailGradeLevelNameValue)
      String? gradeLevelName,
      @JsonKey(
          readValue: _childDetailQuranCurrentJuz,
          fromJson: _childDetailQuranCurrentJuzValue)
      int? quranCurrentJuz,
      @JsonKey(
          readValue: _childDetailSchoolName,
          fromJson: _childDetailSchoolNameValue)
      String? schoolName,
      @JsonKey(readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
      String? joinedAt,
      @JsonKey(
          readValue: _childDetailMemorizedPages,
          fromJson: _childDetailMemorizedPagesValue)
      int? memorizedPages,
      @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
      int? points,
      @JsonKey(name: 'active_enrollments', readValue: readJsonList)
      List<ActiveEnrollmentModel>? activeEnrollments});
}

/// @nodoc
class __$$ChildDetailModelImplCopyWithImpl<$Res>
    extends _$ChildDetailModelCopyWithImpl<$Res, _$ChildDetailModelImpl>
    implements _$$ChildDetailModelImplCopyWith<$Res> {
  __$$ChildDetailModelImplCopyWithImpl(_$ChildDetailModelImpl _value,
      $Res Function(_$ChildDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChildDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentNumber = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? gradeLevelName = freezed,
    Object? quranCurrentJuz = freezed,
    Object? schoolName = freezed,
    Object? joinedAt = freezed,
    Object? memorizedPages = freezed,
    Object? points = freezed,
    Object? activeEnrollments = freezed,
  }) {
    return _then(_$ChildDetailModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelName: freezed == gradeLevelName
          ? _value.gradeLevelName
          : gradeLevelName // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      activeEnrollments: freezed == activeEnrollments
          ? _value._activeEnrollments
          : activeEnrollments // ignore: cast_nullable_to_non_nullable
              as List<ActiveEnrollmentModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ChildDetailModelImpl implements _ChildDetailModel {
  const _$ChildDetailModelImpl(
      {@JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue)
      this.id,
      @JsonKey(
          readValue: _childDetailStudentNumber,
          fromJson: _childDetailStudentNumberValue)
      this.studentNumber,
      @JsonKey(
          readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
      this.fullName,
      @JsonKey(
          readValue: _childDetailFirstName,
          fromJson: _childDetailFirstNameValue)
      this.firstName,
      @JsonKey(
          readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
      this.lastName,
      @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
      this.status,
      @JsonKey(
          readValue: _childDetailBirthDate,
          fromJson: _childDetailBirthDateValue)
      this.birthDate,
      @JsonKey(readValue: _childDetailGender, fromJson: _childDetailGenderValue)
      this.gender,
      @JsonKey(
          readValue: _childDetailGradeLevelName,
          fromJson: _childDetailGradeLevelNameValue)
      this.gradeLevelName,
      @JsonKey(
          readValue: _childDetailQuranCurrentJuz,
          fromJson: _childDetailQuranCurrentJuzValue)
      this.quranCurrentJuz,
      @JsonKey(
          readValue: _childDetailSchoolName,
          fromJson: _childDetailSchoolNameValue)
      this.schoolName,
      @JsonKey(
          readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
      this.joinedAt,
      @JsonKey(
          readValue: _childDetailMemorizedPages,
          fromJson: _childDetailMemorizedPagesValue)
      this.memorizedPages,
      @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
      this.points,
      @JsonKey(name: 'active_enrollments', readValue: readJsonList)
      final List<ActiveEnrollmentModel>? activeEnrollments})
      : _activeEnrollments = activeEnrollments;

  factory _$ChildDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChildDetailModelImplFromJson(json);

  @override
  @JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _childDetailStudentNumber,
      fromJson: _childDetailStudentNumberValue)
  final String? studentNumber;
  @override
  @JsonKey(readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
  final String? fullName;
  @override
  @JsonKey(
      readValue: _childDetailFirstName, fromJson: _childDetailFirstNameValue)
  final String? firstName;
  @override
  @JsonKey(readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
  final String? lastName;
  @override
  @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _childDetailBirthDate, fromJson: _childDetailBirthDateValue)
  final String? birthDate;
  @override
  @JsonKey(readValue: _childDetailGender, fromJson: _childDetailGenderValue)
  final String? gender;
  @override
  @JsonKey(
      readValue: _childDetailGradeLevelName,
      fromJson: _childDetailGradeLevelNameValue)
  final String? gradeLevelName;
  @override
  @JsonKey(
      readValue: _childDetailQuranCurrentJuz,
      fromJson: _childDetailQuranCurrentJuzValue)
  final int? quranCurrentJuz;
  @override
  @JsonKey(
      readValue: _childDetailSchoolName, fromJson: _childDetailSchoolNameValue)
  final String? schoolName;
  @override
  @JsonKey(readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
  final String? joinedAt;
  @override
  @JsonKey(
      readValue: _childDetailMemorizedPages,
      fromJson: _childDetailMemorizedPagesValue)
  final int? memorizedPages;
  @override
  @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
  final int? points;
  final List<ActiveEnrollmentModel>? _activeEnrollments;
  @override
  @JsonKey(name: 'active_enrollments', readValue: readJsonList)
  List<ActiveEnrollmentModel>? get activeEnrollments {
    final value = _activeEnrollments;
    if (value == null) return null;
    if (_activeEnrollments is EqualUnmodifiableListView)
      return _activeEnrollments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChildDetailModel(id: $id, studentNumber: $studentNumber, fullName: $fullName, firstName: $firstName, lastName: $lastName, status: $status, birthDate: $birthDate, gender: $gender, gradeLevelName: $gradeLevelName, quranCurrentJuz: $quranCurrentJuz, schoolName: $schoolName, joinedAt: $joinedAt, memorizedPages: $memorizedPages, points: $points, activeEnrollments: $activeEnrollments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChildDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.gradeLevelName, gradeLevelName) ||
                other.gradeLevelName == gradeLevelName) &&
            (identical(other.quranCurrentJuz, quranCurrentJuz) ||
                other.quranCurrentJuz == quranCurrentJuz) &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.memorizedPages, memorizedPages) ||
                other.memorizedPages == memorizedPages) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality()
                .equals(other._activeEnrollments, _activeEnrollments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      studentNumber,
      fullName,
      firstName,
      lastName,
      status,
      birthDate,
      gender,
      gradeLevelName,
      quranCurrentJuz,
      schoolName,
      joinedAt,
      memorizedPages,
      points,
      const DeepCollectionEquality().hash(_activeEnrollments));

  /// Create a copy of ChildDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChildDetailModelImplCopyWith<_$ChildDetailModelImpl> get copyWith =>
      __$$ChildDetailModelImplCopyWithImpl<_$ChildDetailModelImpl>(
          this, _$identity);
}

abstract class _ChildDetailModel implements ChildDetailModel {
  const factory _ChildDetailModel(
      {@JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue)
      final int? id,
      @JsonKey(
          readValue: _childDetailStudentNumber,
          fromJson: _childDetailStudentNumberValue)
      final String? studentNumber,
      @JsonKey(readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
      final String? fullName,
      @JsonKey(
          readValue: _childDetailFirstName,
          fromJson: _childDetailFirstNameValue)
      final String? firstName,
      @JsonKey(
          readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
      final String? lastName,
      @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
      final String? status,
      @JsonKey(
          readValue: _childDetailBirthDate,
          fromJson: _childDetailBirthDateValue)
      final String? birthDate,
      @JsonKey(readValue: _childDetailGender, fromJson: _childDetailGenderValue)
      final String? gender,
      @JsonKey(
          readValue: _childDetailGradeLevelName,
          fromJson: _childDetailGradeLevelNameValue)
      final String? gradeLevelName,
      @JsonKey(
          readValue: _childDetailQuranCurrentJuz,
          fromJson: _childDetailQuranCurrentJuzValue)
      final int? quranCurrentJuz,
      @JsonKey(
          readValue: _childDetailSchoolName,
          fromJson: _childDetailSchoolNameValue)
      final String? schoolName,
      @JsonKey(
          readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
      final String? joinedAt,
      @JsonKey(
          readValue: _childDetailMemorizedPages,
          fromJson: _childDetailMemorizedPagesValue)
      final int? memorizedPages,
      @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
      final int? points,
      @JsonKey(name: 'active_enrollments', readValue: readJsonList)
      final List<ActiveEnrollmentModel>? activeEnrollments}) = _$ChildDetailModelImpl;

  factory _ChildDetailModel.fromJson(Map<String, dynamic> json) =
      _$ChildDetailModelImpl.fromJson;

  @override
  @JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _childDetailStudentNumber,
      fromJson: _childDetailStudentNumberValue)
  String? get studentNumber;
  @override
  @JsonKey(readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
  String? get fullName;
  @override
  @JsonKey(
      readValue: _childDetailFirstName, fromJson: _childDetailFirstNameValue)
  String? get firstName;
  @override
  @JsonKey(readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
  String? get lastName;
  @override
  @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _childDetailBirthDate, fromJson: _childDetailBirthDateValue)
  String? get birthDate;
  @override
  @JsonKey(readValue: _childDetailGender, fromJson: _childDetailGenderValue)
  String? get gender;
  @override
  @JsonKey(
      readValue: _childDetailGradeLevelName,
      fromJson: _childDetailGradeLevelNameValue)
  String? get gradeLevelName;
  @override
  @JsonKey(
      readValue: _childDetailQuranCurrentJuz,
      fromJson: _childDetailQuranCurrentJuzValue)
  int? get quranCurrentJuz;
  @override
  @JsonKey(
      readValue: _childDetailSchoolName, fromJson: _childDetailSchoolNameValue)
  String? get schoolName;
  @override
  @JsonKey(readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
  String? get joinedAt;
  @override
  @JsonKey(
      readValue: _childDetailMemorizedPages,
      fromJson: _childDetailMemorizedPagesValue)
  int? get memorizedPages;
  @override
  @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
  int? get points;
  @override
  @JsonKey(name: 'active_enrollments', readValue: readJsonList)
  List<ActiveEnrollmentModel>? get activeEnrollments;

  /// Create a copy of ChildDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChildDetailModelImplCopyWith<_$ChildDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuranTestAttemptModel _$QuranTestAttemptModelFromJson(
    Map<String, dynamic> json) {
  return _QuranTestAttemptModel.fromJson(json);
}

/// @nodoc
mixin _$QuranTestAttemptModel {
  @JsonKey(readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestAttemptTestedOn,
      fromJson: _quranTestAttemptTestedOnValue)
  DateTime? get testedOn => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestAttemptScore, fromJson: _quranTestAttemptScoreValue)
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestAttemptStatus,
      fromJson: _quranTestAttemptStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestAttemptAttemptNo,
      fromJson: _quranTestAttemptAttemptNoValue)
  int? get attemptNo => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestAttemptTeacherName,
      fromJson: _quranTestAttemptTeacherNameValue)
  String? get teacherName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestAttemptNotes, fromJson: _quranTestAttemptNotesValue)
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of QuranTestAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranTestAttemptModelCopyWith<QuranTestAttemptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranTestAttemptModelCopyWith<$Res> {
  factory $QuranTestAttemptModelCopyWith(QuranTestAttemptModel value,
          $Res Function(QuranTestAttemptModel) then) =
      _$QuranTestAttemptModelCopyWithImpl<$Res, QuranTestAttemptModel>;
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
      int? id,
      @JsonKey(
          readValue: _quranTestAttemptTestedOn,
          fromJson: _quranTestAttemptTestedOnValue)
      DateTime? testedOn,
      @JsonKey(
          readValue: _quranTestAttemptScore,
          fromJson: _quranTestAttemptScoreValue)
      double? score,
      @JsonKey(
          readValue: _quranTestAttemptStatus,
          fromJson: _quranTestAttemptStatusValue)
      String? status,
      @JsonKey(
          readValue: _quranTestAttemptAttemptNo,
          fromJson: _quranTestAttemptAttemptNoValue)
      int? attemptNo,
      @JsonKey(
          readValue: _quranTestAttemptTeacherName,
          fromJson: _quranTestAttemptTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _quranTestAttemptNotes,
          fromJson: _quranTestAttemptNotesValue)
      String? notes});
}

/// @nodoc
class _$QuranTestAttemptModelCopyWithImpl<$Res,
        $Val extends QuranTestAttemptModel>
    implements $QuranTestAttemptModelCopyWith<$Res> {
  _$QuranTestAttemptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranTestAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? testedOn = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? attemptNo = freezed,
    Object? teacherName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuranTestAttemptModelImplCopyWith<$Res>
    implements $QuranTestAttemptModelCopyWith<$Res> {
  factory _$$QuranTestAttemptModelImplCopyWith(
          _$QuranTestAttemptModelImpl value,
          $Res Function(_$QuranTestAttemptModelImpl) then) =
      __$$QuranTestAttemptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
      int? id,
      @JsonKey(
          readValue: _quranTestAttemptTestedOn,
          fromJson: _quranTestAttemptTestedOnValue)
      DateTime? testedOn,
      @JsonKey(
          readValue: _quranTestAttemptScore,
          fromJson: _quranTestAttemptScoreValue)
      double? score,
      @JsonKey(
          readValue: _quranTestAttemptStatus,
          fromJson: _quranTestAttemptStatusValue)
      String? status,
      @JsonKey(
          readValue: _quranTestAttemptAttemptNo,
          fromJson: _quranTestAttemptAttemptNoValue)
      int? attemptNo,
      @JsonKey(
          readValue: _quranTestAttemptTeacherName,
          fromJson: _quranTestAttemptTeacherNameValue)
      String? teacherName,
      @JsonKey(
          readValue: _quranTestAttemptNotes,
          fromJson: _quranTestAttemptNotesValue)
      String? notes});
}

/// @nodoc
class __$$QuranTestAttemptModelImplCopyWithImpl<$Res>
    extends _$QuranTestAttemptModelCopyWithImpl<$Res,
        _$QuranTestAttemptModelImpl>
    implements _$$QuranTestAttemptModelImplCopyWith<$Res> {
  __$$QuranTestAttemptModelImplCopyWithImpl(_$QuranTestAttemptModelImpl _value,
      $Res Function(_$QuranTestAttemptModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranTestAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? testedOn = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? attemptNo = freezed,
    Object? teacherName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$QuranTestAttemptModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
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
class _$QuranTestAttemptModelImpl implements _QuranTestAttemptModel {
  const _$QuranTestAttemptModelImpl(
      {@JsonKey(
          readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
      this.id,
      @JsonKey(
          readValue: _quranTestAttemptTestedOn,
          fromJson: _quranTestAttemptTestedOnValue)
      this.testedOn,
      @JsonKey(
          readValue: _quranTestAttemptScore,
          fromJson: _quranTestAttemptScoreValue)
      this.score,
      @JsonKey(
          readValue: _quranTestAttemptStatus,
          fromJson: _quranTestAttemptStatusValue)
      this.status,
      @JsonKey(
          readValue: _quranTestAttemptAttemptNo,
          fromJson: _quranTestAttemptAttemptNoValue)
      this.attemptNo,
      @JsonKey(
          readValue: _quranTestAttemptTeacherName,
          fromJson: _quranTestAttemptTeacherNameValue)
      this.teacherName,
      @JsonKey(
          readValue: _quranTestAttemptNotes,
          fromJson: _quranTestAttemptNotesValue)
      this.notes});

  factory _$QuranTestAttemptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranTestAttemptModelImplFromJson(json);

  @override
  @JsonKey(readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _quranTestAttemptTestedOn,
      fromJson: _quranTestAttemptTestedOnValue)
  final DateTime? testedOn;
  @override
  @JsonKey(
      readValue: _quranTestAttemptScore, fromJson: _quranTestAttemptScoreValue)
  final double? score;
  @override
  @JsonKey(
      readValue: _quranTestAttemptStatus,
      fromJson: _quranTestAttemptStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _quranTestAttemptAttemptNo,
      fromJson: _quranTestAttemptAttemptNoValue)
  final int? attemptNo;
  @override
  @JsonKey(
      readValue: _quranTestAttemptTeacherName,
      fromJson: _quranTestAttemptTeacherNameValue)
  final String? teacherName;
  @override
  @JsonKey(
      readValue: _quranTestAttemptNotes, fromJson: _quranTestAttemptNotesValue)
  final String? notes;

  @override
  String toString() {
    return 'QuranTestAttemptModel(id: $id, testedOn: $testedOn, score: $score, status: $status, attemptNo: $attemptNo, teacherName: $teacherName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranTestAttemptModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testedOn, testedOn) ||
                other.testedOn == testedOn) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.attemptNo, attemptNo) ||
                other.attemptNo == attemptNo) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, testedOn, score, status, attemptNo, teacherName, notes);

  /// Create a copy of QuranTestAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranTestAttemptModelImplCopyWith<_$QuranTestAttemptModelImpl>
      get copyWith => __$$QuranTestAttemptModelImplCopyWithImpl<
          _$QuranTestAttemptModelImpl>(this, _$identity);
}

abstract class _QuranTestAttemptModel implements QuranTestAttemptModel {
  const factory _QuranTestAttemptModel(
      {@JsonKey(
          readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
      final int? id,
      @JsonKey(
          readValue: _quranTestAttemptTestedOn,
          fromJson: _quranTestAttemptTestedOnValue)
      final DateTime? testedOn,
      @JsonKey(
          readValue: _quranTestAttemptScore,
          fromJson: _quranTestAttemptScoreValue)
      final double? score,
      @JsonKey(
          readValue: _quranTestAttemptStatus,
          fromJson: _quranTestAttemptStatusValue)
      final String? status,
      @JsonKey(
          readValue: _quranTestAttemptAttemptNo,
          fromJson: _quranTestAttemptAttemptNoValue)
      final int? attemptNo,
      @JsonKey(
          readValue: _quranTestAttemptTeacherName,
          fromJson: _quranTestAttemptTeacherNameValue)
      final String? teacherName,
      @JsonKey(
          readValue: _quranTestAttemptNotes,
          fromJson: _quranTestAttemptNotesValue)
      final String? notes}) = _$QuranTestAttemptModelImpl;

  factory _QuranTestAttemptModel.fromJson(Map<String, dynamic> json) =
      _$QuranTestAttemptModelImpl.fromJson;

  @override
  @JsonKey(readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _quranTestAttemptTestedOn,
      fromJson: _quranTestAttemptTestedOnValue)
  DateTime? get testedOn;
  @override
  @JsonKey(
      readValue: _quranTestAttemptScore, fromJson: _quranTestAttemptScoreValue)
  double? get score;
  @override
  @JsonKey(
      readValue: _quranTestAttemptStatus,
      fromJson: _quranTestAttemptStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _quranTestAttemptAttemptNo,
      fromJson: _quranTestAttemptAttemptNoValue)
  int? get attemptNo;
  @override
  @JsonKey(
      readValue: _quranTestAttemptTeacherName,
      fromJson: _quranTestAttemptTeacherNameValue)
  String? get teacherName;
  @override
  @JsonKey(
      readValue: _quranTestAttemptNotes, fromJson: _quranTestAttemptNotesValue)
  String? get notes;

  /// Create a copy of QuranTestAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranTestAttemptModelImplCopyWith<_$QuranTestAttemptModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuranTestPartModel _$QuranTestPartModelFromJson(Map<String, dynamic> json) {
  return _QuranTestPartModel.fromJson(json);
}

/// @nodoc
mixin _$QuranTestPartModel {
  @JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestPartPartNumber,
      fromJson: _quranTestPartPartNumberValue)
  int? get partNumber => throw _privateConstructorUsedError;
  @JsonKey(readValue: _quranTestPartStatus, fromJson: _quranTestPartStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestPartPassedOn, fromJson: _quranTestPartPassedOnValue)
  String? get passedOn => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<QuranTestAttemptModel>? get attempts =>
      throw _privateConstructorUsedError;

  /// Create a copy of QuranTestPartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranTestPartModelCopyWith<QuranTestPartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranTestPartModelCopyWith<$Res> {
  factory $QuranTestPartModelCopyWith(
          QuranTestPartModel value, $Res Function(QuranTestPartModel) then) =
      _$QuranTestPartModelCopyWithImpl<$Res, QuranTestPartModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
      int? id,
      @JsonKey(
          readValue: _quranTestPartPartNumber,
          fromJson: _quranTestPartPartNumberValue)
      int? partNumber,
      @JsonKey(
          readValue: _quranTestPartStatus, fromJson: _quranTestPartStatusValue)
      String? status,
      @JsonKey(
          readValue: _quranTestPartPassedOn,
          fromJson: _quranTestPartPassedOnValue)
      String? passedOn,
      @JsonKey(readValue: readJsonList) List<QuranTestAttemptModel>? attempts});
}

/// @nodoc
class _$QuranTestPartModelCopyWithImpl<$Res, $Val extends QuranTestPartModel>
    implements $QuranTestPartModelCopyWith<$Res> {
  _$QuranTestPartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranTestPartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? partNumber = freezed,
    Object? status = freezed,
    Object? passedOn = freezed,
    Object? attempts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      partNumber: freezed == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      passedOn: freezed == passedOn
          ? _value.passedOn
          : passedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      attempts: freezed == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<QuranTestAttemptModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuranTestPartModelImplCopyWith<$Res>
    implements $QuranTestPartModelCopyWith<$Res> {
  factory _$$QuranTestPartModelImplCopyWith(_$QuranTestPartModelImpl value,
          $Res Function(_$QuranTestPartModelImpl) then) =
      __$$QuranTestPartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
      int? id,
      @JsonKey(
          readValue: _quranTestPartPartNumber,
          fromJson: _quranTestPartPartNumberValue)
      int? partNumber,
      @JsonKey(
          readValue: _quranTestPartStatus, fromJson: _quranTestPartStatusValue)
      String? status,
      @JsonKey(
          readValue: _quranTestPartPassedOn,
          fromJson: _quranTestPartPassedOnValue)
      String? passedOn,
      @JsonKey(readValue: readJsonList) List<QuranTestAttemptModel>? attempts});
}

/// @nodoc
class __$$QuranTestPartModelImplCopyWithImpl<$Res>
    extends _$QuranTestPartModelCopyWithImpl<$Res, _$QuranTestPartModelImpl>
    implements _$$QuranTestPartModelImplCopyWith<$Res> {
  __$$QuranTestPartModelImplCopyWithImpl(_$QuranTestPartModelImpl _value,
      $Res Function(_$QuranTestPartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranTestPartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? partNumber = freezed,
    Object? status = freezed,
    Object? passedOn = freezed,
    Object? attempts = freezed,
  }) {
    return _then(_$QuranTestPartModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      partNumber: freezed == partNumber
          ? _value.partNumber
          : partNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      passedOn: freezed == passedOn
          ? _value.passedOn
          : passedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      attempts: freezed == attempts
          ? _value._attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<QuranTestAttemptModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$QuranTestPartModelImpl implements _QuranTestPartModel {
  const _$QuranTestPartModelImpl(
      {@JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
      this.id,
      @JsonKey(
          readValue: _quranTestPartPartNumber,
          fromJson: _quranTestPartPartNumberValue)
      this.partNumber,
      @JsonKey(
          readValue: _quranTestPartStatus, fromJson: _quranTestPartStatusValue)
      this.status,
      @JsonKey(
          readValue: _quranTestPartPassedOn,
          fromJson: _quranTestPartPassedOnValue)
      this.passedOn,
      @JsonKey(readValue: readJsonList)
      final List<QuranTestAttemptModel>? attempts})
      : _attempts = attempts;

  factory _$QuranTestPartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranTestPartModelImplFromJson(json);

  @override
  @JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
  final int? id;
  @override
  @JsonKey(
      readValue: _quranTestPartPartNumber,
      fromJson: _quranTestPartPartNumberValue)
  final int? partNumber;
  @override
  @JsonKey(readValue: _quranTestPartStatus, fromJson: _quranTestPartStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _quranTestPartPassedOn, fromJson: _quranTestPartPassedOnValue)
  final String? passedOn;
  final List<QuranTestAttemptModel>? _attempts;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranTestAttemptModel>? get attempts {
    final value = _attempts;
    if (value == null) return null;
    if (_attempts is EqualUnmodifiableListView) return _attempts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuranTestPartModel(id: $id, partNumber: $partNumber, status: $status, passedOn: $passedOn, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranTestPartModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partNumber, partNumber) ||
                other.partNumber == partNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.passedOn, passedOn) ||
                other.passedOn == passedOn) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, partNumber, status, passedOn,
      const DeepCollectionEquality().hash(_attempts));

  /// Create a copy of QuranTestPartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranTestPartModelImplCopyWith<_$QuranTestPartModelImpl> get copyWith =>
      __$$QuranTestPartModelImplCopyWithImpl<_$QuranTestPartModelImpl>(
          this, _$identity);
}

abstract class _QuranTestPartModel implements QuranTestPartModel {
  const factory _QuranTestPartModel(
      {@JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
      final int? id,
      @JsonKey(
          readValue: _quranTestPartPartNumber,
          fromJson: _quranTestPartPartNumberValue)
      final int? partNumber,
      @JsonKey(
          readValue: _quranTestPartStatus, fromJson: _quranTestPartStatusValue)
      final String? status,
      @JsonKey(
          readValue: _quranTestPartPassedOn,
          fromJson: _quranTestPartPassedOnValue)
      final String? passedOn,
      @JsonKey(readValue: readJsonList)
      final List<QuranTestAttemptModel>? attempts}) = _$QuranTestPartModelImpl;

  factory _QuranTestPartModel.fromJson(Map<String, dynamic> json) =
      _$QuranTestPartModelImpl.fromJson;

  @override
  @JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
  int? get id;
  @override
  @JsonKey(
      readValue: _quranTestPartPartNumber,
      fromJson: _quranTestPartPartNumberValue)
  int? get partNumber;
  @override
  @JsonKey(readValue: _quranTestPartStatus, fromJson: _quranTestPartStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _quranTestPartPassedOn, fromJson: _quranTestPartPassedOnValue)
  String? get passedOn;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranTestAttemptModel>? get attempts;

  /// Create a copy of QuranTestPartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranTestPartModelImplCopyWith<_$QuranTestPartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuranTestEntryModel _$QuranTestEntryModelFromJson(Map<String, dynamic> json) {
  return _QuranTestEntryModel.fromJson(json);
}

/// @nodoc
mixin _$QuranTestEntryModel {
  @JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
  String? get kind => throw _privateConstructorUsedError;
  @JsonKey(readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestEntryStatus, fromJson: _quranTestEntryStatusValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestEntryJuzNumber,
      fromJson: _quranTestEntryJuzNumberValue)
  int? get juzNumber => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestEntryJuzFromPage,
      fromJson: _quranTestEntryJuzFromPageValue)
  int? get juzFromPage => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestEntryJuzToPage,
      fromJson: _quranTestEntryJuzToPageValue)
  int? get juzToPage => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestEntryGroupName,
      fromJson: _quranTestEntryGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _quranTestEntryTeacherName,
      fromJson: _quranTestEntryTeacherNameValue)
  String? get teacherName => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<QuranTestPartModel>? get parts => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<QuranTestAttemptModel>? get attempts =>
      throw _privateConstructorUsedError;

  /// Create a copy of QuranTestEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranTestEntryModelCopyWith<QuranTestEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranTestEntryModelCopyWith<$Res> {
  factory $QuranTestEntryModelCopyWith(
          QuranTestEntryModel value, $Res Function(QuranTestEntryModel) then) =
      _$QuranTestEntryModelCopyWithImpl<$Res, QuranTestEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
      String? kind,
      @JsonKey(
          readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
      DateTime? date,
      @JsonKey(
          readValue: _quranTestEntryStatus,
          fromJson: _quranTestEntryStatusValue)
      String? status,
      @JsonKey(
          readValue: _quranTestEntryJuzNumber,
          fromJson: _quranTestEntryJuzNumberValue)
      int? juzNumber,
      @JsonKey(
          readValue: _quranTestEntryJuzFromPage,
          fromJson: _quranTestEntryJuzFromPageValue)
      int? juzFromPage,
      @JsonKey(
          readValue: _quranTestEntryJuzToPage,
          fromJson: _quranTestEntryJuzToPageValue)
      int? juzToPage,
      @JsonKey(
          readValue: _quranTestEntryGroupName,
          fromJson: _quranTestEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _quranTestEntryTeacherName,
          fromJson: _quranTestEntryTeacherNameValue)
      String? teacherName,
      @JsonKey(readValue: readJsonList) List<QuranTestPartModel>? parts,
      @JsonKey(readValue: readJsonList) List<QuranTestAttemptModel>? attempts});
}

/// @nodoc
class _$QuranTestEntryModelCopyWithImpl<$Res, $Val extends QuranTestEntryModel>
    implements $QuranTestEntryModelCopyWith<$Res> {
  _$QuranTestEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranTestEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? kind = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? juzNumber = freezed,
    Object? juzFromPage = freezed,
    Object? juzToPage = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
    Object? parts = freezed,
    Object? attempts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      juzNumber: freezed == juzNumber
          ? _value.juzNumber
          : juzNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      juzFromPage: freezed == juzFromPage
          ? _value.juzFromPage
          : juzFromPage // ignore: cast_nullable_to_non_nullable
              as int?,
      juzToPage: freezed == juzToPage
          ? _value.juzToPage
          : juzToPage // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      parts: freezed == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<QuranTestPartModel>?,
      attempts: freezed == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<QuranTestAttemptModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuranTestEntryModelImplCopyWith<$Res>
    implements $QuranTestEntryModelCopyWith<$Res> {
  factory _$$QuranTestEntryModelImplCopyWith(_$QuranTestEntryModelImpl value,
          $Res Function(_$QuranTestEntryModelImpl) then) =
      __$$QuranTestEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
      int? id,
      @JsonKey(
          readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
      String? kind,
      @JsonKey(
          readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
      DateTime? date,
      @JsonKey(
          readValue: _quranTestEntryStatus,
          fromJson: _quranTestEntryStatusValue)
      String? status,
      @JsonKey(
          readValue: _quranTestEntryJuzNumber,
          fromJson: _quranTestEntryJuzNumberValue)
      int? juzNumber,
      @JsonKey(
          readValue: _quranTestEntryJuzFromPage,
          fromJson: _quranTestEntryJuzFromPageValue)
      int? juzFromPage,
      @JsonKey(
          readValue: _quranTestEntryJuzToPage,
          fromJson: _quranTestEntryJuzToPageValue)
      int? juzToPage,
      @JsonKey(
          readValue: _quranTestEntryGroupName,
          fromJson: _quranTestEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _quranTestEntryTeacherName,
          fromJson: _quranTestEntryTeacherNameValue)
      String? teacherName,
      @JsonKey(readValue: readJsonList) List<QuranTestPartModel>? parts,
      @JsonKey(readValue: readJsonList) List<QuranTestAttemptModel>? attempts});
}

/// @nodoc
class __$$QuranTestEntryModelImplCopyWithImpl<$Res>
    extends _$QuranTestEntryModelCopyWithImpl<$Res, _$QuranTestEntryModelImpl>
    implements _$$QuranTestEntryModelImplCopyWith<$Res> {
  __$$QuranTestEntryModelImplCopyWithImpl(_$QuranTestEntryModelImpl _value,
      $Res Function(_$QuranTestEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranTestEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? kind = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? juzNumber = freezed,
    Object? juzFromPage = freezed,
    Object? juzToPage = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
    Object? parts = freezed,
    Object? attempts = freezed,
  }) {
    return _then(_$QuranTestEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      juzNumber: freezed == juzNumber
          ? _value.juzNumber
          : juzNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      juzFromPage: freezed == juzFromPage
          ? _value.juzFromPage
          : juzFromPage // ignore: cast_nullable_to_non_nullable
              as int?,
      juzToPage: freezed == juzToPage
          ? _value.juzToPage
          : juzToPage // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      parts: freezed == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<QuranTestPartModel>?,
      attempts: freezed == attempts
          ? _value._attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<QuranTestAttemptModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$QuranTestEntryModelImpl implements _QuranTestEntryModel {
  const _$QuranTestEntryModelImpl(
      {@JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
      this.id,
      @JsonKey(
          readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
      this.kind,
      @JsonKey(
          readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
      this.date,
      @JsonKey(
          readValue: _quranTestEntryStatus,
          fromJson: _quranTestEntryStatusValue)
      this.status,
      @JsonKey(
          readValue: _quranTestEntryJuzNumber,
          fromJson: _quranTestEntryJuzNumberValue)
      this.juzNumber,
      @JsonKey(
          readValue: _quranTestEntryJuzFromPage,
          fromJson: _quranTestEntryJuzFromPageValue)
      this.juzFromPage,
      @JsonKey(
          readValue: _quranTestEntryJuzToPage,
          fromJson: _quranTestEntryJuzToPageValue)
      this.juzToPage,
      @JsonKey(
          readValue: _quranTestEntryGroupName,
          fromJson: _quranTestEntryGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _quranTestEntryTeacherName,
          fromJson: _quranTestEntryTeacherNameValue)
      this.teacherName,
      @JsonKey(readValue: readJsonList) final List<QuranTestPartModel>? parts,
      @JsonKey(readValue: readJsonList)
      final List<QuranTestAttemptModel>? attempts})
      : _parts = parts,
        _attempts = attempts;

  factory _$QuranTestEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranTestEntryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
  final String? kind;
  @override
  @JsonKey(readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
  final DateTime? date;
  @override
  @JsonKey(
      readValue: _quranTestEntryStatus, fromJson: _quranTestEntryStatusValue)
  final String? status;
  @override
  @JsonKey(
      readValue: _quranTestEntryJuzNumber,
      fromJson: _quranTestEntryJuzNumberValue)
  final int? juzNumber;
  @override
  @JsonKey(
      readValue: _quranTestEntryJuzFromPage,
      fromJson: _quranTestEntryJuzFromPageValue)
  final int? juzFromPage;
  @override
  @JsonKey(
      readValue: _quranTestEntryJuzToPage,
      fromJson: _quranTestEntryJuzToPageValue)
  final int? juzToPage;
  @override
  @JsonKey(
      readValue: _quranTestEntryGroupName,
      fromJson: _quranTestEntryGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _quranTestEntryTeacherName,
      fromJson: _quranTestEntryTeacherNameValue)
  final String? teacherName;
  final List<QuranTestPartModel>? _parts;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranTestPartModel>? get parts {
    final value = _parts;
    if (value == null) return null;
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<QuranTestAttemptModel>? _attempts;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranTestAttemptModel>? get attempts {
    final value = _attempts;
    if (value == null) return null;
    if (_attempts is EqualUnmodifiableListView) return _attempts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuranTestEntryModel(id: $id, kind: $kind, date: $date, status: $status, juzNumber: $juzNumber, juzFromPage: $juzFromPage, juzToPage: $juzToPage, groupName: $groupName, teacherName: $teacherName, parts: $parts, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranTestEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.juzNumber, juzNumber) ||
                other.juzNumber == juzNumber) &&
            (identical(other.juzFromPage, juzFromPage) ||
                other.juzFromPage == juzFromPage) &&
            (identical(other.juzToPage, juzToPage) ||
                other.juzToPage == juzToPage) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            const DeepCollectionEquality().equals(other._parts, _parts) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      kind,
      date,
      status,
      juzNumber,
      juzFromPage,
      juzToPage,
      groupName,
      teacherName,
      const DeepCollectionEquality().hash(_parts),
      const DeepCollectionEquality().hash(_attempts));

  /// Create a copy of QuranTestEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranTestEntryModelImplCopyWith<_$QuranTestEntryModelImpl> get copyWith =>
      __$$QuranTestEntryModelImplCopyWithImpl<_$QuranTestEntryModelImpl>(
          this, _$identity);
}

abstract class _QuranTestEntryModel implements QuranTestEntryModel {
  const factory _QuranTestEntryModel(
      {@JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
      final int? id,
      @JsonKey(
          readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
      final String? kind,
      @JsonKey(
          readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
      final DateTime? date,
      @JsonKey(
          readValue: _quranTestEntryStatus,
          fromJson: _quranTestEntryStatusValue)
      final String? status,
      @JsonKey(
          readValue: _quranTestEntryJuzNumber,
          fromJson: _quranTestEntryJuzNumberValue)
      final int? juzNumber,
      @JsonKey(
          readValue: _quranTestEntryJuzFromPage,
          fromJson: _quranTestEntryJuzFromPageValue)
      final int? juzFromPage,
      @JsonKey(
          readValue: _quranTestEntryJuzToPage,
          fromJson: _quranTestEntryJuzToPageValue)
      final int? juzToPage,
      @JsonKey(
          readValue: _quranTestEntryGroupName,
          fromJson: _quranTestEntryGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _quranTestEntryTeacherName,
          fromJson: _quranTestEntryTeacherNameValue)
      final String? teacherName,
      @JsonKey(readValue: readJsonList) final List<QuranTestPartModel>? parts,
      @JsonKey(readValue: readJsonList)
      final List<QuranTestAttemptModel>? attempts}) = _$QuranTestEntryModelImpl;

  factory _QuranTestEntryModel.fromJson(Map<String, dynamic> json) =
      _$QuranTestEntryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
  String? get kind;
  @override
  @JsonKey(readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
  DateTime? get date;
  @override
  @JsonKey(
      readValue: _quranTestEntryStatus, fromJson: _quranTestEntryStatusValue)
  String? get status;
  @override
  @JsonKey(
      readValue: _quranTestEntryJuzNumber,
      fromJson: _quranTestEntryJuzNumberValue)
  int? get juzNumber;
  @override
  @JsonKey(
      readValue: _quranTestEntryJuzFromPage,
      fromJson: _quranTestEntryJuzFromPageValue)
  int? get juzFromPage;
  @override
  @JsonKey(
      readValue: _quranTestEntryJuzToPage,
      fromJson: _quranTestEntryJuzToPageValue)
  int? get juzToPage;
  @override
  @JsonKey(
      readValue: _quranTestEntryGroupName,
      fromJson: _quranTestEntryGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _quranTestEntryTeacherName,
      fromJson: _quranTestEntryTeacherNameValue)
  String? get teacherName;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranTestPartModel>? get parts;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranTestAttemptModel>? get attempts;

  /// Create a copy of QuranTestEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranTestEntryModelImplCopyWith<_$QuranTestEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoteEntryModel _$NoteEntryModelFromJson(Map<String, dynamic> json) {
  return _NoteEntryModel.fromJson(json);
}

/// @nodoc
mixin _$NoteEntryModel {
  @JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
  DateTime? get notedAt => throw _privateConstructorUsedError;
  @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
  int? get authorId => throw _privateConstructorUsedError;
  @JsonKey(readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
  String? get authorName => throw _privateConstructorUsedError;

  /// Create a copy of NoteEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteEntryModelCopyWith<NoteEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteEntryModelCopyWith<$Res> {
  factory $NoteEntryModelCopyWith(
          NoteEntryModel value, $Res Function(NoteEntryModel) then) =
      _$NoteEntryModelCopyWithImpl<$Res, NoteEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue) int? id,
      @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
      String? source,
      @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
      DateTime? notedAt,
      @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
      String? body,
      @JsonKey(
          readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
      String? groupName,
      @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
      int? authorId,
      @JsonKey(
          readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
      String? authorName});
}

/// @nodoc
class _$NoteEntryModelCopyWithImpl<$Res, $Val extends NoteEntryModel>
    implements $NoteEntryModelCopyWith<$Res> {
  _$NoteEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? source = freezed,
    Object? notedAt = freezed,
    Object? body = freezed,
    Object? groupName = freezed,
    Object? authorId = freezed,
    Object? authorName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      notedAt: freezed == notedAt
          ? _value.notedAt
          : notedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteEntryModelImplCopyWith<$Res>
    implements $NoteEntryModelCopyWith<$Res> {
  factory _$$NoteEntryModelImplCopyWith(_$NoteEntryModelImpl value,
          $Res Function(_$NoteEntryModelImpl) then) =
      __$$NoteEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue) int? id,
      @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
      String? source,
      @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
      DateTime? notedAt,
      @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
      String? body,
      @JsonKey(
          readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
      String? groupName,
      @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
      int? authorId,
      @JsonKey(
          readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
      String? authorName});
}

/// @nodoc
class __$$NoteEntryModelImplCopyWithImpl<$Res>
    extends _$NoteEntryModelCopyWithImpl<$Res, _$NoteEntryModelImpl>
    implements _$$NoteEntryModelImplCopyWith<$Res> {
  __$$NoteEntryModelImplCopyWithImpl(
      _$NoteEntryModelImpl _value, $Res Function(_$NoteEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoteEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? source = freezed,
    Object? notedAt = freezed,
    Object? body = freezed,
    Object? groupName = freezed,
    Object? authorId = freezed,
    Object? authorName = freezed,
  }) {
    return _then(_$NoteEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      notedAt: freezed == notedAt
          ? _value.notedAt
          : notedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NoteEntryModelImpl implements _NoteEntryModel {
  const _$NoteEntryModelImpl(
      {@JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue) this.id,
      @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
      this.source,
      @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
      this.notedAt,
      @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
      this.body,
      @JsonKey(
          readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
      this.groupName,
      @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
      this.authorId,
      @JsonKey(
          readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
      this.authorName});

  factory _$NoteEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteEntryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
  final String? source;
  @override
  @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
  final DateTime? notedAt;
  @override
  @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
  final String? body;
  @override
  @JsonKey(readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
  final int? authorId;
  @override
  @JsonKey(readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
  final String? authorName;

  @override
  String toString() {
    return 'NoteEntryModel(id: $id, source: $source, notedAt: $notedAt, body: $body, groupName: $groupName, authorId: $authorId, authorName: $authorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.notedAt, notedAt) || other.notedAt == notedAt) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, source, notedAt, body, groupName, authorId, authorName);

  /// Create a copy of NoteEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteEntryModelImplCopyWith<_$NoteEntryModelImpl> get copyWith =>
      __$$NoteEntryModelImplCopyWithImpl<_$NoteEntryModelImpl>(
          this, _$identity);
}

abstract class _NoteEntryModel implements NoteEntryModel {
  const factory _NoteEntryModel(
      {@JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue)
      final int? id,
      @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
      final String? source,
      @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
      final DateTime? notedAt,
      @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
      final String? body,
      @JsonKey(
          readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
      final String? groupName,
      @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
      final int? authorId,
      @JsonKey(
          readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
      final String? authorName}) = _$NoteEntryModelImpl;

  factory _NoteEntryModel.fromJson(Map<String, dynamic> json) =
      _$NoteEntryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
  String? get source;
  @override
  @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
  DateTime? get notedAt;
  @override
  @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
  String? get body;
  @override
  @JsonKey(readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
  int? get authorId;
  @override
  @JsonKey(readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
  String? get authorName;

  /// Create a copy of NoteEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteEntryModelImplCopyWith<_$NoteEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PointEntryModel _$PointEntryModelFromJson(Map<String, dynamic> json) {
  return _PointEntryModel.fromJson(json);
}

/// @nodoc
mixin _$PointEntryModel {
  @JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
  DateTime? get enteredAt => throw _privateConstructorUsedError;
  @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntrySourceType, fromJson: _pointEntrySourceTypeValue)
  String? get sourceType => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntryPointTypeCode,
      fromJson: _pointEntryPointTypeCodeValue)
  String? get pointTypeCode => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntryPointTypeName,
      fromJson: _pointEntryPointTypeNameValue)
  String? get pointTypeName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntryPointTypeCategory,
      fromJson: _pointEntryPointTypeCategoryValue)
  String? get pointTypeCategory => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntryPolicyName, fromJson: _pointEntryPolicyNameValue)
  String? get policyName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _pointEntryTeacherName, fromJson: _pointEntryTeacherNameValue)
  String? get teacherName => throw _privateConstructorUsedError;
  @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
  String? get notes => throw _privateConstructorUsedError;

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
      {@JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue) int? id,
      @JsonKey(
          readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
      DateTime? enteredAt,
      @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
      int? points,
      @JsonKey(
          readValue: _pointEntrySourceType,
          fromJson: _pointEntrySourceTypeValue)
      String? sourceType,
      @JsonKey(
          readValue: _pointEntryPointTypeCode,
          fromJson: _pointEntryPointTypeCodeValue)
      String? pointTypeCode,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      String? pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeCategory,
          fromJson: _pointEntryPointTypeCategoryValue)
      String? pointTypeCategory,
      @JsonKey(
          readValue: _pointEntryPolicyName,
          fromJson: _pointEntryPolicyNameValue)
      String? policyName,
      @JsonKey(
          readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _pointEntryTeacherName,
          fromJson: _pointEntryTeacherNameValue)
      String? teacherName,
      @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
      String? notes});
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
    Object? enteredAt = freezed,
    Object? points = freezed,
    Object? sourceType = freezed,
    Object? pointTypeCode = freezed,
    Object? pointTypeName = freezed,
    Object? pointTypeCategory = freezed,
    Object? policyName = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enteredAt: freezed == enteredAt
          ? _value.enteredAt
          : enteredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeCode: freezed == pointTypeCode
          ? _value.pointTypeCode
          : pointTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeName: freezed == pointTypeName
          ? _value.pointTypeName
          : pointTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeCategory: freezed == pointTypeCategory
          ? _value.pointTypeCategory
          : pointTypeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      policyName: freezed == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {@JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue) int? id,
      @JsonKey(
          readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
      DateTime? enteredAt,
      @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
      int? points,
      @JsonKey(
          readValue: _pointEntrySourceType,
          fromJson: _pointEntrySourceTypeValue)
      String? sourceType,
      @JsonKey(
          readValue: _pointEntryPointTypeCode,
          fromJson: _pointEntryPointTypeCodeValue)
      String? pointTypeCode,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      String? pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeCategory,
          fromJson: _pointEntryPointTypeCategoryValue)
      String? pointTypeCategory,
      @JsonKey(
          readValue: _pointEntryPolicyName,
          fromJson: _pointEntryPolicyNameValue)
      String? policyName,
      @JsonKey(
          readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _pointEntryTeacherName,
          fromJson: _pointEntryTeacherNameValue)
      String? teacherName,
      @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
      String? notes});
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
    Object? enteredAt = freezed,
    Object? points = freezed,
    Object? sourceType = freezed,
    Object? pointTypeCode = freezed,
    Object? pointTypeName = freezed,
    Object? pointTypeCategory = freezed,
    Object? policyName = freezed,
    Object? groupName = freezed,
    Object? teacherName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$PointEntryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enteredAt: freezed == enteredAt
          ? _value.enteredAt
          : enteredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeCode: freezed == pointTypeCode
          ? _value.pointTypeCode
          : pointTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeName: freezed == pointTypeName
          ? _value.pointTypeName
          : pointTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      pointTypeCategory: freezed == pointTypeCategory
          ? _value.pointTypeCategory
          : pointTypeCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      policyName: freezed == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      teacherName: freezed == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
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
class _$PointEntryModelImpl implements _PointEntryModel {
  const _$PointEntryModelImpl(
      {@JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue) this.id,
      @JsonKey(
          readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
      this.enteredAt,
      @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
      this.points,
      @JsonKey(
          readValue: _pointEntrySourceType,
          fromJson: _pointEntrySourceTypeValue)
      this.sourceType,
      @JsonKey(
          readValue: _pointEntryPointTypeCode,
          fromJson: _pointEntryPointTypeCodeValue)
      this.pointTypeCode,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      this.pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeCategory,
          fromJson: _pointEntryPointTypeCategoryValue)
      this.pointTypeCategory,
      @JsonKey(
          readValue: _pointEntryPolicyName,
          fromJson: _pointEntryPolicyNameValue)
      this.policyName,
      @JsonKey(
          readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _pointEntryTeacherName,
          fromJson: _pointEntryTeacherNameValue)
      this.teacherName,
      @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
      this.notes});

  factory _$PointEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointEntryModelImplFromJson(json);

  @override
  @JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue)
  final int? id;
  @override
  @JsonKey(readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
  final DateTime? enteredAt;
  @override
  @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
  final int? points;
  @override
  @JsonKey(
      readValue: _pointEntrySourceType, fromJson: _pointEntrySourceTypeValue)
  final String? sourceType;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeCode,
      fromJson: _pointEntryPointTypeCodeValue)
  final String? pointTypeCode;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeName,
      fromJson: _pointEntryPointTypeNameValue)
  final String? pointTypeName;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeCategory,
      fromJson: _pointEntryPointTypeCategoryValue)
  final String? pointTypeCategory;
  @override
  @JsonKey(
      readValue: _pointEntryPolicyName, fromJson: _pointEntryPolicyNameValue)
  final String? policyName;
  @override
  @JsonKey(readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _pointEntryTeacherName, fromJson: _pointEntryTeacherNameValue)
  final String? teacherName;
  @override
  @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
  final String? notes;

  @override
  String toString() {
    return 'PointEntryModel(id: $id, enteredAt: $enteredAt, points: $points, sourceType: $sourceType, pointTypeCode: $pointTypeCode, pointTypeName: $pointTypeName, pointTypeCategory: $pointTypeCategory, policyName: $policyName, groupName: $groupName, teacherName: $teacherName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enteredAt, enteredAt) ||
                other.enteredAt == enteredAt) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.pointTypeCode, pointTypeCode) ||
                other.pointTypeCode == pointTypeCode) &&
            (identical(other.pointTypeName, pointTypeName) ||
                other.pointTypeName == pointTypeName) &&
            (identical(other.pointTypeCategory, pointTypeCategory) ||
                other.pointTypeCategory == pointTypeCategory) &&
            (identical(other.policyName, policyName) ||
                other.policyName == policyName) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      enteredAt,
      points,
      sourceType,
      pointTypeCode,
      pointTypeName,
      pointTypeCategory,
      policyName,
      groupName,
      teacherName,
      notes);

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
      {@JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue)
      final int? id,
      @JsonKey(
          readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
      final DateTime? enteredAt,
      @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
      final int? points,
      @JsonKey(
          readValue: _pointEntrySourceType,
          fromJson: _pointEntrySourceTypeValue)
      final String? sourceType,
      @JsonKey(
          readValue: _pointEntryPointTypeCode,
          fromJson: _pointEntryPointTypeCodeValue)
      final String? pointTypeCode,
      @JsonKey(
          readValue: _pointEntryPointTypeName,
          fromJson: _pointEntryPointTypeNameValue)
      final String? pointTypeName,
      @JsonKey(
          readValue: _pointEntryPointTypeCategory,
          fromJson: _pointEntryPointTypeCategoryValue)
      final String? pointTypeCategory,
      @JsonKey(
          readValue: _pointEntryPolicyName,
          fromJson: _pointEntryPolicyNameValue)
      final String? policyName,
      @JsonKey(
          readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _pointEntryTeacherName,
          fromJson: _pointEntryTeacherNameValue)
      final String? teacherName,
      @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
      final String? notes}) = _$PointEntryModelImpl;

  factory _PointEntryModel.fromJson(Map<String, dynamic> json) =
      _$PointEntryModelImpl.fromJson;

  @override
  @JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue)
  int? get id;
  @override
  @JsonKey(readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
  DateTime? get enteredAt;
  @override
  @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
  int? get points;
  @override
  @JsonKey(
      readValue: _pointEntrySourceType, fromJson: _pointEntrySourceTypeValue)
  String? get sourceType;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeCode,
      fromJson: _pointEntryPointTypeCodeValue)
  String? get pointTypeCode;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeName,
      fromJson: _pointEntryPointTypeNameValue)
  String? get pointTypeName;
  @override
  @JsonKey(
      readValue: _pointEntryPointTypeCategory,
      fromJson: _pointEntryPointTypeCategoryValue)
  String? get pointTypeCategory;
  @override
  @JsonKey(
      readValue: _pointEntryPolicyName, fromJson: _pointEntryPolicyNameValue)
  String? get policyName;
  @override
  @JsonKey(readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _pointEntryTeacherName, fromJson: _pointEntryTeacherNameValue)
  String? get teacherName;
  @override
  @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
  String? get notes;

  /// Create a copy of PointEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointEntryModelImplCopyWith<_$PointEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
