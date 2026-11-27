// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_test_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuranJuzModel _$QuranJuzModelFromJson(Map<String, dynamic> json) {
  return _QuranJuzModel.fromJson(json);
}

/// @nodoc
mixin _$QuranJuzModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'juz_number', fromJson: jsonIntLenient)
  int? get juzNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_page', fromJson: jsonIntLenient)
  int? get fromPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_page', fromJson: jsonIntLenient)
  int? get toPage => throw _privateConstructorUsedError;

  /// Create a copy of QuranJuzModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranJuzModelCopyWith<QuranJuzModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranJuzModelCopyWith<$Res> {
  factory $QuranJuzModelCopyWith(
          QuranJuzModel value, $Res Function(QuranJuzModel) then) =
      _$QuranJuzModelCopyWithImpl<$Res, QuranJuzModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'juz_number', fromJson: jsonIntLenient) int? juzNumber,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) int? fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient) int? toPage});
}

/// @nodoc
class _$QuranJuzModelCopyWithImpl<$Res, $Val extends QuranJuzModel>
    implements $QuranJuzModelCopyWith<$Res> {
  _$QuranJuzModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranJuzModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? juzNumber = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      juzNumber: freezed == juzNumber
          ? _value.juzNumber
          : juzNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      fromPage: freezed == fromPage
          ? _value.fromPage
          : fromPage // ignore: cast_nullable_to_non_nullable
              as int?,
      toPage: freezed == toPage
          ? _value.toPage
          : toPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuranJuzModelImplCopyWith<$Res>
    implements $QuranJuzModelCopyWith<$Res> {
  factory _$$QuranJuzModelImplCopyWith(
          _$QuranJuzModelImpl value, $Res Function(_$QuranJuzModelImpl) then) =
      __$$QuranJuzModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'juz_number', fromJson: jsonIntLenient) int? juzNumber,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) int? fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient) int? toPage});
}

/// @nodoc
class __$$QuranJuzModelImplCopyWithImpl<$Res>
    extends _$QuranJuzModelCopyWithImpl<$Res, _$QuranJuzModelImpl>
    implements _$$QuranJuzModelImplCopyWith<$Res> {
  __$$QuranJuzModelImplCopyWithImpl(
      _$QuranJuzModelImpl _value, $Res Function(_$QuranJuzModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranJuzModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? juzNumber = freezed,
    Object? fromPage = freezed,
    Object? toPage = freezed,
  }) {
    return _then(_$QuranJuzModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      juzNumber: freezed == juzNumber
          ? _value.juzNumber
          : juzNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      fromPage: freezed == fromPage
          ? _value.fromPage
          : fromPage // ignore: cast_nullable_to_non_nullable
              as int?,
      toPage: freezed == toPage
          ? _value.toPage
          : toPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$QuranJuzModelImpl implements _QuranJuzModel {
  const _$QuranJuzModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'juz_number', fromJson: jsonIntLenient) this.juzNumber,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) this.fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient) this.toPage});

  factory _$QuranJuzModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranJuzModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'juz_number', fromJson: jsonIntLenient)
  final int? juzNumber;
  @override
  @JsonKey(name: 'from_page', fromJson: jsonIntLenient)
  final int? fromPage;
  @override
  @JsonKey(name: 'to_page', fromJson: jsonIntLenient)
  final int? toPage;

  @override
  String toString() {
    return 'QuranJuzModel(id: $id, juzNumber: $juzNumber, fromPage: $fromPage, toPage: $toPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranJuzModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.juzNumber, juzNumber) ||
                other.juzNumber == juzNumber) &&
            (identical(other.fromPage, fromPage) ||
                other.fromPage == fromPage) &&
            (identical(other.toPage, toPage) || other.toPage == toPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, juzNumber, fromPage, toPage);

  /// Create a copy of QuranJuzModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranJuzModelImplCopyWith<_$QuranJuzModelImpl> get copyWith =>
      __$$QuranJuzModelImplCopyWithImpl<_$QuranJuzModelImpl>(this, _$identity);
}

abstract class _QuranJuzModel implements QuranJuzModel {
  const factory _QuranJuzModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'juz_number', fromJson: jsonIntLenient)
      final int? juzNumber,
      @JsonKey(name: 'from_page', fromJson: jsonIntLenient) final int? fromPage,
      @JsonKey(name: 'to_page', fromJson: jsonIntLenient)
      final int? toPage}) = _$QuranJuzModelImpl;

  factory _QuranJuzModel.fromJson(Map<String, dynamic> json) =
      _$QuranJuzModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'juz_number', fromJson: jsonIntLenient)
  int? get juzNumber;
  @override
  @JsonKey(name: 'from_page', fromJson: jsonIntLenient)
  int? get fromPage;
  @override
  @JsonKey(name: 'to_page', fromJson: jsonIntLenient)
  int? get toPage;

  /// Create a copy of QuranJuzModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranJuzModelImplCopyWith<_$QuranJuzModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuranTestGroupModel _$QuranTestGroupModelFromJson(Map<String, dynamic> json) {
  return _QuranTestGroupModel.fromJson(json);
}

