import 'package:alkheir_mosque/features/shared/students/data/models/student_model.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

extension AttendanceEntryModelMapper on AttendanceEntryModel? {
  AttendanceEntry toDomain() {
    return AttendanceEntry(
      id: this?.id ?? 0,
      date: this?.date ?? DateTime.now(),
      dayStatus: this?.dayStatus ?? '',
      statusCode: this?.statusCode ?? '',
      statusName: this?.statusName ?? '',
      notes: this?.notes,
      groupName: this?.groupName ?? '',
      teacherName: this?.teacherName ?? '',
    );
  }
}

extension MemorizationEntryModelMapper on MemorizationEntryModel? {
  MemorizationEntry toDomain() {
    return MemorizationEntry(
      id: this?.id ?? 0,
      date: this?.date ?? DateTime.now(),
      entryType: this?.entryType ?? '',
      fromPage: this?.fromPage ?? 0,
      toPage: this?.toPage ?? 0,
      pagesCount: this?.pagesCount ?? 0,
      pages: this?.pages ?? const [],
      groupName: this?.groupName ?? '',
      teacherName: this?.teacherName ?? '',
      notes: this?.notes,
    );
  }
}

extension ParentUserModelMapper on ParentUserModel? {
  ParentUser toDomain() {
    return ParentUser(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      username: this?.username ?? '',
      email: this?.email ?? '',
      phone: this?.phone ?? '',
    );
  }
}

extension ChildSummaryModelMapper on ChildSummaryModel? {
  ChildSummary toDomain() {
    return ChildSummary(
      id: this?.id ?? 0,
      studentNumber: this?.studentNumber ?? '',
      fullName: this?.fullName ?? '',
      firstName: this?.firstName ?? '',
      lastName: this?.lastName ?? '',
      status: this?.status ?? '',
      birthDate: this?.birthDate,
      gender: this?.gender ?? '',
      gradeLevelName: this?.gradeLevelName,
      quranCurrentJuz: this?.quranCurrentJuz,
    );
  }
}

extension ParentProfileModelMapper on ParentProfileModel? {
  ParentProfile toDomain() {
    return ParentProfile(
      id: this?.id ?? 0,
      parentNumber: this?.parentNumber ?? '',
      fatherName: this?.fatherName ?? '',
      fatherWork: this?.fatherWork ?? '',
      fatherPhone: this?.fatherPhone ?? '',
      motherName: this?.motherName ?? '',
      motherPhone: this?.motherPhone ?? '',
      homePhone: this?.homePhone ?? '',
      address: this?.address ?? '',
      isActive: this?.isActive ?? false,
      user: (this?.user).toDomain(),
      childrenCount: this?.childrenCount ?? 0,
      children: [
        for (final e in this?.children ?? const <ChildSummaryModel>[])
          e.toDomain()
      ],
    );
  }
}

extension ParentSummaryModelMapper on ParentSummaryModel? {
  ParentSummary toDomain() {
    return ParentSummary(
      children: this?.children ?? 0,
      activeEnrollments: this?.activeEnrollments ?? 0,
      memorizedPages: this?.memorizedPages ?? 0,
      points: this?.points ?? 0,
      invoiceTotal: this?.invoiceTotal ?? 0.0,
      paidTotal: this?.paidTotal ?? 0.0,
      balance: this?.balance ?? 0.0,
      unreadNotes: this?.unreadNotes ?? 0,
      availableActivityResponses: this?.availableActivityResponses ?? 0,
    );
  }
}

extension ActivityChildEligibilityModelMapper
    on ActivityChildEligibilityModel? {
  ActivityChildEligibility toDomain() {
    return ActivityChildEligibility(
      studentId: this?.studentId ?? 0,
      studentName: this?.studentName ?? '',
      responseStatus: this?.responseStatus,
      canRespond: this?.canRespond ?? false,
    );
  }
}

extension ParentActivityModelMapper on ParentActivityModel? {
  ParentActivity toDomain() {
    return ParentActivity(
      id: this?.id ?? 0,
      title: this?.title ?? '',
      description: this?.description,
      activityDate: this?.activityDate,
      feeAmount: this?.feeAmount ?? 0.0,
      isActive: this?.isActive ?? false,
      groupName: this?.groupName,
      children: [
        for (final e
            in this?.children ?? const <ActivityChildEligibilityModel>[])
          e.toDomain()
      ],
    );
  }
}

extension InvoiceListItemModelMapper on InvoiceListItemModel? {
  InvoiceListItem toDomain() {
    return InvoiceListItem(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo ?? '',
      status: this?.status ?? '',
      issueDate: this?.issueDate ?? '',
      dueDate: this?.dueDate,
      total: this?.total ?? 0.0,
      paidTotal: this?.paidTotal ?? 0.0,
      balance: this?.balance ?? 0.0,
    );
  }
}

extension InvoiceLineItemModelMapper on InvoiceLineItemModel? {
  InvoiceLineItem toDomain() {
    return InvoiceLineItem(
      id: this?.id ?? 0,
      description: this?.description ?? '',
      quantity: this?.quantity ?? 0.0,
      unitPrice: this?.unitPrice ?? 0.0,
      lineTotal: this?.lineTotal ?? 0.0,
    );
  }
}

extension InvoicePaymentEntryModelMapper on InvoicePaymentEntryModel? {
  InvoicePaymentEntry toDomain() {
    return InvoicePaymentEntry(
      id: this?.id ?? 0,
      amount: this?.amount ?? 0.0,
      paidAt: this?.paidAt ?? '',
      referenceNo: this?.referenceNo,
      methodName: this?.methodName,
      isVoided: this?.isVoided ?? false,
    );
  }
}

