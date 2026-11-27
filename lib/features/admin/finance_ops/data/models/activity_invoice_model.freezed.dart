// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivitySummaryModel _$ActivitySummaryModelFromJson(Map<String, dynamic> json) {
  return _ActivitySummaryModel.fromJson(json);
}

/// @nodoc
mixin _$ActivitySummaryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
  String? get activityDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
  double? get expectedRevenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
  double? get collectedRevenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
  double? get expenseTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activitySummaryGroupName,
      fromJson: _activitySummaryGroupNameValue)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activitySummaryCourseName,
      fromJson: _activitySummaryCourseNameValue)
  String? get courseName => throw _privateConstructorUsedError;

  /// Create a copy of ActivitySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivitySummaryModelCopyWith<ActivitySummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivitySummaryModelCopyWith<$Res> {
  factory $ActivitySummaryModelCopyWith(ActivitySummaryModel value,
          $Res Function(ActivitySummaryModel) then) =
      _$ActivitySummaryModelCopyWithImpl<$Res, ActivitySummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? title,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
      String? activityDate,
      @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
      double? feeAmount,
      @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
      double? expectedRevenue,
      @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
      double? collectedRevenue,
      @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
      double? expenseTotal,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(
          readValue: _activitySummaryGroupName,
          fromJson: _activitySummaryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _activitySummaryCourseName,
          fromJson: _activitySummaryCourseNameValue)
      String? courseName});
}

/// @nodoc
class _$ActivitySummaryModelCopyWithImpl<$Res,
        $Val extends ActivitySummaryModel>
    implements $ActivitySummaryModelCopyWith<$Res> {
  _$ActivitySummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivitySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? activityDate = freezed,
    Object? feeAmount = freezed,
    Object? expectedRevenue = freezed,
    Object? collectedRevenue = freezed,
    Object? expenseTotal = freezed,
    Object? isActive = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
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
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      courseName: freezed == courseName
          ? _value.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivitySummaryModelImplCopyWith<$Res>
    implements $ActivitySummaryModelCopyWith<$Res> {
  factory _$$ActivitySummaryModelImplCopyWith(_$ActivitySummaryModelImpl value,
          $Res Function(_$ActivitySummaryModelImpl) then) =
      __$$ActivitySummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? title,
      @JsonKey(fromJson: jsonStringLenient) String? description,
      @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
      String? activityDate,
      @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
      double? feeAmount,
      @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
      double? expectedRevenue,
      @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
      double? collectedRevenue,
      @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
      double? expenseTotal,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
      @JsonKey(
          readValue: _activitySummaryGroupName,
          fromJson: _activitySummaryGroupNameValue)
      String? groupName,
      @JsonKey(
          readValue: _activitySummaryCourseName,
          fromJson: _activitySummaryCourseNameValue)
      String? courseName});
}

/// @nodoc
class __$$ActivitySummaryModelImplCopyWithImpl<$Res>
    extends _$ActivitySummaryModelCopyWithImpl<$Res, _$ActivitySummaryModelImpl>
    implements _$$ActivitySummaryModelImplCopyWith<$Res> {
  __$$ActivitySummaryModelImplCopyWithImpl(_$ActivitySummaryModelImpl _value,
      $Res Function(_$ActivitySummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivitySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? activityDate = freezed,
    Object? feeAmount = freezed,
    Object? expectedRevenue = freezed,
    Object? collectedRevenue = freezed,
    Object? expenseTotal = freezed,
    Object? isActive = freezed,
    Object? groupName = freezed,
    Object? courseName = freezed,
  }) {
    return _then(_$ActivitySummaryModelImpl(
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
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
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
class _$ActivitySummaryModelImpl implements _ActivitySummaryModel {
  const _$ActivitySummaryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.title,
      @JsonKey(fromJson: jsonStringLenient) this.description,
      @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
      this.activityDate,
      @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient) this.feeAmount,
      @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
      this.expectedRevenue,
      @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
      this.collectedRevenue,
      @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
      this.expenseTotal,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) this.isActive,
      @JsonKey(
          readValue: _activitySummaryGroupName,
          fromJson: _activitySummaryGroupNameValue)
      this.groupName,
      @JsonKey(
          readValue: _activitySummaryCourseName,
          fromJson: _activitySummaryCourseNameValue)
      this.courseName});

  factory _$ActivitySummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivitySummaryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? title;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? description;
  @override
  @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
  final String? activityDate;
  @override
  @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
  final double? feeAmount;
  @override
  @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
  final double? expectedRevenue;
  @override
  @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
  final double? collectedRevenue;
  @override
  @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
  final double? expenseTotal;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  final bool? isActive;
  @override
  @JsonKey(
      readValue: _activitySummaryGroupName,
      fromJson: _activitySummaryGroupNameValue)
  final String? groupName;
  @override
  @JsonKey(
      readValue: _activitySummaryCourseName,
      fromJson: _activitySummaryCourseNameValue)
  final String? courseName;

  @override
  String toString() {
    return 'ActivitySummaryModel(id: $id, title: $title, description: $description, activityDate: $activityDate, feeAmount: $feeAmount, expectedRevenue: $expectedRevenue, collectedRevenue: $collectedRevenue, expenseTotal: $expenseTotal, isActive: $isActive, groupName: $groupName, courseName: $courseName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitySummaryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.activityDate, activityDate) ||
                other.activityDate == activityDate) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.expectedRevenue, expectedRevenue) ||
                other.expectedRevenue == expectedRevenue) &&
            (identical(other.collectedRevenue, collectedRevenue) ||
                other.collectedRevenue == collectedRevenue) &&
            (identical(other.expenseTotal, expenseTotal) ||
                other.expenseTotal == expenseTotal) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName));
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
      expectedRevenue,
      collectedRevenue,
      expenseTotal,
      isActive,
      groupName,
      courseName);

  /// Create a copy of ActivitySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivitySummaryModelImplCopyWith<_$ActivitySummaryModelImpl>
      get copyWith =>
          __$$ActivitySummaryModelImplCopyWithImpl<_$ActivitySummaryModelImpl>(
              this, _$identity);
}