/// @nodoc
mixin _$QuranTestGroupModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
  String? get courseName => throw _privateConstructorUsedError;

  /// Create a copy of QuranTestGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranTestGroupModelCopyWith<QuranTestGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranTestGroupModelCopyWith<$Res> {
  factory $QuranTestGroupModelCopyWith(
          QuranTestGroupModel value, $Res Function(QuranTestGroupModel) then) =
      _$QuranTestGroupModelCopyWithImpl<$Res, QuranTestGroupModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      String? courseName});
}

/// @nodoc
class _$QuranTestGroupModelCopyWithImpl<$Res, $Val extends QuranTestGroupModel>
    implements $QuranTestGroupModelCopyWith<$Res> {
  _$QuranTestGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranTestGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? courseName = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuranTestGroupModelImplCopyWith<$Res>
    implements $QuranTestGroupModelCopyWith<$Res> {
  factory _$$QuranTestGroupModelImplCopyWith(_$QuranTestGroupModelImpl value,
          $Res Function(_$QuranTestGroupModelImpl) then) =
      __$$QuranTestGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      String? courseName});
}

/// @nodoc
class __$$QuranTestGroupModelImplCopyWithImpl<$Res>
    extends _$QuranTestGroupModelCopyWithImpl<$Res, _$QuranTestGroupModelImpl>
    implements _$$QuranTestGroupModelImplCopyWith<$Res> {
  __$$QuranTestGroupModelImplCopyWithImpl(_$QuranTestGroupModelImpl _value,
      $Res Function(_$QuranTestGroupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranTestGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? courseName = freezed,
  }) {
    return _then(_$QuranTestGroupModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$QuranTestGroupModelImpl implements _QuranTestGroupModel {
  const _$QuranTestGroupModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      this.courseName});

  factory _$QuranTestGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranTestGroupModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;
  @override
  @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
  final String? courseName;

  @override
  String toString() {
    return 'QuranTestGroupModel(id: $id, name: $name, courseName: $courseName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranTestGroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, courseName);

  /// Create a copy of QuranTestGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranTestGroupModelImplCopyWith<_$QuranTestGroupModelImpl> get copyWith =>
      __$$QuranTestGroupModelImplCopyWithImpl<_$QuranTestGroupModelImpl>(
          this, _$identity);
}

abstract class _QuranTestGroupModel implements QuranTestGroupModel {
  const factory _QuranTestGroupModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? name,
      @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
      final String? courseName}) = _$QuranTestGroupModelImpl;

  factory _QuranTestGroupModel.fromJson(Map<String, dynamic> json) =
      _$QuranTestGroupModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;
  @override
  @JsonKey(name: 'course_name', fromJson: jsonStringLenient)
  String? get courseName;

  /// Create a copy of QuranTestGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranTestGroupModelImplCopyWith<_$QuranTestGroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NamedRefModel _$NamedRefModelFromJson(Map<String, dynamic> json) {
  return _NamedRefModel.fromJson(json);
}

/// @nodoc
mixin _$NamedRefModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get name => throw _privateConstructorUsedError;

  /// Create a copy of NamedRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NamedRefModelCopyWith<NamedRefModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NamedRefModelCopyWith<$Res> {
  factory $NamedRefModelCopyWith(
          NamedRefModel value, $Res Function(NamedRefModel) then) =
      _$NamedRefModelCopyWithImpl<$Res, NamedRefModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name});
}

/// @nodoc
class _$NamedRefModelCopyWithImpl<$Res, $Val extends NamedRefModel>
    implements $NamedRefModelCopyWith<$Res> {
  _$NamedRefModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NamedRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NamedRefModelImplCopyWith<$Res>
    implements $NamedRefModelCopyWith<$Res> {
  factory _$$NamedRefModelImplCopyWith(
          _$NamedRefModelImpl value, $Res Function(_$NamedRefModelImpl) then) =
      __$$NamedRefModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? name});
}

