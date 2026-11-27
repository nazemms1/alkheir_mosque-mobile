// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

// Fields that need more than a lenient reader keep the exact parsing the app
// used before the freezed split, via readValue hooks.

Object? _attendanceEntryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _attendanceEntryIdValue(Object? v) => v as int?;

Object? _attendanceEntryDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return DateTime.parse(json['date'] as String);
}

DateTime? _attendanceEntryDateValue(Object? v) => v as DateTime?;

Object? _attendanceEntryDayStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['day_status'] as String? ?? '';
}

String? _attendanceEntryDayStatusValue(Object? v) => v as String?;

Object? _attendanceEntryStatusCode(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final status = json['status'] as Map<String, dynamic>?;
  return status?['code'] as String? ?? 'present';
}

String? _attendanceEntryStatusCodeValue(Object? v) => v as String?;

Object? _attendanceEntryStatusName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final status = json['status'] as Map<String, dynamic>?;
  return status?['name'] as String? ?? '';
}

String? _attendanceEntryStatusNameValue(Object? v) => v as String?;

Object? _attendanceEntryNotes(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['notes'] as String?;
}

String? _attendanceEntryNotesValue(Object? v) => v as String?;

Object? _attendanceEntryGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  return group?['name'] as String? ?? '';
}

String? _attendanceEntryGroupNameValue(Object? v) => v as String?;

Object? _attendanceEntryTeacherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = json['teacher'] as Map<String, dynamic>?;
  return teacher?['full_name'] as String? ?? '';
}

String? _attendanceEntryTeacherNameValue(Object? v) => v as String?;

Object? _memorizationEntryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _memorizationEntryIdValue(Object? v) => v as int?;

Object? _memorizationEntryDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return DateTime.parse(json['date'] as String);
}

DateTime? _memorizationEntryDateValue(Object? v) => v as DateTime?;

Object? _memorizationEntryEntryType(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['entry_type'] as String? ?? 'new';
}

String? _memorizationEntryEntryTypeValue(Object? v) => v as String?;

Object? _memorizationEntryFromPage(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['from_page'] as num?)?.toInt() ?? 0;
}

int? _memorizationEntryFromPageValue(Object? v) => v as int?;

Object? _memorizationEntryToPage(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['to_page'] as num?)?.toInt() ?? 0;
}

int? _memorizationEntryToPageValue(Object? v) => v as int?;

Object? _memorizationEntryPagesCount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['pages_count'] as num?)?.toInt() ?? 0;
}

int? _memorizationEntryPagesCountValue(Object? v) => v as int?;

Object? _memorizationEntryPages(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final pagesList = (json['pages'] as List<dynamic>?)
          ?.map((p) => (p as num).toInt())
          .toList() ??
      [];
  return pagesList;
}

List<int>? _memorizationEntryPagesValue(Object? v) => v as List<int>?;

Object? _memorizationEntryGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  return group?['name'] as String? ?? '';
}

String? _memorizationEntryGroupNameValue(Object? v) => v as String?;

Object? _memorizationEntryTeacherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = json['teacher'] as Map<String, dynamic>?;
  return teacher?['full_name'] as String? ?? '';
}

String? _memorizationEntryTeacherNameValue(Object? v) => v as String?;

Object? _memorizationEntryNotes(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['notes'] as String?;
}

String? _memorizationEntryNotesValue(Object? v) => v as String?;

Object? _parentUserId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _parentUserIdValue(Object? v) => v as int?;

Object? _parentUserName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['name'] as String? ?? '';
}

String? _parentUserNameValue(Object? v) => v as String?;

Object? _parentUserUsername(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['username'] as String? ?? '';
}

String? _parentUserUsernameValue(Object? v) => v as String?;

Object? _parentUserEmail(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['email'] as String? ?? '';
}

String? _parentUserEmailValue(Object? v) => v as String?;

Object? _parentUserPhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['phone'] as String? ?? '';
}

String? _parentUserPhoneValue(Object? v) => v as String?;

Object? _childSummaryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _childSummaryIdValue(Object? v) => v as int?;

Object? _childSummaryStudentNumber(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['student_number']?.toString() ?? '';
}

String? _childSummaryStudentNumberValue(Object? v) => v as String?;

Object? _childSummaryFullName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['full_name'] as String? ?? '';
}

String? _childSummaryFullNameValue(Object? v) => v as String?;

Object? _childSummaryFirstName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['first_name'] as String? ?? '';
}

String? _childSummaryFirstNameValue(Object? v) => v as String?;

Object? _childSummaryLastName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['last_name'] as String? ?? '';
}

String? _childSummaryLastNameValue(Object? v) => v as String?;

Object? _childSummaryStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _childSummaryStatusValue(Object? v) => v as String?;

Object? _childSummaryBirthDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['birth_date'] as String?;
}

String? _childSummaryBirthDateValue(Object? v) => v as String?;

Object? _childSummaryGender(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['gender'] as String? ?? '';
}

String? _childSummaryGenderValue(Object? v) => v as String?;

Object? _childSummaryGradeLevelName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final grade = json['grade_level'] as Map<String, dynamic>?;
  return grade?['name'] as String?;
}

String? _childSummaryGradeLevelNameValue(Object? v) => v as String?;