abstract class _ActivitySummaryModel implements ActivitySummaryModel {
  const factory _ActivitySummaryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? title,
      @JsonKey(fromJson: jsonStringLenient) final String? description,
      @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
      final String? activityDate,
      @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
      final double? feeAmount,
      @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
      final double? expectedRevenue,
      @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
      final double? collectedRevenue,
      @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
      final double? expenseTotal,
      @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
      final bool? isActive,
      @JsonKey(
          readValue: _activitySummaryGroupName,
          fromJson: _activitySummaryGroupNameValue)
      final String? groupName,
      @JsonKey(
          readValue: _activitySummaryCourseName,
          fromJson: _activitySummaryCourseNameValue)
      final String? courseName}) = _$ActivitySummaryModelImpl;

  factory _ActivitySummaryModel.fromJson(Map<String, dynamic> json) =
      _$ActivitySummaryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get title;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get description;
  @override
  @JsonKey(name: 'activity_date', fromJson: jsonStringLenient)
  String? get activityDate;
  @override
  @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
  double? get feeAmount;
  @override
  @JsonKey(name: 'expected_revenue', fromJson: jsonDoubleLenient)
  double? get expectedRevenue;
  @override
  @JsonKey(name: 'collected_revenue', fromJson: jsonDoubleLenient)
  double? get collectedRevenue;
  @override
  @JsonKey(name: 'expense_total', fromJson: jsonDoubleLenient)
  double? get expenseTotal;
  @override
  @JsonKey(name: 'is_active', fromJson: jsonBoolLenient)
  bool? get isActive;
  @override
  @JsonKey(
      readValue: _activitySummaryGroupName,
      fromJson: _activitySummaryGroupNameValue)
  String? get groupName;
  @override
  @JsonKey(
      readValue: _activitySummaryCourseName,
      fromJson: _activitySummaryCourseNameValue)
  String? get courseName;

  /// Create a copy of ActivitySummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivitySummaryModelImplCopyWith<_$ActivitySummaryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ActivityDetailModel _$ActivityDetailModelFromJson(Map<String, dynamic> json) {
  return _ActivityDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityDetailModel {
  @JsonKey(readValue: _activityDetailSummary)
  ActivitySummaryModel? get summary => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
  String? get audienceScope => throw _privateConstructorUsedError;
  @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
  int? get registrationsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
  int? get paymentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
  int? get expensesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_groups', readValue: readJsonList)
  List<NamedRefModel>? get targetGroups => throw _privateConstructorUsedError;

  /// Create a copy of ActivityDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityDetailModelCopyWith<ActivityDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityDetailModelCopyWith<$Res> {
  factory $ActivityDetailModelCopyWith(
          ActivityDetailModel value, $Res Function(ActivityDetailModel) then) =
      _$ActivityDetailModelCopyWithImpl<$Res, ActivityDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(readValue: _activityDetailSummary)
      ActivitySummaryModel? summary,
      @JsonKey(fromJson: jsonStringLenient) String? status,
      @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
      String? audienceScope,
      @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
      int? registrationsCount,
      @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
      int? paymentsCount,
      @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
      int? expensesCount,
      @JsonKey(name: 'target_groups', readValue: readJsonList)
      List<NamedRefModel>? targetGroups});

  $ActivitySummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class _$ActivityDetailModelCopyWithImpl<$Res, $Val extends ActivityDetailModel>
    implements $ActivityDetailModelCopyWith<$Res> {
  _$ActivityDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? status = freezed,
    Object? audienceScope = freezed,
    Object? registrationsCount = freezed,
    Object? paymentsCount = freezed,
    Object? expensesCount = freezed,
    Object? targetGroups = freezed,
  }) {
    return _then(_value.copyWith(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ActivitySummaryModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      audienceScope: freezed == audienceScope
          ? _value.audienceScope
          : audienceScope // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationsCount: freezed == registrationsCount
          ? _value.registrationsCount
          : registrationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentsCount: freezed == paymentsCount
          ? _value.paymentsCount
          : paymentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      expensesCount: freezed == expensesCount
          ? _value.expensesCount
          : expensesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      targetGroups: freezed == targetGroups
          ? _value.targetGroups
          : targetGroups // ignore: cast_nullable_to_non_nullable
              as List<NamedRefModel>?,
    ) as $Val);
  }

  /// Create a copy of ActivityDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivitySummaryModelCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $ActivitySummaryModelCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityDetailModelImplCopyWith<$Res>
    implements $ActivityDetailModelCopyWith<$Res> {
  factory _$$ActivityDetailModelImplCopyWith(_$ActivityDetailModelImpl value,
          $Res Function(_$ActivityDetailModelImpl) then) =
      __$$ActivityDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(readValue: _activityDetailSummary)
      ActivitySummaryModel? summary,
      @JsonKey(fromJson: jsonStringLenient) String? status,
      @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
      String? audienceScope,
      @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
      int? registrationsCount,
      @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
      int? paymentsCount,
      @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
      int? expensesCount,
      @JsonKey(name: 'target_groups', readValue: readJsonList)
      List<NamedRefModel>? targetGroups});

  @override
  $ActivitySummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$ActivityDetailModelImplCopyWithImpl<$Res>
    extends _$ActivityDetailModelCopyWithImpl<$Res, _$ActivityDetailModelImpl>
    implements _$$ActivityDetailModelImplCopyWith<$Res> {
  __$$ActivityDetailModelImplCopyWithImpl(_$ActivityDetailModelImpl _value,
      $Res Function(_$ActivityDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? status = freezed,
    Object? audienceScope = freezed,
    Object? registrationsCount = freezed,
    Object? paymentsCount = freezed,
    Object? expensesCount = freezed,
    Object? targetGroups = freezed,
  }) {
    return _then(_$ActivityDetailModelImpl(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as ActivitySummaryModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      audienceScope: freezed == audienceScope
          ? _value.audienceScope
          : audienceScope // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationsCount: freezed == registrationsCount
          ? _value.registrationsCount
          : registrationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentsCount: freezed == paymentsCount
          ? _value.paymentsCount
          : paymentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      expensesCount: freezed == expensesCount
          ? _value.expensesCount
          : expensesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      targetGroups: freezed == targetGroups
          ? _value._targetGroups
          : targetGroups // ignore: cast_nullable_to_non_nullable
              as List<NamedRefModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ActivityDetailModelImpl implements _ActivityDetailModel {
  const _$ActivityDetailModelImpl(
      {@JsonKey(readValue: _activityDetailSummary) this.summary,
      @JsonKey(fromJson: jsonStringLenient) this.status,
      @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
      this.audienceScope,
      @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
      this.registrationsCount,
      @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
      this.paymentsCount,
      @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
      this.expensesCount,
      @JsonKey(name: 'target_groups', readValue: readJsonList)
      final List<NamedRefModel>? targetGroups})
      : _targetGroups = targetGroups;

  factory _$ActivityDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityDetailModelImplFromJson(json);

  @override
  @JsonKey(readValue: _activityDetailSummary)
  final ActivitySummaryModel? summary;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? status;
  @override
  @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
  final String? audienceScope;
  @override
  @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
  final int? registrationsCount;
  @override
  @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
  final int? paymentsCount;
  @override
  @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
  final int? expensesCount;
  final List<NamedRefModel>? _targetGroups;
  @override
  @JsonKey(name: 'target_groups', readValue: readJsonList)
  List<NamedRefModel>? get targetGroups {
    final value = _targetGroups;
    if (value == null) return null;
    if (_targetGroups is EqualUnmodifiableListView) return _targetGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ActivityDetailModel(summary: $summary, status: $status, audienceScope: $audienceScope, registrationsCount: $registrationsCount, paymentsCount: $paymentsCount, expensesCount: $expensesCount, targetGroups: $targetGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityDetailModelImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.audienceScope, audienceScope) ||
                other.audienceScope == audienceScope) &&
            (identical(other.registrationsCount, registrationsCount) ||
                other.registrationsCount == registrationsCount) &&
            (identical(other.paymentsCount, paymentsCount) ||
                other.paymentsCount == paymentsCount) &&
            (identical(other.expensesCount, expensesCount) ||
                other.expensesCount == expensesCount) &&
            const DeepCollectionEquality()
                .equals(other._targetGroups, _targetGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      status,
      audienceScope,
      registrationsCount,
      paymentsCount,
      expensesCount,
      const DeepCollectionEquality().hash(_targetGroups));

  /// Create a copy of ActivityDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityDetailModelImplCopyWith<_$ActivityDetailModelImpl> get copyWith =>
      __$$ActivityDetailModelImplCopyWithImpl<_$ActivityDetailModelImpl>(
          this, _$identity);
}

abstract class _ActivityDetailModel implements ActivityDetailModel {
  const factory _ActivityDetailModel(
      {@JsonKey(readValue: _activityDetailSummary)
      final ActivitySummaryModel? summary,
      @JsonKey(fromJson: jsonStringLenient) final String? status,
      @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
      final String? audienceScope,
      @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
      final int? registrationsCount,
      @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
      final int? paymentsCount,
      @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
      final int? expensesCount,
      @JsonKey(name: 'target_groups', readValue: readJsonList)
      final List<NamedRefModel>? targetGroups}) = _$ActivityDetailModelImpl;

  factory _ActivityDetailModel.fromJson(Map<String, dynamic> json) =
      _$ActivityDetailModelImpl.fromJson;

  @override
  @JsonKey(readValue: _activityDetailSummary)
  ActivitySummaryModel? get summary;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get status;
  @override
  @JsonKey(name: 'audience_scope', fromJson: jsonStringLenient)
  String? get audienceScope;
  @override
  @JsonKey(name: 'registrations_count', fromJson: jsonIntLenient)
  int? get registrationsCount;
  @override
  @JsonKey(name: 'payments_count', fromJson: jsonIntLenient)
  int? get paymentsCount;
  @override
  @JsonKey(name: 'expenses_count', fromJson: jsonIntLenient)
  int? get expensesCount;
  @override
  @JsonKey(name: 'target_groups', readValue: readJsonList)
  List<NamedRefModel>? get targetGroups;

  /// Create a copy of ActivityDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityDetailModelImplCopyWith<_$ActivityDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivityRegistrationModel _$ActivityRegistrationModelFromJson(
    Map<String, dynamic> json) {
  return _ActivityRegistrationModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityRegistrationModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityRegistrationStudentId,
      fromJson: _activityRegistrationStudentIdValue)
  int? get studentId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityRegistrationStudentName,
      fromJson: _activityRegistrationStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
  double? get feeAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  double? get paidTotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of ActivityRegistrationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityRegistrationModelCopyWith<ActivityRegistrationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityRegistrationModelCopyWith<$Res> {
  factory $ActivityRegistrationModelCopyWith(ActivityRegistrationModel value,
          $Res Function(ActivityRegistrationModel) then) =
      _$ActivityRegistrationModelCopyWithImpl<$Res, ActivityRegistrationModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(
          readValue: _activityRegistrationStudentId,
          fromJson: _activityRegistrationStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _activityRegistrationStudentName,
          fromJson: _activityRegistrationStudentNameValue)
      String? studentName,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
      double? feeAmount,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
      double? paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes});
}

/// @nodoc
class _$ActivityRegistrationModelCopyWithImpl<$Res,
        $Val extends ActivityRegistrationModel>
    implements $ActivityRegistrationModelCopyWith<$Res> {
  _$ActivityRegistrationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityRegistrationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? enrollmentId = freezed,
    Object? groupName = freezed,
    Object? feeAmount = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? status = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityRegistrationModelImplCopyWith<$Res>
    implements $ActivityRegistrationModelCopyWith<$Res> {
  factory _$$ActivityRegistrationModelImplCopyWith(
          _$ActivityRegistrationModelImpl value,
          $Res Function(_$ActivityRegistrationModelImpl) then) =
      __$$ActivityRegistrationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(
          readValue: _activityRegistrationStudentId,
          fromJson: _activityRegistrationStudentIdValue)
      int? studentId,
      @JsonKey(
          readValue: _activityRegistrationStudentName,
          fromJson: _activityRegistrationStudentNameValue)
      String? studentName,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName,
      @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
      double? feeAmount,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
      double? paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonStringLenient) String? notes});
}

