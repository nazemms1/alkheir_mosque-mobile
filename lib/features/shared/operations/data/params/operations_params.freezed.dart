// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operations_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddManualPointsParams _$AddManualPointsParamsFromJson(
    Map<String, dynamic> json) {
  return _AddManualPointsParams.fromJson(json);
}

/// @nodoc
mixin _$AddManualPointsParams {
  @JsonKey(name: 'point_type_id', includeIfNull: true)
  int? get pointTypeId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get points => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this AddManualPointsParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddManualPointsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddManualPointsParamsCopyWith<AddManualPointsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddManualPointsParamsCopyWith<$Res> {
  factory $AddManualPointsParamsCopyWith(AddManualPointsParams value,
          $Res Function(AddManualPointsParams) then) =
      _$AddManualPointsParamsCopyWithImpl<$Res, AddManualPointsParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'point_type_id', includeIfNull: true) int? pointTypeId,
      @JsonKey(includeIfNull: true) int? points,
      String? notes});
}

/// @nodoc
class _$AddManualPointsParamsCopyWithImpl<$Res,
        $Val extends AddManualPointsParams>
    implements $AddManualPointsParamsCopyWith<$Res> {
  _$AddManualPointsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddManualPointsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointTypeId = freezed,
    Object? points = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      pointTypeId: freezed == pointTypeId
          ? _value.pointTypeId
          : pointTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddManualPointsParamsImplCopyWith<$Res>
    implements $AddManualPointsParamsCopyWith<$Res> {
  factory _$$AddManualPointsParamsImplCopyWith(
          _$AddManualPointsParamsImpl value,
          $Res Function(_$AddManualPointsParamsImpl) then) =
      __$$AddManualPointsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'point_type_id', includeIfNull: true) int? pointTypeId,
      @JsonKey(includeIfNull: true) int? points,
      String? notes});
}

/// @nodoc
class __$$AddManualPointsParamsImplCopyWithImpl<$Res>
    extends _$AddManualPointsParamsCopyWithImpl<$Res,
        _$AddManualPointsParamsImpl>
    implements _$$AddManualPointsParamsImplCopyWith<$Res> {
  __$$AddManualPointsParamsImplCopyWithImpl(_$AddManualPointsParamsImpl _value,
      $Res Function(_$AddManualPointsParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddManualPointsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointTypeId = freezed,
    Object? points = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$AddManualPointsParamsImpl(
      pointTypeId: freezed == pointTypeId
          ? _value.pointTypeId
          : pointTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$AddManualPointsParamsImpl implements _AddManualPointsParams {
  const _$AddManualPointsParamsImpl(
      {@JsonKey(name: 'point_type_id', includeIfNull: true) this.pointTypeId,
      @JsonKey(includeIfNull: true) this.points,
      this.notes});

  factory _$AddManualPointsParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddManualPointsParamsImplFromJson(json);

  @override
  @JsonKey(name: 'point_type_id', includeIfNull: true)
  final int? pointTypeId;
  @override
  @JsonKey(includeIfNull: true)
  final int? points;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AddManualPointsParams(pointTypeId: $pointTypeId, points: $points, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddManualPointsParamsImpl &&
            (identical(other.pointTypeId, pointTypeId) ||
                other.pointTypeId == pointTypeId) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pointTypeId, points, notes);

  /// Create a copy of AddManualPointsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddManualPointsParamsImplCopyWith<_$AddManualPointsParamsImpl>
      get copyWith => __$$AddManualPointsParamsImplCopyWithImpl<
          _$AddManualPointsParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddManualPointsParamsImplToJson(
      this,
    );
  }
}

abstract class _AddManualPointsParams implements AddManualPointsParams {
  const factory _AddManualPointsParams(
      {@JsonKey(name: 'point_type_id', includeIfNull: true)
      final int? pointTypeId,
      @JsonKey(includeIfNull: true) final int? points,
      final String? notes}) = _$AddManualPointsParamsImpl;

  factory _AddManualPointsParams.fromJson(Map<String, dynamic> json) =
      _$AddManualPointsParamsImpl.fromJson;

  @override
  @JsonKey(name: 'point_type_id', includeIfNull: true)
  int? get pointTypeId;
  @override
  @JsonKey(includeIfNull: true)
  int? get points;
  @override
  String? get notes;

  /// Create a copy of AddManualPointsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddManualPointsParamsImplCopyWith<_$AddManualPointsParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateStudentNoteParams _$CreateStudentNoteParamsFromJson(
    Map<String, dynamic> json) {
  return _CreateStudentNoteParams.fromJson(json);
}

/// @nodoc
mixin _$CreateStudentNoteParams {
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'noted_at', includeIfNull: true)
  String? get notedAt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id')
  int? get enrollmentId => throw _privateConstructorUsedError;

  /// Serializes this CreateStudentNoteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateStudentNoteParamsCopyWith<CreateStudentNoteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStudentNoteParamsCopyWith<$Res> {
  factory $CreateStudentNoteParamsCopyWith(CreateStudentNoteParams value,
          $Res Function(CreateStudentNoteParams) then) =
      _$CreateStudentNoteParamsCopyWithImpl<$Res, CreateStudentNoteParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(includeIfNull: true) String? body,
      @JsonKey(name: 'noted_at', includeIfNull: true) String? notedAt,
      @JsonKey(includeIfNull: true) String? source,
      @JsonKey(includeIfNull: true) String? visibility,
      @JsonKey(name: 'enrollment_id') int? enrollmentId});
}

/// @nodoc
class _$CreateStudentNoteParamsCopyWithImpl<$Res,
        $Val extends CreateStudentNoteParams>
    implements $CreateStudentNoteParamsCopyWith<$Res> {
  _$CreateStudentNoteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? body = freezed,
    Object? notedAt = freezed,
    Object? source = freezed,
    Object? visibility = freezed,
    Object? enrollmentId = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateStudentNoteParamsImplCopyWith<$Res>
    implements $CreateStudentNoteParamsCopyWith<$Res> {
  factory _$$CreateStudentNoteParamsImplCopyWith(
          _$CreateStudentNoteParamsImpl value,
          $Res Function(_$CreateStudentNoteParamsImpl) then) =
      __$$CreateStudentNoteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(includeIfNull: true) String? body,
      @JsonKey(name: 'noted_at', includeIfNull: true) String? notedAt,
      @JsonKey(includeIfNull: true) String? source,
      @JsonKey(includeIfNull: true) String? visibility,
      @JsonKey(name: 'enrollment_id') int? enrollmentId});
}

