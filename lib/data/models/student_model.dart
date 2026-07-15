enum AttendanceStatus {
  present,
  absent,
  late,
  excused,
  excusedEarlyDeparture,
  excusedAbsence,
}

// ─── API Attendance Entry (from /parent/children/{id}/attendance) ─────────────
class AttendanceEntry {
  final int id;
  final DateTime date;
  final String dayStatus;
  final String statusCode;
  final String statusName;
  final String? notes;
  final String groupName;
  final String teacherName;

  const AttendanceEntry({
    required this.id,
    required this.date,
    required this.dayStatus,
    required this.statusCode,
    required this.statusName,
    this.notes,
    required this.groupName,
    required this.teacherName,
  });

  factory AttendanceEntry.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as Map<String, dynamic>?;
    final group = json['group'] as Map<String, dynamic>?;
    final teacher = json['teacher'] as Map<String, dynamic>?;
    return AttendanceEntry(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      dayStatus: json['day_status'] as String? ?? '',
      statusCode: status?['code'] as String? ?? 'present',
      statusName: status?['name'] as String? ?? '',
      notes: json['notes'] as String?,
      groupName: group?['name'] as String? ?? '',
      teacherName: teacher?['full_name'] as String? ?? '',
    );
  }

  AttendanceStatus get attendanceStatus {
    switch (statusCode) {
      case 'present': return AttendanceStatus.present;
      case 'absent': return AttendanceStatus.absent;
      case 'late': return AttendanceStatus.late;
      case 'excused': return AttendanceStatus.excused;
      case 'excused_early_departure': return AttendanceStatus.excusedEarlyDeparture;
      case 'excused_absence': return AttendanceStatus.excusedAbsence;
      default: return AttendanceStatus.present;
    }
  }

  AttendanceRecord toAttendanceRecord() => AttendanceRecord(
    date: date,
    status: attendanceStatus,
    note: notes,
  );
}

// ─── API Memorization Entry (from /parent/children/{id}/memorization) ─────────
class MemorizationEntry {
  final int id;
  final DateTime date;
  final String entryType;
  final int fromPage;
  final int toPage;
  final int pagesCount;
  final List<int> pages;
  final String groupName;
  final String teacherName;
  final String? notes;

  const MemorizationEntry({
    required this.id,
    required this.date,
    required this.entryType,
    required this.fromPage,
    required this.toPage,
    required this.pagesCount,
    required this.pages,
    required this.groupName,
    required this.teacherName,
    this.notes,
  });

  factory MemorizationEntry.fromJson(Map<String, dynamic> json) {
    final group = json['group'] as Map<String, dynamic>?;
    final teacher = json['teacher'] as Map<String, dynamic>?;
    final pagesList = (json['pages'] as List<dynamic>?)
            ?.map((p) => (p as num).toInt())
            .toList() ??
        [];
    return MemorizationEntry(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      entryType: json['entry_type'] as String? ?? 'new',
      fromPage: (json['from_page'] as num?)?.toInt() ?? 0,
      toPage: (json['to_page'] as num?)?.toInt() ?? 0,
      pagesCount: (json['pages_count'] as num?)?.toInt() ?? 0,
      pages: pagesList,
      groupName: group?['name'] as String? ?? '',
      teacherName: teacher?['full_name'] as String? ?? '',
      notes: json['notes'] as String?,
    );
  }
}

enum EvaluationRating { excellent, veryGood, good, acceptable, needsWork }

enum SabrType { trial, final_, awqaf }

enum NoteAuthor { parent, teacher, admin }

/// Status of a Juz' in the memorization workflow
enum JuzStatus {
  notStarted,
  inProgress,       // some pages recited, no trial yet
  trialDone,        // trial assessment (5 pages) completed, final not yet
  fullyAssessed,    // final assessment (8 questions × 12 marks) completed
  fullyAssessedWaqf, // fully assessed + Waqf (pausing rules) mastered ⭐
}

// ─── Student ──────────────────────────────────────────────────────────────────
class StudentModel {
  final String id;
  final String name;
  final String avatarInitials;
  final String groupName;
  final String courseName;
  final String teacherName;
  final String academicYear;
  final int enrollmentYear;
  final String phone;
  final int? enrollmentId; // من API enrollments — يُستخدم لجلب بيانات إضافية