/// @nodoc
class __$$ActivityRegistrationModelImplCopyWithImpl<$Res>
    extends _$ActivityRegistrationModelCopyWithImpl<$Res,
        _$ActivityRegistrationModelImpl>
    implements _$$ActivityRegistrationModelImplCopyWith<$Res> {
  __$$ActivityRegistrationModelImplCopyWithImpl(
      _$ActivityRegistrationModelImpl _value,
      $Res Function(_$ActivityRegistrationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityRegistrationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? studentId = freezed,
    Object? studentName = freezed,
    Object? enrollmentId = freezed,
    Object? groupName = freezed,
    Object? feeAmount = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? status = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ActivityRegistrationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      feeAmount: freezed == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
class _$ActivityRegistrationModelImpl implements _ActivityRegistrationModel {
  const _$ActivityRegistrationModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(
          readValue: _activityRegistrationStudentId,
          fromJson: _activityRegistrationStudentIdValue)
      this.studentId,
      @JsonKey(
          readValue: _activityRegistrationStudentName,
          fromJson: _activityRegistrationStudentNameValue)
      this.studentName,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient) this.groupName,
      @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient) this.feeAmount,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient) this.paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) this.balance,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonStringLenient) this.notes});

  factory _$ActivityRegistrationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityRegistrationModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(
      readValue: _activityRegistrationStudentId,
      fromJson: _activityRegistrationStudentIdValue)
  final int? studentId;
  @override
  @JsonKey(
      readValue: _activityRegistrationStudentName,
      fromJson: _activityRegistrationStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  final String? groupName;
  @override
  @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
  final double? feeAmount;
  @override
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  final double? paidTotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? balance;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;

  @override
  String toString() {
    return 'ActivityRegistrationModel(id: $id, studentId: $studentId, studentName: $studentName, enrollmentId: $enrollmentId, groupName: $groupName, feeAmount: $feeAmount, paidTotal: $paidTotal, balance: $balance, status: $status, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityRegistrationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.paidTotal, paidTotal) ||
                other.paidTotal == paidTotal) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, studentId, studentName,
      enrollmentId, groupName, feeAmount, paidTotal, balance, status, notes);

  /// Create a copy of ActivityRegistrationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityRegistrationModelImplCopyWith<_$ActivityRegistrationModelImpl>
      get copyWith => __$$ActivityRegistrationModelImplCopyWithImpl<
          _$ActivityRegistrationModelImpl>(this, _$identity);
}

abstract class _ActivityRegistrationModel implements ActivityRegistrationModel {
  const factory _ActivityRegistrationModel(
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(
              readValue: _activityRegistrationStudentId,
              fromJson: _activityRegistrationStudentIdValue)
          final int? studentId,
          @JsonKey(
              readValue: _activityRegistrationStudentName,
              fromJson: _activityRegistrationStudentNameValue)
          final String? studentName,
          @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
          final int? enrollmentId,
          @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
          final String? groupName,
          @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
          final double? feeAmount,
          @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
          final double? paidTotal,
          @JsonKey(fromJson: jsonDoubleLenient) final double? balance,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(fromJson: jsonStringLenient) final String? notes}) =
      _$ActivityRegistrationModelImpl;

  factory _ActivityRegistrationModel.fromJson(Map<String, dynamic> json) =
      _$ActivityRegistrationModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(
      readValue: _activityRegistrationStudentId,
      fromJson: _activityRegistrationStudentIdValue)
  int? get studentId;
  @override
  @JsonKey(
      readValue: _activityRegistrationStudentName,
      fromJson: _activityRegistrationStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName;
  @override
  @JsonKey(name: 'fee_amount', fromJson: jsonDoubleLenient)
  double? get feeAmount;
  @override
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  double? get paidTotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;

  /// Create a copy of ActivityRegistrationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityRegistrationModelImplCopyWith<_$ActivityRegistrationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ActivityPaymentModel _$ActivityPaymentModelFromJson(Map<String, dynamic> json) {
  return _ActivityPaymentModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityPaymentModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
  int? get registrationId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityPaymentStudentName,
      fromJson: _activityPaymentStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_at', fromJson: jsonStringValue)
  String? get paidAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityPaymentPaymentMethodName,
      fromJson: _activityPaymentPaymentMethodNameValue)
  String? get paymentMethodName => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
  String? get referenceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  String? get voidedAt => throw _privateConstructorUsedError;

  /// Create a copy of ActivityPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityPaymentModelCopyWith<ActivityPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityPaymentModelCopyWith<$Res> {
  factory $ActivityPaymentModelCopyWith(ActivityPaymentModel value,
          $Res Function(ActivityPaymentModel) then) =
      _$ActivityPaymentModelCopyWithImpl<$Res, ActivityPaymentModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
      int? registrationId,
      @JsonKey(
          readValue: _activityPaymentStudentName,
          fromJson: _activityPaymentStudentNameValue)
      String? studentName,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) String? paidAt,
      @JsonKey(
          readValue: _activityPaymentPaymentMethodName,
          fromJson: _activityPaymentPaymentMethodNameValue)
      String? paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      String? referenceNo,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
      String? voidedAt});
}

/// @nodoc
class _$ActivityPaymentModelCopyWithImpl<$Res,
        $Val extends ActivityPaymentModel>
    implements $ActivityPaymentModelCopyWith<$Res> {
  _$ActivityPaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registrationId = freezed,
    Object? studentName = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodName = freezed,
    Object? referenceNo = freezed,
    Object? voidedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registrationId: freezed == registrationId
          ? _value.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodName: freezed == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityPaymentModelImplCopyWith<$Res>
    implements $ActivityPaymentModelCopyWith<$Res> {
  factory _$$ActivityPaymentModelImplCopyWith(_$ActivityPaymentModelImpl value,
          $Res Function(_$ActivityPaymentModelImpl) then) =
      __$$ActivityPaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
      int? registrationId,
      @JsonKey(
          readValue: _activityPaymentStudentName,
          fromJson: _activityPaymentStudentNameValue)
      String? studentName,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) String? paidAt,
      @JsonKey(
          readValue: _activityPaymentPaymentMethodName,
          fromJson: _activityPaymentPaymentMethodNameValue)
      String? paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      String? referenceNo,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
      String? voidedAt});
}