/// @nodoc
class __$$NamedRefModelImplCopyWithImpl<$Res>
    extends _$NamedRefModelCopyWithImpl<$Res, _$NamedRefModelImpl>
    implements _$$NamedRefModelImplCopyWith<$Res> {
  __$$NamedRefModelImplCopyWithImpl(
      _$NamedRefModelImpl _value, $Res Function(_$NamedRefModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NamedRefModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$NamedRefModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NamedRefModelImpl implements _NamedRefModel {
  const _$NamedRefModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.name});

  factory _$NamedRefModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NamedRefModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? name;

  @override
  String toString() {
    return 'NamedRefModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NamedRefModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of NamedRefModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NamedRefModelImplCopyWith<_$NamedRefModelImpl> get copyWith =>
      __$$NamedRefModelImplCopyWithImpl<_$NamedRefModelImpl>(this, _$identity);
}

abstract class _NamedRefModel implements NamedRefModel {
  const factory _NamedRefModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(fromJson: jsonStringValue) final String? name}) =
      _$NamedRefModelImpl;

  factory _NamedRefModel.fromJson(Map<String, dynamic> json) =
      _$NamedRefModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get name;

  /// Create a copy of NamedRefModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NamedRefModelImplCopyWith<_$NamedRefModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuranPartialAttemptModel _$QuranPartialAttemptModelFromJson(
    Map<String, dynamic> json) {
  return _QuranPartialAttemptModel.fromJson(json);
}

/// @nodoc
mixin _$QuranPartialAttemptModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  int? get attemptNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient)
  int? get mistakeCount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
  String? get testedOn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher => throw _privateConstructorUsedError;

  /// Create a copy of QuranPartialAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranPartialAttemptModelCopyWith<QuranPartialAttemptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranPartialAttemptModelCopyWith<$Res> {
  factory $QuranPartialAttemptModelCopyWith(QuranPartialAttemptModel value,
          $Res Function(QuranPartialAttemptModel) then) =
      _$QuranPartialAttemptModelCopyWithImpl<$Res, QuranPartialAttemptModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient)
      int? mistakeCount,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) String? testedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class _$QuranPartialAttemptModelCopyWithImpl<$Res,
        $Val extends QuranPartialAttemptModel>
    implements $QuranPartialAttemptModelCopyWith<$Res> {
  _$QuranPartialAttemptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranPartialAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attemptNo = freezed,
    Object? mistakeCount = freezed,
    Object? status = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacher = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      mistakeCount: freezed == mistakeCount
          ? _value.mistakeCount
          : mistakeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ) as $Val);
  }

  /// Create a copy of QuranPartialAttemptModel
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
abstract class _$$QuranPartialAttemptModelImplCopyWith<$Res>
    implements $QuranPartialAttemptModelCopyWith<$Res> {
  factory _$$QuranPartialAttemptModelImplCopyWith(
          _$QuranPartialAttemptModelImpl value,
          $Res Function(_$QuranPartialAttemptModelImpl) then) =
      __$$QuranPartialAttemptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient)
      int? mistakeCount,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) String? testedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  @override
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class __$$QuranPartialAttemptModelImplCopyWithImpl<$Res>
    extends _$QuranPartialAttemptModelCopyWithImpl<$Res,
        _$QuranPartialAttemptModelImpl>
    implements _$$QuranPartialAttemptModelImplCopyWith<$Res> {
  __$$QuranPartialAttemptModelImplCopyWithImpl(
      _$QuranPartialAttemptModelImpl _value,
      $Res Function(_$QuranPartialAttemptModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranPartialAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attemptNo = freezed,
    Object? mistakeCount = freezed,
    Object? status = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacher = freezed,
  }) {
    return _then(_$QuranPartialAttemptModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      attemptNo: freezed == attemptNo
          ? _value.attemptNo
          : attemptNo // ignore: cast_nullable_to_non_nullable
              as int?,
      mistakeCount: freezed == mistakeCount
          ? _value.mistakeCount
          : mistakeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
class _$QuranPartialAttemptModelImpl implements _QuranPartialAttemptModel {
  const _$QuranPartialAttemptModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) this.attemptNo,
      @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient)
      this.mistakeCount,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) this.testedOn,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(readValue: readJsonMap) this.teacher});

  factory _$QuranPartialAttemptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranPartialAttemptModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  final int? attemptNo;
  @override
  @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient)
  final int? mistakeCount;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
  final String? testedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? teacher;

  @override
  String toString() {
    return 'QuranPartialAttemptModel(id: $id, attemptNo: $attemptNo, mistakeCount: $mistakeCount, status: $status, testedOn: $testedOn, notes: $notes, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranPartialAttemptModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attemptNo, attemptNo) ||
                other.attemptNo == attemptNo) &&
            (identical(other.mistakeCount, mistakeCount) ||
                other.mistakeCount == mistakeCount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.testedOn, testedOn) ||
                other.testedOn == testedOn) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, attemptNo, mistakeCount,
      status, testedOn, notes, teacher);

  /// Create a copy of QuranPartialAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranPartialAttemptModelImplCopyWith<_$QuranPartialAttemptModelImpl>
      get copyWith => __$$QuranPartialAttemptModelImplCopyWithImpl<
          _$QuranPartialAttemptModelImpl>(this, _$identity);
}