/// @nodoc
class __$$CreateStudentNoteParamsImplCopyWithImpl<$Res>
    extends _$CreateStudentNoteParamsCopyWithImpl<$Res,
        _$CreateStudentNoteParamsImpl>
    implements _$$CreateStudentNoteParamsImplCopyWith<$Res> {
  __$$CreateStudentNoteParamsImplCopyWithImpl(
      _$CreateStudentNoteParamsImpl _value,
      $Res Function(_$CreateStudentNoteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? body = freezed,
    Object? notedAt = freezed,
    Object? source = freezed,
    Object? visibility = freezed,
    Object? enrollmentId = freezed,
  }) {
    return _then(_$CreateStudentNoteParamsImpl(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CreateStudentNoteParamsImpl implements _CreateStudentNoteParams {
  const _$CreateStudentNoteParamsImpl(
      {@JsonKey(name: 'student_id', includeIfNull: true) this.studentId,
      @JsonKey(includeIfNull: true) this.body,
      @JsonKey(name: 'noted_at', includeIfNull: true) this.notedAt,
      @JsonKey(includeIfNull: true) this.source,
      @JsonKey(includeIfNull: true) this.visibility,
      @JsonKey(name: 'enrollment_id') this.enrollmentId});

  factory _$CreateStudentNoteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateStudentNoteParamsImplFromJson(json);

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  final int? studentId;
  @override
  @JsonKey(includeIfNull: true)
  final String? body;
  @override
  @JsonKey(name: 'noted_at', includeIfNull: true)
  final String? notedAt;
  @override
  @JsonKey(includeIfNull: true)
  final String? source;
  @override
  @JsonKey(includeIfNull: true)
  final String? visibility;
  @override
  @JsonKey(name: 'enrollment_id')
  final int? enrollmentId;

  @override
  String toString() {
    return 'CreateStudentNoteParams(studentId: $studentId, body: $body, notedAt: $notedAt, source: $source, visibility: $visibility, enrollmentId: $enrollmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStudentNoteParamsImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.notedAt, notedAt) || other.notedAt == notedAt) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, studentId, body, notedAt, source, visibility, enrollmentId);

  /// Create a copy of CreateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStudentNoteParamsImplCopyWith<_$CreateStudentNoteParamsImpl>
      get copyWith => __$$CreateStudentNoteParamsImplCopyWithImpl<
          _$CreateStudentNoteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateStudentNoteParamsImplToJson(
      this,
    );
  }
}

abstract class _CreateStudentNoteParams implements CreateStudentNoteParams {
  const factory _CreateStudentNoteParams(
      {@JsonKey(name: 'student_id', includeIfNull: true) final int? studentId,
      @JsonKey(includeIfNull: true) final String? body,
      @JsonKey(name: 'noted_at', includeIfNull: true) final String? notedAt,
      @JsonKey(includeIfNull: true) final String? source,
      @JsonKey(includeIfNull: true) final String? visibility,
      @JsonKey(name: 'enrollment_id')
      final int? enrollmentId}) = _$CreateStudentNoteParamsImpl;

  factory _CreateStudentNoteParams.fromJson(Map<String, dynamic> json) =
      _$CreateStudentNoteParamsImpl.fromJson;

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId;
  @override
  @JsonKey(includeIfNull: true)
  String? get body;
  @override
  @JsonKey(name: 'noted_at', includeIfNull: true)
  String? get notedAt;
  @override
  @JsonKey(includeIfNull: true)
  String? get source;
  @override
  @JsonKey(includeIfNull: true)
  String? get visibility;
  @override
  @JsonKey(name: 'enrollment_id')
  int? get enrollmentId;

  /// Create a copy of CreateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStudentNoteParamsImplCopyWith<_$CreateStudentNoteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecordAwqafTestParams _$RecordAwqafTestParamsFromJson(
    Map<String, dynamic> json) {
  return _RecordAwqafTestParams.fromJson(json);
}

/// @nodoc
mixin _$RecordAwqafTestParams {
  @JsonKey(name: 'juz_id', includeIfNull: true)
  int? get juzId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
  int? get quranTestTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tested_on', includeIfNull: true)
  String? get testedOn => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'teacher_id')
  int? get teacherId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this RecordAwqafTestParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordAwqafTestParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordAwqafTestParamsCopyWith<RecordAwqafTestParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordAwqafTestParamsCopyWith<$Res> {
  factory $RecordAwqafTestParamsCopyWith(RecordAwqafTestParams value,
          $Res Function(RecordAwqafTestParams) then) =
      _$RecordAwqafTestParamsCopyWithImpl<$Res, RecordAwqafTestParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'juz_id', includeIfNull: true) int? juzId,
      @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
      int? quranTestTypeId,
      @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
      @JsonKey(includeIfNull: true) String? status,
      double? score,
      @JsonKey(name: 'teacher_id') int? teacherId,
      String? notes});
}

/// @nodoc
class _$RecordAwqafTestParamsCopyWithImpl<$Res,
        $Val extends RecordAwqafTestParams>
    implements $RecordAwqafTestParamsCopyWith<$Res> {
  _$RecordAwqafTestParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordAwqafTestParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? juzId = freezed,
    Object? quranTestTypeId = freezed,
    Object? testedOn = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? teacherId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      juzId: freezed == juzId
          ? _value.juzId
          : juzId // ignore: cast_nullable_to_non_nullable
              as int?,
      quranTestTypeId: freezed == quranTestTypeId
          ? _value.quranTestTypeId
          : quranTestTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordAwqafTestParamsImplCopyWith<$Res>
    implements $RecordAwqafTestParamsCopyWith<$Res> {
  factory _$$RecordAwqafTestParamsImplCopyWith(
          _$RecordAwqafTestParamsImpl value,
          $Res Function(_$RecordAwqafTestParamsImpl) then) =
      __$$RecordAwqafTestParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'juz_id', includeIfNull: true) int? juzId,
      @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
      int? quranTestTypeId,
      @JsonKey(name: 'tested_on', includeIfNull: true) String? testedOn,
      @JsonKey(includeIfNull: true) String? status,
      double? score,
      @JsonKey(name: 'teacher_id') int? teacherId,
      String? notes});
}

/// @nodoc
class __$$RecordAwqafTestParamsImplCopyWithImpl<$Res>
    extends _$RecordAwqafTestParamsCopyWithImpl<$Res,
        _$RecordAwqafTestParamsImpl>
    implements _$$RecordAwqafTestParamsImplCopyWith<$Res> {
  __$$RecordAwqafTestParamsImplCopyWithImpl(_$RecordAwqafTestParamsImpl _value,
      $Res Function(_$RecordAwqafTestParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordAwqafTestParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? juzId = freezed,
    Object? quranTestTypeId = freezed,
    Object? testedOn = freezed,
    Object? status = freezed,
    Object? score = freezed,
    Object? teacherId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$RecordAwqafTestParamsImpl(
      juzId: freezed == juzId
          ? _value.juzId
          : juzId // ignore: cast_nullable_to_non_nullable
              as int?,
      quranTestTypeId: freezed == quranTestTypeId
          ? _value.quranTestTypeId
          : quranTestTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      teacherId: freezed == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RecordAwqafTestParamsImpl implements _RecordAwqafTestParams {
  const _$RecordAwqafTestParamsImpl(
      {@JsonKey(name: 'juz_id', includeIfNull: true) this.juzId,
      @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
      this.quranTestTypeId,
      @JsonKey(name: 'tested_on', includeIfNull: true) this.testedOn,
      @JsonKey(includeIfNull: true) this.status,
      this.score,
      @JsonKey(name: 'teacher_id') this.teacherId,
      this.notes});

  factory _$RecordAwqafTestParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordAwqafTestParamsImplFromJson(json);

  @override
  @JsonKey(name: 'juz_id', includeIfNull: true)
  final int? juzId;
  @override
  @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
  final int? quranTestTypeId;
  @override
  @JsonKey(name: 'tested_on', includeIfNull: true)
  final String? testedOn;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  final double? score;
  @override
  @JsonKey(name: 'teacher_id')
  final int? teacherId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'RecordAwqafTestParams(juzId: $juzId, quranTestTypeId: $quranTestTypeId, testedOn: $testedOn, status: $status, score: $score, teacherId: $teacherId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordAwqafTestParamsImpl &&
            (identical(other.juzId, juzId) || other.juzId == juzId) &&
            (identical(other.quranTestTypeId, quranTestTypeId) ||
                other.quranTestTypeId == quranTestTypeId) &&
            (identical(other.testedOn, testedOn) ||
                other.testedOn == testedOn) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, juzId, quranTestTypeId, testedOn,
      status, score, teacherId, notes);

  /// Create a copy of RecordAwqafTestParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordAwqafTestParamsImplCopyWith<_$RecordAwqafTestParamsImpl>
      get copyWith => __$$RecordAwqafTestParamsImplCopyWithImpl<
          _$RecordAwqafTestParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordAwqafTestParamsImplToJson(
      this,
    );
  }
}

abstract class _RecordAwqafTestParams implements RecordAwqafTestParams {
  const factory _RecordAwqafTestParams(
      {@JsonKey(name: 'juz_id', includeIfNull: true) final int? juzId,
      @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
      final int? quranTestTypeId,
      @JsonKey(name: 'tested_on', includeIfNull: true) final String? testedOn,
      @JsonKey(includeIfNull: true) final String? status,
      final double? score,
      @JsonKey(name: 'teacher_id') final int? teacherId,
      final String? notes}) = _$RecordAwqafTestParamsImpl;

  factory _RecordAwqafTestParams.fromJson(Map<String, dynamic> json) =
      _$RecordAwqafTestParamsImpl.fromJson;

  @override
  @JsonKey(name: 'juz_id', includeIfNull: true)
  int? get juzId;
  @override
  @JsonKey(name: 'quran_test_type_id', includeIfNull: true)
  int? get quranTestTypeId;
  @override
  @JsonKey(name: 'tested_on', includeIfNull: true)
  String? get testedOn;
  @override
  @JsonKey(includeIfNull: true)
  String? get status;
  @override
  double? get score;
  @override
  @JsonKey(name: 'teacher_id')
  int? get teacherId;
  @override
  String? get notes;

  /// Create a copy of RecordAwqafTestParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordAwqafTestParamsImplCopyWith<_$RecordAwqafTestParamsImpl>
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
  @JsonKey(name: 'teacher_id')
  int? get teacherId => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'teacher_id') int? teacherId,
      String? notes});
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
              as int?,
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
      @JsonKey(name: 'teacher_id') int? teacherId,
      String? notes});
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
              as int?,
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
      @JsonKey(name: 'teacher_id') this.teacherId,
      this.notes});

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
  @JsonKey(name: 'teacher_id')
  final int? teacherId;
  @override
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
      @JsonKey(name: 'teacher_id') final int? teacherId,
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
  @JsonKey(name: 'teacher_id')
  int? get teacherId;
  @override
  String? get notes;

  /// Create a copy of RecordMemorizationParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordMemorizationParamsImplCopyWith<_$RecordMemorizationParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecordTeacherAttendanceParams _$RecordTeacherAttendanceParamsFromJson(
    Map<String, dynamic> json) {
  return _RecordTeacherAttendanceParams.fromJson(json);
}