  const StudentModel({
    required this.id,
    required this.name,
    required this.avatarInitials,
    required this.groupName,
    required this.courseName,
    required this.teacherName,
    required this.academicYear,
    required this.enrollmentYear,
    required this.phone,
    this.enrollmentId,
  });
}

// ─── Attendance ───────────────────────────────────────────────────────────────
class AttendanceRecord {
  final DateTime date;
  final AttendanceStatus status;
  final String? note;

  const AttendanceRecord({
    required this.date,
    required this.status,
    this.note,
  });
}

// ─── Quran Juz Data ───────────────────────────────────────────────────────────
class JuzInfo {
  final int number;
  final String name;
  final String firstSurah;
  final int totalPages;

  const JuzInfo({
    required this.number,
    required this.name,
    required this.firstSurah,
    required this.totalPages,
  });
}

// ─── Juz Assessment ──────────────────────────────────────────────────────────
class JuzAssessment {
  /// For trial: number of pages tested (should be 5)
  final int trialPagesCount;
  final double? trialScore; // null = not done yet

  /// Final: 8 questions × 12 marks = 96 total
  final int? finalQuestionsAnswered; // null = not done
  final double? finalScore;          // out of 96

  /// Waqf (pausing rules) assessment passed
  final bool waqfPassed;

  const JuzAssessment({
    this.trialPagesCount = 5,
    this.trialScore,
    this.finalQuestionsAnswered,
    this.finalScore,
    this.waqfPassed = false,
  });

  bool get trialDone => trialScore != null;
  bool get finalDone => finalScore != null;
}

// ─── Memorization ─────────────────────────────────────────────────────────────

/// A recitation session: teacher listens from page X to page Y
class RecitationSession {
  final int fromPage;
  final int toPage;
  final DateTime date;
  final String teacherName;

  const RecitationSession({
    required this.fromPage,
    required this.toPage,
    required this.date,
    required this.teacherName,
  });

  int get pageCount => (toPage - fromPage).abs() + 1;
}

/// One stage of a practice (trial) exam
class PracticeExamStage {
  final int stageNumber;
  final DateTime date;
  final int errorCount;
  final bool wasRetaken;

  const PracticeExamStage({
    required this.stageNumber,
    required this.date,
    required this.errorCount,
    required this.wasRetaken,
  });
}

/// Final exam result for a juz
class FinalExam {
  final DateTime date;
  final double score; // out of 100

  const FinalExam({required this.date, required this.score});
}

enum JuzState {
  notStarted,   // grey
  inProgress,   // gold — some sessions but no practice yet
  practice,     // orange — practice stages started
  done,         // green — final exam passed
}

/// All data for one juz (all 30 are present in the list)
class JuzSection {
  final int juzNumber;
  final String juzName;
  final int firstPage; // first page of this juz in the Quran
  final int lastPage;  // last page
  final List<RecitationSession> sessions;       // recited ranges
  final List<int> pendingPages;                 // pages not yet recited
  final List<PracticeExamStage> practiceStages;
  final FinalExam? finalExam;

  const JuzSection({
    required this.juzNumber,
    required this.juzName,
    required this.firstPage,
    required this.lastPage,
    this.sessions = const [],
    this.pendingPages = const [],
    this.practiceStages = const [],
    this.finalExam,
  });

  int get totalPages => lastPage - firstPage + 1;

  /// Pages covered by all sessions
  int get recitedPageCount {
    int count = 0;
    for (final s in sessions) {
      count += s.pageCount;
    }
    return count.clamp(0, totalPages);
  }

  double get recitedPercentage =>
      totalPages == 0 ? 0 : recitedPageCount / totalPages;

  JuzState get state {
    if (finalExam != null) return JuzState.done;
    if (practiceStages.isNotEmpty) return JuzState.practice;
    if (sessions.isNotEmpty) return JuzState.inProgress;
    return JuzState.notStarted;
  }

  bool get isCompleted => finalExam != null;
}