/// @nodoc
class __$$ActivityPaymentModelImplCopyWithImpl<$Res>
    extends _$ActivityPaymentModelCopyWithImpl<$Res, _$ActivityPaymentModelImpl>
    implements _$$ActivityPaymentModelImplCopyWith<$Res> {
  __$$ActivityPaymentModelImplCopyWithImpl(_$ActivityPaymentModelImpl _value,
      $Res Function(_$ActivityPaymentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? registrationId = freezed,
    Object? studentName = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodName = freezed,
    Object? referenceNo = freezed,
    Object? voidedAt = freezed,
  }) {
    return _then(_$ActivityPaymentModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      registrationId: freezed == registrationId
          ? _value.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as int?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodName: freezed == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ActivityPaymentModelImpl implements _ActivityPaymentModel {
  const _$ActivityPaymentModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
      this.registrationId,
      @JsonKey(
          readValue: _activityPaymentStudentName,
          fromJson: _activityPaymentStudentNameValue)
      this.studentName,
      @JsonKey(fromJson: jsonDoubleLenient) this.amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) this.paidAt,
      @JsonKey(
          readValue: _activityPaymentPaymentMethodName,
          fromJson: _activityPaymentPaymentMethodNameValue)
      this.paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      this.referenceNo,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) this.voidedAt});

  factory _$ActivityPaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityPaymentModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
  final int? registrationId;
  @override
  @JsonKey(
      readValue: _activityPaymentStudentName,
      fromJson: _activityPaymentStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? amount;
  @override
  @JsonKey(name: 'paid_at', fromJson: jsonStringValue)
  final String? paidAt;
  @override
  @JsonKey(
      readValue: _activityPaymentPaymentMethodName,
      fromJson: _activityPaymentPaymentMethodNameValue)
  final String? paymentMethodName;
  @override
  @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
  final String? referenceNo;
  @override
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  final String? voidedAt;

  @override
  String toString() {
    return 'ActivityPaymentModel(id: $id, registrationId: $registrationId, studentName: $studentName, amount: $amount, paidAt: $paidAt, paymentMethodName: $paymentMethodName, referenceNo: $referenceNo, voidedAt: $voidedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityPaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.paymentMethodName, paymentMethodName) ||
                other.paymentMethodName == paymentMethodName) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.voidedAt, voidedAt) ||
                other.voidedAt == voidedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, registrationId, studentName,
      amount, paidAt, paymentMethodName, referenceNo, voidedAt);

  /// Create a copy of ActivityPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityPaymentModelImplCopyWith<_$ActivityPaymentModelImpl>
      get copyWith =>
          __$$ActivityPaymentModelImplCopyWithImpl<_$ActivityPaymentModelImpl>(
              this, _$identity);
}

abstract class _ActivityPaymentModel implements ActivityPaymentModel {
  const factory _ActivityPaymentModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
      final int? registrationId,
      @JsonKey(
          readValue: _activityPaymentStudentName,
          fromJson: _activityPaymentStudentNameValue)
      final String? studentName,
      @JsonKey(fromJson: jsonDoubleLenient) final double? amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) final String? paidAt,
      @JsonKey(
          readValue: _activityPaymentPaymentMethodName,
          fromJson: _activityPaymentPaymentMethodNameValue)
      final String? paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      final String? referenceNo,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
      final String? voidedAt}) = _$ActivityPaymentModelImpl;

  factory _ActivityPaymentModel.fromJson(Map<String, dynamic> json) =
      _$ActivityPaymentModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'activity_registration_id', fromJson: jsonIntLenient)
  int? get registrationId;
  @override
  @JsonKey(
      readValue: _activityPaymentStudentName,
      fromJson: _activityPaymentStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount;
  @override
  @JsonKey(name: 'paid_at', fromJson: jsonStringValue)
  String? get paidAt;
  @override
  @JsonKey(
      readValue: _activityPaymentPaymentMethodName,
      fromJson: _activityPaymentPaymentMethodNameValue)
  String? get paymentMethodName;
  @override
  @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
  String? get referenceNo;
  @override
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  String? get voidedAt;

  /// Create a copy of ActivityPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityPaymentModelImplCopyWith<_$ActivityPaymentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ActivityExpenseModel _$ActivityExpenseModelFromJson(Map<String, dynamic> json) {
  return _ActivityExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$ActivityExpenseModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityExpenseCategoryId,
      fromJson: _activityExpenseCategoryIdValue)
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _activityExpenseCategoryName,
      fromJson: _activityExpenseCategoryNameValue)
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'spent_on', fromJson: jsonStringValue)
  String? get spentOn => throw _privateConstructorUsedError;

  /// Create a copy of ActivityExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityExpenseModelCopyWith<ActivityExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityExpenseModelCopyWith<$Res> {
  factory $ActivityExpenseModelCopyWith(ActivityExpenseModel value,
          $Res Function(ActivityExpenseModel) then) =
      _$ActivityExpenseModelCopyWithImpl<$Res, ActivityExpenseModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(fromJson: jsonStringValue) String? description,
      @JsonKey(
          readValue: _activityExpenseCategoryId,
          fromJson: _activityExpenseCategoryIdValue)
      int? categoryId,
      @JsonKey(
          readValue: _activityExpenseCategoryName,
          fromJson: _activityExpenseCategoryNameValue)
      String? categoryName,
      @JsonKey(name: 'spent_on', fromJson: jsonStringValue) String? spentOn});
}

/// @nodoc
class _$ActivityExpenseModelCopyWithImpl<$Res,
        $Val extends ActivityExpenseModel>
    implements $ActivityExpenseModelCopyWith<$Res> {
  _$ActivityExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? spentOn = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      spentOn: freezed == spentOn
          ? _value.spentOn
          : spentOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityExpenseModelImplCopyWith<$Res>
    implements $ActivityExpenseModelCopyWith<$Res> {
  factory _$$ActivityExpenseModelImplCopyWith(_$ActivityExpenseModelImpl value,
          $Res Function(_$ActivityExpenseModelImpl) then) =
      __$$ActivityExpenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(fromJson: jsonStringValue) String? description,
      @JsonKey(
          readValue: _activityExpenseCategoryId,
          fromJson: _activityExpenseCategoryIdValue)
      int? categoryId,
      @JsonKey(
          readValue: _activityExpenseCategoryName,
          fromJson: _activityExpenseCategoryNameValue)
      String? categoryName,
      @JsonKey(name: 'spent_on', fromJson: jsonStringValue) String? spentOn});
}

