// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentProfileInfoModel _$StudentProfileInfoModelFromJson(
    Map<String, dynamic> json) {
  return _StudentProfileInfoModel.fromJson(json);
}

/// @nodoc
mixin _$StudentProfileInfoModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
  String? get studentNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_level', readValue: readJsonMap)
  NamedRefModel? get gradeLevel => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
  int? get quranCurrentJuz => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentProfileInfoHasPhoto,
      fromJson: _studentProfileInfoHasPhotoValue)
  bool? get hasPhoto => throw _privateConstructorUsedError;

  /// Create a copy of StudentProfileInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentProfileInfoModelCopyWith<StudentProfileInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProfileInfoModelCopyWith<$Res> {
  factory $StudentProfileInfoModelCopyWith(StudentProfileInfoModel value,
          $Res Function(StudentProfileInfoModel) then) =
      _$StudentProfileInfoModelCopyWithImpl<$Res, StudentProfileInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      String? studentNumber,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
      String? birthDate,
      @JsonKey(name: 'grade_level', readValue: readJsonMap)
      NamedRefModel? gradeLevel,
      @JsonKey(readValue: readJsonMap) NamedRefModel? parent,
      @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
      int? quranCurrentJuz,
      @JsonKey(
          readValue: _studentProfileInfoHasPhoto,
          fromJson: _studentProfileInfoHasPhotoValue)
      bool? hasPhoto});

  $NamedRefModelCopyWith<$Res>? get gradeLevel;
  $NamedRefModelCopyWith<$Res>? get parent;
}

/// @nodoc
class _$StudentProfileInfoModelCopyWithImpl<$Res,
        $Val extends StudentProfileInfoModel>
    implements $StudentProfileInfoModelCopyWith<$Res> {
  _$StudentProfileInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentProfileInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? studentNumber = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? gradeLevel = freezed,
    Object? parent = freezed,
    Object? quranCurrentJuz = freezed,
    Object? hasPhoto = freezed,
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
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      hasPhoto: freezed == hasPhoto
          ? _value.hasPhoto
          : hasPhoto // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of StudentProfileInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get gradeLevel {
    if (_value.gradeLevel == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.gradeLevel!, (value) {
      return _then(_value.copyWith(gradeLevel: value) as $Val);
    });
  }

  /// Create a copy of StudentProfileInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentProfileInfoModelImplCopyWith<$Res>
    implements $StudentProfileInfoModelCopyWith<$Res> {
  factory _$$StudentProfileInfoModelImplCopyWith(
          _$StudentProfileInfoModelImpl value,
          $Res Function(_$StudentProfileInfoModelImpl) then) =
      __$$StudentProfileInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      String? studentNumber,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
      String? birthDate,
      @JsonKey(name: 'grade_level', readValue: readJsonMap)
      NamedRefModel? gradeLevel,
      @JsonKey(readValue: readJsonMap) NamedRefModel? parent,
      @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
      int? quranCurrentJuz,
      @JsonKey(
          readValue: _studentProfileInfoHasPhoto,
          fromJson: _studentProfileInfoHasPhotoValue)
      bool? hasPhoto});

  @override
  $NamedRefModelCopyWith<$Res>? get gradeLevel;
  @override
  $NamedRefModelCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$StudentProfileInfoModelImplCopyWithImpl<$Res>
    extends _$StudentProfileInfoModelCopyWithImpl<$Res,
        _$StudentProfileInfoModelImpl>
    implements _$$StudentProfileInfoModelImplCopyWith<$Res> {
  __$$StudentProfileInfoModelImplCopyWithImpl(
      _$StudentProfileInfoModelImpl _value,
      $Res Function(_$StudentProfileInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentProfileInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? studentNumber = freezed,
    Object? status = freezed,
    Object? birthDate = freezed,
    Object? gradeLevel = freezed,
    Object? parent = freezed,
    Object? quranCurrentJuz = freezed,
    Object? hasPhoto = freezed,
  }) {
    return _then(_$StudentProfileInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      studentNumber: freezed == studentNumber
          ? _value.studentNumber
          : studentNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      quranCurrentJuz: freezed == quranCurrentJuz
          ? _value.quranCurrentJuz
          : quranCurrentJuz // ignore: cast_nullable_to_non_nullable
              as int?,
      hasPhoto: freezed == hasPhoto
          ? _value.hasPhoto
          : hasPhoto // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentProfileInfoModelImpl implements _StudentProfileInfoModel {
  const _$StudentProfileInfoModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      this.studentNumber,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient) this.birthDate,
      @JsonKey(name: 'grade_level', readValue: readJsonMap) this.gradeLevel,
      @JsonKey(readValue: readJsonMap) this.parent,
      @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
      this.quranCurrentJuz,
      @JsonKey(
          readValue: _studentProfileInfoHasPhoto,
          fromJson: _studentProfileInfoHasPhotoValue)
      this.hasPhoto});

  factory _$StudentProfileInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentProfileInfoModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
  final String? studentNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
  final String? birthDate;
  @override
  @JsonKey(name: 'grade_level', readValue: readJsonMap)
  final NamedRefModel? gradeLevel;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? parent;
  @override
  @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
  final int? quranCurrentJuz;
  @override
  @JsonKey(
      readValue: _studentProfileInfoHasPhoto,
      fromJson: _studentProfileInfoHasPhotoValue)
  final bool? hasPhoto;

  @override
  String toString() {
    return 'StudentProfileInfoModel(id: $id, name: $name, studentNumber: $studentNumber, status: $status, birthDate: $birthDate, gradeLevel: $gradeLevel, parent: $parent, quranCurrentJuz: $quranCurrentJuz, hasPhoto: $hasPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProfileInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.studentNumber, studentNumber) ||
                other.studentNumber == studentNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gradeLevel, gradeLevel) ||
                other.gradeLevel == gradeLevel) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.quranCurrentJuz, quranCurrentJuz) ||
                other.quranCurrentJuz == quranCurrentJuz) &&
            (identical(other.hasPhoto, hasPhoto) ||
                other.hasPhoto == hasPhoto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, studentNumber, status,
      birthDate, gradeLevel, parent, quranCurrentJuz, hasPhoto);

  /// Create a copy of StudentProfileInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProfileInfoModelImplCopyWith<_$StudentProfileInfoModelImpl>
      get copyWith => __$$StudentProfileInfoModelImplCopyWithImpl<
          _$StudentProfileInfoModelImpl>(this, _$identity);
}