/// @nodoc
mixin _$RecordTeacherAttendanceParams {
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  Object? get records => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this RecordTeacherAttendanceParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordTeacherAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordTeacherAttendanceParamsCopyWith<RecordTeacherAttendanceParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordTeacherAttendanceParamsCopyWith<$Res> {
  factory $RecordTeacherAttendanceParamsCopyWith(
          RecordTeacherAttendanceParams value,
          $Res Function(RecordTeacherAttendanceParams) then) =
      _$RecordTeacherAttendanceParamsCopyWithImpl<$Res,
          RecordTeacherAttendanceParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(includeIfNull: true) Object? records,
      String? notes});
}

/// @nodoc
class _$RecordTeacherAttendanceParamsCopyWithImpl<$Res,
        $Val extends RecordTeacherAttendanceParams>
    implements $RecordTeacherAttendanceParamsCopyWith<$Res> {
  _$RecordTeacherAttendanceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordTeacherAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? courseId = freezed,
    Object? records = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      records: freezed == records ? _value.records : records,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordTeacherAttendanceParamsImplCopyWith<$Res>
    implements $RecordTeacherAttendanceParamsCopyWith<$Res> {
  factory _$$RecordTeacherAttendanceParamsImplCopyWith(
          _$RecordTeacherAttendanceParamsImpl value,
          $Res Function(_$RecordTeacherAttendanceParamsImpl) then) =
      __$$RecordTeacherAttendanceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate,
      @JsonKey(name: 'course_id', includeIfNull: true) int? courseId,
      @JsonKey(includeIfNull: true) Object? records,
      String? notes});
}

/// @nodoc
class __$$RecordTeacherAttendanceParamsImplCopyWithImpl<$Res>
    extends _$RecordTeacherAttendanceParamsCopyWithImpl<$Res,
        _$RecordTeacherAttendanceParamsImpl>
    implements _$$RecordTeacherAttendanceParamsImplCopyWith<$Res> {
  __$$RecordTeacherAttendanceParamsImplCopyWithImpl(
      _$RecordTeacherAttendanceParamsImpl _value,
      $Res Function(_$RecordTeacherAttendanceParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordTeacherAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? courseId = freezed,
    Object? records = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$RecordTeacherAttendanceParamsImpl(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int?,
      records: freezed == records ? _value.records : records,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RecordTeacherAttendanceParamsImpl
    implements _RecordTeacherAttendanceParams {
  const _$RecordTeacherAttendanceParamsImpl(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      this.attendanceDate,
      @JsonKey(name: 'course_id', includeIfNull: true) this.courseId,
      @JsonKey(includeIfNull: true) this.records,
      this.notes});

  factory _$RecordTeacherAttendanceParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RecordTeacherAttendanceParamsImplFromJson(json);

  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  final String? attendanceDate;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  final int? courseId;
  @override
  @JsonKey(includeIfNull: true)
  final Object? records;
  @override
  final String? notes;

  @override
  String toString() {
    return 'RecordTeacherAttendanceParams(attendanceDate: $attendanceDate, courseId: $courseId, records: $records, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordTeacherAttendanceParamsImpl &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            const DeepCollectionEquality().equals(other.records, records) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attendanceDate, courseId,
      const DeepCollectionEquality().hash(records), notes);

  /// Create a copy of RecordTeacherAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordTeacherAttendanceParamsImplCopyWith<
          _$RecordTeacherAttendanceParamsImpl>
      get copyWith => __$$RecordTeacherAttendanceParamsImplCopyWithImpl<
          _$RecordTeacherAttendanceParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordTeacherAttendanceParamsImplToJson(
      this,
    );
  }
}

abstract class _RecordTeacherAttendanceParams
    implements RecordTeacherAttendanceParams {
  const factory _RecordTeacherAttendanceParams(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      final String? attendanceDate,
      @JsonKey(name: 'course_id', includeIfNull: true) final int? courseId,
      @JsonKey(includeIfNull: true) final Object? records,
      final String? notes}) = _$RecordTeacherAttendanceParamsImpl;

  factory _RecordTeacherAttendanceParams.fromJson(Map<String, dynamic> json) =
      _$RecordTeacherAttendanceParamsImpl.fromJson;

  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate;
  @override
  @JsonKey(name: 'course_id', includeIfNull: true)
  int? get courseId;
  @override
  @JsonKey(includeIfNull: true)
  Object? get records;
  @override
  String? get notes;

  /// Create a copy of RecordTeacherAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordTeacherAttendanceParamsImplCopyWith<
          _$RecordTeacherAttendanceParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaveAssessmentResultsParams _$SaveAssessmentResultsParamsFromJson(
    Map<String, dynamic> json) {
  return _SaveAssessmentResultsParams.fromJson(json);
}

/// @nodoc
mixin _$SaveAssessmentResultsParams {
  @JsonKey(includeIfNull: true)
  Object? get results => throw _privateConstructorUsedError;

  /// Serializes this SaveAssessmentResultsParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveAssessmentResultsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveAssessmentResultsParamsCopyWith<SaveAssessmentResultsParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveAssessmentResultsParamsCopyWith<$Res> {
  factory $SaveAssessmentResultsParamsCopyWith(
          SaveAssessmentResultsParams value,
          $Res Function(SaveAssessmentResultsParams) then) =
      _$SaveAssessmentResultsParamsCopyWithImpl<$Res,
          SaveAssessmentResultsParams>;
  @useResult
  $Res call({@JsonKey(includeIfNull: true) Object? results});
}

/// @nodoc
class _$SaveAssessmentResultsParamsCopyWithImpl<$Res,
        $Val extends SaveAssessmentResultsParams>
    implements $SaveAssessmentResultsParamsCopyWith<$Res> {
  _$SaveAssessmentResultsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveAssessmentResultsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results ? _value.results : results,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveAssessmentResultsParamsImplCopyWith<$Res>
    implements $SaveAssessmentResultsParamsCopyWith<$Res> {
  factory _$$SaveAssessmentResultsParamsImplCopyWith(
          _$SaveAssessmentResultsParamsImpl value,
          $Res Function(_$SaveAssessmentResultsParamsImpl) then) =
      __$$SaveAssessmentResultsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: true) Object? results});
}