Object? _childSummaryQuranCurrentJuz(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final juz = json['quran_current_juz'] as Map<String, dynamic>?;
  return juz?['juz_number'] as int?;
}

int? _childSummaryQuranCurrentJuzValue(Object? v) => v as int?;

Object? _parentProfileId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _parentProfileIdValue(Object? v) => v as int?;

Object? _parentProfileParentNumber(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['parent_number'] as String? ?? '';
}

String? _parentProfileParentNumberValue(Object? v) => v as String?;

Object? _parentProfileFatherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['father_name'] as String? ?? '';
}

String? _parentProfileFatherNameValue(Object? v) => v as String?;

Object? _parentProfileFatherWork(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['father_work'] as String? ?? '';
}

String? _parentProfileFatherWorkValue(Object? v) => v as String?;

Object? _parentProfileFatherPhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['father_phone'] as String? ?? '';
}

String? _parentProfileFatherPhoneValue(Object? v) => v as String?;

Object? _parentProfileMotherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['mother_name'] as String? ?? '';
}

String? _parentProfileMotherNameValue(Object? v) => v as String?;

Object? _parentProfileMotherPhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['mother_phone'] as String? ?? '';
}

String? _parentProfileMotherPhoneValue(Object? v) => v as String?;

Object? _parentProfileHomePhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['home_phone'] as String? ?? '';
}

String? _parentProfileHomePhoneValue(Object? v) => v as String?;

Object? _parentProfileAddress(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['address'] as String? ?? '';
}

String? _parentProfileAddressValue(Object? v) => v as String?;

Object? _parentProfileIsActive(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['is_active'] as bool? ?? true;
}

bool? _parentProfileIsActiveValue(Object? v) => v as bool?;

Object? _parentProfileChildrenCount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['children_count'] as int? ?? 0;
}

int? _parentProfileChildrenCountValue(Object? v) => v as int?;

Object? _parentSummaryChildren(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['children'] as int? ?? 0;
}

int? _parentSummaryChildrenValue(Object? v) => v as int?;

Object? _parentSummaryActiveEnrollments(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['active_enrollments'] as int? ?? 0;
}

int? _parentSummaryActiveEnrollmentsValue(Object? v) => v as int?;

Object? _parentSummaryMemorizedPages(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['memorized_pages'] as int? ?? 0;
}

int? _parentSummaryMemorizedPagesValue(Object? v) => v as int?;

Object? _parentSummaryPoints(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['points'] as int? ?? 0;
}

int? _parentSummaryPointsValue(Object? v) => v as int?;

Object? _parentSummaryInvoiceTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['invoice_total'] as num?)?.toDouble() ?? 0;
}

double? _parentSummaryInvoiceTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _parentSummaryPaidTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['paid_total'] as num?)?.toDouble() ?? 0;
}

double? _parentSummaryPaidTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _parentSummaryBalance(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['balance'] as num?)?.toDouble() ?? 0;
}

double? _parentSummaryBalanceValue(Object? v) => (v as num?)?.toDouble();

Object? _parentSummaryUnreadNotes(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['unread_notes'] as int? ?? 0;
}

int? _parentSummaryUnreadNotesValue(Object? v) => v as int?;

Object? _parentSummaryAvailableActivityResponses(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['available_activity_responses'] as int? ?? 0;
}

int? _parentSummaryAvailableActivityResponsesValue(Object? v) => v as int?;

Object? _activityChildEligibilityStudentId(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = json['student'] as Map<String, dynamic>? ?? json;
  return (student['id'] as num).toInt();
}

int? _activityChildEligibilityStudentIdValue(Object? v) => v as int?;

Object? _activityChildEligibilityStudentName(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final student = json['student'] as Map<String, dynamic>? ?? json;
  return student['full_name'] as String? ?? '';
}

String? _activityChildEligibilityStudentNameValue(Object? v) => v as String?;

Object? _activityChildEligibilityResponseStatus(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['response_status'] as String?;
}

String? _activityChildEligibilityResponseStatusValue(Object? v) => v as String?;

Object? _activityChildEligibilityCanRespond(
    Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['can_respond'] as bool? ?? true;
}

bool? _activityChildEligibilityCanRespondValue(Object? v) => v as bool?;

Object? _parentActivityId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _parentActivityIdValue(Object? v) => v as int?;

Object? _parentActivityTitle(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['title'] as String? ?? '';
}

String? _parentActivityTitleValue(Object? v) => v as String?;

Object? _parentActivityDescription(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['description'] as String?;
}

String? _parentActivityDescriptionValue(Object? v) => v as String?;

Object? _parentActivityActivityDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['activity_date'] != null
      ? DateTime.tryParse(json['activity_date'] as String)
      : null;
}

DateTime? _parentActivityActivityDateValue(Object? v) => v as DateTime?;

Object? _parentActivityFeeAmount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['fee_amount'] as num?)?.toDouble() ?? 0;
}

double? _parentActivityFeeAmountValue(Object? v) => (v as num?)?.toDouble();

Object? _parentActivityIsActive(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['is_active'] as bool? ?? true;
}

bool? _parentActivityIsActiveValue(Object? v) => v as bool?;

Object? _parentActivityGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  return group?['name'] as String?;
}

String? _parentActivityGroupNameValue(Object? v) => v as String?;

Object? _invoiceListItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _invoiceListItemIdValue(Object? v) => v as int?;