abstract class _StudentProfileInfoModel implements StudentProfileInfoModel {
  const factory _StudentProfileInfoModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
      final String? studentNumber,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
      final String? birthDate,
      @JsonKey(name: 'grade_level', readValue: readJsonMap)
      final NamedRefModel? gradeLevel,
      @JsonKey(readValue: readJsonMap) final NamedRefModel? parent,
      @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
      final int? quranCurrentJuz,
      @JsonKey(
          readValue: _studentProfileInfoHasPhoto,
          fromJson: _studentProfileInfoHasPhotoValue)
      final bool? hasPhoto}) = _$StudentProfileInfoModelImpl;

  factory _StudentProfileInfoModel.fromJson(Map<String, dynamic> json) =
      _$StudentProfileInfoModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(name: 'student_number', fromJson: jsonStringLenient)
  String? get studentNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'birth_date', fromJson: jsonStringLenient)
  String? get birthDate;
  @override
  @JsonKey(name: 'grade_level', readValue: readJsonMap)
  NamedRefModel? get gradeLevel;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get parent;
  @override
  @JsonKey(name: 'quran_current_juz', fromJson: jsonIntLenient)
  int? get quranCurrentJuz;
  @override
  @JsonKey(
      readValue: _studentProfileInfoHasPhoto,
      fromJson: _studentProfileInfoHasPhotoValue)
  bool? get hasPhoto;

  /// Create a copy of StudentProfileInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentProfileInfoModelImplCopyWith<_$StudentProfileInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentEnrollmentInfoModel _$StudentEnrollmentInfoModelFromJson(
    Map<String, dynamic> json) {
  return _StudentEnrollmentInfoModel.fromJson(json);
}