abstract class _QuranPartialAttemptModel implements QuranPartialAttemptModel {
  const factory _QuranPartialAttemptModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
          final int? attemptNo,
          @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient)
          final int? mistakeCount,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
          final String? testedOn,
          @JsonKey(fromJson: jsonStringLenient) final String? notes,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? teacher}) =
      _$QuranPartialAttemptModelImpl;

  factory _QuranPartialAttemptModel.fromJson(Map<String, dynamic> json) =
      _$QuranPartialAttemptModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  int? get attemptNo;
  @override
  @JsonKey(name: 'mistake_count', fromJson: jsonIntLenient)
  int? get mistakeCount;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
  String? get testedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher;

  /// Create a copy of QuranPartialAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranPartialAttemptModelImplCopyWith<_$QuranPartialAttemptModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuranPartialPartModel _$QuranPartialPartModelFromJson(
    Map<String, dynamic> json) {
  return _QuranPartialPartModel.fromJson(json);
}

/// @nodoc
mixin _$QuranPartialPartModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'part_number', fromJson: jsonIntLenient)
  int? get partNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  String? get passedOn => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<QuranPartialAttemptModel>? get attempts =>
      throw _privateConstructorUsedError;

  /// Create a copy of QuranPartialPartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranPartialPartModelCopyWith<QuranPartialPartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranPartialPartModelCopyWith<$Res> {
  factory $QuranPartialPartModelCopyWith(QuranPartialPartModel value,
          $Res Function(QuranPartialPartModel) then) =
      _$QuranPartialPartModelCopyWithImpl<$Res, QuranPartialPartModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'part_number', fromJson: jsonIntLenient) int? partNumber,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
      @JsonKey(readValue: readJsonList)
      List<QuranPartialAttemptModel>? attempts});
}

/// @nodoc
class _$QuranPartialPartModelCopyWithImpl<$Res,
        $Val extends QuranPartialPartModel>
    implements $QuranPartialPartModelCopyWith<$Res> {
  _$QuranPartialPartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranPartialPartModel
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
              as List<QuranPartialAttemptModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuranPartialPartModelImplCopyWith<$Res>
    implements $QuranPartialPartModelCopyWith<$Res> {
  factory _$$QuranPartialPartModelImplCopyWith(
          _$QuranPartialPartModelImpl value,
          $Res Function(_$QuranPartialPartModelImpl) then) =
      __$$QuranPartialPartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'part_number', fromJson: jsonIntLenient) int? partNumber,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
      @JsonKey(readValue: readJsonList)
      List<QuranPartialAttemptModel>? attempts});
}

/// @nodoc
class __$$QuranPartialPartModelImplCopyWithImpl<$Res>
    extends _$QuranPartialPartModelCopyWithImpl<$Res,
        _$QuranPartialPartModelImpl>
    implements _$$QuranPartialPartModelImplCopyWith<$Res> {
  __$$QuranPartialPartModelImplCopyWithImpl(_$QuranPartialPartModelImpl _value,
      $Res Function(_$QuranPartialPartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranPartialPartModel
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
    return _then(_$QuranPartialPartModelImpl(
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
              as List<QuranPartialAttemptModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$QuranPartialPartModelImpl implements _QuranPartialPartModel {
  const _$QuranPartialPartModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'part_number', fromJson: jsonIntLenient) this.partNumber,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) this.passedOn,
      @JsonKey(readValue: readJsonList)
      final List<QuranPartialAttemptModel>? attempts})
      : _attempts = attempts;

  factory _$QuranPartialPartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranPartialPartModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'part_number', fromJson: jsonIntLenient)
  final int? partNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  final String? passedOn;
  final List<QuranPartialAttemptModel>? _attempts;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranPartialAttemptModel>? get attempts {
    final value = _attempts;
    if (value == null) return null;
    if (_attempts is EqualUnmodifiableListView) return _attempts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuranPartialPartModel(id: $id, partNumber: $partNumber, status: $status, passedOn: $passedOn, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranPartialPartModelImpl &&
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

  /// Create a copy of QuranPartialPartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranPartialPartModelImplCopyWith<_$QuranPartialPartModelImpl>
      get copyWith => __$$QuranPartialPartModelImplCopyWithImpl<
          _$QuranPartialPartModelImpl>(this, _$identity);
}

abstract class _QuranPartialPartModel implements QuranPartialPartModel {
  const factory _QuranPartialPartModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'part_number', fromJson: jsonIntLenient)
          final int? partNumber,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
          final String? passedOn,
          @JsonKey(readValue: readJsonList)
          final List<QuranPartialAttemptModel>? attempts}) =
      _$QuranPartialPartModelImpl;

  factory _QuranPartialPartModel.fromJson(Map<String, dynamic> json) =
      _$QuranPartialPartModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'part_number', fromJson: jsonIntLenient)
  int? get partNumber;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  String? get passedOn;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranPartialAttemptModel>? get attempts;

  /// Create a copy of QuranPartialPartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranPartialPartModelImplCopyWith<_$QuranPartialPartModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuranPartialCycleModel _$QuranPartialCycleModelFromJson(
    Map<String, dynamic> json) {
  return _QuranPartialCycleModel.fromJson(json);
}

