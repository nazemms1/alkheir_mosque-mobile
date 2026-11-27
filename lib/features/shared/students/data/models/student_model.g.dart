// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceEntryModelImpl _$$AttendanceEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceEntryModelImpl(
      id: _attendanceEntryIdValue(_attendanceEntryId(json, 'id')),
      date: _attendanceEntryDateValue(_attendanceEntryDate(json, 'date')),
      dayStatus: _attendanceEntryDayStatusValue(
          _attendanceEntryDayStatus(json, 'dayStatus')),
      statusCode: _attendanceEntryStatusCodeValue(
          _attendanceEntryStatusCode(json, 'statusCode')),
      statusName: _attendanceEntryStatusNameValue(
          _attendanceEntryStatusName(json, 'statusName')),
      notes: _attendanceEntryNotesValue(_attendanceEntryNotes(json, 'notes')),
      groupName: _attendanceEntryGroupNameValue(
          _attendanceEntryGroupName(json, 'groupName')),
      teacherName: _attendanceEntryTeacherNameValue(
          _attendanceEntryTeacherName(json, 'teacherName')),
    );

_$MemorizationEntryModelImpl _$$MemorizationEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MemorizationEntryModelImpl(
      id: _memorizationEntryIdValue(_memorizationEntryId(json, 'id')),
      date: _memorizationEntryDateValue(_memorizationEntryDate(json, 'date')),
      entryType: _memorizationEntryEntryTypeValue(
          _memorizationEntryEntryType(json, 'entryType')),
      fromPage: _memorizationEntryFromPageValue(
          _memorizationEntryFromPage(json, 'fromPage')),
      toPage: _memorizationEntryToPageValue(
          _memorizationEntryToPage(json, 'toPage')),
      pagesCount: _memorizationEntryPagesCountValue(
          _memorizationEntryPagesCount(json, 'pagesCount')),
      pages:
          _memorizationEntryPagesValue(_memorizationEntryPages(json, 'pages')),
      groupName: _memorizationEntryGroupNameValue(
          _memorizationEntryGroupName(json, 'groupName')),
      teacherName: _memorizationEntryTeacherNameValue(
          _memorizationEntryTeacherName(json, 'teacherName')),
      notes:
          _memorizationEntryNotesValue(_memorizationEntryNotes(json, 'notes')),
    );

_$ParentUserModelImpl _$$ParentUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParentUserModelImpl(
      id: _parentUserIdValue(_parentUserId(json, 'id')),
      name: _parentUserNameValue(_parentUserName(json, 'name')),
      username: _parentUserUsernameValue(_parentUserUsername(json, 'username')),
      email: _parentUserEmailValue(_parentUserEmail(json, 'email')),
      phone: _parentUserPhoneValue(_parentUserPhone(json, 'phone')),
    );

_$ChildSummaryModelImpl _$$ChildSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChildSummaryModelImpl(
      id: _childSummaryIdValue(_childSummaryId(json, 'id')),
      studentNumber: _childSummaryStudentNumberValue(
          _childSummaryStudentNumber(json, 'studentNumber')),
      fullName:
          _childSummaryFullNameValue(_childSummaryFullName(json, 'fullName')),
      firstName: _childSummaryFirstNameValue(
          _childSummaryFirstName(json, 'firstName')),
      lastName:
          _childSummaryLastNameValue(_childSummaryLastName(json, 'lastName')),
      status: _childSummaryStatusValue(_childSummaryStatus(json, 'status')),
      birthDate: _childSummaryBirthDateValue(
          _childSummaryBirthDate(json, 'birthDate')),
      gender: _childSummaryGenderValue(_childSummaryGender(json, 'gender')),
      gradeLevelName: _childSummaryGradeLevelNameValue(
          _childSummaryGradeLevelName(json, 'gradeLevelName')),
      quranCurrentJuz: _childSummaryQuranCurrentJuzValue(
          _childSummaryQuranCurrentJuz(json, 'quranCurrentJuz')),
    );