class MemorizationProgress {
  final int totalPagesMemorized;
  final int totalQuranPages;
  final String currentSurah;
  final int currentJuz;
  final List<JuzSection> sections; // exactly 30 entries

  const MemorizationProgress({
    required this.totalPagesMemorized,
    required this.totalQuranPages,
    required this.currentSurah,
    required this.currentJuz,
    required this.sections,
  });

  double get percentage => totalPagesMemorized / totalQuranPages;
}


// ─── Sabr (Exam) ─────────────────────────────────────────────────────────────
class SabrRecord {
  final String id;
  final DateTime date;
  final SabrType type;
  final String title;
  final String surahFrom;
  final String surahTo;
  final List<int> pageNumbers;
  final int totalPages;
  final EvaluationRating rating;
  final double score;
  final String examinerName;
  final String notes;
  final bool isPassed;

  const SabrRecord({
    required this.id,
    required this.date,
    required this.type,
    required this.title,
    required this.surahFrom,
    required this.surahTo,
    required this.pageNumbers,
    required this.totalPages,
    required this.rating,
    required this.score,
    required this.examinerName,
    required this.notes,
    required this.isPassed,
  });
}

// ─── Notes / Messages ─────────────────────────────────────────────────────────
class NoteMessage {
  final String id;
  final DateTime dateTime;
  final NoteAuthor author;
  final String authorName;
  final String content;
  final bool isRead;

  const NoteMessage({
    required this.id,
    required this.dateTime,
    required this.author,
    required this.authorName,
    required this.content,
    required this.isRead,
  });
}

// ─── Points ───────────────────────────────────────────────────────────────────
class PointRecord {
  final DateTime date;
  final int points;
  final String reason;
  final bool isBonus;

  const PointRecord({
    required this.date,
    required this.points,
    required this.reason,
    required this.isBonus,
  });
}

class EvaluationRecord {
  final DateTime date;
  final String subject;
  final EvaluationRating rating;
  final String teacherComment;

  const EvaluationRecord({
    required this.date,
    required this.subject,
    required this.rating,
    required this.teacherComment,
  });
}

// ─── Notifications ────────────────────────────────────────────────────────────
class AppNotification {
  final String id;
  final String title;
  final String body;
  final DateTime dateTime;
  final NotificationType type;
  final bool isRead;

  const AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.type,
    required this.isRead,
  });
}

enum NotificationType { attendance, memorization, points, evaluation, general, sabr, notes }

// ─── Dashboard Data ───────────────────────────────────────────────────────────
/// Per-child data bundle used by the parent dashboard.
class ChildData {
  final StudentModel student;
  final List<AttendanceRecord> attendanceRecords;
  final MemorizationProgress memorizationProgress;
  final List<PointRecord> pointRecords;
  final List<EvaluationRecord> evaluations;
  final List<SabrRecord> sabrRecords;
  final List<NoteMessage> notes;
  final int totalPoints;

  const ChildData({
    required this.student,
    required this.attendanceRecords,
    required this.memorizationProgress,
    required this.pointRecords,
    required this.evaluations,
    required this.sabrRecords,
    required this.notes,
    required this.totalPoints,
  });

  int get attendanceCount =>
      attendanceRecords.where((r) => r.status == AttendanceStatus.present).length;

  int get absenceCount =>
      attendanceRecords.where((r) => r.status == AttendanceStatus.absent).length;

  double get attendanceRate =>
      attendanceRecords.isEmpty ? 0 : attendanceCount / attendanceRecords.length;

  int get unreadNotes =>
      notes.where((n) => !n.isRead && n.author != NoteAuthor.parent).length;
}

class ParentDashboardData {
  /// All children linked to this parent account.
  final List<ChildData> children;
  final List<AppNotification> notifications;

  const ParentDashboardData({
    required this.children,
    required this.notifications,
  });