/// @nodoc
mixin _$StudentEnrollmentInfoModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
  String? get enrolledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'left_at', fromJson: jsonStringLenient)
  String? get leftAt => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get group => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get course => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher => throw _privateConstructorUsedError;

  /// Create a copy of StudentEnrollmentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentEnrollmentInfoModelCopyWith<StudentEnrollmentInfoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentEnrollmentInfoModelCopyWith<$Res> {
  factory $StudentEnrollmentInfoModelCopyWith(StudentEnrollmentInfoModel value,
          $Res Function(StudentEnrollmentInfoModel) then) =
      _$StudentEnrollmentInfoModelCopyWithImpl<$Res,
          StudentEnrollmentInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
      String? enrolledAt,
      @JsonKey(name: 'left_at', fromJson: jsonStringLenient) String? leftAt,
      @JsonKey(readValue: readJsonMap) NamedRefModel? group,
      @JsonKey(readValue: readJsonMap) NamedRefModel? course,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  $NamedRefModelCopyWith<$Res>? get group;
  $NamedRefModelCopyWith<$Res>? get course;
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class _$StudentEnrollmentInfoModelCopyWithImpl<$Res,
        $Val extends StudentEnrollmentInfoModel>
    implements $StudentEnrollmentInfoModelCopyWith<$Res> {
  _$StudentEnrollmentInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentEnrollmentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
    Object? leftAt = freezed,
    Object? group = freezed,
    Object? course = freezed,
    Object? teacher = freezed,
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
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ) as $Val);
  }

  /// Create a copy of StudentEnrollmentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  /// Create a copy of StudentEnrollmentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NamedRefModelCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $NamedRefModelCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

  /// Create a copy of StudentEnrollmentInfoModel
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
abstract class _$$StudentEnrollmentInfoModelImplCopyWith<$Res>
    implements $StudentEnrollmentInfoModelCopyWith<$Res> {
  factory _$$StudentEnrollmentInfoModelImplCopyWith(
          _$StudentEnrollmentInfoModelImpl value,
          $Res Function(_$StudentEnrollmentInfoModelImpl) then) =
      __$$StudentEnrollmentInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
      String? enrolledAt,
      @JsonKey(name: 'left_at', fromJson: jsonStringLenient) String? leftAt,
      @JsonKey(readValue: readJsonMap) NamedRefModel? group,
      @JsonKey(readValue: readJsonMap) NamedRefModel? course,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  @override
  $NamedRefModelCopyWith<$Res>? get group;
  @override
  $NamedRefModelCopyWith<$Res>? get course;
  @override
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class __$$StudentEnrollmentInfoModelImplCopyWithImpl<$Res>
    extends _$StudentEnrollmentInfoModelCopyWithImpl<$Res,
        _$StudentEnrollmentInfoModelImpl>
    implements _$$StudentEnrollmentInfoModelImplCopyWith<$Res> {
  __$$StudentEnrollmentInfoModelImplCopyWithImpl(
      _$StudentEnrollmentInfoModelImpl _value,
      $Res Function(_$StudentEnrollmentInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentEnrollmentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? enrolledAt = freezed,
    Object? leftAt = freezed,
    Object? group = freezed,
    Object? course = freezed,
    Object? teacher = freezed,
  }) {
    return _then(_$StudentEnrollmentInfoModelImpl(
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
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentEnrollmentInfoModelImpl implements _StudentEnrollmentInfoModel {
  const _$StudentEnrollmentInfoModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
      this.enrolledAt,
      @JsonKey(name: 'left_at', fromJson: jsonStringLenient) this.leftAt,
      @JsonKey(readValue: readJsonMap) this.group,
      @JsonKey(readValue: readJsonMap) this.course,
      @JsonKey(readValue: readJsonMap) this.teacher});

  factory _$StudentEnrollmentInfoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StudentEnrollmentInfoModelImplFromJson(json);

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
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? group;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? course;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? teacher;

  @override
  String toString() {
    return 'StudentEnrollmentInfoModel(id: $id, status: $status, enrolledAt: $enrolledAt, leftAt: $leftAt, group: $group, course: $course, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentEnrollmentInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enrolledAt, enrolledAt) ||
                other.enrolledAt == enrolledAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, enrolledAt, leftAt, group, course, teacher);

  /// Create a copy of StudentEnrollmentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentEnrollmentInfoModelImplCopyWith<_$StudentEnrollmentInfoModelImpl>
      get copyWith => __$$StudentEnrollmentInfoModelImplCopyWithImpl<
          _$StudentEnrollmentInfoModelImpl>(this, _$identity);
}

abstract class _StudentEnrollmentInfoModel
    implements StudentEnrollmentInfoModel {
  const factory _StudentEnrollmentInfoModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(name: 'enrolled_at', fromJson: jsonStringLenient)
          final String? enrolledAt,
          @JsonKey(name: 'left_at', fromJson: jsonStringLenient)
          final String? leftAt,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? group,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? course,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? teacher}) =
      _$StudentEnrollmentInfoModelImpl;

  factory _StudentEnrollmentInfoModel.fromJson(Map<String, dynamic> json) =
      _$StudentEnrollmentInfoModelImpl.fromJson;

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
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get group;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get course;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher;

  /// Create a copy of StudentEnrollmentInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentEnrollmentInfoModelImplCopyWith<_$StudentEnrollmentInfoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentProgressStatsModel _$StudentProgressStatsModelFromJson(
    Map<String, dynamic> json) {
  return _StudentProgressStatsModel.fromJson(json);
}

/// @nodoc
mixin _$StudentProgressStatsModel {
  @JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
  double? get assessmentAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
  int? get attendanceDays => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonIntLenient)
  int? get files => throw _privateConstructorUsedError;
  @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
  int? get memorizedPages => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonIntLenient)
  int? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
  int? get passedFinalTests => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
  int? get passedPartialTests => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonIntLenient)
  int? get points => throw _privateConstructorUsedError;

  /// Create a copy of StudentProgressStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentProgressStatsModelCopyWith<StudentProgressStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProgressStatsModelCopyWith<$Res> {
  factory $StudentProgressStatsModelCopyWith(StudentProgressStatsModel value,
          $Res Function(StudentProgressStatsModel) then) =
      _$StudentProgressStatsModelCopyWithImpl<$Res, StudentProgressStatsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
      double? assessmentAverage,
      @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
      int? attendanceDays,
      @JsonKey(fromJson: jsonIntLenient) int? files,
      @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
      int? memorizedPages,
      @JsonKey(fromJson: jsonIntLenient) int? notes,
      @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
      int? passedFinalTests,
      @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
      int? passedPartialTests,
      @JsonKey(fromJson: jsonIntLenient) int? points});
}

