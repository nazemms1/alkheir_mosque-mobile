// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminGroupItemModelImpl _$$AdminGroupItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminGroupItemModelImpl(
      id: _adminGroupItemIdValue(_adminGroupItemId(json, 'id')),
      name: _adminGroupItemNameValue(_adminGroupItemName(json, 'name')),
      teacher:
          _adminGroupItemTeacherValue(_adminGroupItemTeacher(json, 'teacher')),
      assistantTeacher: _adminGroupItemAssistantTeacherValue(
          _adminGroupItemAssistantTeacher(json, 'assistantTeacher')),
      course: _adminGroupItemCourseValue(_adminGroupItemCourse(json, 'course')),
      academicYear: _adminGroupItemAcademicYearValue(
          _adminGroupItemAcademicYear(json, 'academicYear')),
      enrollmentsCount: _adminGroupItemEnrollmentsCountValue(
          _adminGroupItemEnrollmentsCount(json, 'enrollmentsCount')),
      isActive: _adminGroupItemIsActiveValue(
          _adminGroupItemIsActive(json, 'isActive')),
      startsOn: _adminGroupItemStartsOnValue(
          _adminGroupItemStartsOn(json, 'startsOn')),
      endsOn: _adminGroupItemEndsOnValue(_adminGroupItemEndsOn(json, 'endsOn')),
    );

_$AdminStudentItemModelImpl _$$AdminStudentItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminStudentItemModelImpl(
      id: _adminStudentItemIdValue(_adminStudentItemId(json, 'id')),
      fullName: _adminStudentItemFullNameValue(
          _adminStudentItemFullName(json, 'fullName')),
      studentNumber: _adminStudentItemStudentNumberValue(
          _adminStudentItemStudentNumber(json, 'studentNumber')),
      gradeLevel: _adminStudentItemGradeLevelValue(
          _adminStudentItemGradeLevel(json, 'gradeLevel')),
      parent:
          _adminStudentItemParentValue(_adminStudentItemParent(json, 'parent')),
      schoolName: _adminStudentItemSchoolNameValue(
          _adminStudentItemSchoolName(json, 'schoolName')),
      currentJuz: _adminStudentItemCurrentJuzValue(
          _adminStudentItemCurrentJuz(json, 'currentJuz')),
      status:
          _adminStudentItemStatusValue(_adminStudentItemStatus(json, 'status')),
      birthDate: _adminStudentItemBirthDateValue(
          _adminStudentItemBirthDate(json, 'birthDate')),
      enrollmentsCount: _adminStudentItemEnrollmentsCountValue(
          _adminStudentItemEnrollmentsCount(json, 'enrollmentsCount')),
      enrollmentId: _adminStudentItemEnrollmentIdValue(
          _adminStudentItemEnrollmentId(json, 'enrollmentId')),
      attendanceStatusId: _adminStudentItemAttendanceStatusIdValue(
          _adminStudentItemAttendanceStatusId(json, 'attendanceStatusId')),
    );

_$AdminEnrollmentItemModelImpl _$$AdminEnrollmentItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminEnrollmentItemModelImpl(
      id: _adminEnrollmentItemIdValue(_adminEnrollmentItemId(json, 'id')),
      studentName: _adminEnrollmentItemStudentNameValue(
          _adminEnrollmentItemStudentName(json, 'studentName')),
      studentId: _adminEnrollmentItemStudentIdValue(
          _adminEnrollmentItemStudentId(json, 'studentId')),
      parentName: _adminEnrollmentItemParentNameValue(
          _adminEnrollmentItemParentName(json, 'parentName')),
      groupName: _adminEnrollmentItemGroupNameValue(
          _adminEnrollmentItemGroupName(json, 'groupName')),
      groupId: _adminEnrollmentItemGroupIdValue(
          _adminEnrollmentItemGroupId(json, 'groupId')),
      courseName: _adminEnrollmentItemCourseNameValue(
          _adminEnrollmentItemCourseName(json, 'courseName')),
      finalPoints: _adminEnrollmentItemFinalPointsValue(
          _adminEnrollmentItemFinalPoints(json, 'finalPoints')),
      memorizedPages: _adminEnrollmentItemMemorizedPagesValue(
          _adminEnrollmentItemMemorizedPages(json, 'memorizedPages')),
      status: _adminEnrollmentItemStatusValue(
          _adminEnrollmentItemStatus(json, 'status')),
      enrolledAt: _adminEnrollmentItemEnrolledAtValue(
          _adminEnrollmentItemEnrolledAt(json, 'enrolledAt')),
    );