  // Convenience getters that delegate to the first child (legacy callers).
  ChildData get activeChild => children.first;
  StudentModel get student => activeChild.student;
  List<AttendanceRecord> get attendanceRecords => activeChild.attendanceRecords;
  MemorizationProgress get memorizationProgress => activeChild.memorizationProgress;
  List<PointRecord> get pointRecords => activeChild.pointRecords;
  List<EvaluationRecord> get evaluations => activeChild.evaluations;
  List<SabrRecord> get sabrRecords => activeChild.sabrRecords;
  List<NoteMessage> get notes => activeChild.notes;
  int get totalPoints => activeChild.totalPoints;

  int get attendanceCount => activeChild.attendanceCount;
  int get absenceCount    => activeChild.absenceCount;
  double get attendanceRate => activeChild.attendanceRate;

  int get unreadNotifications => notifications.where((n) => !n.isRead).length;
  int get unreadNotes         => activeChild.unreadNotes;
}

// ─── Parent Profile (from /parent/profile) ───────────────────────────────────
class ParentUser {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;

  const ParentUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory ParentUser.fromJson(Map<String, dynamic> json) => ParentUser(
        id: json['id'] as int,
        name: json['name'] as String? ?? '',
        username: json['username'] as String? ?? '',
        email: json['email'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
      );
}

class ChildSummary {
  final int id;
  final String studentNumber;
  final String fullName;
  final String firstName;
  final String lastName;
  final String status;
  final String? birthDate;
  final String gender;
  final String? gradeLevelName;
  final int? quranCurrentJuz;

  const ChildSummary({
    required this.id,
    required this.studentNumber,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.status,
    this.birthDate,
    required this.gender,
    this.gradeLevelName,
    this.quranCurrentJuz,
  });

  factory ChildSummary.fromJson(Map<String, dynamic> json) {
    final grade = json['grade_level'] as Map<String, dynamic>?;
    final juz = json['quran_current_juz'] as Map<String, dynamic>?;
    return ChildSummary(
      id: json['id'] as int,
      studentNumber: json['student_number']?.toString() ?? '',
      fullName: json['full_name'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      status: json['status'] as String? ?? '',
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String? ?? '',
      gradeLevelName: grade?['name'] as String?,
      quranCurrentJuz: juz?['juz_number'] as int?,
    );
  }
}

class ParentProfile {
  final int id;
  final String parentNumber;
  final String fatherName;
  final String fatherWork;
  final String fatherPhone;
  final String motherName;
  final String motherPhone;
  final String homePhone;
  final String address;
  final bool isActive;
  final ParentUser user;
  final int childrenCount;
  final List<ChildSummary> children;

  const ParentProfile({
    required this.id,
    required this.parentNumber,
    required this.fatherName,
    required this.fatherWork,
    required this.fatherPhone,
    required this.motherName,
    required this.motherPhone,
    required this.homePhone,
    required this.address,
    required this.isActive,
    required this.user,
    required this.childrenCount,
    required this.children,
  });

  factory ParentProfile.fromJson(Map<String, dynamic> json) {
    final childrenJson = json['children'] as List<dynamic>? ?? [];
    return ParentProfile(
      id: json['id'] as int,
      parentNumber: json['parent_number'] as String? ?? '',
      fatherName: json['father_name'] as String? ?? '',
      fatherWork: json['father_work'] as String? ?? '',
      fatherPhone: json['father_phone'] as String? ?? '',
      motherName: json['mother_name'] as String? ?? '',
      motherPhone: json['mother_phone'] as String? ?? '',
      homePhone: json['home_phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
      user: ParentUser.fromJson(json['user'] as Map<String, dynamic>),
      childrenCount: json['children_count'] as int? ?? 0,
      children: childrenJson
          .map((c) => ChildSummary.fromJson(c as Map<String, dynamic>))
          .toList(),
    );
  }

  String get avatarInitials {
    final parts = fatherName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts.first[0]} ${parts.last[0]}';
    return parts.isNotEmpty && parts.first.isNotEmpty ? parts.first[0] : '؟';
  }
}

// ─── Parent Summary (from /parent/summary) ───────────────────────────────────
class ParentSummary {
  final int children;
  final int activeEnrollments;
  final int memorizedPages;
  final int points;
  final double invoiceTotal;
  final double paidTotal;
  final double balance;
  final int unreadNotes;
  final int availableActivityResponses;