/// @nodoc
class _$StudentProgressStatsModelCopyWithImpl<$Res,
        $Val extends StudentProgressStatsModel>
    implements $StudentProgressStatsModelCopyWith<$Res> {
  _$StudentProgressStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentProgressStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentAverage = freezed,
    Object? attendanceDays = freezed,
    Object? files = freezed,
    Object? memorizedPages = freezed,
    Object? notes = freezed,
    Object? passedFinalTests = freezed,
    Object? passedPartialTests = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      assessmentAverage: freezed == assessmentAverage
          ? _value.assessmentAverage
          : assessmentAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceDays: freezed == attendanceDays
          ? _value.attendanceDays
          : attendanceDays // ignore: cast_nullable_to_non_nullable
              as int?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as int?,
      passedFinalTests: freezed == passedFinalTests
          ? _value.passedFinalTests
          : passedFinalTests // ignore: cast_nullable_to_non_nullable
              as int?,
      passedPartialTests: freezed == passedPartialTests
          ? _value.passedPartialTests
          : passedPartialTests // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentProgressStatsModelImplCopyWith<$Res>
    implements $StudentProgressStatsModelCopyWith<$Res> {
  factory _$$StudentProgressStatsModelImplCopyWith(
          _$StudentProgressStatsModelImpl value,
          $Res Function(_$StudentProgressStatsModelImpl) then) =
      __$$StudentProgressStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
      double? assessmentAverage,
      @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
      int? attendanceDays,
      @JsonKey(fromJson: jsonIntLenient) int? files,
      @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
      int? memorizedPages,
      @JsonKey(fromJson: jsonIntLenient) int? notes,
      @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
      int? passedFinalTests,
      @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
      int? passedPartialTests,
      @JsonKey(fromJson: jsonIntLenient) int? points});
}