/// @nodoc
class __$$ActivityExpenseModelImplCopyWithImpl<$Res>
    extends _$ActivityExpenseModelCopyWithImpl<$Res, _$ActivityExpenseModelImpl>
    implements _$$ActivityExpenseModelImplCopyWith<$Res> {
  __$$ActivityExpenseModelImplCopyWithImpl(_$ActivityExpenseModelImpl _value,
      $Res Function(_$ActivityExpenseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? spentOn = freezed,
  }) {
    return _then(_$ActivityExpenseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      spentOn: freezed == spentOn
          ? _value.spentOn
          : spentOn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ActivityExpenseModelImpl implements _ActivityExpenseModel {
  const _$ActivityExpenseModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonDoubleLenient) this.amount,
      @JsonKey(fromJson: jsonStringValue) this.description,
      @JsonKey(
          readValue: _activityExpenseCategoryId,
          fromJson: _activityExpenseCategoryIdValue)
      this.categoryId,
      @JsonKey(
          readValue: _activityExpenseCategoryName,
          fromJson: _activityExpenseCategoryNameValue)
      this.categoryName,
      @JsonKey(name: 'spent_on', fromJson: jsonStringValue) this.spentOn});

  factory _$ActivityExpenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityExpenseModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? amount;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? description;
  @override
  @JsonKey(
      readValue: _activityExpenseCategoryId,
      fromJson: _activityExpenseCategoryIdValue)
  final int? categoryId;
  @override
  @JsonKey(
      readValue: _activityExpenseCategoryName,
      fromJson: _activityExpenseCategoryNameValue)
  final String? categoryName;
  @override
  @JsonKey(name: 'spent_on', fromJson: jsonStringValue)
  final String? spentOn;

  @override
  String toString() {
    return 'ActivityExpenseModel(id: $id, amount: $amount, description: $description, categoryId: $categoryId, categoryName: $categoryName, spentOn: $spentOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityExpenseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.spentOn, spentOn) || other.spentOn == spentOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, description, categoryId, categoryName, spentOn);

  /// Create a copy of ActivityExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityExpenseModelImplCopyWith<_$ActivityExpenseModelImpl>
      get copyWith =>
          __$$ActivityExpenseModelImplCopyWithImpl<_$ActivityExpenseModelImpl>(
              this, _$identity);
}

abstract class _ActivityExpenseModel implements ActivityExpenseModel {
  const factory _ActivityExpenseModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonDoubleLenient) final double? amount,
      @JsonKey(fromJson: jsonStringValue) final String? description,
      @JsonKey(
          readValue: _activityExpenseCategoryId,
          fromJson: _activityExpenseCategoryIdValue)
      final int? categoryId,
      @JsonKey(
          readValue: _activityExpenseCategoryName,
          fromJson: _activityExpenseCategoryNameValue)
      final String? categoryName,
      @JsonKey(name: 'spent_on', fromJson: jsonStringValue)
      final String? spentOn}) = _$ActivityExpenseModelImpl;

  factory _ActivityExpenseModel.fromJson(Map<String, dynamic> json) =
      _$ActivityExpenseModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get description;
  @override
  @JsonKey(
      readValue: _activityExpenseCategoryId,
      fromJson: _activityExpenseCategoryIdValue)
  int? get categoryId;
  @override
  @JsonKey(
      readValue: _activityExpenseCategoryName,
      fromJson: _activityExpenseCategoryNameValue)
  String? get categoryName;
  @override
  @JsonKey(name: 'spent_on', fromJson: jsonStringValue)
  String? get spentOn;

  /// Create a copy of ActivityExpenseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityExpenseModelImplCopyWith<_$ActivityExpenseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvoiceSummaryModel _$InvoiceSummaryModelFromJson(Map<String, dynamic> json) {
  return _InvoiceSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceSummaryModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
  String? get invoiceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
  String? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
  String? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  double? get paidTotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_count', fromJson: jsonIntLenient)
  int? get itemsCount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceSummaryParentName,
      fromJson: _invoiceSummaryParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceSummaryModelCopyWith<InvoiceSummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceSummaryModelCopyWith<$Res> {
  factory $InvoiceSummaryModelCopyWith(
          InvoiceSummaryModel value, $Res Function(InvoiceSummaryModel) then) =
      _$InvoiceSummaryModelCopyWithImpl<$Res, InvoiceSummaryModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) String? invoiceNo,
      @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
      String? invoiceType,
      @JsonKey(name: 'issue_date', fromJson: jsonStringValue) String? issueDate,
      @JsonKey(name: 'due_date', fromJson: jsonStringLenient) String? dueDate,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonDoubleLenient) double? total,
      @JsonKey(fromJson: jsonDoubleLenient) double? discount,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
      double? paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(name: 'items_count', fromJson: jsonIntLenient) int? itemsCount,
      @JsonKey(
          readValue: _invoiceSummaryParentName,
          fromJson: _invoiceSummaryParentNameValue)
      String? parentName});
}

/// @nodoc
class _$InvoiceSummaryModelCopyWithImpl<$Res, $Val extends InvoiceSummaryModel>
    implements $InvoiceSummaryModelCopyWith<$Res> {
  _$InvoiceSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? invoiceType = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? status = freezed,
    Object? total = freezed,
    Object? discount = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? itemsCount = freezed,
    Object? parentName = freezed,
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
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceSummaryModelImplCopyWith<$Res>
    implements $InvoiceSummaryModelCopyWith<$Res> {
  factory _$$InvoiceSummaryModelImplCopyWith(_$InvoiceSummaryModelImpl value,
          $Res Function(_$InvoiceSummaryModelImpl) then) =
      __$$InvoiceSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) String? invoiceNo,
      @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
      String? invoiceType,
      @JsonKey(name: 'issue_date', fromJson: jsonStringValue) String? issueDate,
      @JsonKey(name: 'due_date', fromJson: jsonStringLenient) String? dueDate,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonDoubleLenient) double? total,
      @JsonKey(fromJson: jsonDoubleLenient) double? discount,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
      double? paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(name: 'items_count', fromJson: jsonIntLenient) int? itemsCount,
      @JsonKey(
          readValue: _invoiceSummaryParentName,
          fromJson: _invoiceSummaryParentNameValue)
      String? parentName});
}

/// @nodoc
class __$$InvoiceSummaryModelImplCopyWithImpl<$Res>
    extends _$InvoiceSummaryModelCopyWithImpl<$Res, _$InvoiceSummaryModelImpl>
    implements _$$InvoiceSummaryModelImplCopyWith<$Res> {
  __$$InvoiceSummaryModelImplCopyWithImpl(_$InvoiceSummaryModelImpl _value,
      $Res Function(_$InvoiceSummaryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceNo = freezed,
    Object? invoiceType = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? status = freezed,
    Object? total = freezed,
    Object? discount = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? itemsCount = freezed,
    Object? parentName = freezed,
  }) {
    return _then(_$InvoiceSummaryModelImpl(
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
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidTotal: freezed == paidTotal
          ? _value.paidTotal
          : paidTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      itemsCount: freezed == itemsCount
          ? _value.itemsCount
          : itemsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InvoiceSummaryModelImpl implements _InvoiceSummaryModel {
  const _$InvoiceSummaryModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) this.invoiceNo,
      @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
      this.invoiceType,
      @JsonKey(name: 'issue_date', fromJson: jsonStringValue) this.issueDate,
      @JsonKey(name: 'due_date', fromJson: jsonStringLenient) this.dueDate,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonDoubleLenient) this.total,
      @JsonKey(fromJson: jsonDoubleLenient) this.discount,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient) this.paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) this.balance,
      @JsonKey(name: 'items_count', fromJson: jsonIntLenient) this.itemsCount,
      @JsonKey(
          readValue: _invoiceSummaryParentName,
          fromJson: _invoiceSummaryParentNameValue)
      this.parentName});

  factory _$InvoiceSummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceSummaryModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
  final String? invoiceNo;
  @override
  @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
  final String? invoiceType;
  @override
  @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
  final String? issueDate;
  @override
  @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
  final String? dueDate;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? total;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? discount;
  @override
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  final double? paidTotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? balance;
  @override
  @JsonKey(name: 'items_count', fromJson: jsonIntLenient)
  final int? itemsCount;
  @override
  @JsonKey(
      readValue: _invoiceSummaryParentName,
      fromJson: _invoiceSummaryParentNameValue)
  final String? parentName;

  @override
  String toString() {
    return 'InvoiceSummaryModel(id: $id, invoiceNo: $invoiceNo, invoiceType: $invoiceType, issueDate: $issueDate, dueDate: $dueDate, status: $status, total: $total, discount: $discount, paidTotal: $paidTotal, balance: $balance, itemsCount: $itemsCount, parentName: $parentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceSummaryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.invoiceType, invoiceType) ||
                other.invoiceType == invoiceType) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.paidTotal, paidTotal) ||
                other.paidTotal == paidTotal) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.itemsCount, itemsCount) ||
                other.itemsCount == itemsCount) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNo,
      invoiceType,
      issueDate,
      dueDate,
      status,
      total,
      discount,
      paidTotal,
      balance,
      itemsCount,
      parentName);

  /// Create a copy of InvoiceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceSummaryModelImplCopyWith<_$InvoiceSummaryModelImpl> get copyWith =>
      __$$InvoiceSummaryModelImplCopyWithImpl<_$InvoiceSummaryModelImpl>(
          this, _$identity);
}

