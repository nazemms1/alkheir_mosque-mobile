import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';

// ─── Stats ────────────────────────────────────────────────────────────────────
class AdminStats {
  final int totalStudents;
  final int totalGroups;
  final int activeGroups;
  final int totalEnrollments;
  final int totalInvoices;
  final int totalActivities;
  final int totalAssessments;

  const AdminStats({
    required this.totalStudents,
    required this.totalGroups,
    required this.activeGroups,
    required this.totalEnrollments,
    required this.totalInvoices,
    required this.totalActivities,
    required this.totalAssessments,
  });
}

// ─── Group ────────────────────────────────────────────────────────────────────
class AdminGroupItem {
  final int id;
  final String name;
  final String teacher;
  final String assistantTeacher;
  final String course;
  final String academicYear;
  final int enrollmentsCount;
  final bool isActive;
  final String? startsOn;
  final String? endsOn;

  const AdminGroupItem({
    required this.id,
    required this.name,
    required this.teacher,
    required this.assistantTeacher,
    required this.course,
    required this.academicYear,
    required this.enrollmentsCount,
    required this.isActive,
    this.startsOn,
    this.endsOn,
  });
}

// ─── Group Detail ─────────────────────────────────────────────────────────────
/// لا يوجد GET /groups/{id} في الـ API — يُبنى هذا الكائن من [AdminGroupItem]
/// (نتيجة GET /groups) مع تسجيلات الحلقة (GET /enrollments?group_id=).
class AdminGroupDetail {
  final int id;
  final String name;
  final String teacher;
  final String assistantTeacher;
  final String course;
  final String academicYear;
  final int enrollmentsCount;
  final bool isActive;
  final String? startsOn;
  final String? endsOn;
  final List<AdminEnrollmentItem> enrollments;

  const AdminGroupDetail({
    required this.id,
    required this.name,
    required this.teacher,
    required this.assistantTeacher,
    required this.course,
    required this.academicYear,
    required this.enrollmentsCount,
    required this.isActive,
    this.startsOn,
    this.endsOn,
    required this.enrollments,
  });
}

// ─── Student ──────────────────────────────────────────────────────────────────
class AdminStudentItem {
  final int id;
  final String fullName;
  final String studentNumber;
  final String gradeLevel;
  final String parent;
  final String schoolName;
  final int currentJuz;
  final String status;
  final String? birthDate;
  final int enrollmentsCount;
  final int? enrollmentId;
  final String? attendanceStatusId;

  const AdminStudentItem({
    required this.id,
    required this.fullName,
    required this.studentNumber,
    required this.gradeLevel,
    required this.parent,
    required this.schoolName,
    required this.currentJuz,
    required this.status,
    this.birthDate,
    required this.enrollmentsCount,
    this.enrollmentId,
    this.attendanceStatusId,
  });

  String get initials {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts.first[0]}${parts[1][0]}';
    return parts.isNotEmpty && parts.first.isNotEmpty
        ? parts.first[0]
        : L10nGateway.current.text76;
  }

  bool get isActive => status == 'active';
}

// ─── Enrollment ───────────────────────────────────────────────────────────────
class AdminEnrollmentItem {
  final int id;
  final String studentName;
  final int studentId;
  final String? parentName;
  final String groupName;
  final int groupId;
  final String courseName;
  final int finalPoints;
  final int memorizedPages;
  final String status;
  final String enrolledAt;

  const AdminEnrollmentItem({
    required this.id,
    required this.studentName,
    required this.studentId,
    this.parentName,
    required this.groupName,
    required this.groupId,
    required this.courseName,
    required this.finalPoints,
    required this.memorizedPages,
    required this.status,
    required this.enrolledAt,
  });

  String get studentInitials {
    final parts = studentName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts.first[0]}${parts[1][0]}';
    return parts.isNotEmpty && parts.first.isNotEmpty
        ? parts.first[0]
        : L10nGateway.current.text76;
  }
}