_$AdminAssessmentItemModelImpl _$$AdminAssessmentItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminAssessmentItemModelImpl(
      id: _adminAssessmentItemIdValue(_adminAssessmentItemId(json, 'id')),
      title: _adminAssessmentItemTitleValue(
          _adminAssessmentItemTitle(json, 'title')),
      type:
          _adminAssessmentItemTypeValue(_adminAssessmentItemType(json, 'type')),
      description: _adminAssessmentItemDescriptionValue(
          _adminAssessmentItemDescription(json, 'description')),
      groupName: _adminAssessmentItemGroupNameValue(
          _adminAssessmentItemGroupName(json, 'groupName')),
      groupId: _adminAssessmentItemGroupIdValue(
          _adminAssessmentItemGroupId(json, 'groupId')),
      courseName: _adminAssessmentItemCourseNameValue(
          _adminAssessmentItemCourseName(json, 'courseName')),
      totalMark: _adminAssessmentItemTotalMarkValue(
          _adminAssessmentItemTotalMark(json, 'totalMark')),
      passMark: _adminAssessmentItemPassMarkValue(
          _adminAssessmentItemPassMark(json, 'passMark')),
      resultsCount: _adminAssessmentItemResultsCountValue(
          _adminAssessmentItemResultsCount(json, 'resultsCount')),
      isActive: _adminAssessmentItemIsActiveValue(
          _adminAssessmentItemIsActive(json, 'isActive')),
      scheduledAt: _adminAssessmentItemScheduledAtValue(
          _adminAssessmentItemScheduledAt(json, 'scheduledAt')),
      dueAt: _adminAssessmentItemDueAtValue(
          _adminAssessmentItemDueAt(json, 'dueAt')),
    );

_$AdminInvoiceItemModelImpl _$$AdminInvoiceItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminInvoiceItemModelImpl(
      id: _adminInvoiceItemIdValue(_adminInvoiceItemId(json, 'id')),
      invoiceNo: _adminInvoiceItemInvoiceNoValue(
          _adminInvoiceItemInvoiceNo(json, 'invoiceNo')),
      invoiceType: _adminInvoiceItemInvoiceTypeValue(
          _adminInvoiceItemInvoiceType(json, 'invoiceType')),
      parentName: _adminInvoiceItemParentNameValue(
          _adminInvoiceItemParentName(json, 'parentName')),
      total: _adminInvoiceItemTotalValue(_adminInvoiceItemTotal(json, 'total')),
      paidTotal: _adminInvoiceItemPaidTotalValue(
          _adminInvoiceItemPaidTotal(json, 'paidTotal')),
      balance: _adminInvoiceItemBalanceValue(
          _adminInvoiceItemBalance(json, 'balance')),
      discount: _adminInvoiceItemDiscountValue(
          _adminInvoiceItemDiscount(json, 'discount')),
      status:
          _adminInvoiceItemStatusValue(_adminInvoiceItemStatus(json, 'status')),
      issueDate: _adminInvoiceItemIssueDateValue(
          _adminInvoiceItemIssueDate(json, 'issueDate')),
      dueDate: _adminInvoiceItemDueDateValue(
          _adminInvoiceItemDueDate(json, 'dueDate')),
      itemsCount: _adminInvoiceItemItemsCountValue(
          _adminInvoiceItemItemsCount(json, 'itemsCount')),
    );