abstract class _InvoiceSummaryModel implements InvoiceSummaryModel {
  const factory _InvoiceSummaryModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
      final String? invoiceNo,
      @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
      final String? invoiceType,
      @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
      final String? issueDate,
      @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
      final String? dueDate,
      @JsonKey(fromJson: jsonStringValue) final String? status,
      @JsonKey(fromJson: jsonDoubleLenient) final double? total,
      @JsonKey(fromJson: jsonDoubleLenient) final double? discount,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
      final double? paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) final double? balance,
      @JsonKey(name: 'items_count', fromJson: jsonIntLenient)
      final int? itemsCount,
      @JsonKey(
          readValue: _invoiceSummaryParentName,
          fromJson: _invoiceSummaryParentNameValue)
      final String? parentName}) = _$InvoiceSummaryModelImpl;

  factory _InvoiceSummaryModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceSummaryModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
  String? get invoiceNo;
  @override
  @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
  String? get invoiceType;
  @override
  @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
  String? get issueDate;
  @override
  @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
  String? get dueDate;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get total;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get discount;
  @override
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  double? get paidTotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance;
  @override
  @JsonKey(name: 'items_count', fromJson: jsonIntLenient)
  int? get itemsCount;
  @override
  @JsonKey(
      readValue: _invoiceSummaryParentName,
      fromJson: _invoiceSummaryParentNameValue)
  String? get parentName;

  /// Create a copy of InvoiceSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceSummaryModelImplCopyWith<_$InvoiceSummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceItemRecordModel _$InvoiceItemRecordModelFromJson(
    Map<String, dynamic> json) {
  return _InvoiceItemRecordModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceItemRecordModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient)
  double? get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceItemRecordStudentName,
      fromJson: _invoiceItemRecordStudentNameValue)
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_id', fromJson: jsonIntLenient)
  int? get activityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceItemRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceItemRecordModelCopyWith<InvoiceItemRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceItemRecordModelCopyWith<$Res> {
  factory $InvoiceItemRecordModelCopyWith(InvoiceItemRecordModel value,
          $Res Function(InvoiceItemRecordModel) then) =
      _$InvoiceItemRecordModelCopyWithImpl<$Res, InvoiceItemRecordModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? description,
      @JsonKey(fromJson: jsonDoubleLenient) double? quantity,
      @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient)
      double? unitPrice,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(
          readValue: _invoiceItemRecordStudentName,
          fromJson: _invoiceItemRecordStudentNameValue)
      String? studentName,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'activity_id', fromJson: jsonIntLenient) int? activityId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName});
}

/// @nodoc
class _$InvoiceItemRecordModelCopyWithImpl<$Res,
        $Val extends InvoiceItemRecordModel>
    implements $InvoiceItemRecordModelCopyWith<$Res> {
  _$InvoiceItemRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceItemRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? amount = freezed,
    Object? studentName = freezed,
    Object? enrollmentId = freezed,
    Object? activityId = freezed,
    Object? groupName = freezed,
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceItemRecordModelImplCopyWith<$Res>
    implements $InvoiceItemRecordModelCopyWith<$Res> {
  factory _$$InvoiceItemRecordModelImplCopyWith(
          _$InvoiceItemRecordModelImpl value,
          $Res Function(_$InvoiceItemRecordModelImpl) then) =
      __$$InvoiceItemRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(fromJson: jsonStringValue) String? description,
      @JsonKey(fromJson: jsonDoubleLenient) double? quantity,
      @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient)
      double? unitPrice,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(
          readValue: _invoiceItemRecordStudentName,
          fromJson: _invoiceItemRecordStudentNameValue)
      String? studentName,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      int? enrollmentId,
      @JsonKey(name: 'activity_id', fromJson: jsonIntLenient) int? activityId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      String? groupName});
}

/// @nodoc
class __$$InvoiceItemRecordModelImplCopyWithImpl<$Res>
    extends _$InvoiceItemRecordModelCopyWithImpl<$Res,
        _$InvoiceItemRecordModelImpl>
    implements _$$InvoiceItemRecordModelImplCopyWith<$Res> {
  __$$InvoiceItemRecordModelImplCopyWithImpl(
      _$InvoiceItemRecordModelImpl _value,
      $Res Function(_$InvoiceItemRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceItemRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? amount = freezed,
    Object? studentName = freezed,
    Object? enrollmentId = freezed,
    Object? activityId = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_$InvoiceItemRecordModelImpl(
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentId: freezed == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
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
class _$InvoiceItemRecordModelImpl implements _InvoiceItemRecordModel {
  const _$InvoiceItemRecordModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(fromJson: jsonStringValue) this.description,
      @JsonKey(fromJson: jsonDoubleLenient) this.quantity,
      @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient) this.unitPrice,
      @JsonKey(fromJson: jsonDoubleLenient) this.amount,
      @JsonKey(
          readValue: _invoiceItemRecordStudentName,
          fromJson: _invoiceItemRecordStudentNameValue)
      this.studentName,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      this.enrollmentId,
      @JsonKey(name: 'activity_id', fromJson: jsonIntLenient) this.activityId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      this.groupName});

  factory _$InvoiceItemRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceItemRecordModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? description;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? quantity;
  @override
  @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient)
  final double? unitPrice;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? amount;
  @override
  @JsonKey(
      readValue: _invoiceItemRecordStudentName,
      fromJson: _invoiceItemRecordStudentNameValue)
  final String? studentName;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  final int? enrollmentId;
  @override
  @JsonKey(name: 'activity_id', fromJson: jsonIntLenient)
  final int? activityId;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  final String? groupName;

  @override
  String toString() {
    return 'InvoiceItemRecordModel(id: $id, description: $description, quantity: $quantity, unitPrice: $unitPrice, amount: $amount, studentName: $studentName, enrollmentId: $enrollmentId, activityId: $activityId, groupName: $groupName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceItemRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, quantity,
      unitPrice, amount, studentName, enrollmentId, activityId, groupName);

  /// Create a copy of InvoiceItemRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceItemRecordModelImplCopyWith<_$InvoiceItemRecordModelImpl>
      get copyWith => __$$InvoiceItemRecordModelImplCopyWithImpl<
          _$InvoiceItemRecordModelImpl>(this, _$identity);
}

abstract class _InvoiceItemRecordModel implements InvoiceItemRecordModel {
  const factory _InvoiceItemRecordModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(fromJson: jsonStringValue) final String? description,
      @JsonKey(fromJson: jsonDoubleLenient) final double? quantity,
      @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient)
      final double? unitPrice,
      @JsonKey(fromJson: jsonDoubleLenient) final double? amount,
      @JsonKey(
          readValue: _invoiceItemRecordStudentName,
          fromJson: _invoiceItemRecordStudentNameValue)
      final String? studentName,
      @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
      final int? enrollmentId,
      @JsonKey(name: 'activity_id', fromJson: jsonIntLenient)
      final int? activityId,
      @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
      final String? groupName}) = _$InvoiceItemRecordModelImpl;

  factory _InvoiceItemRecordModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceItemRecordModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get description;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get quantity;
  @override
  @JsonKey(name: 'unit_price', fromJson: jsonDoubleLenient)
  double? get unitPrice;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount;
  @override
  @JsonKey(
      readValue: _invoiceItemRecordStudentName,
      fromJson: _invoiceItemRecordStudentNameValue)
  String? get studentName;
  @override
  @JsonKey(name: 'enrollment_id', fromJson: jsonIntLenient)
  int? get enrollmentId;
  @override
  @JsonKey(name: 'activity_id', fromJson: jsonIntLenient)
  int? get activityId;
  @override
  @JsonKey(name: 'group_name', fromJson: jsonStringLenient)
  String? get groupName;

  /// Create a copy of InvoiceItemRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceItemRecordModelImplCopyWith<_$InvoiceItemRecordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvoicePaymentRecordModel _$InvoicePaymentRecordModelFromJson(
    Map<String, dynamic> json) {
  return _InvoicePaymentRecordModel.fromJson(json);
}

/// @nodoc
mixin _$InvoicePaymentRecordModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient)
  int? get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentRecordInvoiceNo,
      fromJson: _invoicePaymentRecordInvoiceNoValue)
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentRecordParentName,
      fromJson: _invoicePaymentRecordParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_at', fromJson: jsonStringValue)
  String? get paidAt => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoicePaymentRecordPaymentMethodName,
      fromJson: _invoicePaymentRecordPaymentMethodNameValue)
  String? get paymentMethodName => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
  String? get referenceNo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  String? get voidedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
  String? get voidReason => throw _privateConstructorUsedError;

  /// Create a copy of InvoicePaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoicePaymentRecordModelCopyWith<InvoicePaymentRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoicePaymentRecordModelCopyWith<$Res> {
  factory $InvoicePaymentRecordModelCopyWith(InvoicePaymentRecordModel value,
          $Res Function(InvoicePaymentRecordModel) then) =
      _$InvoicePaymentRecordModelCopyWithImpl<$Res, InvoicePaymentRecordModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient) int? invoiceId,
      @JsonKey(
          readValue: _invoicePaymentRecordInvoiceNo,
          fromJson: _invoicePaymentRecordInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _invoicePaymentRecordParentName,
          fromJson: _invoicePaymentRecordParentNameValue)
      String? parentName,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) String? paidAt,
      @JsonKey(
          readValue: _invoicePaymentRecordPaymentMethodName,
          fromJson: _invoicePaymentRecordPaymentMethodNameValue)
      String? paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      String? referenceNo,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) String? voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      String? voidReason});
}