/// @nodoc
class __$$SaveAssessmentResultsParamsImplCopyWithImpl<$Res>
    extends _$SaveAssessmentResultsParamsCopyWithImpl<$Res,
        _$SaveAssessmentResultsParamsImpl>
    implements _$$SaveAssessmentResultsParamsImplCopyWith<$Res> {
  __$$SaveAssessmentResultsParamsImplCopyWithImpl(
      _$SaveAssessmentResultsParamsImpl _value,
      $Res Function(_$SaveAssessmentResultsParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveAssessmentResultsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$SaveAssessmentResultsParamsImpl(
      results: freezed == results ? _value.results : results,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SaveAssessmentResultsParamsImpl
    implements _SaveAssessmentResultsParams {
  const _$SaveAssessmentResultsParamsImpl(
      {@JsonKey(includeIfNull: true) this.results});

  factory _$SaveAssessmentResultsParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SaveAssessmentResultsParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final Object? results;

  @override
  String toString() {
    return 'SaveAssessmentResultsParams(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAssessmentResultsParamsImpl &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(results));

  /// Create a copy of SaveAssessmentResultsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveAssessmentResultsParamsImplCopyWith<_$SaveAssessmentResultsParamsImpl>
      get copyWith => __$$SaveAssessmentResultsParamsImplCopyWithImpl<
          _$SaveAssessmentResultsParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveAssessmentResultsParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveAssessmentResultsParams
    implements SaveAssessmentResultsParams {
  const factory _SaveAssessmentResultsParams(
          {@JsonKey(includeIfNull: true) final Object? results}) =
      _$SaveAssessmentResultsParamsImpl;

  factory _SaveAssessmentResultsParams.fromJson(Map<String, dynamic> json) =
      _$SaveAssessmentResultsParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  Object? get results;

  /// Create a copy of SaveAssessmentResultsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveAssessmentResultsParamsImplCopyWith<_$SaveAssessmentResultsParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaveEnrollmentParams _$SaveEnrollmentParamsFromJson(Map<String, dynamic> json) {
  return _SaveEnrollmentParams.fromJson(json);
}

/// @nodoc
mixin _$SaveEnrollmentParams {
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id', includeIfNull: true)
  int? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrolled_at', includeIfNull: true)
  String? get enrolledAt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'left_at', includeIfNull: true)
  String? get leftAt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this SaveEnrollmentParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveEnrollmentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveEnrollmentParamsCopyWith<SaveEnrollmentParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveEnrollmentParamsCopyWith<$Res> {
  factory $SaveEnrollmentParamsCopyWith(SaveEnrollmentParams value,
          $Res Function(SaveEnrollmentParams) then) =
      _$SaveEnrollmentParamsCopyWithImpl<$Res, SaveEnrollmentParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(name: 'group_id', includeIfNull: true) int? groupId,
      @JsonKey(name: 'enrolled_at', includeIfNull: true) String? enrolledAt,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'left_at', includeIfNull: true) String? leftAt,
      @JsonKey(includeIfNull: true) String? notes});
}

/// @nodoc
class _$SaveEnrollmentParamsCopyWithImpl<$Res,
        $Val extends SaveEnrollmentParams>
    implements $SaveEnrollmentParamsCopyWith<$Res> {
  _$SaveEnrollmentParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveEnrollmentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? groupId = freezed,
    Object? enrolledAt = freezed,
    Object? status = freezed,
    Object? leftAt = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      leftAt: freezed == leftAt
          ? _value.leftAt
          : leftAt // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveEnrollmentParamsImplCopyWith<$Res>
    implements $SaveEnrollmentParamsCopyWith<$Res> {
  factory _$$SaveEnrollmentParamsImplCopyWith(_$SaveEnrollmentParamsImpl value,
          $Res Function(_$SaveEnrollmentParamsImpl) then) =
      __$$SaveEnrollmentParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'student_id', includeIfNull: true) int? studentId,
      @JsonKey(name: 'group_id', includeIfNull: true) int? groupId,
      @JsonKey(name: 'enrolled_at', includeIfNull: true) String? enrolledAt,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'left_at', includeIfNull: true) String? leftAt,
      @JsonKey(includeIfNull: true) String? notes});
}

