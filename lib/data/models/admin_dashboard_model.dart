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

  factory AdminGroupItem.fromJson(Map<String, dynamic> json) {
    return AdminGroupItem(
      id: json['id'] as int,
      name: (json['name'] as String? ?? '').trim(),
      teacher: (json['teacher'] as String? ?? '').trim(),
      assistantTeacher: (json['assistant_teacher'] as String? ?? '').trim(),
      course: (json['course'] as String? ?? '').trim(),
      academicYear: (json['academic_year'] as String? ?? '').trim(),
      enrollmentsCount: json['enrollments_count'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      startsOn: json['starts_on'] as String?,
      endsOn: json['ends_on'] as String?,
    );
  }
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
  });

  factory AdminStudentItem.fromJson(Map<String, dynamic> json) {
    final first = (json['first_name'] as String? ?? '').trim();
    final last = (json['last_name'] as String? ?? '').trim();
    return AdminStudentItem(
      id: json['id'] as int,
      fullName: '$first $last'.trim(),
      studentNumber: json['student_number'] as String? ?? '',
      gradeLevel: json['grade_level'] as String? ?? '',
      parent: (json['parent'] as String? ?? '').trim(),
      schoolName: (json['school_name'] as String? ?? '').trim(),
      currentJuz: json['current_juz'] as int? ?? 1,
      status: json['status'] as String? ?? 'active',
      birthDate: json['birth_date'] as String?,
      enrollmentsCount: json['enrollments_count'] as int? ?? 0,
    );
  }

  String get initials {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts.first[0]}${parts[1][0]}';
    return parts.isNotEmpty && parts.first.isNotEmpty ? parts.first[0] : '؟';
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

  factory AdminEnrollmentItem.fromJson(Map<String, dynamic> json) {
    final student = json['student'] as Map<String, dynamic>? ?? {};
    final group = json['group'] as Map<String, dynamic>? ?? {};
    return AdminEnrollmentItem(
      id: json['id'] as int,
      studentName: (student['full_name'] as String? ?? '').trim(),
      studentId: student['id'] as int? ?? 0,
      parentName: student['parent_name'] as String?,
      groupName: (group['name'] as String? ?? '').trim(),
      groupId: group['id'] as int? ?? 0,
      courseName: (group['course_name'] as String? ?? '').trim(),
      finalPoints: json['final_points'] as int? ?? 0,
      memorizedPages: json['memorized_pages'] as int? ?? 0,
      status: json['status'] as String? ?? 'active',
      enrolledAt: json['enrolled_at'] as String? ?? '',
    );
  }

  String get studentInitials {
    final parts = studentName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts.first[0]}${parts[1][0]}';
    return parts.isNotEmpty && parts.first.isNotEmpty ? parts.first[0] : '؟';
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

  factory AdminAssessmentItem.fromJson(Map<String, dynamic> json) {
    final group = json['group'] as Map<String, dynamic>? ?? {};
    return AdminAssessmentItem(
      id: json['id'] as int,
      title: (json['title'] as String? ?? '').trim(),
      type: (json['type'] as String? ?? '').trim(),
      description: json['description'] as String?,
      groupName: (group['name'] as String? ?? '').trim(),
      groupId: group['id'] as int? ?? 0,
      courseName: (group['course_name'] as String? ?? '').trim(),
      totalMark: (json['total_mark'] as num? ?? 100).toDouble(),
      passMark: (json['pass_mark'] as num? ?? 60).toDouble(),
      resultsCount: json['results_count'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      scheduledAt: json['scheduled_at'] as String?,
      dueAt: json['due_at'] as String?,
    );
  }

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

  factory AdminInvoiceItem.fromJson(Map<String, dynamic> json) {
    return AdminInvoiceItem(
      id: json['id'] as int,
      invoiceNo: json['invoice_no'] as String? ?? '',
      invoiceType: json['invoice_type'] as String? ?? 'finance',
      parentName: json['parent'] as String?,
      total: (json['total'] as num? ?? 0).toDouble(),
      paidTotal: (json['paid_total'] as num? ?? 0).toDouble(),
      balance: (json['balance'] as num? ?? 0).toDouble(),
      discount: (json['discount'] as num? ?? 0).toDouble(),
      status: json['status'] as String? ?? 'issued',
      issueDate: json['issue_date'] as String? ?? '',
      dueDate: json['due_date'] as String?,
      itemsCount: json['items_count'] as int? ?? 0,
    );
  }

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
    return parts.isNotEmpty && parts.first.isNotEmpty ? parts.first[0] : '؟';
  }

  factory AdminStudentDetail.fromJson(Map<String, dynamic> json) {
    final first = (json['first_name'] as String? ?? '').trim();
    final last = (json['last_name'] as String? ?? '').trim();
    final parent = json['parent'] as Map<String, dynamic>? ?? {};
    final enrollmentsRaw = json['enrollments'] as List<dynamic>? ?? [];

    return AdminStudentDetail(
      id: json['id'] as int,
      fullName: '$first $last'.trim(),
      studentNumber: json['student_number'] as String? ?? '',
      gradeLevel: json['grade_level'] as String? ?? '',
      schoolName: (json['school_name'] as String? ?? '').trim(),
      status: json['status'] as String? ?? 'active',
      birthDate: json['birth_date'] as String?,
      currentJuz: json['current_juz'] as int? ?? 1,
      memorizedPages: json['memorized_pages'] as int? ?? 0,
      totalPoints: json['total_points'] as int? ?? 0,
      parentName: (parent['name'] as String? ??
              json['parent_name'] as String? ??
              '')
          .trim(),
      parentPhone: (parent['phone'] as String? ??
              json['parent_phone'] as String? ??
              '')
          .trim(),
      parentEmail: (parent['email'] as String? ??
              json['parent_email'] as String? ??
              '')
          .trim(),
      fatherName: (parent['father_name'] as String? ??
              json['father_name'] as String? ??
              '')
          .trim(),
      motherName: (parent['mother_name'] as String? ??
              json['mother_name'] as String? ??
              '')
          .trim(),
      enrollments: enrollmentsRaw
          .map((e) => AdminEnrollmentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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

  factory AdminActivityItem.fromJson(Map<String, dynamic> json) {
    final group = json['group'] as Map<String, dynamic>?;
    return AdminActivityItem(
      id: json['id'] as int,
      title: (json['title'] as String? ?? '').trim(),
      description: json['description'] as String?,
      activityDate: json['activity_date'] as String?,
      groupName: group != null ? (group['name'] as String? ?? '').trim() : null,
      feeAmount: (json['fee_amount'] as num? ?? 0).toDouble(),
      expectedRevenue: (json['expected_revenue'] as num? ?? 0).toDouble(),
      collectedRevenue: (json['collected_revenue'] as num? ?? 0).toDouble(),
      expenseTotal: (json['expense_total'] as num? ?? 0).toDouble(),
      isActive: json['is_active'] as bool? ?? false,
    );
  }
}