/// @nodoc
class _$InvoicePaymentRecordModelCopyWithImpl<$Res,
        $Val extends InvoicePaymentRecordModel>
    implements $InvoicePaymentRecordModelCopyWith<$Res> {
  _$InvoicePaymentRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoicePaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceId = freezed,
    Object? invoiceNo = freezed,
    Object? parentName = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodName = freezed,
    Object? referenceNo = freezed,
    Object? notes = freezed,
    Object? voidedAt = freezed,
    Object? voidReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodName: freezed == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      voidReason: freezed == voidReason
          ? _value.voidReason
          : voidReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoicePaymentRecordModelImplCopyWith<$Res>
    implements $InvoicePaymentRecordModelCopyWith<$Res> {
  factory _$$InvoicePaymentRecordModelImplCopyWith(
          _$InvoicePaymentRecordModelImpl value,
          $Res Function(_$InvoicePaymentRecordModelImpl) then) =
      __$$InvoicePaymentRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient) int? invoiceId,
      @JsonKey(
          readValue: _invoicePaymentRecordInvoiceNo,
          fromJson: _invoicePaymentRecordInvoiceNoValue)
      String? invoiceNo,
      @JsonKey(
          readValue: _invoicePaymentRecordParentName,
          fromJson: _invoicePaymentRecordParentNameValue)
      String? parentName,
      @JsonKey(fromJson: jsonDoubleLenient) double? amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) String? paidAt,
      @JsonKey(
          readValue: _invoicePaymentRecordPaymentMethodName,
          fromJson: _invoicePaymentRecordPaymentMethodNameValue)
      String? paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      String? referenceNo,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) String? voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      String? voidReason});
}

/// @nodoc
class __$$InvoicePaymentRecordModelImplCopyWithImpl<$Res>
    extends _$InvoicePaymentRecordModelCopyWithImpl<$Res,
        _$InvoicePaymentRecordModelImpl>
    implements _$$InvoicePaymentRecordModelImplCopyWith<$Res> {
  __$$InvoicePaymentRecordModelImplCopyWithImpl(
      _$InvoicePaymentRecordModelImpl _value,
      $Res Function(_$InvoicePaymentRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoicePaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoiceId = freezed,
    Object? invoiceNo = freezed,
    Object? parentName = freezed,
    Object? amount = freezed,
    Object? paidAt = freezed,
    Object? paymentMethodName = freezed,
    Object? referenceNo = freezed,
    Object? notes = freezed,
    Object? voidedAt = freezed,
    Object? voidReason = freezed,
  }) {
    return _then(_$InvoicePaymentRecordModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as int?,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodName: freezed == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNo: freezed == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      voidedAt: freezed == voidedAt
          ? _value.voidedAt
          : voidedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      voidReason: freezed == voidReason
          ? _value.voidReason
          : voidReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InvoicePaymentRecordModelImpl implements _InvoicePaymentRecordModel {
  const _$InvoicePaymentRecordModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient) this.invoiceId,
      @JsonKey(
          readValue: _invoicePaymentRecordInvoiceNo,
          fromJson: _invoicePaymentRecordInvoiceNoValue)
      this.invoiceNo,
      @JsonKey(
          readValue: _invoicePaymentRecordParentName,
          fromJson: _invoicePaymentRecordParentNameValue)
      this.parentName,
      @JsonKey(fromJson: jsonDoubleLenient) this.amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) this.paidAt,
      @JsonKey(
          readValue: _invoicePaymentRecordPaymentMethodName,
          fromJson: _invoicePaymentRecordPaymentMethodNameValue)
      this.paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      this.referenceNo,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient) this.voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      this.voidReason});

  factory _$InvoicePaymentRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoicePaymentRecordModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient)
  final int? invoiceId;
  @override
  @JsonKey(
      readValue: _invoicePaymentRecordInvoiceNo,
      fromJson: _invoicePaymentRecordInvoiceNoValue)
  final String? invoiceNo;
  @override
  @JsonKey(
      readValue: _invoicePaymentRecordParentName,
      fromJson: _invoicePaymentRecordParentNameValue)
  final String? parentName;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? amount;
  @override
  @JsonKey(name: 'paid_at', fromJson: jsonStringValue)
  final String? paidAt;
  @override
  @JsonKey(
      readValue: _invoicePaymentRecordPaymentMethodName,
      fromJson: _invoicePaymentRecordPaymentMethodNameValue)
  final String? paymentMethodName;
  @override
  @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
  final String? referenceNo;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  @override
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  final String? voidedAt;
  @override
  @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
  final String? voidReason;

  @override
  String toString() {
    return 'InvoicePaymentRecordModel(id: $id, invoiceId: $invoiceId, invoiceNo: $invoiceNo, parentName: $parentName, amount: $amount, paidAt: $paidAt, paymentMethodName: $paymentMethodName, referenceNo: $referenceNo, notes: $notes, voidedAt: $voidedAt, voidReason: $voidReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoicePaymentRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.paymentMethodName, paymentMethodName) ||
                other.paymentMethodName == paymentMethodName) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.voidedAt, voidedAt) ||
                other.voidedAt == voidedAt) &&
            (identical(other.voidReason, voidReason) ||
                other.voidReason == voidReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceId,
      invoiceNo,
      parentName,
      amount,
      paidAt,
      paymentMethodName,
      referenceNo,
      notes,
      voidedAt,
      voidReason);

  /// Create a copy of InvoicePaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoicePaymentRecordModelImplCopyWith<_$InvoicePaymentRecordModelImpl>
      get copyWith => __$$InvoicePaymentRecordModelImplCopyWithImpl<
          _$InvoicePaymentRecordModelImpl>(this, _$identity);
}