extension InvoiceDetailModelMapper on InvoiceDetailModel? {
  InvoiceDetail toDomain() {
    return InvoiceDetail(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo ?? '',
      status: this?.status ?? '',
      issueDate: this?.issueDate ?? '',
      dueDate: this?.dueDate,
      subtotal: this?.subtotal ?? 0.0,
      discount: this?.discount ?? 0.0,
      total: this?.total ?? 0.0,
      paidTotal: this?.paidTotal ?? 0.0,
      balance: this?.balance ?? 0.0,
      items: [
        for (final e in this?.items ?? const <InvoiceLineItemModel>[])
          e.toDomain()
      ],
      payments: [
        for (final e in this?.payments ?? const <InvoicePaymentEntryModel>[])
          e.toDomain()
      ],
    );
  }
}

extension StudentParentInfoModelMapper on StudentParentInfoModel? {
  StudentParentInfo toDomain() {
    return StudentParentInfo(
      fatherName: this?.fatherName ?? '',
      motherName: this?.motherName ?? '',
      fatherPhone: this?.fatherPhone ?? '',
      motherPhone: this?.motherPhone ?? '',
      homePhone: this?.homePhone ?? '',
      address: this?.address ?? '',
      email: this?.email ?? '',
    );
  }
}

extension EnrollmentGroupModelMapper on EnrollmentGroupModel? {
  EnrollmentGroup toDomain() {
    return EnrollmentGroup(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      courseName: this?.courseName ?? '',
      teacherName: this?.teacherName ?? '',
      teacherPhone: this?.teacherPhone ?? '',
    );
  }
}

extension ActiveEnrollmentModelMapper on ActiveEnrollmentModel? {
  ActiveEnrollment toDomain() {
    return ActiveEnrollment(
      id: this?.id ?? 0,
      status: this?.status ?? '',
      enrolledAt: this?.enrolledAt ?? '',
      leftAt: this?.leftAt,
      memorizedPages: this?.memorizedPages ?? 0,
      points: this?.points ?? 0,
      group: (this?.group).toDomain(),
    );
  }
}

extension ChildDetailModelMapper on ChildDetailModel? {
  ChildDetail toDomain() {
    return ChildDetail(
      id: this?.id ?? 0,
      studentNumber: this?.studentNumber ?? '',
      fullName: this?.fullName ?? '',
      firstName: this?.firstName ?? '',
      lastName: this?.lastName ?? '',
      status: this?.status ?? '',
      birthDate: this?.birthDate,
      gender: this?.gender ?? '',
      gradeLevelName: this?.gradeLevelName,
      quranCurrentJuz: this?.quranCurrentJuz,
      schoolName: this?.schoolName,
      joinedAt: this?.joinedAt,
      memorizedPages: this?.memorizedPages ?? 0,
      points: this?.points ?? 0,
      activeEnrollments: [
        for (final e
            in this?.activeEnrollments ?? const <ActiveEnrollmentModel>[])
          e.toDomain()
      ],
    );
  }
}

extension QuranTestAttemptModelMapper on QuranTestAttemptModel? {
  QuranTestAttempt toDomain() {
    return QuranTestAttempt(
      id: this?.id ?? 0,
      testedOn: this?.testedOn ?? DateTime.now(),
      score: this?.score,
      status: this?.status ?? '',
      attemptNo: this?.attemptNo ?? 0,
      teacherName: this?.teacherName ?? '',
      notes: this?.notes,
    );
  }
}

extension QuranTestPartModelMapper on QuranTestPartModel? {
  QuranTestPart toDomain() {
    return QuranTestPart(
      id: this?.id ?? 0,
      partNumber: this?.partNumber ?? 0,
      status: this?.status ?? '',
      passedOn: this?.passedOn,
      attempts: [
        for (final e in this?.attempts ?? const <QuranTestAttemptModel>[])
          e.toDomain()
      ],
    );
  }
}

extension QuranTestEntryModelMapper on QuranTestEntryModel? {
  QuranTestEntry toDomain() {
    return QuranTestEntry(
      id: this?.id ?? 0,
      kind: this?.kind ?? '',
      date: this?.date ?? DateTime.now(),
      status: this?.status ?? '',
      juzNumber: this?.juzNumber ?? 0,
      juzFromPage: this?.juzFromPage ?? 0,
      juzToPage: this?.juzToPage ?? 0,
      groupName: this?.groupName ?? '',
      teacherName: this?.teacherName ?? '',
      parts: [
        for (final e in this?.parts ?? const <QuranTestPartModel>[])
          e.toDomain()
      ],
      attempts: [
        for (final e in this?.attempts ?? const <QuranTestAttemptModel>[])
          e.toDomain()
      ],
    );
  }
}

extension NoteEntryModelMapper on NoteEntryModel? {
  NoteEntry toDomain() {
    return NoteEntry(
      id: this?.id ?? 0,
      source: this?.source ?? '',
      notedAt: this?.notedAt ?? DateTime.now(),
      body: this?.body ?? '',
      groupName: this?.groupName,
      authorId: this?.authorId ?? 0,
      authorName: this?.authorName ?? '',
    );
  }
}

extension PointEntryModelMapper on PointEntryModel? {
  PointEntry toDomain() {
    return PointEntry(
      id: this?.id ?? 0,
      enteredAt: this?.enteredAt ?? DateTime.now(),
      points: this?.points ?? 0,
      sourceType: this?.sourceType ?? '',
      pointTypeCode: this?.pointTypeCode ?? '',
      pointTypeName: this?.pointTypeName ?? '',
      pointTypeCategory: this?.pointTypeCategory ?? '',
      policyName: this?.policyName,
      groupName: this?.groupName ?? '',
      teacherName: this?.teacherName ?? '',
      notes: this?.notes,
    );
  }
}