/// @nodoc
mixin _$QuranPartialCycleModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  String? get passedOn => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  QuranJuzModel? get juz => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  QuranTestGroupModel? get group => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<QuranPartialPartModel>? get parts => throw _privateConstructorUsedError;

  /// Create a copy of QuranPartialCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranPartialCycleModelCopyWith<QuranPartialCycleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranPartialCycleModelCopyWith<$Res> {
  factory $QuranPartialCycleModelCopyWith(QuranPartialCycleModel value,
          $Res Function(QuranPartialCycleModel) then) =
      _$QuranPartialCycleModelCopyWithImpl<$Res, QuranPartialCycleModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
      @JsonKey(readValue: readJsonMap) QuranJuzModel? juz,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(readValue: readJsonMap) QuranTestGroupModel? group,
      @JsonKey(readValue: readJsonList) List<QuranPartialPartModel>? parts});

  $QuranJuzModelCopyWith<$Res>? get juz;
  $NamedRefModelCopyWith<$Res>? get student;
  $QuranTestGroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class _$QuranPartialCycleModelCopyWithImpl<$Res,
        $Val extends QuranPartialCycleModel>
    implements $QuranPartialCycleModelCopyWith<$Res> {
  _$QuranPartialCycleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranPartialCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? status = freezed,
    Object? passedOn = freezed,
    Object? juz = freezed,
    Object? student = freezed,
    Object? group = freezed,
    Object? parts = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      passedOn: freezed == passedOn
          ? _value.passedOn
          : passedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      juz: freezed == juz
          ? _value.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as QuranJuzModel?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as QuranTestGroupModel?,
      parts: freezed == parts
          ? _value.parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<QuranPartialPartModel>?,
    ) as $Val);
  }

  /// Create a copy of QuranPartialCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuranJuzModelCopyWith<$Res>? get juz {
    if (_value.juz == null) {
      return null;
    }

    return $QuranJuzModelCopyWith<$Res>(_value.juz!, (value) {
      return _then(_value.copyWith(juz: value) as $Val);
    });
  }

  /// Create a copy of QuranPartialCycleModel
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

  /// Create a copy of QuranPartialCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuranTestGroupModelCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $QuranTestGroupModelCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuranPartialCycleModelImplCopyWith<$Res>
    implements $QuranPartialCycleModelCopyWith<$Res> {
  factory _$$QuranPartialCycleModelImplCopyWith(
          _$QuranPartialCycleModelImpl value,
          $Res Function(_$QuranPartialCycleModelImpl) then) =
      __$$QuranPartialCycleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
      @JsonKey(readValue: readJsonMap) QuranJuzModel? juz,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(readValue: readJsonMap) QuranTestGroupModel? group,
      @JsonKey(readValue: readJsonList) List<QuranPartialPartModel>? parts});

  @override
  $QuranJuzModelCopyWith<$Res>? get juz;
  @override
  $NamedRefModelCopyWith<$Res>? get student;
  @override
  $QuranTestGroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class __$$QuranPartialCycleModelImplCopyWithImpl<$Res>
    extends _$QuranPartialCycleModelCopyWithImpl<$Res,
        _$QuranPartialCycleModelImpl>
    implements _$$QuranPartialCycleModelImplCopyWith<$Res> {
  __$$QuranPartialCycleModelImplCopyWithImpl(
      _$QuranPartialCycleModelImpl _value,
      $Res Function(_$QuranPartialCycleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranPartialCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? status = freezed,
    Object? passedOn = freezed,
    Object? juz = freezed,
    Object? student = freezed,
    Object? group = freezed,
    Object? parts = freezed,
  }) {
    return _then(_$QuranPartialCycleModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      passedOn: freezed == passedOn
          ? _value.passedOn
          : passedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      juz: freezed == juz
          ? _value.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as QuranJuzModel?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as QuranTestGroupModel?,
      parts: freezed == parts
          ? _value._parts
          : parts // ignore: cast_nullable_to_non_nullable
              as List<QuranPartialPartModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$QuranPartialCycleModelImpl implements _QuranPartialCycleModel {
  const _$QuranPartialCycleModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) this.passedOn,
      @JsonKey(readValue: readJsonMap) this.juz,
      @JsonKey(readValue: readJsonMap) this.student,
      @JsonKey(readValue: readJsonMap) this.group,
      @JsonKey(readValue: readJsonList)
      final List<QuranPartialPartModel>? parts})
      : _parts = parts;

  factory _$QuranPartialCycleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranPartialCycleModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  final String? passedOn;
  @override
  @JsonKey(readValue: readJsonMap)
  final QuranJuzModel? juz;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? student;
  @override
  @JsonKey(readValue: readJsonMap)
  final QuranTestGroupModel? group;
  final List<QuranPartialPartModel>? _parts;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranPartialPartModel>? get parts {
    final value = _parts;
    if (value == null) return null;
    if (_parts is EqualUnmodifiableListView) return _parts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuranPartialCycleModel(id: $id, enrollmentId: $enrollmentId, status: $status, passedOn: $passedOn, juz: $juz, student: $student, group: $group, parts: $parts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranPartialCycleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.passedOn, passedOn) ||
                other.passedOn == passedOn) &&
            (identical(other.juz, juz) || other.juz == juz) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.group, group) || other.group == group) &&
            const DeepCollectionEquality().equals(other._parts, _parts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      enrollmentId,
      status,
      passedOn,
      juz,
      student,
      group,
      const DeepCollectionEquality().hash(_parts));

  /// Create a copy of QuranPartialCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranPartialCycleModelImplCopyWith<_$QuranPartialCycleModelImpl>
      get copyWith => __$$QuranPartialCycleModelImplCopyWithImpl<
          _$QuranPartialCycleModelImpl>(this, _$identity);
}