Object? _invoiceListItemInvoiceNo(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['invoice_no'] as String? ?? '';
}

String? _invoiceListItemInvoiceNoValue(Object? v) => v as String?;

Object? _invoiceListItemStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _invoiceListItemStatusValue(Object? v) => v as String?;

Object? _invoiceListItemIssueDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['issue_date'] as String? ?? '';
}

String? _invoiceListItemIssueDateValue(Object? v) => v as String?;

Object? _invoiceListItemDueDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['due_date'] as String?;
}

String? _invoiceListItemDueDateValue(Object? v) => v as String?;

Object? _invoiceListItemTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['total'] as num?)?.toDouble() ?? 0;
}

double? _invoiceListItemTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceListItemPaidTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['paid_total'] as num?)?.toDouble() ?? 0;
}

double? _invoiceListItemPaidTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceListItemBalance(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['balance'] as num?)?.toDouble() ?? 0;
}

double? _invoiceListItemBalanceValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceLineItemId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _invoiceLineItemIdValue(Object? v) => v as int?;

Object? _invoiceLineItemDescription(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['description'] as String? ?? '';
}

String? _invoiceLineItemDescriptionValue(Object? v) => v as String?;

Object? _invoiceLineItemQuantity(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['quantity'] as num?)?.toDouble() ?? 1;
}

double? _invoiceLineItemQuantityValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceLineItemUnitPrice(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['unit_price'] as num?)?.toDouble() ?? 0;
}

double? _invoiceLineItemUnitPriceValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceLineItemLineTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['line_total'] as num?)?.toDouble() ?? 0;
}

double? _invoiceLineItemLineTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _invoicePaymentEntryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _invoicePaymentEntryIdValue(Object? v) => v as int?;

Object? _invoicePaymentEntryAmount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['amount'] as num?)?.toDouble() ?? 0;
}

double? _invoicePaymentEntryAmountValue(Object? v) => (v as num?)?.toDouble();

Object? _invoicePaymentEntryPaidAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['paid_at'] as String? ?? '';
}

String? _invoicePaymentEntryPaidAtValue(Object? v) => v as String?;

Object? _invoicePaymentEntryReferenceNo(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['reference_no'] as String?;
}

String? _invoicePaymentEntryReferenceNoValue(Object? v) => v as String?;

Object? _invoicePaymentEntryMethodName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final method = json['method'] as Map<String, dynamic>?;
  return method?['name'] as String?;
}

String? _invoicePaymentEntryMethodNameValue(Object? v) => v as String?;

Object? _invoicePaymentEntryIsVoided(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['voided_at'] != null;
}

bool? _invoicePaymentEntryIsVoidedValue(Object? v) => v as bool?;

Object? _invoiceDetailId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _invoiceDetailIdValue(Object? v) => v as int?;

Object? _invoiceDetailInvoiceNo(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['invoice_no'] as String? ?? '';
}

String? _invoiceDetailInvoiceNoValue(Object? v) => v as String?;

Object? _invoiceDetailStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _invoiceDetailStatusValue(Object? v) => v as String?;

Object? _invoiceDetailIssueDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['issue_date'] as String? ?? '';
}

String? _invoiceDetailIssueDateValue(Object? v) => v as String?;

Object? _invoiceDetailDueDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['due_date'] as String?;
}

String? _invoiceDetailDueDateValue(Object? v) => v as String?;

Object? _invoiceDetailSubtotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['subtotal'] as num?)?.toDouble() ?? 0;
}

double? _invoiceDetailSubtotalValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceDetailDiscount(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['discount'] as num?)?.toDouble() ?? 0;
}

double? _invoiceDetailDiscountValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceDetailTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['total'] as num?)?.toDouble() ?? 0;
}

double? _invoiceDetailTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceDetailPaidTotal(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['paid_total'] as num?)?.toDouble() ?? 0;
}

double? _invoiceDetailPaidTotalValue(Object? v) => (v as num?)?.toDouble();

Object? _invoiceDetailBalance(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['balance'] as num?)?.toDouble() ?? 0;
}

double? _invoiceDetailBalanceValue(Object? v) => (v as num?)?.toDouble();

Object? _studentParentInfoFatherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['father_name'] as String? ??
          json['parent_name'] as String? ??
          '')
      .trim();
}

String? _studentParentInfoFatherNameValue(Object? v) => v as String?;

Object? _studentParentInfoMotherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['mother_name'] as String? ?? '').trim();
}

String? _studentParentInfoMotherNameValue(Object? v) => v as String?;

Object? _studentParentInfoFatherPhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['father_phone'] as String? ?? parent['phone'] as String? ?? '')
      .trim();
}

String? _studentParentInfoFatherPhoneValue(Object? v) => v as String?;

Object? _studentParentInfoMotherPhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['mother_phone'] as String? ?? '').trim();
}

String? _studentParentInfoMotherPhoneValue(Object? v) => v as String?;

Object? _studentParentInfoHomePhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['home_phone'] as String? ?? '').trim();
}

String? _studentParentInfoHomePhoneValue(Object? v) => v as String?;

Object? _studentParentInfoAddress(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['address'] as String? ?? '').trim();
}

String? _studentParentInfoAddressValue(Object? v) => v as String?;