// ─── Assessment ───────────────────────────────────────────────────────────────
class AdminAssessmentItem {
  final int id;
  final String title;
  final String type;
  final String? description;
  final String groupName;
  final int groupId;
  final String courseName;
  final double totalMark;
  final double passMark;
  final int resultsCount;
  final bool isActive;
  final String? scheduledAt;
  final String? dueAt;

  const AdminAssessmentItem({
    required this.id,
    required this.title,
    required this.type,
    this.description,
    required this.groupName,
    required this.groupId,
    required this.courseName,
    required this.totalMark,
    required this.passMark,
    required this.resultsCount,
    required this.isActive,
    this.scheduledAt,
    this.dueAt,
  });

  String get formattedDate {
    if (scheduledAt == null) return '—';
    try {
      final dt = DateTime.parse(scheduledAt!).toLocal();
      return '${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return scheduledAt!;
    }
  }
}

// ─── Invoice ──────────────────────────────────────────────────────────────────
class AdminInvoiceItem {
  final int id;
  final String invoiceNo;
  final String invoiceType;
  final String? parentName;
  final double total;
  final double paidTotal;
  final double balance;
  final double discount;
  final String status;
  final String issueDate;
  final String? dueDate;
  final int itemsCount;

  const AdminInvoiceItem({
    required this.id,
    required this.invoiceNo,
    required this.invoiceType,
    this.parentName,
    required this.total,
    required this.paidTotal,
    required this.balance,
    required this.discount,
    required this.status,
    required this.issueDate,
    this.dueDate,
    required this.itemsCount,
  });

  bool get isPaid => status == 'paid' || balance <= 0;
  bool get isOverdue => status == 'overdue';
}

// ─── Student Detail (for supervisor view) ────────────────────────────────────
class AdminStudentDetail {
  final int id;
  final String fullName;
  final String studentNumber;
  final String gradeLevel;
  final String schoolName;
  final String status;
  final String? birthDate;
  final int currentJuz;
  final int memorizedPages;
  final int totalPoints;
  // بيانات الأهل
  final String parentName;
  final String parentPhone;
  final String parentEmail;
  final String fatherName;
  final String motherName;
  // التسجيلات
  final List<AdminEnrollmentItem> enrollments;

  const AdminStudentDetail({
    required this.id,
    required this.fullName,
    required this.studentNumber,
    required this.gradeLevel,
    required this.schoolName,
    required this.status,
    this.birthDate,
    required this.currentJuz,
    required this.memorizedPages,
    required this.totalPoints,
    required this.parentName,
    required this.parentPhone,
    required this.parentEmail,
    required this.fatherName,
    required this.motherName,
    required this.enrollments,
  });

  bool get isActive => status == 'active';

  String get initials {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts.first[0]}${parts[1][0]}';
    return parts.isNotEmpty && parts.first.isNotEmpty
        ? parts.first[0]
        : L10nGateway.current.text76;
  }
}

// ─── Activity ─────────────────────────────────────────────────────────────────
class AdminActivityItem {
  final int id;
  final String title;
  final String? description;
  final String? activityDate;
  final String? groupName;
  final double feeAmount;
  final double expectedRevenue;
  final double collectedRevenue;
  final double expenseTotal;
  final bool isActive;

  const AdminActivityItem({
    required this.id,
    required this.title,
    this.description,
    this.activityDate,
    this.groupName,
    required this.feeAmount,
    required this.expectedRevenue,
    required this.collectedRevenue,
    required this.expenseTotal,
    required this.isActive,
  });
}

// ─── Scan attendance result (الحضور السريع) ───────────────────────────────────
class ScanAttendanceResult {
  final String attendanceStatusId;
  final String attendanceStatusName;
  final int enrollmentId;
  final int studentId;
  final String studentName;
  final int? groupId;
  final String? groupName;

  const ScanAttendanceResult({
    required this.attendanceStatusId,
    required this.attendanceStatusName,
    required this.enrollmentId,
    required this.studentId,
    required this.studentName,
    this.groupId,
    this.groupName,
  });
}
