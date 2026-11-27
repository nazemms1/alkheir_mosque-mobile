import 'package:alkheir_mosque/features/admin/dashboard/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';

extension AdminGroupItemModelMapper on AdminGroupItemModel? {
  AdminGroupItem toDomain() {
    return AdminGroupItem(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      teacher: this?.teacher ?? '',
      assistantTeacher: this?.assistantTeacher ?? '',
      course: this?.course ?? '',
      academicYear: this?.academicYear ?? '',
      enrollmentsCount: this?.enrollmentsCount ?? 0,
      isActive: this?.isActive ?? false,
      startsOn: this?.startsOn,
      endsOn: this?.endsOn,
    );
  }
}

extension AdminStudentItemModelMapper on AdminStudentItemModel? {
  AdminStudentItem toDomain() {
    return AdminStudentItem(
      id: this?.id ?? 0,
      fullName: this?.fullName ?? '',
      studentNumber: this?.studentNumber ?? '',
      gradeLevel: this?.gradeLevel ?? '',
      parent: this?.parent ?? '',
      schoolName: this?.schoolName ?? '',
      currentJuz: this?.currentJuz ?? 0,
      status: this?.status ?? '',
      birthDate: this?.birthDate,
      enrollmentsCount: this?.enrollmentsCount ?? 0,
      enrollmentId: this?.enrollmentId,
      attendanceStatusId: this?.attendanceStatusId,
    );
  }
}

extension AdminEnrollmentItemModelMapper on AdminEnrollmentItemModel? {
  AdminEnrollmentItem toDomain() {
    return AdminEnrollmentItem(
      id: this?.id ?? 0,
      studentName: this?.studentName ?? '',
      studentId: this?.studentId ?? 0,
      parentName: this?.parentName,
      groupName: this?.groupName ?? '',
      groupId: this?.groupId ?? 0,
      courseName: this?.courseName ?? '',
      finalPoints: this?.finalPoints ?? 0,
      memorizedPages: this?.memorizedPages ?? 0,
      status: this?.status ?? '',
      enrolledAt: this?.enrolledAt ?? '',
    );
  }
}

extension AdminAssessmentItemModelMapper on AdminAssessmentItemModel? {
  AdminAssessmentItem toDomain() {
    return AdminAssessmentItem(
      id: this?.id ?? 0,
      title: this?.title ?? '',
      type: this?.type ?? '',
      description: this?.description,
      groupName: this?.groupName ?? '',
      groupId: this?.groupId ?? 0,
      courseName: this?.courseName ?? '',
      totalMark: this?.totalMark ?? 0.0,
      passMark: this?.passMark ?? 0.0,
      resultsCount: this?.resultsCount ?? 0,
      isActive: this?.isActive ?? false,
      scheduledAt: this?.scheduledAt,
      dueAt: this?.dueAt,
    );
  }
}

extension AdminInvoiceItemModelMapper on AdminInvoiceItemModel? {
  AdminInvoiceItem toDomain() {
    return AdminInvoiceItem(
      id: this?.id ?? 0,
      invoiceNo: this?.invoiceNo ?? '',
      invoiceType: this?.invoiceType ?? '',
      parentName: this?.parentName,
      total: this?.total ?? 0.0,
      paidTotal: this?.paidTotal ?? 0.0,
      balance: this?.balance ?? 0.0,
      discount: this?.discount ?? 0.0,
      status: this?.status ?? '',
      issueDate: this?.issueDate ?? '',
      dueDate: this?.dueDate,
      itemsCount: this?.itemsCount ?? 0,
    );
  }
}

extension AdminStudentDetailModelMapper on AdminStudentDetailModel? {
  AdminStudentDetail toDomain() {
    return AdminStudentDetail(
      id: this?.id ?? 0,
      fullName: this?.fullName ?? '',
      studentNumber: this?.studentNumber ?? '',
      gradeLevel: this?.gradeLevel ?? '',
      schoolName: this?.schoolName ?? '',
      status: this?.status ?? '',
      birthDate: this?.birthDate,
      currentJuz: this?.currentJuz ?? 0,
      memorizedPages: this?.memorizedPages ?? 0,
      totalPoints: this?.totalPoints ?? 0,
      parentName: this?.parentName ?? '',
      parentPhone: this?.parentPhone ?? '',
      parentEmail: this?.parentEmail ?? '',
      fatherName: this?.fatherName ?? '',
      motherName: this?.motherName ?? '',
      enrollments: [
        for (final e in this?.enrollments ?? const <AdminEnrollmentItemModel>[])
          e.toDomain()
      ],
    );
  }
}

extension AdminActivityItemModelMapper on AdminActivityItemModel? {
  AdminActivityItem toDomain() {
    return AdminActivityItem(
      id: this?.id ?? 0,
      title: this?.title ?? '',
      description: this?.description,
      activityDate: this?.activityDate,
      groupName: this?.groupName,
      feeAmount: this?.feeAmount ?? 0.0,
      expectedRevenue: this?.expectedRevenue ?? 0.0,
      collectedRevenue: this?.collectedRevenue ?? 0.0,
      expenseTotal: this?.expenseTotal ?? 0.0,
      isActive: this?.isActive ?? false,
    );
  }
}

extension ScanAttendanceResultModelMapper on ScanAttendanceResultModel? {
  ScanAttendanceResult toDomain() {
    return ScanAttendanceResult(
      attendanceStatusId: this?.attendanceStatusId ?? '',
      attendanceStatusName: this?.attendanceStatusName ?? '',
      enrollmentId: this?.enrollmentId ?? 0,
      studentId: this?.studentId ?? 0,
      studentName: this?.studentName ?? '',
      groupId: this?.groupId,
      groupName: this?.groupName,
    );
  }
}