/// @nodoc
class __$$StudentProgressStatsModelImplCopyWithImpl<$Res>
    extends _$StudentProgressStatsModelCopyWithImpl<$Res,
        _$StudentProgressStatsModelImpl>
    implements _$$StudentProgressStatsModelImplCopyWith<$Res> {
  __$$StudentProgressStatsModelImplCopyWithImpl(
      _$StudentProgressStatsModelImpl _value,
      $Res Function(_$StudentProgressStatsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentProgressStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentAverage = freezed,
    Object? attendanceDays = freezed,
    Object? files = freezed,
    Object? memorizedPages = freezed,
    Object? notes = freezed,
    Object? passedFinalTests = freezed,
    Object? passedPartialTests = freezed,
    Object? points = freezed,
  }) {
    return _then(_$StudentProgressStatsModelImpl(
      assessmentAverage: freezed == assessmentAverage
          ? _value.assessmentAverage
          : assessmentAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceDays: freezed == attendanceDays
          ? _value.attendanceDays
          : attendanceDays // ignore: cast_nullable_to_non_nullable
              as int?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as int?,
      memorizedPages: freezed == memorizedPages
          ? _value.memorizedPages
          : memorizedPages // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as int?,
      passedFinalTests: freezed == passedFinalTests
          ? _value.passedFinalTests
          : passedFinalTests // ignore: cast_nullable_to_non_nullable
              as int?,
      passedPartialTests: freezed == passedPartialTests
          ? _value.passedPartialTests
          : passedPartialTests // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentProgressStatsModelImpl implements _StudentProgressStatsModel {
  const _$StudentProgressStatsModelImpl(
      {@JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
      this.assessmentAverage,
      @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
      this.attendanceDays,
      @JsonKey(fromJson: jsonIntLenient) this.files,
      @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
      this.memorizedPages,
      @JsonKey(fromJson: jsonIntLenient) this.notes,
      @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
      this.passedFinalTests,
      @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
      this.passedPartialTests,
      @JsonKey(fromJson: jsonIntLenient) this.points});

  factory _$StudentProgressStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentProgressStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
  final double? assessmentAverage;
  @override
  @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
  final int? attendanceDays;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? files;
  @override
  @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
  final int? memorizedPages;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? notes;
  @override
  @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
  final int? passedFinalTests;
  @override
  @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
  final int? passedPartialTests;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? points;

  @override
  String toString() {
    return 'StudentProgressStatsModel(assessmentAverage: $assessmentAverage, attendanceDays: $attendanceDays, files: $files, memorizedPages: $memorizedPages, notes: $notes, passedFinalTests: $passedFinalTests, passedPartialTests: $passedPartialTests, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProgressStatsModelImpl &&
            (identical(other.assessmentAverage, assessmentAverage) ||
                other.assessmentAverage == assessmentAverage) &&
            (identical(other.attendanceDays, attendanceDays) ||
                other.attendanceDays == attendanceDays) &&
            (identical(other.files, files) || other.files == files) &&
            (identical(other.memorizedPages, memorizedPages) ||
                other.memorizedPages == memorizedPages) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.passedFinalTests, passedFinalTests) ||
                other.passedFinalTests == passedFinalTests) &&
            (identical(other.passedPartialTests, passedPartialTests) ||
                other.passedPartialTests == passedPartialTests) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assessmentAverage,
      attendanceDays,
      files,
      memorizedPages,
      notes,
      passedFinalTests,
      passedPartialTests,
      points);

  /// Create a copy of StudentProgressStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProgressStatsModelImplCopyWith<_$StudentProgressStatsModelImpl>
      get copyWith => __$$StudentProgressStatsModelImplCopyWithImpl<
          _$StudentProgressStatsModelImpl>(this, _$identity);
}

abstract class _StudentProgressStatsModel implements StudentProgressStatsModel {
  const factory _StudentProgressStatsModel(
          {@JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
          final double? assessmentAverage,
          @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
          final int? attendanceDays,
          @JsonKey(fromJson: jsonIntLenient) final int? files,
          @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
          final int? memorizedPages,
          @JsonKey(fromJson: jsonIntLenient) final int? notes,
          @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
          final int? passedFinalTests,
          @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
          final int? passedPartialTests,
          @JsonKey(fromJson: jsonIntLenient) final int? points}) =
      _$StudentProgressStatsModelImpl;

  factory _StudentProgressStatsModel.fromJson(Map<String, dynamic> json) =
      _$StudentProgressStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'assessment_average', fromJson: jsonDoubleLenient)
  double? get assessmentAverage;
  @override
  @JsonKey(name: 'attendance_days', fromJson: jsonIntLenient)
  int? get attendanceDays;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get files;
  @override
  @JsonKey(name: 'memorized_pages', fromJson: jsonIntLenient)
  int? get memorizedPages;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get notes;
  @override
  @JsonKey(name: 'passed_final_tests', fromJson: jsonIntLenient)
  int? get passedFinalTests;
  @override
  @JsonKey(name: 'passed_partial_tests', fromJson: jsonIntLenient)
  int? get passedPartialTests;
  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get points;

  /// Create a copy of StudentProgressStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentProgressStatsModelImplCopyWith<_$StudentProgressStatsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentProgressModel _$StudentProgressModelFromJson(Map<String, dynamic> json) {
  return _StudentProgressModel.fromJson(json);
}