Object? _studentParentInfoEmail(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final parent = json['parent'] as Map<String, dynamic>? ?? {};
  return (parent['email'] as String? ?? '').trim();
}

String? _studentParentInfoEmailValue(Object? v) => v as String?;

Object? _enrollmentGroupId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _enrollmentGroupIdValue(Object? v) => v as int?;

Object? _enrollmentGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['name'] as String? ?? '';
}

String? _enrollmentGroupNameValue(Object? v) => v as String?;

Object? _enrollmentGroupCourseName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final course = json['course'] as Map<String, dynamic>?;
  return course?['name'] as String? ?? '';
}

String? _enrollmentGroupCourseNameValue(Object? v) => v as String?;

Object? _enrollmentGroupTeacherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = json['teacher'] as Map<String, dynamic>?;
  return teacher?['full_name'] as String? ?? '';
}

String? _enrollmentGroupTeacherNameValue(Object? v) => v as String?;

Object? _enrollmentGroupTeacherPhone(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = json['teacher'] as Map<String, dynamic>?;
  return teacher?['phone'] as String? ?? '';
}

String? _enrollmentGroupTeacherPhoneValue(Object? v) => v as String?;

Object? _activeEnrollmentId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _activeEnrollmentIdValue(Object? v) => v as int?;

Object? _activeEnrollmentStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _activeEnrollmentStatusValue(Object? v) => v as String?;

Object? _activeEnrollmentEnrolledAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['enrolled_at'] as String? ?? '';
}

String? _activeEnrollmentEnrolledAtValue(Object? v) => v as String?;

Object? _activeEnrollmentLeftAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['left_at'] as String?;
}

String? _activeEnrollmentLeftAtValue(Object? v) => v as String?;

Object? _activeEnrollmentMemorizedPages(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['memorized_pages'] as num?)?.toInt() ?? 0;
}

int? _activeEnrollmentMemorizedPagesValue(Object? v) => v as int?;

Object? _activeEnrollmentPoints(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['points'] as num?)?.toInt() ?? 0;
}

int? _activeEnrollmentPointsValue(Object? v) => v as int?;

Object? _childDetailId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _childDetailIdValue(Object? v) => v as int?;

Object? _childDetailStudentNumber(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['student_number']?.toString() ?? '';
}

String? _childDetailStudentNumberValue(Object? v) => v as String?;

Object? _childDetailFullName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['full_name'] as String? ?? '';
}

String? _childDetailFullNameValue(Object? v) => v as String?;

Object? _childDetailFirstName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['first_name'] as String? ?? '';
}

String? _childDetailFirstNameValue(Object? v) => v as String?;

Object? _childDetailLastName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['last_name'] as String? ?? '';
}

String? _childDetailLastNameValue(Object? v) => v as String?;

Object? _childDetailStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _childDetailStatusValue(Object? v) => v as String?;

Object? _childDetailBirthDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['birth_date'] as String?;
}

String? _childDetailBirthDateValue(Object? v) => v as String?;

Object? _childDetailGender(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['gender'] as String? ?? '';
}

String? _childDetailGenderValue(Object? v) => v as String?;

Object? _childDetailGradeLevelName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final grade = json['grade_level'] as Map<String, dynamic>?;
  return grade?['name'] as String?;
}

String? _childDetailGradeLevelNameValue(Object? v) => v as String?;

Object? _childDetailQuranCurrentJuz(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final juz = json['quran_current_juz'] as Map<String, dynamic>?;
  return juz?['juz_number'] as int?;
}

int? _childDetailQuranCurrentJuzValue(Object? v) => v as int?;

Object? _childDetailSchoolName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['school_name'] as String?;
}

String? _childDetailSchoolNameValue(Object? v) => v as String?;

Object? _childDetailJoinedAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['joined_at'] as String?;
}

String? _childDetailJoinedAtValue(Object? v) => v as String?;

Object? _childDetailMemorizedPages(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['memorized_pages'] as num?)?.toInt() ?? 0;
}

int? _childDetailMemorizedPagesValue(Object? v) => v as int?;

Object? _childDetailPoints(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['points'] as num?)?.toInt() ?? 0;
}

int? _childDetailPointsValue(Object? v) => v as int?;

Object? _quranTestAttemptId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _quranTestAttemptIdValue(Object? v) => v as int?;

Object? _quranTestAttemptTestedOn(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return DateTime.parse(json['tested_on'] as String);
}

DateTime? _quranTestAttemptTestedOnValue(Object? v) => v as DateTime?;

Object? _quranTestAttemptScore(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['score'] as num?)?.toDouble();
}

double? _quranTestAttemptScoreValue(Object? v) => (v as num?)?.toDouble();

Object? _quranTestAttemptStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _quranTestAttemptStatusValue(Object? v) => v as String?;

Object? _quranTestAttemptAttemptNo(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['attempt_no'] as int? ?? 1;
}

int? _quranTestAttemptAttemptNoValue(Object? v) => v as int?;

Object? _quranTestAttemptTeacherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = json['teacher'] as Map<String, dynamic>?;
  return teacher?['full_name'] as String? ?? '';
}

String? _quranTestAttemptTeacherNameValue(Object? v) => v as String?;

Object? _quranTestAttemptNotes(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['notes'] as String?;
}