abstract class _InvoicePaymentRecordModel implements InvoicePaymentRecordModel {
  const factory _InvoicePaymentRecordModel(
      {@JsonKey(fromJson: jsonIntLenient) final int? id,
      @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient)
      final int? invoiceId,
      @JsonKey(
          readValue: _invoicePaymentRecordInvoiceNo,
          fromJson: _invoicePaymentRecordInvoiceNoValue)
      final String? invoiceNo,
      @JsonKey(
          readValue: _invoicePaymentRecordParentName,
          fromJson: _invoicePaymentRecordParentNameValue)
      final String? parentName,
      @JsonKey(fromJson: jsonDoubleLenient) final double? amount,
      @JsonKey(name: 'paid_at', fromJson: jsonStringValue) final String? paidAt,
      @JsonKey(
          readValue: _invoicePaymentRecordPaymentMethodName,
          fromJson: _invoicePaymentRecordPaymentMethodNameValue)
      final String? paymentMethodName,
      @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
      final String? referenceNo,
      @JsonKey(fromJson: jsonStringLenient) final String? notes,
      @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
      final String? voidedAt,
      @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
      final String? voidReason}) = _$InvoicePaymentRecordModelImpl;

  factory _InvoicePaymentRecordModel.fromJson(Map<String, dynamic> json) =
      _$InvoicePaymentRecordModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'invoice_id', fromJson: jsonIntLenient)
  int? get invoiceId;
  @override
  @JsonKey(
      readValue: _invoicePaymentRecordInvoiceNo,
      fromJson: _invoicePaymentRecordInvoiceNoValue)
  String? get invoiceNo;
  @override
  @JsonKey(
      readValue: _invoicePaymentRecordParentName,
      fromJson: _invoicePaymentRecordParentNameValue)
  String? get parentName;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get amount;
  @override
  @JsonKey(name: 'paid_at', fromJson: jsonStringValue)
  String? get paidAt;
  @override
  @JsonKey(
      readValue: _invoicePaymentRecordPaymentMethodName,
      fromJson: _invoicePaymentRecordPaymentMethodNameValue)
  String? get paymentMethodName;
  @override
  @JsonKey(name: 'reference_no', fromJson: jsonStringLenient)
  String? get referenceNo;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(name: 'voided_at', fromJson: jsonStringLenient)
  String? get voidedAt;
  @override
  @JsonKey(name: 'void_reason', fromJson: jsonStringLenient)
  String? get voidReason;

  /// Create a copy of InvoicePaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoicePaymentRecordModelImplCopyWith<_$InvoicePaymentRecordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) {
  return _InvoiceDetailModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetailModel {
  @JsonKey(fromJson: jsonIntLenient)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
  String? get invoiceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
  String? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
  String? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringValue)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  double? get paidTotal => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: _invoiceDetailParentName,
      fromJson: _invoiceDetailParentNameValue)
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<InvoiceItemRecordModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(readValue: readJsonList)
  List<InvoicePaymentRecordModel>? get payments =>
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
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) String? invoiceNo,
      @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
      String? invoiceType,
      @JsonKey(name: 'issue_date', fromJson: jsonStringValue) String? issueDate,
      @JsonKey(name: 'due_date', fromJson: jsonStringLenient) String? dueDate,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonDoubleLenient) double? subtotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? discount,
      @JsonKey(fromJson: jsonDoubleLenient) double? total,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
      double? paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(
          readValue: _invoiceDetailParentName,
          fromJson: _invoiceDetailParentNameValue)
      String? parentName,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonList) List<InvoiceItemRecordModel>? items,
      @JsonKey(readValue: readJsonList)
      List<InvoicePaymentRecordModel>? payments});
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
    Object? invoiceType = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? parentName = freezed,
    Object? notes = freezed,
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
      invoiceType: freezed == invoiceType
          ? _value.invoiceType
          : invoiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItemRecordModel>?,
      payments: freezed == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<InvoicePaymentRecordModel>?,
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
      {@JsonKey(fromJson: jsonIntLenient) int? id,
      @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) String? invoiceNo,
      @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
      String? invoiceType,
      @JsonKey(name: 'issue_date', fromJson: jsonStringValue) String? issueDate,
      @JsonKey(name: 'due_date', fromJson: jsonStringLenient) String? dueDate,
      @JsonKey(fromJson: jsonStringValue) String? status,
      @JsonKey(fromJson: jsonDoubleLenient) double? subtotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? discount,
      @JsonKey(fromJson: jsonDoubleLenient) double? total,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
      double? paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) double? balance,
      @JsonKey(
          readValue: _invoiceDetailParentName,
          fromJson: _invoiceDetailParentNameValue)
      String? parentName,
      @JsonKey(fromJson: jsonStringLenient) String? notes,
      @JsonKey(readValue: readJsonList) List<InvoiceItemRecordModel>? items,
      @JsonKey(readValue: readJsonList)
      List<InvoicePaymentRecordModel>? payments});
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
    Object? invoiceType = freezed,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? status = freezed,
    Object? subtotal = freezed,
    Object? discount = freezed,
    Object? total = freezed,
    Object? paidTotal = freezed,
    Object? balance = freezed,
    Object? parentName = freezed,
    Object? notes = freezed,
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
      invoiceType: freezed == invoiceType
          ? _value.invoiceType
          : invoiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItemRecordModel>?,
      payments: freezed == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<InvoicePaymentRecordModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InvoiceDetailModelImpl implements _InvoiceDetailModel {
  const _$InvoiceDetailModelImpl(
      {@JsonKey(fromJson: jsonIntLenient) this.id,
      @JsonKey(name: 'invoice_no', fromJson: jsonStringValue) this.invoiceNo,
      @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
      this.invoiceType,
      @JsonKey(name: 'issue_date', fromJson: jsonStringValue) this.issueDate,
      @JsonKey(name: 'due_date', fromJson: jsonStringLenient) this.dueDate,
      @JsonKey(fromJson: jsonStringValue) this.status,
      @JsonKey(fromJson: jsonDoubleLenient) this.subtotal,
      @JsonKey(fromJson: jsonDoubleLenient) this.discount,
      @JsonKey(fromJson: jsonDoubleLenient) this.total,
      @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient) this.paidTotal,
      @JsonKey(fromJson: jsonDoubleLenient) this.balance,
      @JsonKey(
          readValue: _invoiceDetailParentName,
          fromJson: _invoiceDetailParentNameValue)
      this.parentName,
      @JsonKey(fromJson: jsonStringLenient) this.notes,
      @JsonKey(readValue: readJsonList)
      final List<InvoiceItemRecordModel>? items,
      @JsonKey(readValue: readJsonList)
      final List<InvoicePaymentRecordModel>? payments})
      : _items = items,
        _payments = payments;

  factory _$InvoiceDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailModelImplFromJson(json);

  @override
  @JsonKey(fromJson: jsonIntLenient)
  final int? id;
  @override
  @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
  final String? invoiceNo;
  @override
  @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
  final String? invoiceType;
  @override
  @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
  final String? issueDate;
  @override
  @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
  final String? dueDate;
  @override
  @JsonKey(fromJson: jsonStringValue)
  final String? status;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? subtotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? discount;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? total;
  @override
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  final double? paidTotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  final double? balance;
  @override
  @JsonKey(
      readValue: _invoiceDetailParentName,
      fromJson: _invoiceDetailParentNameValue)
  final String? parentName;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  final String? notes;
  final List<InvoiceItemRecordModel>? _items;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoiceItemRecordModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<InvoicePaymentRecordModel>? _payments;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoicePaymentRecordModel>? get payments {
    final value = _payments;
    if (value == null) return null;
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InvoiceDetailModel(id: $id, invoiceNo: $invoiceNo, invoiceType: $invoiceType, issueDate: $issueDate, dueDate: $dueDate, status: $status, subtotal: $subtotal, discount: $discount, total: $total, paidTotal: $paidTotal, balance: $balance, parentName: $parentName, notes: $notes, items: $items, payments: $payments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.invoiceType, invoiceType) ||
                other.invoiceType == invoiceType) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paidTotal, paidTotal) ||
                other.paidTotal == paidTotal) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoiceNo,
      invoiceType,
      issueDate,
      dueDate,
      status,
      subtotal,
      discount,
      total,
      paidTotal,
      balance,
      parentName,
      notes,
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
          {@JsonKey(fromJson: jsonIntLenient) final int? id,
          @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
          final String? invoiceNo,
          @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
          final String? invoiceType,
          @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
          final String? issueDate,
          @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
          final String? dueDate,
          @JsonKey(fromJson: jsonStringValue) final String? status,
          @JsonKey(fromJson: jsonDoubleLenient) final double? subtotal,
          @JsonKey(fromJson: jsonDoubleLenient) final double? discount,
          @JsonKey(fromJson: jsonDoubleLenient) final double? total,
          @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
          final double? paidTotal,
          @JsonKey(fromJson: jsonDoubleLenient) final double? balance,
          @JsonKey(
              readValue: _invoiceDetailParentName,
              fromJson: _invoiceDetailParentNameValue)
          final String? parentName,
          @JsonKey(fromJson: jsonStringLenient) final String? notes,
          @JsonKey(readValue: readJsonList)
          final List<InvoiceItemRecordModel>? items,
          @JsonKey(readValue: readJsonList)
          final List<InvoicePaymentRecordModel>? payments}) =
      _$InvoiceDetailModelImpl;

  factory _InvoiceDetailModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailModelImpl.fromJson;

  @override
  @JsonKey(fromJson: jsonIntLenient)
  int? get id;
  @override
  @JsonKey(name: 'invoice_no', fromJson: jsonStringValue)
  String? get invoiceNo;
  @override
  @JsonKey(name: 'invoice_type', fromJson: jsonStringValue)
  String? get invoiceType;
  @override
  @JsonKey(name: 'issue_date', fromJson: jsonStringValue)
  String? get issueDate;
  @override
  @JsonKey(name: 'due_date', fromJson: jsonStringLenient)
  String? get dueDate;
  @override
  @JsonKey(fromJson: jsonStringValue)
  String? get status;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get subtotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get discount;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get total;
  @override
  @JsonKey(name: 'paid_total', fromJson: jsonDoubleLenient)
  double? get paidTotal;
  @override
  @JsonKey(fromJson: jsonDoubleLenient)
  double? get balance;
  @override
  @JsonKey(
      readValue: _invoiceDetailParentName,
      fromJson: _invoiceDetailParentNameValue)
  String? get parentName;
  @override
  @JsonKey(fromJson: jsonStringLenient)
  String? get notes;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoiceItemRecordModel>? get items;
  @override
  @JsonKey(readValue: readJsonList)
  List<InvoicePaymentRecordModel>? get payments;

  /// Create a copy of InvoiceDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceDetailModelImplCopyWith<_$InvoiceDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
