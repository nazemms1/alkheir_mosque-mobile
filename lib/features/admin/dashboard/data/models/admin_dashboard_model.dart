// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'admin_dashboard_model.freezed.dart';
part 'admin_dashboard_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.

Object? _adminGroupItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _adminGroupItemIdValue(Object? v) => v as int?;

Object? _adminGroupItemName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['name'] as String? ?? '').trim();
}

String? _adminGroupItemNameValue(Object? v) => v as String?;

Object? _adminGroupItemTeacher(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['teacher'] as String? ?? '').trim();
}

String? _adminGroupItemTeacherValue(Object? v) => v as String?;

Object? _adminGroupItemAssistantTeacher(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['assistant_teacher'] as String? ?? '').trim();
}

String? _adminGroupItemAssistantTeacherValue(Object? v) => v as String?;

Object? _adminGroupItemCourse(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['course'] as String? ?? '').trim();
}

String? _adminGroupItemCourseValue(Object? v) => v as String?;

Object? _adminGroupItemAcademicYear(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['academic_year'] as String? ?? '').trim();
}

String? _adminGroupItemAcademicYearValue(Object? v) => v as String?;

Object? _adminGroupItemEnrollmentsCount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['enrollments_count'] as int? ?? 0;
}

int? _adminGroupItemEnrollmentsCountValue(Object? v) => v as int?;

Object? _adminGroupItemIsActive(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['is_active'] as bool? ?? false;
}

bool? _adminGroupItemIsActiveValue(Object? v) => v as bool?;

Object? _adminGroupItemStartsOn(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['starts_on'] as String?;
}

String? _adminGroupItemStartsOnValue(Object? v) => v as String?;

Object? _adminGroupItemEndsOn(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['ends_on'] as String?;
}

String? _adminGroupItemEndsOnValue(Object? v) => v as String?;

Object? _adminStudentItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _adminStudentItemIdValue(Object? v) => v as int?;

Object? _adminStudentItemFullName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final first = (json['first_name'] as String? ?? '').trim();
  final last = (json['last_name'] as String? ?? '').trim();
  return '$first $last'.trim();
}

String? _adminStudentItemFullNameValue(Object? v) => v as String?;

Object? _adminStudentItemStudentNumber(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['student_number'] as String? ?? '';
}

String? _adminStudentItemStudentNumberValue(Object? v) => v as String?;

Object? _adminStudentItemGradeLevel(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['grade_level'] as String? ?? '';
}

String? _adminStudentItemGradeLevelValue(Object? v) => v as String?;

Object? _adminStudentItemParent(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['parent'] as String? ?? '').trim();
}

String? _adminStudentItemParentValue(Object? v) => v as String?;

Object? _adminStudentItemSchoolName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['school_name'] as String? ?? '').trim();
}

String? _adminStudentItemSchoolNameValue(Object? v) => v as String?;

Object? _adminStudentItemCurrentJuz(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['current_juz'] as int? ?? 1;
}

int? _adminStudentItemCurrentJuzValue(Object? v) => v as int?;

Object? _adminStudentItemStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? 'active';
}

String? _adminStudentItemStatusValue(Object? v) => v as String?;

Object? _adminStudentItemBirthDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['birth_date'] as String?;
}

String? _adminStudentItemBirthDateValue(Object? v) => v as String?;

Object? _adminStudentItemEnrollmentsCount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['enrollments_count'] as int? ?? 0;
}

int? _adminStudentItemEnrollmentsCountValue(Object? v) => v as int?;

Object? _adminStudentItemEnrollmentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['enrollment_id'] as int?;
}

int? _adminStudentItemEnrollmentIdValue(Object? v) => v as int?;

Object? _adminStudentItemAttendanceStatusId(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['attendance_status_id']?.toString();
}

String? _adminStudentItemAttendanceStatusIdValue(Object? v) => v as String?;

Object? _adminEnrollmentItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _adminEnrollmentItemIdValue(Object? v) => v as int?;

Object? _adminEnrollmentItemStudentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = json['student'] as Map<String, dynamic>? ?? {};
  return (student['full_name'] as String? ?? '').trim();
}

String? _adminEnrollmentItemStudentNameValue(Object? v) => v as String?;

Object? _adminEnrollmentItemStudentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = json['student'] as Map<String, dynamic>? ?? {};
  return student['id'] as int? ?? 0;
}

int? _adminEnrollmentItemStudentIdValue(Object? v) => v as int?;

Object? _adminEnrollmentItemParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = json['student'] as Map<String, dynamic>? ?? {};
  return student['parent_name'] as String?;
}

String? _adminEnrollmentItemParentNameValue(Object? v) => v as String?;

Object? _adminEnrollmentItemGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>? ?? {};
  return (group['name'] as String? ?? '').trim();
}

String? _adminEnrollmentItemGroupNameValue(Object? v) => v as String?;

Object? _adminEnrollmentItemGroupId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>? ?? {};
  return group['id'] as int? ?? 0;
}

int? _adminEnrollmentItemGroupIdValue(Object? v) => v as int?;

Object? _adminEnrollmentItemCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>? ?? {};
  return (group['course_name'] as String? ?? '').trim();
}

String? _adminEnrollmentItemCourseNameValue(Object? v) => v as String?;

Object? _adminEnrollmentItemFinalPoints(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['final_points'] as int? ?? 0;
}

int? _adminEnrollmentItemFinalPointsValue(Object? v) => v as int?;

Object? _adminEnrollmentItemMemorizedPages(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['memorized_pages'] as int? ?? 0;
}

int? _adminEnrollmentItemMemorizedPagesValue(Object? v) => v as int?;

Object? _adminEnrollmentItemStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? 'active';
}

String? _adminEnrollmentItemStatusValue(Object? v) => v as String?;

Object? _adminEnrollmentItemEnrolledAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['enrolled_at'] as String? ?? '';
}

String? _adminEnrollmentItemEnrolledAtValue(Object? v) => v as String?;

Object? _adminAssessmentItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _adminAssessmentItemIdValue(Object? v) => v as int?;

Object? _adminAssessmentItemTitle(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['title'] as String? ?? '').trim();
}

String? _adminAssessmentItemTitleValue(Object? v) => v as String?;

Object? _adminAssessmentItemType(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['type'] as String? ?? '').trim();
}

String? _adminAssessmentItemTypeValue(Object? v) => v as String?;

Object? _adminAssessmentItemDescription(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['description'] as String?;
}

String? _adminAssessmentItemDescriptionValue(Object? v) => v as String?;

Object? _adminAssessmentItemGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>? ?? {};
  return (group['name'] as String? ?? '').trim();
}

String? _adminAssessmentItemGroupNameValue(Object? v) => v as String?;

Object? _adminAssessmentItemGroupId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>? ?? {};
  return group['id'] as int? ?? 0;
}

int? _adminAssessmentItemGroupIdValue(Object? v) => v as int?;

Object? _adminAssessmentItemCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>? ?? {};
  return (group['course_name'] as String? ?? '').trim();
}

String? _adminAssessmentItemCourseNameValue(Object? v) => v as String?;

Object? _adminAssessmentItemTotalMark(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['total_mark'] as num? ?? 100).toDouble();
}

double? _adminAssessmentItemTotalMarkValue(Object? v) =>
    (v as num?)?.toDouble();

Object? _adminAssessmentItemPassMark(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['pass_mark'] as num? ?? 60).toDouble();
}

double? _adminAssessmentItemPassMarkValue(Object? v) => (v as num?)?.toDouble();

Object? _adminAssessmentItemResultsCount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['results_count'] as int? ?? 0;
}

int? _adminAssessmentItemResultsCountValue(Object? v) => v as int?;

Object? _adminAssessmentItemIsActive(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['is_active'] as bool? ?? false;
}

bool? _adminAssessmentItemIsActiveValue(Object? v) => v as bool?;

Object? _adminAssessmentItemScheduledAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['scheduled_at'] as String?;
}

String? _adminAssessmentItemScheduledAtValue(Object? v) => v as String?;

Object? _adminAssessmentItemDueAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['due_at'] as String?;
}

String? _adminAssessmentItemDueAtValue(Object? v) => v as String?;

Object? _adminInvoiceItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _adminInvoiceItemIdValue(Object? v) => v as int?;