String? _quranTestAttemptNotesValue(Object? v) => v as String?;

Object? _quranTestPartId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _quranTestPartIdValue(Object? v) => v as int?;

Object? _quranTestPartPartNumber(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['part_number'] as int? ?? 1;
}

int? _quranTestPartPartNumberValue(Object? v) => v as int?;

Object? _quranTestPartStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _quranTestPartStatusValue(Object? v) => v as String?;

Object? _quranTestPartPassedOn(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['passed_on'] as String?;
}

String? _quranTestPartPassedOnValue(Object? v) => v as String?;

Object? _quranTestEntryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _quranTestEntryIdValue(Object? v) => v as int?;

Object? _quranTestEntryKind(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['kind'] as String? ?? 'final';
}

String? _quranTestEntryKindValue(Object? v) => v as String?;

Object? _quranTestEntryDate(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return DateTime.parse(json['date'] as String);
}

DateTime? _quranTestEntryDateValue(Object? v) => v as DateTime?;

Object? _quranTestEntryStatus(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['status'] as String? ?? '';
}

String? _quranTestEntryStatusValue(Object? v) => v as String?;

Object? _quranTestEntryJuzNumber(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final juz = json['juz'] as Map<String, dynamic>?;
  return juz?['juz_number'] as int? ?? 0;
}

int? _quranTestEntryJuzNumberValue(Object? v) => v as int?;

Object? _quranTestEntryJuzFromPage(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final juz = json['juz'] as Map<String, dynamic>?;
  return juz?['from_page'] as int? ?? 0;
}

int? _quranTestEntryJuzFromPageValue(Object? v) => v as int?;

Object? _quranTestEntryJuzToPage(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final juz = json['juz'] as Map<String, dynamic>?;
  return juz?['to_page'] as int? ?? 0;
}

int? _quranTestEntryJuzToPageValue(Object? v) => v as int?;

Object? _quranTestEntryGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  return group?['name'] as String? ?? '';
}

String? _quranTestEntryGroupNameValue(Object? v) => v as String?;

Object? _quranTestEntryTeacherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  final teacher = group?['teacher'] as Map<String, dynamic>?;
  return teacher?['full_name'] as String? ?? '';
}

String? _quranTestEntryTeacherNameValue(Object? v) => v as String?;

Object? _noteEntryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _noteEntryIdValue(Object? v) => v as int?;

Object? _noteEntrySource(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['source'] as String? ?? 'teacher';
}

String? _noteEntrySourceValue(Object? v) => v as String?;

Object? _noteEntryNotedAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return DateTime.parse(json['noted_at'] as String);
}

DateTime? _noteEntryNotedAtValue(Object? v) => v as DateTime?;

Object? _noteEntryBody(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['body'] as String? ?? '';
}

String? _noteEntryBodyValue(Object? v) => v as String?;

Object? _noteEntryGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  return group?['name'] as String?;
}

String? _noteEntryGroupNameValue(Object? v) => v as String?;

Object? _noteEntryAuthorId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final author = json['author'] as Map<String, dynamic>?;
  return author?['id'] as int? ?? 0;
}

int? _noteEntryAuthorIdValue(Object? v) => v as int?;

Object? _noteEntryAuthorName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final author = json['author'] as Map<String, dynamic>?;
  return author?['name'] as String? ?? '';
}

String? _noteEntryAuthorNameValue(Object? v) => v as String?;

Object? _pointEntryId(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['id'] as int;
}

int? _pointEntryIdValue(Object? v) => v as int?;

Object? _pointEntryEnteredAt(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return DateTime.parse(json['entered_at'] as String);
}

DateTime? _pointEntryEnteredAtValue(Object? v) => v as DateTime?;

Object? _pointEntryPoints(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return (json['points'] as num).toInt();
}

int? _pointEntryPointsValue(Object? v) => v as int?;

Object? _pointEntrySourceType(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['source_type'] as String? ?? '';
}

String? _pointEntrySourceTypeValue(Object? v) => v as String?;

Object? _pointEntryPointTypeCode(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final pt = json['point_type'] as Map<String, dynamic>?;
  return pt?['code'] as String? ?? '';
}

String? _pointEntryPointTypeCodeValue(Object? v) => v as String?;

Object? _pointEntryPointTypeName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final pt = json['point_type'] as Map<String, dynamic>?;
  return pt?['name'] as String? ?? '';
}

String? _pointEntryPointTypeNameValue(Object? v) => v as String?;

Object? _pointEntryPointTypeCategory(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final pt = json['point_type'] as Map<String, dynamic>?;
  return pt?['category'] as String? ?? '';
}

String? _pointEntryPointTypeCategoryValue(Object? v) => v as String?;

Object? _pointEntryPolicyName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final policy = json['policy'] as Map<String, dynamic>?;
  return policy?['name'] as String?;
}

String? _pointEntryPolicyNameValue(Object? v) => v as String?;

Object? _pointEntryGroupName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final group = json['group'] as Map<String, dynamic>?;
  return group?['name'] as String? ?? '';
}

String? _pointEntryGroupNameValue(Object? v) => v as String?;

Object? _pointEntryTeacherName(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  final teacher = json['teacher'] as Map<String, dynamic>?;
  return teacher?['full_name'] as String? ?? '';
}

String? _pointEntryTeacherNameValue(Object? v) => v as String?;