  const ParentSummary({
    required this.children,
    required this.activeEnrollments,
    required this.memorizedPages,
    required this.points,
    required this.invoiceTotal,
    required this.paidTotal,
    required this.balance,
    required this.unreadNotes,
    required this.availableActivityResponses,
  });

  factory ParentSummary.fromJson(Map<String, dynamic> json) => ParentSummary(
        children: json['children'] as int? ?? 0,
        activeEnrollments: json['active_enrollments'] as int? ?? 0,
        memorizedPages: json['memorized_pages'] as int? ?? 0,
        points: json['points'] as int? ?? 0,
        invoiceTotal: (json['invoice_total'] as num?)?.toDouble() ?? 0,
        paidTotal: (json['paid_total'] as num?)?.toDouble() ?? 0,
        balance: (json['balance'] as num?)?.toDouble() ?? 0,
        unreadNotes: json['unread_notes'] as int? ?? 0,
        availableActivityResponses:
            json['available_activity_responses'] as int? ?? 0,
      );
}

// ─── Student Parent Info (from /students/{id} supervisor endpoint) ───────────
class StudentParentInfo {
  final String fatherName;
  final String motherName;
  final String fatherPhone;
  final String motherPhone;
  final String homePhone;
  final String address;
  final String email;

  const StudentParentInfo({
    required this.fatherName,
    required this.motherName,
    required this.fatherPhone,
    required this.motherPhone,
    required this.homePhone,
    required this.address,
    required this.email,
  });

  factory StudentParentInfo.fromJson(Map<String, dynamic> json) {
    final parent = json['parent'] as Map<String, dynamic>? ?? {};
    return StudentParentInfo(
      fatherName: (parent['father_name'] as String? ?? json['parent_name'] as String? ?? '').trim(),
      motherName: (parent['mother_name'] as String? ?? '').trim(),
      fatherPhone: (parent['father_phone'] as String? ?? parent['phone'] as String? ?? '').trim(),
      motherPhone: (parent['mother_phone'] as String? ?? '').trim(),
      homePhone: (parent['home_phone'] as String? ?? '').trim(),
      address: (parent['address'] as String? ?? '').trim(),
      email: (parent['email'] as String? ?? '').trim(),
    );
  }

  bool get hasAnyData => fatherName.isNotEmpty || motherName.isNotEmpty || fatherPhone.isNotEmpty;
}

// ─── Child Detail (from /parent/children and /parent/children/{id}) ──────────
class EnrollmentGroup {
  final int id;
  final String name;
  final String courseName;
  final String teacherName;
  final String teacherPhone;

  const EnrollmentGroup({
    required this.id,
    required this.name,
    required this.courseName,
    required this.teacherName,
    required this.teacherPhone,
  });

  factory EnrollmentGroup.fromJson(Map<String, dynamic> json) {
    final course = json['course'] as Map<String, dynamic>?;
    final teacher = json['teacher'] as Map<String, dynamic>?;
    return EnrollmentGroup(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      courseName: course?['name'] as String? ?? '',
      teacherName: teacher?['full_name'] as String? ?? '',
      teacherPhone: teacher?['phone'] as String? ?? '',
    );
  }
}

class ActiveEnrollment {
  final int id;
  final String status;
  final String enrolledAt;
  final String? leftAt;
  final int memorizedPages;
  final int points;
  final EnrollmentGroup group;

  const ActiveEnrollment({
    required this.id,
    required this.status,
    required this.enrolledAt,
    this.leftAt,
    required this.memorizedPages,
    required this.points,
    required this.group,
  });

  factory ActiveEnrollment.fromJson(Map<String, dynamic> json) =>
      ActiveEnrollment(
        id: json['id'] as int,
        status: json['status'] as String? ?? '',
        enrolledAt: json['enrolled_at'] as String? ?? '',
        leftAt: json['left_at'] as String?,
        memorizedPages: (json['memorized_pages'] as num?)?.toInt() ?? 0,
        points: (json['points'] as num?)?.toInt() ?? 0,
        group: EnrollmentGroup.fromJson(
            json['group'] as Map<String, dynamic>),
      );
}

class ChildDetail {
  final int id;
  final String studentNumber;
  final String fullName;
  final String firstName;
  final String lastName;
  final String status;
  final String? birthDate;
  final String gender;
  final String? gradeLevelName;
  final int? quranCurrentJuz;
  final String? schoolName;
  final String? joinedAt;
  final int memorizedPages;
  final int points;
  final List<ActiveEnrollment> activeEnrollments;