abstract class _QuranPartialCycleModel implements QuranPartialCycleModel {
  const factory _QuranPartialCycleModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      final int? enrollmentId,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
      final String? passedOn,
      @JsonKey(readValue: readJsonMap) final QuranJuzModel? juz,
      @JsonKey(readValue: readJsonMap) final NamedRefModel? student,
      @JsonKey(readValue: readJsonMap) final QuranTestGroupModel? group,
      @JsonKey(readValue: readJsonList)
      final List<QuranPartialPartModel>? parts}) = _$QuranPartialCycleModelImpl;

  factory _QuranPartialCycleModel.fromJson(Map<String, dynamic> json) =
      _$QuranPartialCycleModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  String? get passedOn;
  @override
  @JsonKey(readValue: readJsonMap)
  QuranJuzModel? get juz;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student;
  @override
  @JsonKey(readValue: readJsonMap)
  QuranTestGroupModel? get group;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranPartialPartModel>? get parts;

  /// Create a copy of QuranPartialCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranPartialCycleModelImplCopyWith<_$QuranPartialCycleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuranFinalAttemptModel _$QuranFinalAttemptModelFromJson(
    Map<String, dynamic> json) {
  return _QuranFinalAttemptModel.fromJson(json);
}

/// @nodoc
mixin _$QuranFinalAttemptModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
  int? get attemptNo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
  String? get testedOn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher => throw _privateConstructorUsedError;

  /// Create a copy of QuranFinalAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranFinalAttemptModelCopyWith<QuranFinalAttemptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranFinalAttemptModelCopyWith<$Res> {
  factory $QuranFinalAttemptModelCopyWith(QuranFinalAttemptModel value,
          $Res Function(QuranFinalAttemptModel) then) =
      _$QuranFinalAttemptModelCopyWithImpl<$Res, QuranFinalAttemptModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(fromJson: jsonDoubleLenient) double? score,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) String? testedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class _$QuranFinalAttemptModelCopyWithImpl<$Res,
        $Val extends QuranFinalAttemptModel>
    implements $QuranFinalAttemptModelCopyWith<$Res> {
  _$QuranFinalAttemptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranFinalAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attemptNo = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacher = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: freezed == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
    ) as $Val);
  }

  /// Create a copy of QuranFinalAttemptModel
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
abstract class _$$QuranFinalAttemptModelImplCopyWith<$Res>
    implements $QuranFinalAttemptModelCopyWith<$Res> {
  factory _$$QuranFinalAttemptModelImplCopyWith(
          _$QuranFinalAttemptModelImpl value,
          $Res Function(_$QuranFinalAttemptModelImpl) then) =
      __$$QuranFinalAttemptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) int? attemptNo,
      @JsonKey(fromJson: jsonDoubleLenient) double? score,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) String? testedOn,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonMap) NamedRefModel? teacher});

  @override
  $NamedRefModelCopyWith<$Res>? get teacher;
}