Object? _pointEntryNotes(Map<dynamic, dynamic> raw, String _) {
  final json = raw.cast<String, dynamic>();
  return json['notes'] as String?;
}

String? _pointEntryNotesValue(Object? v) => v as String?;

@Freezed(toJson: false)
class AttendanceEntryModel with _$AttendanceEntryModel {
  const factory AttendanceEntryModel({
    @JsonKey(readValue: _attendanceEntryId, fromJson: _attendanceEntryIdValue)
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
        readValue: _attendanceEntryNotes, fromJson: _attendanceEntryNotesValue)
    String? notes,
    @JsonKey(
        readValue: _attendanceEntryGroupName,
        fromJson: _attendanceEntryGroupNameValue)
    String? groupName,
    @JsonKey(
        readValue: _attendanceEntryTeacherName,
        fromJson: _attendanceEntryTeacherNameValue)
    String? teacherName,
  }) = _AttendanceEntryModel;

  factory AttendanceEntryModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceEntryModelFromJson(json);
}

@Freezed(toJson: false)
class MemorizationEntryModel with _$MemorizationEntryModel {
  const factory MemorizationEntryModel({
    @JsonKey(
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
    String? notes,
  }) = _MemorizationEntryModel;

  factory MemorizationEntryModel.fromJson(Map<String, dynamic> json) =>
      _$MemorizationEntryModelFromJson(json);
}

@Freezed(toJson: false)
class ParentUserModel with _$ParentUserModel {
  const factory ParentUserModel({
    @JsonKey(readValue: _parentUserId, fromJson: _parentUserIdValue) int? id,
    @JsonKey(readValue: _parentUserName, fromJson: _parentUserNameValue)
    String? name,
    @JsonKey(readValue: _parentUserUsername, fromJson: _parentUserUsernameValue)
    String? username,
    @JsonKey(readValue: _parentUserEmail, fromJson: _parentUserEmailValue)
    String? email,
    @JsonKey(readValue: _parentUserPhone, fromJson: _parentUserPhoneValue)
    String? phone,
  }) = _ParentUserModel;

  factory ParentUserModel.fromJson(Map<String, dynamic> json) =>
      _$ParentUserModelFromJson(json);
}

@Freezed(toJson: false)
class ChildSummaryModel with _$ChildSummaryModel {
  const factory ChildSummaryModel({
    @JsonKey(readValue: _childSummaryId, fromJson: _childSummaryIdValue)
    int? id,
    @JsonKey(
        readValue: _childSummaryStudentNumber,
        fromJson: _childSummaryStudentNumberValue)
    String? studentNumber,
    @JsonKey(
        readValue: _childSummaryFullName, fromJson: _childSummaryFullNameValue)
    String? fullName,
    @JsonKey(
        readValue: _childSummaryFirstName,
        fromJson: _childSummaryFirstNameValue)
    String? firstName,
    @JsonKey(
        readValue: _childSummaryLastName, fromJson: _childSummaryLastNameValue)
    String? lastName,
    @JsonKey(readValue: _childSummaryStatus, fromJson: _childSummaryStatusValue)
    String? status,
    @JsonKey(
        readValue: _childSummaryBirthDate,
        fromJson: _childSummaryBirthDateValue)
    String? birthDate,
    @JsonKey(readValue: _childSummaryGender, fromJson: _childSummaryGenderValue)
    String? gender,
    @JsonKey(
        readValue: _childSummaryGradeLevelName,
        fromJson: _childSummaryGradeLevelNameValue)
    String? gradeLevelName,
    @JsonKey(
        readValue: _childSummaryQuranCurrentJuz,
        fromJson: _childSummaryQuranCurrentJuzValue)
    int? quranCurrentJuz,
  }) = _ChildSummaryModel;

  factory ChildSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ChildSummaryModelFromJson(json);
}

@Freezed(toJson: false)
class ParentProfileModel with _$ParentProfileModel {
  const factory ParentProfileModel({
    @JsonKey(readValue: _parentProfileId, fromJson: _parentProfileIdValue)
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
        readValue: _parentProfileAddress, fromJson: _parentProfileAddressValue)
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
    @JsonKey(readValue: readJsonList) List<ChildSummaryModel>? children,
  }) = _ParentProfileModel;

  factory ParentProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ParentProfileModelFromJson(json);
}

@Freezed(toJson: false)
class ParentSummaryModel with _$ParentSummaryModel {
  const factory ParentSummaryModel({
    @JsonKey(
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
        readValue: _parentSummaryBalance, fromJson: _parentSummaryBalanceValue)
    double? balance,
    @JsonKey(
        readValue: _parentSummaryUnreadNotes,
        fromJson: _parentSummaryUnreadNotesValue)
    int? unreadNotes,
    @JsonKey(
        readValue: _parentSummaryAvailableActivityResponses,
        fromJson: _parentSummaryAvailableActivityResponsesValue)
    int? availableActivityResponses,
  }) = _ParentSummaryModel;

  factory ParentSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ParentSummaryModelFromJson(json);
}