_$AdminStudentDetailModelImpl _$$AdminStudentDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminStudentDetailModelImpl(
      id: _adminStudentDetailIdValue(_adminStudentDetailId(json, 'id')),
      fullName: _adminStudentDetailFullNameValue(
          _adminStudentDetailFullName(json, 'fullName')),
      studentNumber: _adminStudentDetailStudentNumberValue(
          _adminStudentDetailStudentNumber(json, 'studentNumber')),
      gradeLevel: _adminStudentDetailGradeLevelValue(
          _adminStudentDetailGradeLevel(json, 'gradeLevel')),
      schoolName: _adminStudentDetailSchoolNameValue(
          _adminStudentDetailSchoolName(json, 'schoolName')),
      status: _adminStudentDetailStatusValue(
          _adminStudentDetailStatus(json, 'status')),
      birthDate: _adminStudentDetailBirthDateValue(
          _adminStudentDetailBirthDate(json, 'birthDate')),
      currentJuz: _adminStudentDetailCurrentJuzValue(
          _adminStudentDetailCurrentJuz(json, 'currentJuz')),
      memorizedPages: _adminStudentDetailMemorizedPagesValue(
          _adminStudentDetailMemorizedPages(json, 'memorizedPages')),
      totalPoints: _adminStudentDetailTotalPointsValue(
          _adminStudentDetailTotalPoints(json, 'totalPoints')),
      parentName: _adminStudentDetailParentNameValue(
          _adminStudentDetailParentName(json, 'parentName')),
      parentPhone: _adminStudentDetailParentPhoneValue(
          _adminStudentDetailParentPhone(json, 'parentPhone')),
      parentEmail: _adminStudentDetailParentEmailValue(
          _adminStudentDetailParentEmail(json, 'parentEmail')),
      fatherName: _adminStudentDetailFatherNameValue(
          _adminStudentDetailFatherName(json, 'fatherName')),
      motherName: _adminStudentDetailMotherNameValue(
          _adminStudentDetailMotherName(json, 'motherName')),
      enrollments: (readJsonList(json, 'enrollments') as List<dynamic>?)
          ?.map((e) =>
              AdminEnrollmentItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$AdminActivityItemModelImpl _$$AdminActivityItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminActivityItemModelImpl(
      id: _adminActivityItemIdValue(_adminActivityItemId(json, 'id')),
      title:
          _adminActivityItemTitleValue(_adminActivityItemTitle(json, 'title')),
      description: _adminActivityItemDescriptionValue(
          _adminActivityItemDescription(json, 'description')),
      activityDate: _adminActivityItemActivityDateValue(
          _adminActivityItemActivityDate(json, 'activityDate')),
      groupName: _adminActivityItemGroupNameValue(
          _adminActivityItemGroupName(json, 'groupName')),
      feeAmount: _adminActivityItemFeeAmountValue(
          _adminActivityItemFeeAmount(json, 'feeAmount')),
      expectedRevenue: _adminActivityItemExpectedRevenueValue(
          _adminActivityItemExpectedRevenue(json, 'expectedRevenue')),
      collectedRevenue: _adminActivityItemCollectedRevenueValue(
          _adminActivityItemCollectedRevenue(json, 'collectedRevenue')),
      expenseTotal: _adminActivityItemExpenseTotalValue(
          _adminActivityItemExpenseTotal(json, 'expenseTotal')),
      isActive: _adminActivityItemIsActiveValue(
          _adminActivityItemIsActive(json, 'isActive')),
    );

_$ScanAttendanceResultModelImpl _$$ScanAttendanceResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanAttendanceResultModelImpl(
      attendanceStatusId: _scanAttendanceResultAttendanceStatusIdValue(
          _scanAttendanceResultAttendanceStatusId(json, 'attendanceStatusId')),
      attendanceStatusName: _scanAttendanceResultAttendanceStatusNameValue(
          _scanAttendanceResultAttendanceStatusName(
              json, 'attendanceStatusName')),
      enrollmentId: _scanAttendanceResultEnrollmentIdValue(
          _scanAttendanceResultEnrollmentId(json, 'enrollmentId')),
      studentId: _scanAttendanceResultStudentIdValue(
          _scanAttendanceResultStudentId(json, 'studentId')),
      studentName: _scanAttendanceResultStudentNameValue(
          _scanAttendanceResultStudentName(json, 'studentName')),
      groupId: _scanAttendanceResultGroupIdValue(
          _scanAttendanceResultGroupId(json, 'groupId')),
      groupName: _scanAttendanceResultGroupNameValue(
          _scanAttendanceResultGroupName(json, 'groupName')),
    );