  const ChildDetail({
    required this.id,
    required this.studentNumber,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.status,
    this.birthDate,
    required this.gender,
    this.gradeLevelName,
    this.quranCurrentJuz,
    this.schoolName,
    this.joinedAt,
    required this.memorizedPages,
    required this.points,
    required this.activeEnrollments,
  });

  factory ChildDetail.fromJson(Map<String, dynamic> json) {
    final grade = json['grade_level'] as Map<String, dynamic>?;
    final juz = json['quran_current_juz'] as Map<String, dynamic>?;
    final enrollments = json['active_enrollments'] as List<dynamic>? ?? [];
    return ChildDetail(
      id: json['id'] as int,
      studentNumber: json['student_number']?.toString() ?? '',
      fullName: json['full_name'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      status: json['status'] as String? ?? '',
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String? ?? '',
      gradeLevelName: grade?['name'] as String?,
      quranCurrentJuz: juz?['juz_number'] as int?,
      schoolName: json['school_name'] as String?,
      joinedAt: json['joined_at'] as String?,
      memorizedPages: (json['memorized_pages'] as num?)?.toInt() ?? 0,
      points: (json['points'] as num?)?.toInt() ?? 0,
      activeEnrollments: enrollments
          .map((e) => ActiveEnrollment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String get avatarInitials {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts.first[0]} ${parts.last[0]}';
    return parts.isNotEmpty && parts.first.isNotEmpty ? parts.first[0] : '؟';
  }

  String get groupName =>
      activeEnrollments.isNotEmpty ? activeEnrollments.first.group.name : '';

  String get courseName =>
      activeEnrollments.isNotEmpty ? activeEnrollments.first.group.courseName : '';

  String get teacherName =>
      activeEnrollments.isNotEmpty ? activeEnrollments.first.group.teacherName : '';
}

// ─── API Quran Test Entry (from /parent/children/{id}/quran-tests) ───────────
class QuranTestAttempt {
  final int id;
  final DateTime testedOn;
  final double? score;
  final String status;
  final int attemptNo;
  final String teacherName;
  final String? notes;

  const QuranTestAttempt({
    required this.id,
    required this.testedOn,
    required this.score,
    required this.status,
    required this.attemptNo,
    required this.teacherName,
    this.notes,
  });

  factory QuranTestAttempt.fromJson(Map<String, dynamic> json) {
    final teacher = json['teacher'] as Map<String, dynamic>?;
    return QuranTestAttempt(
      id: json['id'] as int,
      testedOn: DateTime.parse(json['tested_on'] as String),
      score: (json['score'] as num?)?.toDouble(),
      status: json['status'] as String? ?? '',
      attemptNo: json['attempt_no'] as int? ?? 1,
      teacherName: teacher?['full_name'] as String? ?? '',
      notes: json['notes'] as String?,
    );
  }
}

class QuranTestPart {
  final int id;
  final int partNumber;
  final String status;
  final String? passedOn;
  final List<QuranTestAttempt> attempts;

  const QuranTestPart({
    required this.id,
    required this.partNumber,
    required this.status,
    this.passedOn,
    required this.attempts,
  });

  factory QuranTestPart.fromJson(Map<String, dynamic> json) {
    final attempts = (json['attempts'] as List<dynamic>? ?? [])
        .map((a) => QuranTestAttempt.fromJson(a as Map<String, dynamic>))
        .toList();
    return QuranTestPart(
      id: json['id'] as int,
      partNumber: json['part_number'] as int? ?? 1,
      status: json['status'] as String? ?? '',
      passedOn: json['passed_on'] as String?,
      attempts: attempts,
    );
  }
}

class QuranTestEntry {
  final int id;
  final String kind; // 'partial' | 'final'
  final DateTime date;
  final String status;
  final int juzNumber;
  final int juzFromPage;
  final int juzToPage;
  final String groupName;
  final String teacherName;
  final List<QuranTestPart> parts;
  final List<QuranTestAttempt> attempts; // for final tests

  const QuranTestEntry({
    required this.id,
    required this.kind,
    required this.date,
    required this.status,
    required this.juzNumber,
    required this.juzFromPage,
    required this.juzToPage,
    required this.groupName,
    required this.teacherName,
    required this.parts,
    required this.attempts,
  });

  factory QuranTestEntry.fromJson(Map<String, dynamic> json) {
    final juz = json['juz'] as Map<String, dynamic>?;
    final group = json['group'] as Map<String, dynamic>?;
    final teacher = group?['teacher'] as Map<String, dynamic>?;
    final parts = (json['parts'] as List<dynamic>? ?? [])
        .map((p) => QuranTestPart.fromJson(p as Map<String, dynamic>))
        .toList();
    final attempts = (json['attempts'] as List<dynamic>? ?? [])
        .map((a) => QuranTestAttempt.fromJson(a as Map<String, dynamic>))
        .toList();
    return QuranTestEntry(
      id: json['id'] as int,
      kind: json['kind'] as String? ?? 'final',
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String? ?? '',
      juzNumber: juz?['juz_number'] as int? ?? 0,
      juzFromPage: juz?['from_page'] as int? ?? 0,
      juzToPage: juz?['to_page'] as int? ?? 0,
      groupName: group?['name'] as String? ?? '',
      teacherName: teacher?['full_name'] as String? ?? '',
      parts: parts,
      attempts: attempts,
    );
  }

  bool get isPassed => status == 'passed';
  bool get isPartial => kind == 'partial';
  bool get isFinal => kind == 'final';

  /// الدرجة: أول محاولة ناجحة أو الأخيرة
  double? get score {
    final allAttempts = isFinal ? attempts : parts.expand((p) => p.attempts).toList();
    if (allAttempts.isEmpty) return null;
    final passed = allAttempts.where((a) => a.status == 'passed' && a.score != null);
    return passed.isNotEmpty ? passed.first.score : allAttempts.last.score;
  }

  /// عدد الأجزاء أو صفحات الجزء
  List<int> get pageNumbers {
    final pages = <int>[];
    for (int p = juzFromPage; p <= juzToPage; p++) { pages.add(p); }
    return pages;
  }

  /// اسم الجزء للعرض
  String get juzTitle => 'الجزء $juzNumber';

  /// تحويل إلى SabrRecord للواجهة القديمة
  SabrRecord toSabrRecord() => SabrRecord(
    id: '$id',
    date: date,
    type: isFinal ? SabrType.final_ : SabrType.trial,
    title: juzTitle,
    surahFrom: 'ص $juzFromPage',
    surahTo: 'ص $juzToPage',
    pageNumbers: pageNumbers,
    totalPages: juzToPage - juzFromPage + 1,
    rating: _scoreToRating(score),
    score: score ?? 0,
    examinerName: teacherName,
    notes: _buildNotes(),
    isPassed: isPassed,
  );

  String _buildNotes() {
    final allAttempts = isFinal ? attempts : parts.expand((p) => p.attempts).toList();
    final notes = allAttempts
        .where((a) => a.notes != null && a.notes!.trim().isNotEmpty)
        .map((a) => a.notes!)
        .toSet()
        .toList();
    return notes.isNotEmpty ? notes.first : '';
  }

  static EvaluationRating _scoreToRating(double? score) {
    if (score == null) return EvaluationRating.needsWork;
    if (score >= 90) return EvaluationRating.excellent;
    if (score >= 80) return EvaluationRating.veryGood;
    if (score >= 70) return EvaluationRating.good;
    if (score >= 60) return EvaluationRating.acceptable;
    return EvaluationRating.needsWork;
  }
}

// ─── API Note Entry (from /parent/children/{id}/notes) ───────────────────────
class NoteEntry {
  final int id;
  final String source; // 'teacher' | 'admin' | 'parent'
  final DateTime notedAt;
  final String body;
  final String? groupName;
  final int authorId;
  final String authorName;

  const NoteEntry({
    required this.id,
    required this.source,
    required this.notedAt,
    required this.body,
    this.groupName,
    required this.authorId,
    required this.authorName,
  });

  factory NoteEntry.fromJson(Map<String, dynamic> json) {
    final author = json['author'] as Map<String, dynamic>?;
    final group = json['group'] as Map<String, dynamic>?;
    return NoteEntry(
      id: json['id'] as int,
      source: json['source'] as String? ?? 'teacher',
      notedAt: DateTime.parse(json['noted_at'] as String),
      body: json['body'] as String? ?? '',
      groupName: group?['name'] as String?,
      authorId: author?['id'] as int? ?? 0,
      authorName: author?['name'] as String? ?? '',
    );
  }

  NoteAuthor get noteAuthor {
    switch (source) {
      case 'parent': return NoteAuthor.parent;
      case 'admin': return NoteAuthor.admin;
      default: return NoteAuthor.teacher;
    }
  }

  NoteMessage toNoteMessage() => NoteMessage(
    id: '$id',
    dateTime: notedAt,
    author: noteAuthor,
    authorName: authorName,
    content: body,
    isRead: true,
  );
}

// ─── API Point Entry (from /parent/children/{id}/points) ─────────────────────
class PointEntry {
  final int id;
  final DateTime enteredAt;
  final int points;
  final String sourceType;
  final String pointTypeCode;
  final String pointTypeName;
  final String pointTypeCategory;
  final String? policyName;
  final String groupName;
  final String teacherName;
  final String? notes;

  const PointEntry({
    required this.id,
    required this.enteredAt,
    required this.points,
    required this.sourceType,
    required this.pointTypeCode,
    required this.pointTypeName,
    required this.pointTypeCategory,
    this.policyName,
    required this.groupName,
    required this.teacherName,
    this.notes,
  });

  factory PointEntry.fromJson(Map<String, dynamic> json) {
    final pt = json['point_type'] as Map<String, dynamic>?;
    final policy = json['policy'] as Map<String, dynamic>?;
    final group = json['group'] as Map<String, dynamic>?;
    final teacher = json['teacher'] as Map<String, dynamic>?;
    return PointEntry(
      id: json['id'] as int,
      enteredAt: DateTime.parse(json['entered_at'] as String),
      points: (json['points'] as num).toInt(),
      sourceType: json['source_type'] as String? ?? '',
      pointTypeCode: pt?['code'] as String? ?? '',
      pointTypeName: pt?['name'] as String? ?? '',
      pointTypeCategory: pt?['category'] as String? ?? '',
      policyName: policy?['name'] as String?,
      groupName: group?['name'] as String? ?? '',
      teacherName: teacher?['full_name'] as String? ?? '',
      notes: json['notes'] as String?,
    );
  }

  /// هل مصدر النقاط مكافأة (غير حفظ مباشر)
  bool get isBonus => pointTypeCategory != 'memorization';

  /// تحويل إلى PointRecord المستخدم في الواجهة القديمة
  PointRecord toPointRecord() => PointRecord(
    date: enteredAt,
    points: points,
    reason: notes ?? pointTypeName,
    isBonus: isBonus,
  );

}

// ─── Student Dashboard Data (for student login) ───────────────────────────────
class StudentDashboardData {
  final StudentModel student;
  final MemorizationProgress memorizationProgress;
  final List<AttendanceRecord> attendanceRecords;
  final List<PointRecord> pointRecords;
  final List<SabrRecord> sabrRecords;
  final int totalPoints;

  const StudentDashboardData({
    required this.student,
    required this.memorizationProgress,
    required this.attendanceRecords,
    required this.pointRecords,
    required this.sabrRecords,
    required this.totalPoints,
  });

  double get attendanceRate {
    if (attendanceRecords.isEmpty) return 0;
    final present =
        attendanceRecords.where((r) => r.status == AttendanceStatus.present).length;
    return present / attendanceRecords.length;
  }
}