/// @nodoc
class __$$QuranFinalAttemptModelImplCopyWithImpl<$Res>
    extends _$QuranFinalAttemptModelCopyWithImpl<$Res,
        _$QuranFinalAttemptModelImpl>
    implements _$$QuranFinalAttemptModelImplCopyWith<$Res> {
  __$$QuranFinalAttemptModelImplCopyWithImpl(
      _$QuranFinalAttemptModelImpl _value,
      $Res Function(_$QuranFinalAttemptModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranFinalAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attemptNo = freezed,
    Object? score = freezed,
    Object? status = freezed,
    Object? testedOn = freezed,
    Object? notes = freezed,
    Object? teacher = freezed,
  }) {
    return _then(_$QuranFinalAttemptModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      testedOn: freezed == testedOn
          ? _value.testedOn
          : testedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
class _$QuranFinalAttemptModelImpl implements _QuranFinalAttemptModel {
  const _$QuranFinalAttemptModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient) this.attemptNo,
      @JsonKey(fromJson: jsonDoubleLenient) this.score,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'tested_on', fromJson: jsonStringLenient) this.testedOn,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(readValue: readJsonMap) this.teacher});

  factory _$QuranFinalAttemptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranFinalAttemptModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
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
  @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
  final String? testedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? teacher;

  @override
  String toString() {
    return 'QuranFinalAttemptModel(id: $id, attemptNo: $attemptNo, score: $score, status: $status, testedOn: $testedOn, notes: $notes, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranFinalAttemptModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attemptNo, attemptNo) ||
                other.attemptNo == attemptNo) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.testedOn, testedOn) ||
                other.testedOn == testedOn) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, attemptNo, score, status, testedOn, notes, teacher);

  /// Create a copy of QuranFinalAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranFinalAttemptModelImplCopyWith<_$QuranFinalAttemptModelImpl>
      get copyWith => __$$QuranFinalAttemptModelImplCopyWithImpl<
          _$QuranFinalAttemptModelImpl>(this, _$identity);
}

abstract class _QuranFinalAttemptModel implements QuranFinalAttemptModel {
  const factory _QuranFinalAttemptModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'attempt_no', fromJson: jsonIntLenient)
          final int? attemptNo,
          @JsonKey(fromJson: jsonDoubleLenient) final double? score,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
          final String? testedOn,
          @JsonKey(fromJson: jsonStringLenient) final String? notes,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? teacher}) =
      _$QuranFinalAttemptModelImpl;

  factory _QuranFinalAttemptModel.fromJson(Map<String, dynamic> json) =
      _$QuranFinalAttemptModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
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
  @JsonKey(name: 'tested_on', fromJson: jsonStringLenient)
  String? get testedOn;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get teacher;

  /// Create a copy of QuranFinalAttemptModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranFinalAttemptModelImplCopyWith<_$QuranFinalAttemptModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuranFinalCycleModel _$QuranFinalCycleModelFromJson(Map<String, dynamic> json) {
  return _QuranFinalCycleModel.fromJson(json);
}