Object? _adminInvoiceItemInvoiceNo(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['invoice_no'] as String? ?? '';
}

String? _adminInvoiceItemInvoiceNoValue(Object? v) => v as String?;

Object? _adminInvoiceItemInvoiceType(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['invoice_type'] as String? ?? 'finance';
}

String? _adminInvoiceItemInvoiceTypeValue(Object? v) => v as String?;

Object? _adminInvoiceItemParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['parent'] as String?;
}

String? _adminInvoiceItemParentNameValue(Object? v) => v as String?;

Object? _adminInvoiceItemTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['total'] as num? ?? 0).toDouble();
}

double? _adminInvoiceItemTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _adminInvoiceItemPaidTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['paid_total'] as num? ?? 0).toDouble();
}

double? _adminInvoiceItemPaidTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _adminInvoiceItemBalance(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['balance'] as num? ?? 0).toDouble();
}

double? _adminInvoiceItemBalanceValue(Object? v) => (v as num?)?.toDouble();

Object? _adminInvoiceItemDiscount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['discount'] as num? ?? 0).toDouble();
}

double? _adminInvoiceItemDiscountValue(Object? v) => (v as num?)?.toDouble();

Object? _adminInvoiceItemStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? 'issued';
}

String? _adminInvoiceItemStatusValue(Object? v) => v as String?;

Object? _adminInvoiceItemIssueDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['issue_date'] as String? ?? '';
}

String? _adminInvoiceItemIssueDateValue(Object? v) => v as String?;

Object? _adminInvoiceItemDueDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['due_date'] as String?;
}

String? _adminInvoiceItemDueDateValue(Object? v) => v as String?;

Object? _adminInvoiceItemItemsCount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['items_count'] as int? ?? 0;
}

int? _adminInvoiceItemItemsCountValue(Object? v) => v as int?;

Object? _adminStudentDetailId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _adminStudentDetailIdValue(Object? v) => v as int?;

Object? _adminStudentDetailFullName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final first = (json['first_name'] as String? ?? '').trim();
  final last = (json['last_name'] as String? ?? '').trim();
  return '$first $last'.trim();
}

String? _adminStudentDetailFullNameValue(Object? v) => v as String?;

Object? _adminStudentDetailStudentNumber(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['student_number'] as String? ?? '';
}

String? _adminStudentDetailStudentNumberValue(Object? v) => v as String?;

Object? _adminStudentDetailGradeLevel(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['grade_level'] as String? ?? '';
}

String? _adminStudentDetailGradeLevelValue(Object? v) => v as String?;

Object? _adminStudentDetailSchoolName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['school_name'] as String? ?? '').trim();
}

String? _adminStudentDetailSchoolNameValue(Object? v) => v as String?;

Object? _adminStudentDetailStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? 'active';
}

String? _adminStudentDetailStatusValue(Object? v) => v as String?;

Object? _adminStudentDetailBirthDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['birth_date'] as String?;
}

String? _adminStudentDetailBirthDateValue(Object? v) => v as String?;

Object? _adminStudentDetailCurrentJuz(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['current_juz'] as int? ?? 1;
}

int? _adminStudentDetailCurrentJuzValue(Object? v) => v as int?;

Object? _adminStudentDetailMemorizedPages(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['memorized_pages'] as int? ?? 0;
}

int? _adminStudentDetailMemorizedPagesValue(Object? v) => v as int?;

Object? _adminStudentDetailTotalPoints(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['total_points'] as int? ?? 0;
}

int? _adminStudentDetailTotalPointsValue(Object? v) => v as int?;

Object? _adminStudentDetailParentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['name'] as String? ?? json['parent_name'] as String? ?? '')
      .trim();
}

String? _adminStudentDetailParentNameValue(Object? v) => v as String?;

Object? _adminStudentDetailParentPhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['phone'] as String? ?? json['parent_phone'] as String? ?? '')
      .trim();
}

String? _adminStudentDetailParentPhoneValue(Object? v) => v as String?;

Object? _adminStudentDetailParentEmail(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['email'] as String? ?? json['parent_email'] as String? ?? '')
      .trim();
}

String? _adminStudentDetailParentEmailValue(Object? v) => v as String?;