@Freezed(toJson: false)
class ActivityChildEligibilityModel with _$ActivityChildEligibilityModel {
  const factory ActivityChildEligibilityModel({
    @JsonKey(
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
    bool? canRespond,
  }) = _ActivityChildEligibilityModel;

  factory ActivityChildEligibilityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityChildEligibilityModelFromJson(json);
}

@Freezed(toJson: false)
class ParentActivityModel with _$ParentActivityModel {
  const factory ParentActivityModel({
    @JsonKey(readValue: _parentActivityId, fromJson: _parentActivityIdValue)
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
    List<ActivityChildEligibilityModel>? children,
  }) = _ParentActivityModel;

  factory ParentActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ParentActivityModelFromJson(json);
}

@Freezed(toJson: false)
class InvoiceListItemModel with _$InvoiceListItemModel {
  const factory InvoiceListItemModel({
    @JsonKey(readValue: _invoiceListItemId, fromJson: _invoiceListItemIdValue)
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
        readValue: _invoiceListItemTotal, fromJson: _invoiceListItemTotalValue)
    double? total,
    @JsonKey(
        readValue: _invoiceListItemPaidTotal,
        fromJson: _invoiceListItemPaidTotalValue)
    double? paidTotal,
    @JsonKey(
        readValue: _invoiceListItemBalance,
        fromJson: _invoiceListItemBalanceValue)
    double? balance,
  }) = _InvoiceListItemModel;

  factory InvoiceListItemModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceListItemModelFromJson(json);
}

@Freezed(toJson: false)
class InvoiceLineItemModel with _$InvoiceLineItemModel {
  const factory InvoiceLineItemModel({
    @JsonKey(readValue: _invoiceLineItemId, fromJson: _invoiceLineItemIdValue)
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
    double? lineTotal,
  }) = _InvoiceLineItemModel;

  factory InvoiceLineItemModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemModelFromJson(json);
}

@Freezed(toJson: false)
class InvoicePaymentEntryModel with _$InvoicePaymentEntryModel {
  const factory InvoicePaymentEntryModel({
    @JsonKey(
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
    bool? isVoided,
  }) = _InvoicePaymentEntryModel;

  factory InvoicePaymentEntryModel.fromJson(Map<String, dynamic> json) =>
      _$InvoicePaymentEntryModelFromJson(json);
}

@Freezed(toJson: false)
class InvoiceDetailModel with _$InvoiceDetailModel {
  const factory InvoiceDetailModel({
    @JsonKey(readValue: _invoiceDetailId, fromJson: _invoiceDetailIdValue)
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
        readValue: _invoiceDetailDueDate, fromJson: _invoiceDetailDueDateValue)
    String? dueDate,
    @JsonKey(
        readValue: _invoiceDetailSubtotal,
        fromJson: _invoiceDetailSubtotalValue)
    double? subtotal,
    @JsonKey(
        readValue: _invoiceDetailDiscount,
        fromJson: _invoiceDetailDiscountValue)
    double? discount,
    @JsonKey(readValue: _invoiceDetailTotal, fromJson: _invoiceDetailTotalValue)
    double? total,
    @JsonKey(
        readValue: _invoiceDetailPaidTotal,
        fromJson: _invoiceDetailPaidTotalValue)
    double? paidTotal,
    @JsonKey(
        readValue: _invoiceDetailBalance, fromJson: _invoiceDetailBalanceValue)
    double? balance,
    @JsonKey(readValue: readJsonList) List<InvoiceLineItemModel>? items,
    @JsonKey(readValue: readJsonList) List<InvoicePaymentEntryModel>? payments,
  }) = _InvoiceDetailModel;

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailModelFromJson(json);
}

@Freezed(toJson: false)
class StudentParentInfoModel with _$StudentParentInfoModel {
  const factory StudentParentInfoModel({
    @JsonKey(
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
    String? email,
  }) = _StudentParentInfoModel;

  factory StudentParentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$StudentParentInfoModelFromJson(json);
}

@Freezed(toJson: false)
class EnrollmentGroupModel with _$EnrollmentGroupModel {
  const factory EnrollmentGroupModel({
    @JsonKey(readValue: _enrollmentGroupId, fromJson: _enrollmentGroupIdValue)
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
    String? teacherPhone,
  }) = _EnrollmentGroupModel;

  factory EnrollmentGroupModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentGroupModelFromJson(json);
}

@Freezed(toJson: false)
class ActiveEnrollmentModel with _$ActiveEnrollmentModel {
  const factory ActiveEnrollmentModel({
    @JsonKey(readValue: _activeEnrollmentId, fromJson: _activeEnrollmentIdValue)
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
    @JsonKey(readValue: readJsonMap) EnrollmentGroupModel? group,
  }) = _ActiveEnrollmentModel;