/// @nodoc
mixin _$QuranFinalCycleModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  String? get passedOn => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  QuranJuzModel? get juz => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonMap)
  QuranTestGroupModel? get group => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<QuranFinalAttemptModel>? get attempts =>
      throw _privateConstructorUsedError;

  /// Create a copy of QuranFinalCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuranFinalCycleModelCopyWith<QuranFinalCycleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuranFinalCycleModelCopyWith<$Res> {
  factory $QuranFinalCycleModelCopyWith(QuranFinalCycleModel value,
          $Res Function(QuranFinalCycleModel) then) =
      _$QuranFinalCycleModelCopyWithImpl<$Res, QuranFinalCycleModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
      @JsonKey(readValue: readJsonMap) QuranJuzModel? juz,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(readValue: readJsonMap) QuranTestGroupModel? group,
      @JsonKey(readValue: readJsonList)
      List<QuranFinalAttemptModel>? attempts});

  $QuranJuzModelCopyWith<$Res>? get juz;
  $NamedRefModelCopyWith<$Res>? get student;
  $QuranTestGroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class _$QuranFinalCycleModelCopyWithImpl<$Res,
        $Val extends QuranFinalCycleModel>
    implements $QuranFinalCycleModelCopyWith<$Res> {
  _$QuranFinalCycleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuranFinalCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? status = freezed,
    Object? passedOn = freezed,
    Object? juz = freezed,
    Object? student = freezed,
    Object? group = freezed,
    Object? attempts = freezed,
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
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      passedOn: freezed == passedOn
          ? _value.passedOn
          : passedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      juz: freezed == juz
          ? _value.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as QuranJuzModel?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as QuranTestGroupModel?,
      attempts: freezed == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<QuranFinalAttemptModel>?,
    ) as $Val);
  }

  /// Create a copy of QuranFinalCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuranJuzModelCopyWith<$Res>? get juz {
    if (_value.juz == null) {
      return null;
    }

    return $QuranJuzModelCopyWith<$Res>(_value.juz!, (value) {
      return _then(_value.copyWith(juz: value) as $Val);
    });
  }

  /// Create a copy of QuranFinalCycleModel
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

  /// Create a copy of QuranFinalCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuranTestGroupModelCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $QuranTestGroupModelCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuranFinalCycleModelImplCopyWith<$Res>
    implements $QuranFinalCycleModelCopyWith<$Res> {
  factory _$$QuranFinalCycleModelImplCopyWith(_$QuranFinalCycleModelImpl value,
          $Res Function(_$QuranFinalCycleModelImpl) then) =
      __$$QuranFinalCycleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) String? passedOn,
      @JsonKey(readValue: readJsonMap) QuranJuzModel? juz,
      @JsonKey(readValue: readJsonMap) NamedRefModel? student,
      @JsonKey(readValue: readJsonMap) QuranTestGroupModel? group,
      @JsonKey(readValue: readJsonList)
      List<QuranFinalAttemptModel>? attempts});

  @override
  $QuranJuzModelCopyWith<$Res>? get juz;
  @override
  $NamedRefModelCopyWith<$Res>? get student;
  @override
  $QuranTestGroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class __$$QuranFinalCycleModelImplCopyWithImpl<$Res>
    extends _$QuranFinalCycleModelCopyWithImpl<$Res, _$QuranFinalCycleModelImpl>
    implements _$$QuranFinalCycleModelImplCopyWith<$Res> {
  __$$QuranFinalCycleModelImplCopyWithImpl(_$QuranFinalCycleModelImpl _value,
      $Res Function(_$QuranFinalCycleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuranFinalCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? enrollmentId = freezed,
    Object? status = freezed,
    Object? passedOn = freezed,
    Object? juz = freezed,
    Object? student = freezed,
    Object? group = freezed,
    Object? attempts = freezed,
  }) {
    return _then(_$QuranFinalCycleModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      passedOn: freezed == passedOn
          ? _value.passedOn
          : passedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      juz: freezed == juz
          ? _value.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as QuranJuzModel?,
      student: freezed == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as NamedRefModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as QuranTestGroupModel?,
      attempts: freezed == attempts
          ? _value._attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as List<QuranFinalAttemptModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$QuranFinalCycleModelImpl implements _QuranFinalCycleModel {
  const _$QuranFinalCycleModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(name: 'passed_on', fromJson: jsonStringLenient) this.passedOn,
      @JsonKey(readValue: readJsonMap) this.juz,
      @JsonKey(readValue: readJsonMap) this.student,
      @JsonKey(readValue: readJsonMap) this.group,
      @JsonKey(readValue: readJsonList)
      final List<QuranFinalAttemptModel>? attempts})
      : _attempts = attempts;

  factory _$QuranFinalCycleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuranFinalCycleModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  final String? passedOn;
  @override
  @JsonKey(readValue: readJsonMap)
  final QuranJuzModel? juz;
  @override
  @JsonKey(readValue: readJsonMap)
  final NamedRefModel? student;
  @override
  @JsonKey(readValue: readJsonMap)
  final QuranTestGroupModel? group;
  final List<QuranFinalAttemptModel>? _attempts;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranFinalAttemptModel>? get attempts {
    final value = _attempts;
    if (value == null) return null;
    if (_attempts is EqualUnmodifiableListView) return _attempts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuranFinalCycleModel(id: $id, enrollmentId: $enrollmentId, status: $status, passedOn: $passedOn, juz: $juz, student: $student, group: $group, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuranFinalCycleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.passedOn, passedOn) ||
                other.passedOn == passedOn) &&
            (identical(other.juz, juz) || other.juz == juz) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.group, group) || other.group == group) &&
            const DeepCollectionEquality().equals(other._attempts, _attempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      enrollmentId,
      status,
      passedOn,
      juz,
      student,
      group,
      const DeepCollectionEquality().hash(_attempts));

  /// Create a copy of QuranFinalCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuranFinalCycleModelImplCopyWith<_$QuranFinalCycleModelImpl>
      get copyWith =>
          __$$QuranFinalCycleModelImplCopyWithImpl<_$QuranFinalCycleModelImpl>(
              this, _$identity);
}

abstract class _QuranFinalCycleModel implements QuranFinalCycleModel {
  const factory _QuranFinalCycleModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
          final int? enrollmentId,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
          final String? passedOn,
          @JsonKey(readValue: readJsonMap) final QuranJuzModel? juz,
          @JsonKey(readValue: readJsonMap) final NamedRefModel? student,
          @JsonKey(readValue: readJsonMap) final QuranTestGroupModel? group,
          @JsonKey(readValue: readJsonList)
          final List<QuranFinalAttemptModel>? attempts}) =
      _$QuranFinalCycleModelImpl;

  factory _QuranFinalCycleModel.fromJson(Map<String, dynamic> json) =
      _$QuranFinalCycleModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(name: 'passed_on', fromJson: jsonStringLenient)
  String? get passedOn;
  @override
  @JsonKey(readValue: readJsonMap)
  QuranJuzModel? get juz;
  @override
  @JsonKey(readValue: readJsonMap)
  NamedRefModel? get student;
  @override
  @JsonKey(readValue: readJsonMap)
  QuranTestGroupModel? get group;
  @override
  @JsonKey(readValue: readJsonList)
  List<QuranFinalAttemptModel>? get attempts;

  /// Create a copy of QuranFinalCycleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuranFinalCycleModelImplCopyWith<_$QuranFinalCycleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