Object? _adminStudentDetailFatherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['father_name'] as String? ??
          json['father_name'] as String? ??
          '')
      .trim();
}

String? _adminStudentDetailFatherNameValue(Object? v) => v as String?;

Object? _adminStudentDetailMotherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['mother_name'] as String? ??
          json['mother_name'] as String? ??
          '')
      .trim();
}

String? _adminStudentDetailMotherNameValue(Object? v) => v as String?;

Object? _adminActivityItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _adminActivityItemIdValue(Object? v) => v as int?;

Object? _adminActivityItemTitle(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['title'] as String? ?? '').trim();
}

String? _adminActivityItemTitleValue(Object? v) => v as String?;

Object? _adminActivityItemDescription(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['description'] as String?;
}

String? _adminActivityItemDescriptionValue(Object? v) => v as String?;

Object? _adminActivityItemActivityDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['activity_date'] as String?;
}

String? _adminActivityItemActivityDateValue(Object? v) => v as String?;

Object? _adminActivityItemGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  return group != null ? (group['name'] as String? ?? '').trim() : null;
}

String? _adminActivityItemGroupNameValue(Object? v) => v as String?;

Object? _adminActivityItemFeeAmount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['fee_amount'] as num? ?? 0).toDouble();
}

double? _adminActivityItemFeeAmountValue(Object? v) => (v as num?)?.toDouble();

Object? _adminActivityItemExpectedRevenue(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['expected_revenue'] as num? ?? 0).toDouble();
}

double? _adminActivityItemExpectedRevenueValue(Object? v) =>
    (v as num?)?.toDouble();

Object? _adminActivityItemCollectedRevenue(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['collected_revenue'] as num? ?? 0).toDouble();
}

double? _adminActivityItemCollectedRevenueValue(Object? v) =>
    (v as num?)?.toDouble();

Object? _adminActivityItemExpenseTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['expense_total'] as num? ?? 0).toDouble();
}

double? _adminActivityItemExpenseTotalValue(Object? v) =>
    (v as num?)?.toDouble();

Object? _adminActivityItemIsActive(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['is_active'] as bool? ?? false;
}

bool? _adminActivityItemIsActiveValue(Object? v) => v as bool?;

Object? _scanAttendanceResultAttendanceStatusId(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return '${json['attendance_status_id']}';
}

String? _scanAttendanceResultAttendanceStatusIdValue(Object? v) => v as String?;

Object? _scanAttendanceResultAttendanceStatusName(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['attendance_status_name'] as String? ?? '';
}

String? _scanAttendanceResultAttendanceStatusNameValue(Object? v) =>
    v as String?;

Object? _scanAttendanceResultEnrollmentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['enrollment_id'] as int;
}

int? _scanAttendanceResultEnrollmentIdValue(Object? v) => v as int?;

Object? _scanAttendanceResultStudentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['student_id'] as int;
}

int? _scanAttendanceResultStudentIdValue(Object? v) => v as int?;

Object? _scanAttendanceResultStudentName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['student_name'] as String? ?? '';
}

String? _scanAttendanceResultStudentNameValue(Object? v) => v as String?;

Object? _scanAttendanceResultGroupId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['group_id'] as int?;
}

int? _scanAttendanceResultGroupIdValue(Object? v) => v as int?;

Object? _scanAttendanceResultGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['group_name'] as String?;
}

String? _scanAttendanceResultGroupNameValue(Object? v) => v as String?;

@Freezed(toJson: false)
class AdminGroupItemModel with _$AdminGroupItemModel {
  const factory AdminGroupItemModel({
    @JsonKey(readValue: _adminGroupItemId, fromJson: _adminGroupItemIdValue)
    int? id,
    @JsonKey(readValue: _adminGroupItemName, fromJson: _adminGroupItemNameValue)
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
        readValue: _adminGroupItemCourse, fromJson: _adminGroupItemCourseValue)
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
        readValue: _adminGroupItemEndsOn, fromJson: _adminGroupItemEndsOnValue)
    String? endsOn,
  }) = _AdminGroupItemModel;

  factory AdminGroupItemModel.fromJson(Map<String, dynamic> json) =>
      _$AdminGroupItemModelFromJson(json);
}