/// @nodoc
mixin _$StudentProgressModel {
  @JsonKey(readValue: readJsonMap)
  StudentProfileInfoModel? get profile => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<StudentEnrollmentInfoModel>? get enrollments =>
      throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  StudentProgressStatsModel? get stats => throw _privateConstructorUsedError;

  /// Create a copy of StudentProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentProgressModelCopyWith<StudentProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProgressModelCopyWith<$Res> {
  factory $StudentProgressModelCopyWith(StudentProgressModel value,
          $Res Function(StudentProgressModel) then) =
      _$StudentProgressModelCopyWithImpl<$Res, StudentProgressModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: readJsonMap) StudentProfileInfoModel? profile,
      @JsonKey(readValue: readJsonList)
      List<StudentEnrollmentInfoModel>? enrollments,
      @JsonKey(readValue: readJsonMap) StudentProgressStatsModel? stats});

  $StudentProfileInfoModelCopyWith<$Res>? get profile;
  $StudentProgressStatsModelCopyWith<$Res>? get stats;
}

/// @nodoc
class _$StudentProgressModelCopyWithImpl<$Res,
        $Val extends StudentProgressModel>
    implements $StudentProgressModelCopyWith<$Res> {
  _$StudentProgressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = freezed,
    Object? enrollments = freezed,
    Object? stats = freezed,
  }) {
    return _then(_value.copyWith(
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as StudentProfileInfoModel?,
      enrollments: freezed == enrollments
          ? _value.enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<StudentEnrollmentInfoModel>?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StudentProgressStatsModel?,
    ) as $Val);
  }

  /// Create a copy of StudentProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentProfileInfoModelCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $StudentProfileInfoModelCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  /// Create a copy of StudentProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentProgressStatsModelCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $StudentProgressStatsModelCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentProgressModelImplCopyWith<$Res>
    implements $StudentProgressModelCopyWith<$Res> {
  factory _$$StudentProgressModelImplCopyWith(_$StudentProgressModelImpl value,
          $Res Function(_$StudentProgressModelImpl) then) =
      __$$StudentProgressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: readJsonMap) StudentProfileInfoModel? profile,
      @JsonKey(readValue: readJsonList)
      List<StudentEnrollmentInfoModel>? enrollments,
      @JsonKey(readValue: readJsonMap) StudentProgressStatsModel? stats});

  @override
  $StudentProfileInfoModelCopyWith<$Res>? get profile;
  @override
  $StudentProgressStatsModelCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$StudentProgressModelImplCopyWithImpl<$Res>
    extends _$StudentProgressModelCopyWithImpl<$Res, _$StudentProgressModelImpl>
    implements _$$StudentProgressModelImplCopyWith<$Res> {
  __$$StudentProgressModelImplCopyWithImpl(_$StudentProgressModelImpl _value,
      $Res Function(_$StudentProgressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = freezed,
    Object? enrollments = freezed,
    Object? stats = freezed,
  }) {
    return _then(_$StudentProgressModelImpl(
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as StudentProfileInfoModel?,
      enrollments: freezed == enrollments
          ? _value._enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<StudentEnrollmentInfoModel>?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as StudentProgressStatsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentProgressModelImpl implements _StudentProgressModel {
  const _$StudentProgressModelImpl(
      {@JsonKey(readValue: readJsonMap) this.profile,
      @JsonKey(readValue: readJsonList)
      final List<StudentEnrollmentInfoModel>? enrollments,
      @JsonKey(readValue: readJsonMap) this.stats})
      : _enrollments = enrollments;

  factory _$StudentProgressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentProgressModelImplFromJson(json);

  @override
  @JsonKey(readValue: readJsonMap)
  final StudentProfileInfoModel? profile;
  final List<StudentEnrollmentInfoModel>? _enrollments;
  @override
  @JsonKey(readValue: readJsonList)
  List<StudentEnrollmentInfoModel>? get enrollments {
    final value = _enrollments;
    if (value == null) return null;
    if (_enrollments is EqualUnmodifiableListView) return _enrollments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(readValue: readJsonMap)
  final StudentProgressStatsModel? stats;

  @override
  String toString() {
    return 'StudentProgressModel(profile: $profile, enrollments: $enrollments, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProgressModelImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality()
                .equals(other._enrollments, _enrollments) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, profile,
      const DeepCollectionEquality().hash(_enrollments), stats);

  /// Create a copy of StudentProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProgressModelImplCopyWith<_$StudentProgressModelImpl>
      get copyWith =>
          __$$StudentProgressModelImplCopyWithImpl<_$StudentProgressModelImpl>(
              this, _$identity);
}

abstract class _StudentProgressModel implements StudentProgressModel {
  const factory _StudentProgressModel(
      {@JsonKey(readValue: readJsonMap) final StudentProfileInfoModel? profile,
      @JsonKey(readValue: readJsonList)
      final List<StudentEnrollmentInfoModel>? enrollments,
      @JsonKey(readValue: readJsonMap)
      final StudentProgressStatsModel? stats}) = _$StudentProgressModelImpl;

  factory _StudentProgressModel.fromJson(Map<String, dynamic> json) =
      _$StudentProgressModelImpl.fromJson;

  @override
  @JsonKey(readValue: readJsonMap)
  StudentProfileInfoModel? get profile;
  @override
  @JsonKey(readValue: readJsonList)
  List<StudentEnrollmentInfoModel>? get enrollments;
  @override
  @JsonKey(readValue: readJsonMap)
  StudentProgressStatsModel? get stats;

  /// Create a copy of StudentProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentProgressModelImplCopyWith<_$StudentProgressModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentFileItemModel _$StudentFileItemModelFromJson(Map<String, dynamic> json) {
  return _StudentFileItemModel.fromJson(json);
}

/// @nodoc
mixin _$StudentFileItemModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_type', fromJson: jsonStringValue)
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name', fromJson: jsonStringValue)
  String? get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
  String? get uploadedAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _studentFileItemUploadedByName,
      fromJson: _studentFileItemUploadedByNameValue)
  String? get uploadedByName => throw _privateConstructorUsedError;

  /// Create a copy of StudentFileItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentFileItemModelCopyWith<StudentFileItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentFileItemModelCopyWith<$Res> {
  factory $StudentFileItemModelCopyWith(StudentFileItemModel value,
          $Res Function(StudentFileItemModel) then) =
      _$StudentFileItemModelCopyWithImpl<$Res, StudentFileItemModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'file_type', fromJson: jsonStringValue) String? fileType,
      @JsonKey(name: 'original_name', fromJson: jsonStringValue)
      String? originalName,
      @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
      String? uploadedAt,
      @JsonKey(
          readValue: _studentFileItemUploadedByName,
          fromJson: _studentFileItemUploadedByNameValue)
      String? uploadedByName});
}