/// @nodoc
class __$$SaveEnrollmentParamsImplCopyWithImpl<$Res>
    extends _$SaveEnrollmentParamsCopyWithImpl<$Res, _$SaveEnrollmentParamsImpl>
    implements _$$SaveEnrollmentParamsImplCopyWith<$Res> {
  __$$SaveEnrollmentParamsImplCopyWithImpl(_$SaveEnrollmentParamsImpl _value,
      $Res Function(_$SaveEnrollmentParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveEnrollmentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = freezed,
    Object? groupId = freezed,
    Object? enrolledAt = freezed,
    Object? status = freezed,
    Object? leftAt = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$SaveEnrollmentParamsImpl(
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      enrolledAt: freezed == enrolledAt
          ? _value.enrolledAt
          : enrolledAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      leftAt: freezed == leftAt
          ? _value.leftAt
          : leftAt // ignore: cast_nullable_to_non_nullable
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
class _$SaveEnrollmentParamsImpl implements _SaveEnrollmentParams {
  const _$SaveEnrollmentParamsImpl(
      {@JsonKey(name: 'student_id', includeIfNull: true) this.studentId,
      @JsonKey(name: 'group_id', includeIfNull: true) this.groupId,
      @JsonKey(name: 'enrolled_at', includeIfNull: true) this.enrolledAt,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(name: 'left_at', includeIfNull: true) this.leftAt,
      @JsonKey(includeIfNull: true) this.notes});

  factory _$SaveEnrollmentParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveEnrollmentParamsImplFromJson(json);

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  final int? studentId;
  @override
  @JsonKey(name: 'group_id', includeIfNull: true)
  final int? groupId;
  @override
  @JsonKey(name: 'enrolled_at', includeIfNull: true)
  final String? enrolledAt;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(name: 'left_at', includeIfNull: true)
  final String? leftAt;
  @override
  @JsonKey(includeIfNull: true)
  final String? notes;

  @override
  String toString() {
    return 'SaveEnrollmentParams(studentId: $studentId, groupId: $groupId, enrolledAt: $enrolledAt, status: $status, leftAt: $leftAt, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveEnrollmentParamsImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, studentId, groupId, enrolledAt, status, leftAt, notes);

  /// Create a copy of SaveEnrollmentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveEnrollmentParamsImplCopyWith<_$SaveEnrollmentParamsImpl>
      get copyWith =>
          __$$SaveEnrollmentParamsImplCopyWithImpl<_$SaveEnrollmentParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveEnrollmentParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveEnrollmentParams implements SaveEnrollmentParams {
  const factory _SaveEnrollmentParams(
      {@JsonKey(name: 'student_id', includeIfNull: true) final int? studentId,
      @JsonKey(name: 'group_id', includeIfNull: true) final int? groupId,
      @JsonKey(name: 'enrolled_at', includeIfNull: true)
      final String? enrolledAt,
      @JsonKey(includeIfNull: true) final String? status,
      @JsonKey(name: 'left_at', includeIfNull: true) final String? leftAt,
      @JsonKey(includeIfNull: true)
      final String? notes}) = _$SaveEnrollmentParamsImpl;

  factory _SaveEnrollmentParams.fromJson(Map<String, dynamic> json) =
      _$SaveEnrollmentParamsImpl.fromJson;

  @override
  @JsonKey(name: 'student_id', includeIfNull: true)
  int? get studentId;
  @override
  @JsonKey(name: 'group_id', includeIfNull: true)
  int? get groupId;
  @override
  @JsonKey(name: 'enrolled_at', includeIfNull: true)
  String? get enrolledAt;
  @override
  @JsonKey(includeIfNull: true)
  String? get status;
  @override
  @JsonKey(name: 'left_at', includeIfNull: true)
  String? get leftAt;
  @override
  @JsonKey(includeIfNull: true)
  String? get notes;

  /// Create a copy of SaveEnrollmentParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveEnrollmentParamsImplCopyWith<_$SaveEnrollmentParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaveGroupParams _$SaveGroupParamsFromJson(Map<String, dynamic> json) {
  return _SaveGroupParams.fromJson(json);
}

/// @nodoc
mixin _$SaveGroupParams {
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
  Object? get capacity => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  double? get monthlyFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this SaveGroupParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveGroupParamsCopyWith<SaveGroupParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveGroupParamsCopyWith<$Res> {
  factory $SaveGroupParamsCopyWith(
          SaveGroupParams value, $Res Function(SaveGroupParams) then) =
      _$SaveGroupParamsCopyWithImpl<$Res, SaveGroupParams>;
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
      @JsonKey(includeIfNull: true) Object? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) double? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class _$SaveGroupParamsCopyWithImpl<$Res, $Val extends SaveGroupParams>
    implements $SaveGroupParamsCopyWith<$Res> {
  _$SaveGroupParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveGroupParams
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
      capacity: freezed == capacity ? _value.capacity : capacity,
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
abstract class _$$SaveGroupParamsImplCopyWith<$Res>
    implements $SaveGroupParamsCopyWith<$Res> {
  factory _$$SaveGroupParamsImplCopyWith(_$SaveGroupParamsImpl value,
          $Res Function(_$SaveGroupParamsImpl) then) =
      __$$SaveGroupParamsImplCopyWithImpl<$Res>;
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
      @JsonKey(includeIfNull: true) Object? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true) double? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true) bool? isActive});
}

/// @nodoc
class __$$SaveGroupParamsImplCopyWithImpl<$Res>
    extends _$SaveGroupParamsCopyWithImpl<$Res, _$SaveGroupParamsImpl>
    implements _$$SaveGroupParamsImplCopyWith<$Res> {
  __$$SaveGroupParamsImplCopyWithImpl(
      _$SaveGroupParamsImpl _value, $Res Function(_$SaveGroupParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveGroupParams
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
    return _then(_$SaveGroupParamsImpl(
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
      capacity: freezed == capacity ? _value.capacity : capacity,
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

@JsonSerializable(includeIfNull: false)
class _$SaveGroupParamsImpl implements _SaveGroupParams {
  const _$SaveGroupParamsImpl(
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

  factory _$SaveGroupParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveGroupParamsImplFromJson(json);

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
  final Object? capacity;
  @override
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  final double? monthlyFee;
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
    return 'SaveGroupParams(name: $name, academicYearId: $academicYearId, courseId: $courseId, teacherId: $teacherId, assistantTeacherId: $assistantTeacherId, gradeLevelId: $gradeLevelId, capacity: $capacity, monthlyFee: $monthlyFee, startsOn: $startsOn, endsOn: $endsOn, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveGroupParamsImpl &&
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
            const DeepCollectionEquality().equals(other.capacity, capacity) &&
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
      const DeepCollectionEquality().hash(capacity),
      monthlyFee,
      startsOn,
      endsOn,
      isActive);

  /// Create a copy of SaveGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveGroupParamsImplCopyWith<_$SaveGroupParamsImpl> get copyWith =>
      __$$SaveGroupParamsImplCopyWithImpl<_$SaveGroupParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveGroupParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveGroupParams implements SaveGroupParams {
  const factory _SaveGroupParams(
      {@JsonKey(includeIfNull: true) final String? name,
      @JsonKey(name: 'academic_year_id', includeIfNull: true)
      final int? academicYearId,
      @JsonKey(name: 'course_id', includeIfNull: true) final int? courseId,
      @JsonKey(name: 'teacher_id', includeIfNull: true) final int? teacherId,
      @JsonKey(name: 'assistant_teacher_id', includeIfNull: true)
      final int? assistantTeacherId,
      @JsonKey(name: 'grade_level_id', includeIfNull: true)
      final int? gradeLevelId,
      @JsonKey(includeIfNull: true) final Object? capacity,
      @JsonKey(name: 'monthly_fee', includeIfNull: true)
      final double? monthlyFee,
      @JsonKey(name: 'starts_on', includeIfNull: true) final String? startsOn,
      @JsonKey(name: 'ends_on', includeIfNull: true) final String? endsOn,
      @JsonKey(name: 'is_active', includeIfNull: true)
      final bool? isActive}) = _$SaveGroupParamsImpl;

  factory _SaveGroupParams.fromJson(Map<String, dynamic> json) =
      _$SaveGroupParamsImpl.fromJson;

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
  Object? get capacity;
  @override
  @JsonKey(name: 'monthly_fee', includeIfNull: true)
  double? get monthlyFee;
  @override
  @JsonKey(name: 'starts_on', includeIfNull: true)
  String? get startsOn;
  @override
  @JsonKey(name: 'ends_on', includeIfNull: true)
  String? get endsOn;
  @override
  @JsonKey(name: 'is_active', includeIfNull: true)
  bool? get isActive;

  /// Create a copy of SaveGroupParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveGroupParamsImplCopyWith<_$SaveGroupParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaveStudentParams _$SaveStudentParamsFromJson(Map<String, dynamic> json) {
  return _SaveStudentParams.fromJson(json);
}

/// @nodoc
mixin _$SaveStudentParams {
  @JsonKey(name: 'first_name', includeIfNull: true)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', includeIfNull: true)
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date', includeIfNull: true)
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id', includeIfNull: true)
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  int? get gradeLevelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at', includeIfNull: true)
  String? get joinedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
  int? get quranCurrentJuzId => throw _privateConstructorUsedError;
  @JsonKey(name: 'school_name', includeIfNull: true)
  String? get schoolName => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this SaveStudentParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveStudentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveStudentParamsCopyWith<SaveStudentParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveStudentParamsCopyWith<$Res> {
  factory $SaveStudentParamsCopyWith(
          SaveStudentParams value, $Res Function(SaveStudentParams) then) =
      _$SaveStudentParamsCopyWithImpl<$Res, SaveStudentParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name', includeIfNull: true) String? firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) String? lastName,
      @JsonKey(name: 'birth_date', includeIfNull: true) String? birthDate,
      @JsonKey(name: 'parent_id', includeIfNull: true) int? parentId,
      @JsonKey(includeIfNull: true) String? gender,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
      @JsonKey(name: 'joined_at', includeIfNull: true) String? joinedAt,
      @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
      int? quranCurrentJuzId,
      @JsonKey(name: 'school_name', includeIfNull: true) String? schoolName,
      @JsonKey(includeIfNull: true) String? notes});
}

/// @nodoc
class _$SaveStudentParamsCopyWithImpl<$Res, $Val extends SaveStudentParams>
    implements $SaveStudentParamsCopyWith<$Res> {
  _$SaveStudentParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveStudentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? parentId = freezed,
    Object? gender = freezed,
    Object? status = freezed,
    Object? gradeLevelId = freezed,
    Object? joinedAt = freezed,
    Object? quranCurrentJuzId = freezed,
    Object? schoolName = freezed,
    Object? notes = freezed,
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelId: freezed == gradeLevelId
          ? _value.gradeLevelId
          : gradeLevelId // ignore: cast_nullable_to_non_nullable
              as int?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuzId: freezed == quranCurrentJuzId
          ? _value.quranCurrentJuzId
          : quranCurrentJuzId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveStudentParamsImplCopyWith<$Res>
    implements $SaveStudentParamsCopyWith<$Res> {
  factory _$$SaveStudentParamsImplCopyWith(_$SaveStudentParamsImpl value,
          $Res Function(_$SaveStudentParamsImpl) then) =
      __$$SaveStudentParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name', includeIfNull: true) String? firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) String? lastName,
      @JsonKey(name: 'birth_date', includeIfNull: true) String? birthDate,
      @JsonKey(name: 'parent_id', includeIfNull: true) int? parentId,
      @JsonKey(includeIfNull: true) String? gender,
      @JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) int? gradeLevelId,
      @JsonKey(name: 'joined_at', includeIfNull: true) String? joinedAt,
      @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
      int? quranCurrentJuzId,
      @JsonKey(name: 'school_name', includeIfNull: true) String? schoolName,
      @JsonKey(includeIfNull: true) String? notes});
}

/// @nodoc
class __$$SaveStudentParamsImplCopyWithImpl<$Res>
    extends _$SaveStudentParamsCopyWithImpl<$Res, _$SaveStudentParamsImpl>
    implements _$$SaveStudentParamsImplCopyWith<$Res> {
  __$$SaveStudentParamsImplCopyWithImpl(_$SaveStudentParamsImpl _value,
      $Res Function(_$SaveStudentParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveStudentParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
    Object? parentId = freezed,
    Object? gender = freezed,
    Object? status = freezed,
    Object? gradeLevelId = freezed,
    Object? joinedAt = freezed,
    Object? quranCurrentJuzId = freezed,
    Object? schoolName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$SaveStudentParamsImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevelId: freezed == gradeLevelId
          ? _value.gradeLevelId
          : gradeLevelId // ignore: cast_nullable_to_non_nullable
              as int?,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      quranCurrentJuzId: freezed == quranCurrentJuzId
          ? _value.quranCurrentJuzId
          : quranCurrentJuzId // ignore: cast_nullable_to_non_nullable
              as int?,
      schoolName: freezed == schoolName
          ? _value.schoolName
          : schoolName // ignore: cast_nullable_to_non_nullable
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
class _$SaveStudentParamsImpl implements _SaveStudentParams {
  const _$SaveStudentParamsImpl(
      {@JsonKey(name: 'first_name', includeIfNull: true) this.firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) this.lastName,
      @JsonKey(name: 'birth_date', includeIfNull: true) this.birthDate,
      @JsonKey(name: 'parent_id', includeIfNull: true) this.parentId,
      @JsonKey(includeIfNull: true) this.gender,
      @JsonKey(includeIfNull: true) this.status,
      @JsonKey(name: 'grade_level_id', includeIfNull: true) this.gradeLevelId,
      @JsonKey(name: 'joined_at', includeIfNull: true) this.joinedAt,
      @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
      this.quranCurrentJuzId,
      @JsonKey(name: 'school_name', includeIfNull: true) this.schoolName,
      @JsonKey(includeIfNull: true) this.notes});

  factory _$SaveStudentParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveStudentParamsImplFromJson(json);

  @override
  @JsonKey(name: 'first_name', includeIfNull: true)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name', includeIfNull: true)
  final String? lastName;
  @override
  @JsonKey(name: 'birth_date', includeIfNull: true)
  final String? birthDate;
  @override
  @JsonKey(name: 'parent_id', includeIfNull: true)
  final int? parentId;
  @override
  @JsonKey(includeIfNull: true)
  final String? gender;
  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  final int? gradeLevelId;
  @override
  @JsonKey(name: 'joined_at', includeIfNull: true)
  final String? joinedAt;
  @override
  @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
  final int? quranCurrentJuzId;
  @override
  @JsonKey(name: 'school_name', includeIfNull: true)
  final String? schoolName;
  @override
  @JsonKey(includeIfNull: true)
  final String? notes;

  @override
  String toString() {
    return 'SaveStudentParams(firstName: $firstName, lastName: $lastName, birthDate: $birthDate, parentId: $parentId, gender: $gender, status: $status, gradeLevelId: $gradeLevelId, joinedAt: $joinedAt, quranCurrentJuzId: $quranCurrentJuzId, schoolName: $schoolName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveStudentParamsImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gradeLevelId, gradeLevelId) ||
                other.gradeLevelId == gradeLevelId) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.quranCurrentJuzId, quranCurrentJuzId) ||
                other.quranCurrentJuzId == quranCurrentJuzId) &&
            (identical(other.schoolName, schoolName) ||
                other.schoolName == schoolName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      birthDate,
      parentId,
      gender,
      status,
      gradeLevelId,
      joinedAt,
      quranCurrentJuzId,
      schoolName,
      notes);

  /// Create a copy of SaveStudentParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveStudentParamsImplCopyWith<_$SaveStudentParamsImpl> get copyWith =>
      __$$SaveStudentParamsImplCopyWithImpl<_$SaveStudentParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveStudentParamsImplToJson(
      this,
    );
  }
}

abstract class _SaveStudentParams implements SaveStudentParams {
  const factory _SaveStudentParams(
      {@JsonKey(name: 'first_name', includeIfNull: true)
      final String? firstName,
      @JsonKey(name: 'last_name', includeIfNull: true) final String? lastName,
      @JsonKey(name: 'birth_date', includeIfNull: true) final String? birthDate,
      @JsonKey(name: 'parent_id', includeIfNull: true) final int? parentId,
      @JsonKey(includeIfNull: true) final String? gender,
      @JsonKey(includeIfNull: true) final String? status,
      @JsonKey(name: 'grade_level_id', includeIfNull: true)
      final int? gradeLevelId,
      @JsonKey(name: 'joined_at', includeIfNull: true) final String? joinedAt,
      @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
      final int? quranCurrentJuzId,
      @JsonKey(name: 'school_name', includeIfNull: true)
      final String? schoolName,
      @JsonKey(includeIfNull: true)
      final String? notes}) = _$SaveStudentParamsImpl;

  factory _SaveStudentParams.fromJson(Map<String, dynamic> json) =
      _$SaveStudentParamsImpl.fromJson;

  @override
  @JsonKey(name: 'first_name', includeIfNull: true)
  String? get firstName;
  @override
  @JsonKey(name: 'last_name', includeIfNull: true)
  String? get lastName;
  @override
  @JsonKey(name: 'birth_date', includeIfNull: true)
  String? get birthDate;
  @override
  @JsonKey(name: 'parent_id', includeIfNull: true)
  int? get parentId;
  @override
  @JsonKey(includeIfNull: true)
  String? get gender;
  @override
  @JsonKey(includeIfNull: true)
  String? get status;
  @override
  @JsonKey(name: 'grade_level_id', includeIfNull: true)
  int? get gradeLevelId;
  @override
  @JsonKey(name: 'joined_at', includeIfNull: true)
  String? get joinedAt;
  @override
  @JsonKey(name: 'quran_current_juz_id', includeIfNull: true)
  int? get quranCurrentJuzId;
  @override
  @JsonKey(name: 'school_name', includeIfNull: true)
  String? get schoolName;
  @override
  @JsonKey(includeIfNull: true)
  String? get notes;

  /// Create a copy of SaveStudentParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveStudentParamsImplCopyWith<_$SaveStudentParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SetStudentAttendanceDayStatusParams
    _$SetStudentAttendanceDayStatusParamsFromJson(Map<String, dynamic> json) {
  return _SetStudentAttendanceDayStatusParams.fromJson(json);
}

/// @nodoc
mixin _$SetStudentAttendanceDayStatusParams {
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this SetStudentAttendanceDayStatusParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetStudentAttendanceDayStatusParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetStudentAttendanceDayStatusParamsCopyWith<
          SetStudentAttendanceDayStatusParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetStudentAttendanceDayStatusParamsCopyWith<$Res> {
  factory $SetStudentAttendanceDayStatusParamsCopyWith(
          SetStudentAttendanceDayStatusParams value,
          $Res Function(SetStudentAttendanceDayStatusParams) then) =
      _$SetStudentAttendanceDayStatusParamsCopyWithImpl<$Res,
          SetStudentAttendanceDayStatusParams>;
  @useResult
  $Res call({@JsonKey(includeIfNull: true) String? status});
}

/// @nodoc
class _$SetStudentAttendanceDayStatusParamsCopyWithImpl<$Res,
        $Val extends SetStudentAttendanceDayStatusParams>
    implements $SetStudentAttendanceDayStatusParamsCopyWith<$Res> {
  _$SetStudentAttendanceDayStatusParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetStudentAttendanceDayStatusParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetStudentAttendanceDayStatusParamsImplCopyWith<$Res>
    implements $SetStudentAttendanceDayStatusParamsCopyWith<$Res> {
  factory _$$SetStudentAttendanceDayStatusParamsImplCopyWith(
          _$SetStudentAttendanceDayStatusParamsImpl value,
          $Res Function(_$SetStudentAttendanceDayStatusParamsImpl) then) =
      __$$SetStudentAttendanceDayStatusParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: true) String? status});
}

/// @nodoc
class __$$SetStudentAttendanceDayStatusParamsImplCopyWithImpl<$Res>
    extends _$SetStudentAttendanceDayStatusParamsCopyWithImpl<$Res,
        _$SetStudentAttendanceDayStatusParamsImpl>
    implements _$$SetStudentAttendanceDayStatusParamsImplCopyWith<$Res> {
  __$$SetStudentAttendanceDayStatusParamsImplCopyWithImpl(
      _$SetStudentAttendanceDayStatusParamsImpl _value,
      $Res Function(_$SetStudentAttendanceDayStatusParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetStudentAttendanceDayStatusParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$SetStudentAttendanceDayStatusParamsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SetStudentAttendanceDayStatusParamsImpl
    implements _SetStudentAttendanceDayStatusParams {
  const _$SetStudentAttendanceDayStatusParamsImpl(
      {@JsonKey(includeIfNull: true) this.status});

  factory _$SetStudentAttendanceDayStatusParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SetStudentAttendanceDayStatusParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? status;

  @override
  String toString() {
    return 'SetStudentAttendanceDayStatusParams(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetStudentAttendanceDayStatusParamsImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of SetStudentAttendanceDayStatusParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetStudentAttendanceDayStatusParamsImplCopyWith<
          _$SetStudentAttendanceDayStatusParamsImpl>
      get copyWith => __$$SetStudentAttendanceDayStatusParamsImplCopyWithImpl<
          _$SetStudentAttendanceDayStatusParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetStudentAttendanceDayStatusParamsImplToJson(
      this,
    );
  }
}

abstract class _SetStudentAttendanceDayStatusParams
    implements SetStudentAttendanceDayStatusParams {
  const factory _SetStudentAttendanceDayStatusParams(
          {@JsonKey(includeIfNull: true) final String? status}) =
      _$SetStudentAttendanceDayStatusParamsImpl;

  factory _SetStudentAttendanceDayStatusParams.fromJson(
          Map<String, dynamic> json) =
      _$SetStudentAttendanceDayStatusParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get status;

  /// Create a copy of SetStudentAttendanceDayStatusParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetStudentAttendanceDayStatusParamsImplCopyWith<
          _$SetStudentAttendanceDayStatusParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TakeGroupAttendanceParams _$TakeGroupAttendanceParamsFromJson(
    Map<String, dynamic> json) {
  return _TakeGroupAttendanceParams.fromJson(json);
}

/// @nodoc
mixin _$TakeGroupAttendanceParams {
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  Object? get records => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this TakeGroupAttendanceParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TakeGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TakeGroupAttendanceParamsCopyWith<TakeGroupAttendanceParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TakeGroupAttendanceParamsCopyWith<$Res> {
  factory $TakeGroupAttendanceParamsCopyWith(TakeGroupAttendanceParams value,
          $Res Function(TakeGroupAttendanceParams) then) =
      _$TakeGroupAttendanceParamsCopyWithImpl<$Res, TakeGroupAttendanceParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate,
      @JsonKey(includeIfNull: true) Object? records,
      String? notes});
}

/// @nodoc
class _$TakeGroupAttendanceParamsCopyWithImpl<$Res,
        $Val extends TakeGroupAttendanceParams>
    implements $TakeGroupAttendanceParamsCopyWith<$Res> {
  _$TakeGroupAttendanceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TakeGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? records = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records ? _value.records : records,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TakeGroupAttendanceParamsImplCopyWith<$Res>
    implements $TakeGroupAttendanceParamsCopyWith<$Res> {
  factory _$$TakeGroupAttendanceParamsImplCopyWith(
          _$TakeGroupAttendanceParamsImpl value,
          $Res Function(_$TakeGroupAttendanceParamsImpl) then) =
      __$$TakeGroupAttendanceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      String? attendanceDate,
      @JsonKey(includeIfNull: true) Object? records,
      String? notes});
}

/// @nodoc
class __$$TakeGroupAttendanceParamsImplCopyWithImpl<$Res>
    extends _$TakeGroupAttendanceParamsCopyWithImpl<$Res,
        _$TakeGroupAttendanceParamsImpl>
    implements _$$TakeGroupAttendanceParamsImplCopyWith<$Res> {
  __$$TakeGroupAttendanceParamsImplCopyWithImpl(
      _$TakeGroupAttendanceParamsImpl _value,
      $Res Function(_$TakeGroupAttendanceParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TakeGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? records = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$TakeGroupAttendanceParamsImpl(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      records: freezed == records ? _value.records : records,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$TakeGroupAttendanceParamsImpl implements _TakeGroupAttendanceParams {
  const _$TakeGroupAttendanceParamsImpl(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      this.attendanceDate,
      @JsonKey(includeIfNull: true) this.records,
      this.notes});

  factory _$TakeGroupAttendanceParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TakeGroupAttendanceParamsImplFromJson(json);

  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  final String? attendanceDate;
  @override
  @JsonKey(includeIfNull: true)
  final Object? records;
  @override
  final String? notes;

  @override
  String toString() {
    return 'TakeGroupAttendanceParams(attendanceDate: $attendanceDate, records: $records, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TakeGroupAttendanceParamsImpl &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            const DeepCollectionEquality().equals(other.records, records) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attendanceDate,
      const DeepCollectionEquality().hash(records), notes);

  /// Create a copy of TakeGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TakeGroupAttendanceParamsImplCopyWith<_$TakeGroupAttendanceParamsImpl>
      get copyWith => __$$TakeGroupAttendanceParamsImplCopyWithImpl<
          _$TakeGroupAttendanceParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TakeGroupAttendanceParamsImplToJson(
      this,
    );
  }
}

abstract class _TakeGroupAttendanceParams implements TakeGroupAttendanceParams {
  const factory _TakeGroupAttendanceParams(
      {@JsonKey(name: 'attendance_date', includeIfNull: true)
      final String? attendanceDate,
      @JsonKey(includeIfNull: true) final Object? records,
      final String? notes}) = _$TakeGroupAttendanceParamsImpl;

  factory _TakeGroupAttendanceParams.fromJson(Map<String, dynamic> json) =
      _$TakeGroupAttendanceParamsImpl.fromJson;

  @override
  @JsonKey(name: 'attendance_date', includeIfNull: true)
  String? get attendanceDate;
  @override
  @JsonKey(includeIfNull: true)
  Object? get records;
  @override
  String? get notes;

  /// Create a copy of TakeGroupAttendanceParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TakeGroupAttendanceParamsImplCopyWith<_$TakeGroupAttendanceParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateLessonTaughtParams _$UpdateLessonTaughtParamsFromJson(
    Map<String, dynamic> json) {
  return _UpdateLessonTaughtParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateLessonTaughtParams {
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_taught', includeIfNull: true)
  bool? get isTaught => throw _privateConstructorUsedError;

  /// Serializes this UpdateLessonTaughtParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateLessonTaughtParamsCopyWith<UpdateLessonTaughtParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLessonTaughtParamsCopyWith<$Res> {
  factory $UpdateLessonTaughtParamsCopyWith(UpdateLessonTaughtParams value,
          $Res Function(UpdateLessonTaughtParams) then) =
      _$UpdateLessonTaughtParamsCopyWithImpl<$Res, UpdateLessonTaughtParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'is_taught', includeIfNull: true) bool? isTaught});
}

/// @nodoc
class _$UpdateLessonTaughtParamsCopyWithImpl<$Res,
        $Val extends UpdateLessonTaughtParams>
    implements $UpdateLessonTaughtParamsCopyWith<$Res> {
  _$UpdateLessonTaughtParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isTaught = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isTaught: freezed == isTaught
          ? _value.isTaught
          : isTaught // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateLessonTaughtParamsImplCopyWith<$Res>
    implements $UpdateLessonTaughtParamsCopyWith<$Res> {
  factory _$$UpdateLessonTaughtParamsImplCopyWith(
          _$UpdateLessonTaughtParamsImpl value,
          $Res Function(_$UpdateLessonTaughtParamsImpl) then) =
      __$$UpdateLessonTaughtParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? status,
      @JsonKey(name: 'is_taught', includeIfNull: true) bool? isTaught});
}

/// @nodoc
class __$$UpdateLessonTaughtParamsImplCopyWithImpl<$Res>
    extends _$UpdateLessonTaughtParamsCopyWithImpl<$Res,
        _$UpdateLessonTaughtParamsImpl>
    implements _$$UpdateLessonTaughtParamsImplCopyWith<$Res> {
  __$$UpdateLessonTaughtParamsImplCopyWithImpl(
      _$UpdateLessonTaughtParamsImpl _value,
      $Res Function(_$UpdateLessonTaughtParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isTaught = freezed,
  }) {
    return _then(_$UpdateLessonTaughtParamsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isTaught: freezed == isTaught
          ? _value.isTaught
          : isTaught // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$UpdateLessonTaughtParamsImpl implements _UpdateLessonTaughtParams {
  const _$UpdateLessonTaughtParamsImpl(
      {@JsonKey(includeIfNull: true) this.status,
      @JsonKey(name: 'is_taught', includeIfNull: true) this.isTaught});

  factory _$UpdateLessonTaughtParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateLessonTaughtParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? status;
  @override
  @JsonKey(name: 'is_taught', includeIfNull: true)
  final bool? isTaught;

  @override
  String toString() {
    return 'UpdateLessonTaughtParams(status: $status, isTaught: $isTaught)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLessonTaughtParamsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isTaught, isTaught) ||
                other.isTaught == isTaught));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, isTaught);

  /// Create a copy of UpdateLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLessonTaughtParamsImplCopyWith<_$UpdateLessonTaughtParamsImpl>
      get copyWith => __$$UpdateLessonTaughtParamsImplCopyWithImpl<
          _$UpdateLessonTaughtParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateLessonTaughtParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateLessonTaughtParams implements UpdateLessonTaughtParams {
  const factory _UpdateLessonTaughtParams(
      {@JsonKey(includeIfNull: true) final String? status,
      @JsonKey(name: 'is_taught', includeIfNull: true)
      final bool? isTaught}) = _$UpdateLessonTaughtParamsImpl;

  factory _UpdateLessonTaughtParams.fromJson(Map<String, dynamic> json) =
      _$UpdateLessonTaughtParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get status;
  @override
  @JsonKey(name: 'is_taught', includeIfNull: true)
  bool? get isTaught;

  /// Create a copy of UpdateLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateLessonTaughtParamsImplCopyWith<_$UpdateLessonTaughtParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateStudentNoteParams _$UpdateStudentNoteParamsFromJson(
    Map<String, dynamic> json) {
  return _UpdateStudentNoteParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateStudentNoteParams {
  @JsonKey(includeIfNull: true)
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'noted_at', includeIfNull: true)
  String? get notedAt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get visibility => throw _privateConstructorUsedError;

  /// Serializes this UpdateStudentNoteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateStudentNoteParamsCopyWith<UpdateStudentNoteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateStudentNoteParamsCopyWith<$Res> {
  factory $UpdateStudentNoteParamsCopyWith(UpdateStudentNoteParams value,
          $Res Function(UpdateStudentNoteParams) then) =
      _$UpdateStudentNoteParamsCopyWithImpl<$Res, UpdateStudentNoteParams>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? body,
      @JsonKey(name: 'noted_at', includeIfNull: true) String? notedAt,
      @JsonKey(includeIfNull: true) String? source,
      @JsonKey(includeIfNull: true) String? visibility});
}

/// @nodoc
class _$UpdateStudentNoteParamsCopyWithImpl<$Res,
        $Val extends UpdateStudentNoteParams>
    implements $UpdateStudentNoteParamsCopyWith<$Res> {
  _$UpdateStudentNoteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? notedAt = freezed,
    Object? source = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateStudentNoteParamsImplCopyWith<$Res>
    implements $UpdateStudentNoteParamsCopyWith<$Res> {
  factory _$$UpdateStudentNoteParamsImplCopyWith(
          _$UpdateStudentNoteParamsImpl value,
          $Res Function(_$UpdateStudentNoteParamsImpl) then) =
      __$$UpdateStudentNoteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: true) String? body,
      @JsonKey(name: 'noted_at', includeIfNull: true) String? notedAt,
      @JsonKey(includeIfNull: true) String? source,
      @JsonKey(includeIfNull: true) String? visibility});
}

/// @nodoc
class __$$UpdateStudentNoteParamsImplCopyWithImpl<$Res>
    extends _$UpdateStudentNoteParamsCopyWithImpl<$Res,
        _$UpdateStudentNoteParamsImpl>
    implements _$$UpdateStudentNoteParamsImplCopyWith<$Res> {
  __$$UpdateStudentNoteParamsImplCopyWithImpl(
      _$UpdateStudentNoteParamsImpl _value,
      $Res Function(_$UpdateStudentNoteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? notedAt = freezed,
    Object? source = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_$UpdateStudentNoteParamsImpl(
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
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$UpdateStudentNoteParamsImpl implements _UpdateStudentNoteParams {
  const _$UpdateStudentNoteParamsImpl(
      {@JsonKey(includeIfNull: true) this.body,
      @JsonKey(name: 'noted_at', includeIfNull: true) this.notedAt,
      @JsonKey(includeIfNull: true) this.source,
      @JsonKey(includeIfNull: true) this.visibility});

  factory _$UpdateStudentNoteParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateStudentNoteParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? body;
  @override
  @JsonKey(name: 'noted_at', includeIfNull: true)
  final String? notedAt;
  @override
  @JsonKey(includeIfNull: true)
  final String? source;
  @override
  @JsonKey(includeIfNull: true)
  final String? visibility;

  @override
  String toString() {
    return 'UpdateStudentNoteParams(body: $body, notedAt: $notedAt, source: $source, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStudentNoteParamsImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.notedAt, notedAt) || other.notedAt == notedAt) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, body, notedAt, source, visibility);

  /// Create a copy of UpdateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStudentNoteParamsImplCopyWith<_$UpdateStudentNoteParamsImpl>
      get copyWith => __$$UpdateStudentNoteParamsImplCopyWithImpl<
          _$UpdateStudentNoteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateStudentNoteParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateStudentNoteParams implements UpdateStudentNoteParams {
  const factory _UpdateStudentNoteParams(
          {@JsonKey(includeIfNull: true) final String? body,
          @JsonKey(name: 'noted_at', includeIfNull: true) final String? notedAt,
          @JsonKey(includeIfNull: true) final String? source,
          @JsonKey(includeIfNull: true) final String? visibility}) =
      _$UpdateStudentNoteParamsImpl;

  factory _UpdateStudentNoteParams.fromJson(Map<String, dynamic> json) =
      _$UpdateStudentNoteParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get body;
  @override
  @JsonKey(name: 'noted_at', includeIfNull: true)
  String? get notedAt;
  @override
  @JsonKey(includeIfNull: true)
  String? get source;
  @override
  @JsonKey(includeIfNull: true)
  String? get visibility;

  /// Create a copy of UpdateStudentNoteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStudentNoteParamsImplCopyWith<_$UpdateStudentNoteParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PatchLessonTaughtParams _$PatchLessonTaughtParamsFromJson(
    Map<String, dynamic> json) {
  return _PatchLessonTaughtParams.fromJson(json);
}

/// @nodoc
mixin _$PatchLessonTaughtParams {
  @JsonKey(includeIfNull: true)
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this PatchLessonTaughtParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchLessonTaughtParamsCopyWith<PatchLessonTaughtParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchLessonTaughtParamsCopyWith<$Res> {
  factory $PatchLessonTaughtParamsCopyWith(PatchLessonTaughtParams value,
          $Res Function(PatchLessonTaughtParams) then) =
      _$PatchLessonTaughtParamsCopyWithImpl<$Res, PatchLessonTaughtParams>;
  @useResult
  $Res call({@JsonKey(includeIfNull: true) String? status});
}

/// @nodoc
class _$PatchLessonTaughtParamsCopyWithImpl<$Res,
        $Val extends PatchLessonTaughtParams>
    implements $PatchLessonTaughtParamsCopyWith<$Res> {
  _$PatchLessonTaughtParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchLessonTaughtParamsImplCopyWith<$Res>
    implements $PatchLessonTaughtParamsCopyWith<$Res> {
  factory _$$PatchLessonTaughtParamsImplCopyWith(
          _$PatchLessonTaughtParamsImpl value,
          $Res Function(_$PatchLessonTaughtParamsImpl) then) =
      __$$PatchLessonTaughtParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(includeIfNull: true) String? status});
}

/// @nodoc
class __$$PatchLessonTaughtParamsImplCopyWithImpl<$Res>
    extends _$PatchLessonTaughtParamsCopyWithImpl<$Res,
        _$PatchLessonTaughtParamsImpl>
    implements _$$PatchLessonTaughtParamsImplCopyWith<$Res> {
  __$$PatchLessonTaughtParamsImplCopyWithImpl(
      _$PatchLessonTaughtParamsImpl _value,
      $Res Function(_$PatchLessonTaughtParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$PatchLessonTaughtParamsImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$PatchLessonTaughtParamsImpl implements _PatchLessonTaughtParams {
  const _$PatchLessonTaughtParamsImpl(
      {@JsonKey(includeIfNull: true) this.status});

  factory _$PatchLessonTaughtParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchLessonTaughtParamsImplFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? status;

  @override
  String toString() {
    return 'PatchLessonTaughtParams(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchLessonTaughtParamsImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of PatchLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchLessonTaughtParamsImplCopyWith<_$PatchLessonTaughtParamsImpl>
      get copyWith => __$$PatchLessonTaughtParamsImplCopyWithImpl<
          _$PatchLessonTaughtParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchLessonTaughtParamsImplToJson(
      this,
    );
  }
}

abstract class _PatchLessonTaughtParams implements PatchLessonTaughtParams {
  const factory _PatchLessonTaughtParams(
          {@JsonKey(includeIfNull: true) final String? status}) =
      _$PatchLessonTaughtParamsImpl;

  factory _PatchLessonTaughtParams.fromJson(Map<String, dynamic> json) =
      _$PatchLessonTaughtParamsImpl.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get status;

  /// Create a copy of PatchLessonTaughtParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchLessonTaughtParamsImplCopyWith<_$PatchLessonTaughtParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