@Freezed(toJson: false)
class AdminStudentItemModel with _$AdminStudentItemModel {
  const factory AdminStudentItemModel({
    @JsonKey(readValue: _adminStudentItemId, fromJson: _adminStudentItemIdValue)
    int? id,
    @JsonKey(
        readValue: _adminStudentItemFullName,
        fromJson: _adminStudentItemFullNameValue)
    String? fullName,
    @JsonKey(
        readValue: _adminStudentItemStudentNumber,
        fromJson: _adminStudentItemStudentNumberValue)
    String? studentNumber,
    @JsonKey(
        readValue: _adminStudentItemGradeLevel,
        fromJson: _adminStudentItemGradeLevelValue)
    String? gradeLevel,
    @JsonKey(
        readValue: _adminStudentItemParent,
        fromJson: _adminStudentItemParentValue)
    String? parent,
    @JsonKey(
        readValue: _adminStudentItemSchoolName,
        fromJson: _adminStudentItemSchoolNameValue)
    String? schoolName,
    @JsonKey(
        readValue: _adminStudentItemCurrentJuz,
        fromJson: _adminStudentItemCurrentJuzValue)
    int? currentJuz,
    @JsonKey(
        readValue: _adminStudentItemStatus,
        fromJson: _adminStudentItemStatusValue)
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
    String? attendanceStatusId,
  }) = _AdminStudentItemModel;

  factory AdminStudentItemModel.fromJson(Map<String, dynamic> json) =>
      _$AdminStudentItemModelFromJson(json);
}

@Freezed(toJson: false)
class AdminEnrollmentItemModel with _$AdminEnrollmentItemModel {
  const factory AdminEnrollmentItemModel({
    @JsonKey(
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
    String? enrolledAt,
  }) = _AdminEnrollmentItemModel;

  factory AdminEnrollmentItemModel.fromJson(Map<String, dynamic> json) =>
      _$AdminEnrollmentItemModelFromJson(json);
}

@Freezed(toJson: false)
class AdminAssessmentItemModel with _$AdminAssessmentItemModel {
  const factory AdminAssessmentItemModel({
    @JsonKey(
        readValue: _adminAssessmentItemId,
        fromJson: _adminAssessmentItemIdValue)
    int? id,
    @JsonKey(
        readValue: _adminAssessmentItemTitle,
        fromJson: _adminAssessmentItemTitleValue)
    String? title,
    @JsonKey(
        readValue: _adminAssessmentItemType,
        fromJson: _adminAssessmentItemTypeValue)
    String? type,
    @JsonKey(
        readValue: _adminAssessmentItemDescription,
        fromJson: _adminAssessmentItemDescriptionValue)
    String? description,
    @JsonKey(
        readValue: _adminAssessmentItemGroupName,
        fromJson: _adminAssessmentItemGroupNameValue)
    String? groupName,
    @JsonKey(
        readValue: _adminAssessmentItemGroupId,
        fromJson: _adminAssessmentItemGroupIdValue)
    int? groupId,
    @JsonKey(
        readValue: _adminAssessmentItemCourseName,
        fromJson: _adminAssessmentItemCourseNameValue)
    String? courseName,
    @JsonKey(
        readValue: _adminAssessmentItemTotalMark,
        fromJson: _adminAssessmentItemTotalMarkValue)
    double? totalMark,
    @JsonKey(
        readValue: _adminAssessmentItemPassMark,
        fromJson: _adminAssessmentItemPassMarkValue)
    double? passMark,
    @JsonKey(
        readValue: _adminAssessmentItemResultsCount,
        fromJson: _adminAssessmentItemResultsCountValue)
    int? resultsCount,
    @JsonKey(
        readValue: _adminAssessmentItemIsActive,
        fromJson: _adminAssessmentItemIsActiveValue)
    bool? isActive,
    @JsonKey(
        readValue: _adminAssessmentItemScheduledAt,
        fromJson: _adminAssessmentItemScheduledAtValue)
    String? scheduledAt,
    @JsonKey(
        readValue: _adminAssessmentItemDueAt,
        fromJson: _adminAssessmentItemDueAtValue)
    String? dueAt,
  }) = _AdminAssessmentItemModel;