_$ParentProfileModelImpl _$$ParentProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParentProfileModelImpl(
      id: _parentProfileIdValue(_parentProfileId(json, 'id')),
      parentNumber: _parentProfileParentNumberValue(
          _parentProfileParentNumber(json, 'parentNumber')),
      fatherName: _parentProfileFatherNameValue(
          _parentProfileFatherName(json, 'fatherName')),
      fatherWork: _parentProfileFatherWorkValue(
          _parentProfileFatherWork(json, 'fatherWork')),
      fatherPhone: _parentProfileFatherPhoneValue(
          _parentProfileFatherPhone(json, 'fatherPhone')),
      motherName: _parentProfileMotherNameValue(
          _parentProfileMotherName(json, 'motherName')),
      motherPhone: _parentProfileMotherPhoneValue(
          _parentProfileMotherPhone(json, 'motherPhone')),
      homePhone: _parentProfileHomePhoneValue(
          _parentProfileHomePhone(json, 'homePhone')),
      address:
          _parentProfileAddressValue(_parentProfileAddress(json, 'address')),
      isActive:
          _parentProfileIsActiveValue(_parentProfileIsActive(json, 'isActive')),
      user: readJsonMap(json, 'user') == null
          ? null
          : ParentUserModel.fromJson(
              readJsonMap(json, 'user') as Map<String, dynamic>),
      childrenCount: _parentProfileChildrenCountValue(
          _parentProfileChildrenCount(json, 'childrenCount')),
      children: (readJsonList(json, 'children') as List<dynamic>?)
          ?.map((e) => ChildSummaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$ParentSummaryModelImpl _$$ParentSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParentSummaryModelImpl(
      children:
          _parentSummaryChildrenValue(_parentSummaryChildren(json, 'children')),
      activeEnrollments: _parentSummaryActiveEnrollmentsValue(
          _parentSummaryActiveEnrollments(json, 'activeEnrollments')),
      memorizedPages: _parentSummaryMemorizedPagesValue(
          _parentSummaryMemorizedPages(json, 'memorizedPages')),
      points: _parentSummaryPointsValue(_parentSummaryPoints(json, 'points')),
      invoiceTotal: _parentSummaryInvoiceTotalValue(
          _parentSummaryInvoiceTotal(json, 'invoiceTotal')),
      paidTotal: _parentSummaryPaidTotalValue(
          _parentSummaryPaidTotal(json, 'paidTotal')),
      balance:
          _parentSummaryBalanceValue(_parentSummaryBalance(json, 'balance')),
      unreadNotes: _parentSummaryUnreadNotesValue(
          _parentSummaryUnreadNotes(json, 'unreadNotes')),
      availableActivityResponses: _parentSummaryAvailableActivityResponsesValue(
          _parentSummaryAvailableActivityResponses(
              json, 'availableActivityResponses')),
    );

_$ActivityChildEligibilityModelImpl
    _$$ActivityChildEligibilityModelImplFromJson(Map<String, dynamic> json) =>
        _$ActivityChildEligibilityModelImpl(
          studentId: _activityChildEligibilityStudentIdValue(
              _activityChildEligibilityStudentId(json, 'studentId')),
          studentName: _activityChildEligibilityStudentNameValue(
              _activityChildEligibilityStudentName(json, 'studentName')),
          responseStatus: _activityChildEligibilityResponseStatusValue(
              _activityChildEligibilityResponseStatus(json, 'responseStatus')),
          canRespond: _activityChildEligibilityCanRespondValue(
              _activityChildEligibilityCanRespond(json, 'canRespond')),
        );

_$ParentActivityModelImpl _$$ParentActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParentActivityModelImpl(
      id: _parentActivityIdValue(_parentActivityId(json, 'id')),
      title: _parentActivityTitleValue(_parentActivityTitle(json, 'title')),
      description: _parentActivityDescriptionValue(
          _parentActivityDescription(json, 'description')),
      activityDate: _parentActivityActivityDateValue(
          _parentActivityActivityDate(json, 'activityDate')),
      feeAmount: _parentActivityFeeAmountValue(
          _parentActivityFeeAmount(json, 'feeAmount')),
      isActive: _parentActivityIsActiveValue(
          _parentActivityIsActive(json, 'isActive')),
      groupName: _parentActivityGroupNameValue(
          _parentActivityGroupName(json, 'groupName')),
      children: (readJsonList(json, 'children') as List<dynamic>?)
          ?.map((e) =>
              ActivityChildEligibilityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$InvoiceListItemModelImpl _$$InvoiceListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceListItemModelImpl(
      id: _invoiceListItemIdValue(_invoiceListItemId(json, 'id')),
      invoiceNo: _invoiceListItemInvoiceNoValue(
          _invoiceListItemInvoiceNo(json, 'invoiceNo')),
      status:
          _invoiceListItemStatusValue(_invoiceListItemStatus(json, 'status')),
      issueDate: _invoiceListItemIssueDateValue(
          _invoiceListItemIssueDate(json, 'issueDate')),
      dueDate: _invoiceListItemDueDateValue(
          _invoiceListItemDueDate(json, 'dueDate')),
      total: _invoiceListItemTotalValue(_invoiceListItemTotal(json, 'total')),
      paidTotal: _invoiceListItemPaidTotalValue(
          _invoiceListItemPaidTotal(json, 'paidTotal')),
      balance: _invoiceListItemBalanceValue(
          _invoiceListItemBalance(json, 'balance')),
    );

_$InvoiceLineItemModelImpl _$$InvoiceLineItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceLineItemModelImpl(
      id: _invoiceLineItemIdValue(_invoiceLineItemId(json, 'id')),
      description: _invoiceLineItemDescriptionValue(
          _invoiceLineItemDescription(json, 'description')),
      quantity: _invoiceLineItemQuantityValue(
          _invoiceLineItemQuantity(json, 'quantity')),
      unitPrice: _invoiceLineItemUnitPriceValue(
          _invoiceLineItemUnitPrice(json, 'unitPrice')),
      lineTotal: _invoiceLineItemLineTotalValue(
          _invoiceLineItemLineTotal(json, 'lineTotal')),
    );

_$InvoicePaymentEntryModelImpl _$$InvoicePaymentEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoicePaymentEntryModelImpl(
      id: _invoicePaymentEntryIdValue(_invoicePaymentEntryId(json, 'id')),
      amount: _invoicePaymentEntryAmountValue(
          _invoicePaymentEntryAmount(json, 'amount')),
      paidAt: _invoicePaymentEntryPaidAtValue(
          _invoicePaymentEntryPaidAt(json, 'paidAt')),
      referenceNo: _invoicePaymentEntryReferenceNoValue(
          _invoicePaymentEntryReferenceNo(json, 'referenceNo')),
      methodName: _invoicePaymentEntryMethodNameValue(
          _invoicePaymentEntryMethodName(json, 'methodName')),
      isVoided: _invoicePaymentEntryIsVoidedValue(
          _invoicePaymentEntryIsVoided(json, 'isVoided')),
    );

_$InvoiceDetailModelImpl _$$InvoiceDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceDetailModelImpl(
      id: _invoiceDetailIdValue(_invoiceDetailId(json, 'id')),
      invoiceNo: _invoiceDetailInvoiceNoValue(
          _invoiceDetailInvoiceNo(json, 'invoiceNo')),
      status: _invoiceDetailStatusValue(_invoiceDetailStatus(json, 'status')),
      issueDate: _invoiceDetailIssueDateValue(
          _invoiceDetailIssueDate(json, 'issueDate')),
      dueDate:
          _invoiceDetailDueDateValue(_invoiceDetailDueDate(json, 'dueDate')),
      subtotal:
          _invoiceDetailSubtotalValue(_invoiceDetailSubtotal(json, 'subtotal')),
      discount:
          _invoiceDetailDiscountValue(_invoiceDetailDiscount(json, 'discount')),
      total: _invoiceDetailTotalValue(_invoiceDetailTotal(json, 'total')),
      paidTotal: _invoiceDetailPaidTotalValue(
          _invoiceDetailPaidTotal(json, 'paidTotal')),
      balance:
          _invoiceDetailBalanceValue(_invoiceDetailBalance(json, 'balance')),
      items: (readJsonList(json, 'items') as List<dynamic>?)
          ?.map((e) => InvoiceLineItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (readJsonList(json, 'payments') as List<dynamic>?)
          ?.map((e) =>
              InvoicePaymentEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$StudentParentInfoModelImpl _$$StudentParentInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentParentInfoModelImpl(
      fatherName: _studentParentInfoFatherNameValue(
          _studentParentInfoFatherName(json, 'fatherName')),
      motherName: _studentParentInfoMotherNameValue(
          _studentParentInfoMotherName(json, 'motherName')),
      fatherPhone: _studentParentInfoFatherPhoneValue(
          _studentParentInfoFatherPhone(json, 'fatherPhone')),
      motherPhone: _studentParentInfoMotherPhoneValue(
          _studentParentInfoMotherPhone(json, 'motherPhone')),
      homePhone: _studentParentInfoHomePhoneValue(
          _studentParentInfoHomePhone(json, 'homePhone')),
      address: _studentParentInfoAddressValue(
          _studentParentInfoAddress(json, 'address')),
      email:
          _studentParentInfoEmailValue(_studentParentInfoEmail(json, 'email')),
    );

_$EnrollmentGroupModelImpl _$$EnrollmentGroupModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrollmentGroupModelImpl(
      id: _enrollmentGroupIdValue(_enrollmentGroupId(json, 'id')),
      name: _enrollmentGroupNameValue(_enrollmentGroupName(json, 'name')),
      courseName: _enrollmentGroupCourseNameValue(
          _enrollmentGroupCourseName(json, 'courseName')),
      teacherName: _enrollmentGroupTeacherNameValue(
          _enrollmentGroupTeacherName(json, 'teacherName')),
      teacherPhone: _enrollmentGroupTeacherPhoneValue(
          _enrollmentGroupTeacherPhone(json, 'teacherPhone')),
    );

_$ActiveEnrollmentModelImpl _$$ActiveEnrollmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActiveEnrollmentModelImpl(
      id: _activeEnrollmentIdValue(_activeEnrollmentId(json, 'id')),
      status:
          _activeEnrollmentStatusValue(_activeEnrollmentStatus(json, 'status')),
      enrolledAt: _activeEnrollmentEnrolledAtValue(
          _activeEnrollmentEnrolledAt(json, 'enrolledAt')),
      leftAt:
          _activeEnrollmentLeftAtValue(_activeEnrollmentLeftAt(json, 'leftAt')),
      memorizedPages: _activeEnrollmentMemorizedPagesValue(
          _activeEnrollmentMemorizedPages(json, 'memorizedPages')),
      points:
          _activeEnrollmentPointsValue(_activeEnrollmentPoints(json, 'points')),
      group: readJsonMap(json, 'group') == null
          ? null
          : EnrollmentGroupModel.fromJson(
              readJsonMap(json, 'group') as Map<String, dynamic>),
    );

_$ChildDetailModelImpl _$$ChildDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChildDetailModelImpl(
      id: _childDetailIdValue(_childDetailId(json, 'id')),
      studentNumber: _childDetailStudentNumberValue(
          _childDetailStudentNumber(json, 'studentNumber')),
      fullName:
          _childDetailFullNameValue(_childDetailFullName(json, 'fullName')),
      firstName:
          _childDetailFirstNameValue(_childDetailFirstName(json, 'firstName')),
      lastName:
          _childDetailLastNameValue(_childDetailLastName(json, 'lastName')),
      status: _childDetailStatusValue(_childDetailStatus(json, 'status')),
      birthDate:
          _childDetailBirthDateValue(_childDetailBirthDate(json, 'birthDate')),
      gender: _childDetailGenderValue(_childDetailGender(json, 'gender')),
      gradeLevelName: _childDetailGradeLevelNameValue(
          _childDetailGradeLevelName(json, 'gradeLevelName')),
      quranCurrentJuz: _childDetailQuranCurrentJuzValue(
          _childDetailQuranCurrentJuz(json, 'quranCurrentJuz')),
      schoolName: _childDetailSchoolNameValue(
          _childDetailSchoolName(json, 'schoolName')),
      joinedAt:
          _childDetailJoinedAtValue(_childDetailJoinedAt(json, 'joinedAt')),
      memorizedPages: _childDetailMemorizedPagesValue(
          _childDetailMemorizedPages(json, 'memorizedPages')),
      points: _childDetailPointsValue(_childDetailPoints(json, 'points')),
      activeEnrollments: (readJsonList(json, 'active_enrollments')
              as List<dynamic>?)
          ?.map(
              (e) => ActiveEnrollmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$QuranTestAttemptModelImpl _$$QuranTestAttemptModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranTestAttemptModelImpl(
      id: _quranTestAttemptIdValue(_quranTestAttemptId(json, 'id')),
      testedOn: _quranTestAttemptTestedOnValue(
          _quranTestAttemptTestedOn(json, 'testedOn')),
      score: _quranTestAttemptScoreValue(_quranTestAttemptScore(json, 'score')),
      status:
          _quranTestAttemptStatusValue(_quranTestAttemptStatus(json, 'status')),
      attemptNo: _quranTestAttemptAttemptNoValue(
          _quranTestAttemptAttemptNo(json, 'attemptNo')),
      teacherName: _quranTestAttemptTeacherNameValue(
          _quranTestAttemptTeacherName(json, 'teacherName')),
      notes: _quranTestAttemptNotesValue(_quranTestAttemptNotes(json, 'notes')),
    );

_$QuranTestPartModelImpl _$$QuranTestPartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranTestPartModelImpl(
      id: _quranTestPartIdValue(_quranTestPartId(json, 'id')),
      partNumber: _quranTestPartPartNumberValue(
          _quranTestPartPartNumber(json, 'partNumber')),
      status: _quranTestPartStatusValue(_quranTestPartStatus(json, 'status')),
      passedOn:
          _quranTestPartPassedOnValue(_quranTestPartPassedOn(json, 'passedOn')),
      attempts: (readJsonList(json, 'attempts') as List<dynamic>?)
          ?.map(
              (e) => QuranTestAttemptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$QuranTestEntryModelImpl _$$QuranTestEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuranTestEntryModelImpl(
      id: _quranTestEntryIdValue(_quranTestEntryId(json, 'id')),
      kind: _quranTestEntryKindValue(_quranTestEntryKind(json, 'kind')),
      date: _quranTestEntryDateValue(_quranTestEntryDate(json, 'date')),
      status: _quranTestEntryStatusValue(_quranTestEntryStatus(json, 'status')),
      juzNumber: _quranTestEntryJuzNumberValue(
          _quranTestEntryJuzNumber(json, 'juzNumber')),
      juzFromPage: _quranTestEntryJuzFromPageValue(
          _quranTestEntryJuzFromPage(json, 'juzFromPage')),
      juzToPage: _quranTestEntryJuzToPageValue(
          _quranTestEntryJuzToPage(json, 'juzToPage')),
      groupName: _quranTestEntryGroupNameValue(
          _quranTestEntryGroupName(json, 'groupName')),
      teacherName: _quranTestEntryTeacherNameValue(
          _quranTestEntryTeacherName(json, 'teacherName')),
      parts: (readJsonList(json, 'parts') as List<dynamic>?)
          ?.map((e) => QuranTestPartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      attempts: (readJsonList(json, 'attempts') as List<dynamic>?)
          ?.map(
              (e) => QuranTestAttemptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$NoteEntryModelImpl _$$NoteEntryModelImplFromJson(Map<String, dynamic> json) =>
    _$NoteEntryModelImpl(
      id: _noteEntryIdValue(_noteEntryId(json, 'id')),
      source: _noteEntrySourceValue(_noteEntrySource(json, 'source')),
      notedAt: _noteEntryNotedAtValue(_noteEntryNotedAt(json, 'notedAt')),
      body: _noteEntryBodyValue(_noteEntryBody(json, 'body')),
      groupName:
          _noteEntryGroupNameValue(_noteEntryGroupName(json, 'groupName')),
      authorId: _noteEntryAuthorIdValue(_noteEntryAuthorId(json, 'authorId')),
      authorName:
          _noteEntryAuthorNameValue(_noteEntryAuthorName(json, 'authorName')),
    );

_$PointEntryModelImpl _$$PointEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PointEntryModelImpl(
      id: _pointEntryIdValue(_pointEntryId(json, 'id')),
      enteredAt:
          _pointEntryEnteredAtValue(_pointEntryEnteredAt(json, 'enteredAt')),
      points: _pointEntryPointsValue(_pointEntryPoints(json, 'points')),
      sourceType:
          _pointEntrySourceTypeValue(_pointEntrySourceType(json, 'sourceType')),
      pointTypeCode: _pointEntryPointTypeCodeValue(
          _pointEntryPointTypeCode(json, 'pointTypeCode')),
      pointTypeName: _pointEntryPointTypeNameValue(
          _pointEntryPointTypeName(json, 'pointTypeName')),
      pointTypeCategory: _pointEntryPointTypeCategoryValue(
          _pointEntryPointTypeCategory(json, 'pointTypeCategory')),
      policyName:
          _pointEntryPolicyNameValue(_pointEntryPolicyName(json, 'policyName')),
      groupName:
          _pointEntryGroupNameValue(_pointEntryGroupName(json, 'groupName')),
      teacherName: _pointEntryTeacherNameValue(
          _pointEntryTeacherName(json, 'teacherName')),
      notes: _pointEntryNotesValue(_pointEntryNotes(json, 'notes')),
    );