  factory ActiveEnrollmentModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveEnrollmentModelFromJson(json);
}

@Freezed(toJson: false)
class ChildDetailModel with _$ChildDetailModel {
  const factory ChildDetailModel({
    @JsonKey(readValue: _childDetailId, fromJson: _childDetailIdValue) int? id,
    @JsonKey(
        readValue: _childDetailStudentNumber,
        fromJson: _childDetailStudentNumberValue)
    String? studentNumber,
    @JsonKey(
        readValue: _childDetailFullName, fromJson: _childDetailFullNameValue)
    String? fullName,
    @JsonKey(
        readValue: _childDetailFirstName, fromJson: _childDetailFirstNameValue)
    String? firstName,
    @JsonKey(
        readValue: _childDetailLastName, fromJson: _childDetailLastNameValue)
    String? lastName,
    @JsonKey(readValue: _childDetailStatus, fromJson: _childDetailStatusValue)
    String? status,
    @JsonKey(
        readValue: _childDetailBirthDate, fromJson: _childDetailBirthDateValue)
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
    @JsonKey(
        readValue: _childDetailJoinedAt, fromJson: _childDetailJoinedAtValue)
    String? joinedAt,
    @JsonKey(
        readValue: _childDetailMemorizedPages,
        fromJson: _childDetailMemorizedPagesValue)
    int? memorizedPages,
    @JsonKey(readValue: _childDetailPoints, fromJson: _childDetailPointsValue)
    int? points,
    @JsonKey(name: 'active_enrollments', readValue: readJsonList)
    List<ActiveEnrollmentModel>? activeEnrollments,
  }) = _ChildDetailModel;

  factory ChildDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ChildDetailModelFromJson(json);
}

@Freezed(toJson: false)
class QuranTestAttemptModel with _$QuranTestAttemptModel {
  const factory QuranTestAttemptModel({
    @JsonKey(readValue: _quranTestAttemptId, fromJson: _quranTestAttemptIdValue)
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
    String? notes,
  }) = _QuranTestAttemptModel;

  factory QuranTestAttemptModel.fromJson(Map<String, dynamic> json) =>
      _$QuranTestAttemptModelFromJson(json);
}

@Freezed(toJson: false)
class QuranTestPartModel with _$QuranTestPartModel {
  const factory QuranTestPartModel({
    @JsonKey(readValue: _quranTestPartId, fromJson: _quranTestPartIdValue)
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
    @JsonKey(readValue: readJsonList) List<QuranTestAttemptModel>? attempts,
  }) = _QuranTestPartModel;

  factory QuranTestPartModel.fromJson(Map<String, dynamic> json) =>
      _$QuranTestPartModelFromJson(json);
}

@Freezed(toJson: false)
class QuranTestEntryModel with _$QuranTestEntryModel {
  const factory QuranTestEntryModel({
    @JsonKey(readValue: _quranTestEntryId, fromJson: _quranTestEntryIdValue)
    int? id,
    @JsonKey(readValue: _quranTestEntryKind, fromJson: _quranTestEntryKindValue)
    String? kind,
    @JsonKey(readValue: _quranTestEntryDate, fromJson: _quranTestEntryDateValue)
    DateTime? date,
    @JsonKey(
        readValue: _quranTestEntryStatus, fromJson: _quranTestEntryStatusValue)
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
    @JsonKey(readValue: readJsonList) List<QuranTestAttemptModel>? attempts,
  }) = _QuranTestEntryModel;

  factory QuranTestEntryModel.fromJson(Map<String, dynamic> json) =>
      _$QuranTestEntryModelFromJson(json);
}

@Freezed(toJson: false)
class NoteEntryModel with _$NoteEntryModel {
  const factory NoteEntryModel({
    @JsonKey(readValue: _noteEntryId, fromJson: _noteEntryIdValue) int? id,
    @JsonKey(readValue: _noteEntrySource, fromJson: _noteEntrySourceValue)
    String? source,
    @JsonKey(readValue: _noteEntryNotedAt, fromJson: _noteEntryNotedAtValue)
    DateTime? notedAt,
    @JsonKey(readValue: _noteEntryBody, fromJson: _noteEntryBodyValue)
    String? body,
    @JsonKey(readValue: _noteEntryGroupName, fromJson: _noteEntryGroupNameValue)
    String? groupName,
    @JsonKey(readValue: _noteEntryAuthorId, fromJson: _noteEntryAuthorIdValue)
    int? authorId,
    @JsonKey(
        readValue: _noteEntryAuthorName, fromJson: _noteEntryAuthorNameValue)
    String? authorName,
  }) = _NoteEntryModel;

  factory NoteEntryModel.fromJson(Map<String, dynamic> json) =>
      _$NoteEntryModelFromJson(json);
}

@Freezed(toJson: false)
class PointEntryModel with _$PointEntryModel {
  const factory PointEntryModel({
    @JsonKey(readValue: _pointEntryId, fromJson: _pointEntryIdValue) int? id,
    @JsonKey(
        readValue: _pointEntryEnteredAt, fromJson: _pointEntryEnteredAtValue)
    DateTime? enteredAt,
    @JsonKey(readValue: _pointEntryPoints, fromJson: _pointEntryPointsValue)
    int? points,
    @JsonKey(
        readValue: _pointEntrySourceType, fromJson: _pointEntrySourceTypeValue)
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
        readValue: _pointEntryPolicyName, fromJson: _pointEntryPolicyNameValue)
    String? policyName,
    @JsonKey(
        readValue: _pointEntryGroupName, fromJson: _pointEntryGroupNameValue)
    String? groupName,
    @JsonKey(
        readValue: _pointEntryTeacherName,
        fromJson: _pointEntryTeacherNameValue)
    String? teacherName,
    @JsonKey(readValue: _pointEntryNotes, fromJson: _pointEntryNotesValue)
    String? notes,
  }) = _PointEntryModel;

  factory PointEntryModel.fromJson(Map<String, dynamic> json) =>
      _$PointEntryModelFromJson(json);
}