  factory AdminAssessmentItemModel.fromJson(Map<String, dynamic> json) =>
      _$AdminAssessmentItemModelFromJson(json);
}

@Freezed(toJson: false)
class AdminInvoiceItemModel with _$AdminInvoiceItemModel {
  const factory AdminInvoiceItemModel({
    @JsonKey(readValue: _adminInvoiceItemId, fromJson: _adminInvoiceItemIdValue)
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
    @JsonKey(
        readValue: _adminInvoiceItemTotal,
        fromJson: _adminInvoiceItemTotalValue)
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
    int? itemsCount,
  }) = _AdminInvoiceItemModel;

  factory AdminInvoiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$AdminInvoiceItemModelFromJson(json);
}

@Freezed(toJson: false)
class AdminStudentDetailModel with _$AdminStudentDetailModel {
  const factory AdminStudentDetailModel({
    @JsonKey(
        readValue: _adminStudentDetailId, fromJson: _adminStudentDetailIdValue)
    int? id,
    @JsonKey(
        readValue: _adminStudentDetailFullName,
        fromJson: _adminStudentDetailFullNameValue)
    String? fullName,
    @JsonKey(
        readValue: _adminStudentDetailStudentNumber,
        fromJson: _adminStudentDetailStudentNumberValue)
    String? studentNumber,
    @JsonKey(
        readValue: _adminStudentDetailGradeLevel,
        fromJson: _adminStudentDetailGradeLevelValue)
    String? gradeLevel,
    @JsonKey(
        readValue: _adminStudentDetailSchoolName,
        fromJson: _adminStudentDetailSchoolNameValue)
    String? schoolName,
    @JsonKey(
        readValue: _adminStudentDetailStatus,
        fromJson: _adminStudentDetailStatusValue)
    String? status,
    @JsonKey(
        readValue: _adminStudentDetailBirthDate,
        fromJson: _adminStudentDetailBirthDateValue)
    String? birthDate,
    @JsonKey(
        readValue: _adminStudentDetailCurrentJuz,
        fromJson: _adminStudentDetailCurrentJuzValue)
    int? currentJuz,
    @JsonKey(
        readValue: _adminStudentDetailMemorizedPages,
        fromJson: _adminStudentDetailMemorizedPagesValue)
    int? memorizedPages,
    @JsonKey(
        readValue: _adminStudentDetailTotalPoints,
        fromJson: _adminStudentDetailTotalPointsValue)
    int? totalPoints,
    @JsonKey(
        readValue: _adminStudentDetailParentName,
        fromJson: _adminStudentDetailParentNameValue)
    String? parentName,
    @JsonKey(
        readValue: _adminStudentDetailParentPhone,
        fromJson: _adminStudentDetailParentPhoneValue)
    String? parentPhone,
    @JsonKey(
        readValue: _adminStudentDetailParentEmail,
        fromJson: _adminStudentDetailParentEmailValue)
    String? parentEmail,
    @JsonKey(
        readValue: _adminStudentDetailFatherName,
        fromJson: _adminStudentDetailFatherNameValue)
    String? fatherName,
    @JsonKey(
        readValue: _adminStudentDetailMotherName,
        fromJson: _adminStudentDetailMotherNameValue)
    String? motherName,
    @JsonKey(readValue: readJsonList)
    List<AdminEnrollmentItemModel>? enrollments,
  }) = _AdminStudentDetailModel;

  factory AdminStudentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AdminStudentDetailModelFromJson(json);
}

@Freezed(toJson: false)
class AdminActivityItemModel with _$AdminActivityItemModel {
  const factory AdminActivityItemModel({
    @JsonKey(
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
    bool? isActive,
  }) = _AdminActivityItemModel;

  factory AdminActivityItemModel.fromJson(Map<String, dynamic> json) =>
      _$AdminActivityItemModelFromJson(json);
}

@Freezed(toJson: false)
class ScanAttendanceResultModel with _$ScanAttendanceResultModel {
  const factory ScanAttendanceResultModel({
    @JsonKey(
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
    String? groupName,
  }) = _ScanAttendanceResultModel;

  factory ScanAttendanceResultModel.fromJson(Map<String, dynamic> json) =>
      _$ScanAttendanceResultModelFromJson(json);
}