/// @nodoc
class _$StudentFileItemModelCopyWithImpl<$Res,
        $Val extends StudentFileItemModel>
    implements $StudentFileItemModelCopyWith<$Res> {
  _$StudentFileItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentFileItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileType = freezed,
    Object? originalName = freezed,
    Object? uploadedAt = freezed,
    Object? uploadedByName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedByName: freezed == uploadedByName
          ? _value.uploadedByName
          : uploadedByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentFileItemModelImplCopyWith<$Res>
    implements $StudentFileItemModelCopyWith<$Res> {
  factory _$$StudentFileItemModelImplCopyWith(_$StudentFileItemModelImpl value,
          $Res Function(_$StudentFileItemModelImpl) then) =
      __$$StudentFileItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'file_type', fromJson: jsonStringValue) String? fileType,
      @JsonKey(name: 'original_name', fromJson: jsonStringValue)
      String? originalName,
      @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
      String? uploadedAt,
      @JsonKey(
          readValue: _studentFileItemUploadedByName,
          fromJson: _studentFileItemUploadedByNameValue)
      String? uploadedByName});
}

/// @nodoc
class __$$StudentFileItemModelImplCopyWithImpl<$Res>
    extends _$StudentFileItemModelCopyWithImpl<$Res, _$StudentFileItemModelImpl>
    implements _$$StudentFileItemModelImplCopyWith<$Res> {
  __$$StudentFileItemModelImplCopyWithImpl(_$StudentFileItemModelImpl _value,
      $Res Function(_$StudentFileItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentFileItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fileType = freezed,
    Object? originalName = freezed,
    Object? uploadedAt = freezed,
    Object? uploadedByName = freezed,
  }) {
    return _then(_$StudentFileItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedByName: freezed == uploadedByName
          ? _value.uploadedByName
          : uploadedByName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StudentFileItemModelImpl implements _StudentFileItemModel {
  const _$StudentFileItemModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'file_type', fromJson: jsonStringValue) this.fileType,
      @JsonKey(name: 'original_name', fromJson: jsonStringValue)
      this.originalName,
      @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
      this.uploadedAt,
      @JsonKey(
          readValue: _studentFileItemUploadedByName,
          fromJson: _studentFileItemUploadedByNameValue)
      this.uploadedByName});

  factory _$StudentFileItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentFileItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'file_type', fromJson: jsonStringValue)
  final String? fileType;
  @override
  @JsonKey(name: 'original_name', fromJson: jsonStringValue)
  final String? originalName;
  @override
  @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
  final String? uploadedAt;
  @override
  @JsonKey(
      readValue: _studentFileItemUploadedByName,
      fromJson: _studentFileItemUploadedByNameValue)
  final String? uploadedByName;

  @override
  String toString() {
    return 'StudentFileItemModel(id: $id, fileType: $fileType, originalName: $originalName, uploadedAt: $uploadedAt, uploadedByName: $uploadedByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentFileItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.uploadedByName, uploadedByName) ||
                other.uploadedByName == uploadedByName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, fileType, originalName, uploadedAt, uploadedByName);

  /// Create a copy of StudentFileItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentFileItemModelImplCopyWith<_$StudentFileItemModelImpl>
      get copyWith =>
          __$$StudentFileItemModelImplCopyWithImpl<_$StudentFileItemModelImpl>(
              this, _$identity);
}

abstract class _StudentFileItemModel implements StudentFileItemModel {
  const factory _StudentFileItemModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'file_type', fromJson: jsonStringValue)
      final String? fileType,
      @JsonKey(name: 'original_name', fromJson: jsonStringValue)
      final String? originalName,
      @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
      final String? uploadedAt,
      @JsonKey(
          readValue: _studentFileItemUploadedByName,
          fromJson: _studentFileItemUploadedByNameValue)
      final String? uploadedByName}) = _$StudentFileItemModelImpl;

  factory _StudentFileItemModel.fromJson(Map<String, dynamic> json) =
      _$StudentFileItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'file_type', fromJson: jsonStringValue)
  String? get fileType;
  @override
  @JsonKey(name: 'original_name', fromJson: jsonStringValue)
  String? get originalName;
  @override
  @JsonKey(name: 'uploaded_at', fromJson: jsonStringLenient)
  String? get uploadedAt;
  @override
  @JsonKey(
      readValue: _studentFileItemUploadedByName,
      fromJson: _studentFileItemUploadedByNameValue)
  String? get uploadedByName;

  /// Create a copy of StudentFileItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentFileItemModelImplCopyWith<_$StudentFileItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
