import '../models/student_model.dart';

abstract final class MockDataService {
  static ParentDashboardData getDashboardData() {
    return ParentDashboardData(
      children: [_childData1(), _childData2()],
      notifications: _notifications,
    );
  }

  static StudentDashboardData getStudentDashboardData() {
    final c = _childData1();
    return StudentDashboardData(
      student: c.student,
      memorizationProgress: c.memorizationProgress,
      attendanceRecords: c.attendanceRecords,
      pointRecords: c.pointRecords,
      sabrRecords: c.sabrRecords,
      totalPoints: c.totalPoints,
    );
  }

  // ─── Child 1 ────────────────────────────────────────────────────────────────
  static ChildData _childData1() {
    return ChildData(
      student: _student1,
      attendanceRecords: _generateAttendance1(),
      memorizationProgress: _memorizationProgress1,
      pointRecords: _pointRecords1,
      evaluations: _evaluations1,
      sabrRecords: _sabrRecords1,
      notes: _notes1,
      totalPoints: 1240,
    );
  }

  static const _student1 = StudentModel(
    id: 'STU-2024-042',
    name: 'عبد الرحمن محمد الأحمد',
    avatarInitials: 'ع م',
    groupName: 'حلقة المصلحون 2',
    courseName: 'دورة صيف 2026',
    teacherName: 'الأستاذ عبد الله شعار',
    academicYear: '2025 - 2026 م',
    enrollmentYear: 2024,
    phone: '+966 50 123 4567',
  );

  static List<AttendanceRecord> _generateAttendance1() {
    final now = DateTime.now();
    final statuses = [
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.late,
      AttendanceStatus.present,
      AttendanceStatus.absent,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.excused,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.excusedEarlyDeparture,
      AttendanceStatus.late,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.excusedAbsence,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.late,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
    ];
    final notes = {
      AttendanceStatus.absent: 'غياب بدون عذر',
      AttendanceStatus.late: 'تأخر عن موعد الحلقة',
      AttendanceStatus.excused: 'غياب بعذر مقبول',
      AttendanceStatus.excusedEarlyDeparture: 'انصراف مبكر بعذر',
      AttendanceStatus.excusedAbsence: 'غياب مع تقديم عذر مسبق',
    };

    final records = <AttendanceRecord>[];
    for (int i = statuses.length - 1; i >= 0; i--) {
      final date = now.subtract(Duration(days: statuses.length - 1 - i));
      if (date.weekday != DateTime.friday &&
          date.weekday != DateTime.saturday) {
        records.add(AttendanceRecord(
          date: date,
          status: statuses[i],
          note: notes[statuses[i]],
        ));
      }
    }
    return records;
  }

  // ─── Juz page ranges (standard Quran pagination, 20 pages each) ─────────────
  static const _juzNames = [
    'الجزء الأول',
    'الجزء الثاني',
    'الجزء الثالث',
    'الجزء الرابع',
    'الجزء الخامس',
    'الجزء السادس',
    'الجزء السابع',
    'الجزء الثامن',
    'الجزء التاسع',
    'الجزء العاشر',
    'الجزء الحادي عشر',
    'الجزء الثاني عشر',
    'الجزء الثالث عشر',
    'الجزء الرابع عشر',
    'الجزء الخامس عشر',
    'الجزء السادس عشر',
    'الجزء السابع عشر',
    'الجزء الثامن عشر',
    'الجزء التاسع عشر',
    'الجزء العشرون',
    'الجزء الحادي والعشرون',
    'الجزء الثاني والعشرون',
    'الجزء الثالث والعشرون',
    'الجزء الرابع والعشرون',
    'الجزء الخامس والعشرون',
    'الجزء السادس والعشرون',
    'الجزء السابع والعشرون',
    'الجزء الثامن والعشرون',
    'الجزء التاسع والعشرون',
    'الجزء الثلاثون',
  ];

  // ─── Juz Sections for Child 1 ───────────────────────────────────────────────
  // عبد الرحمن: أتمّ الأجزاء 1–12، الجزء 13 في سبر تجريبي، 14 في سبر نهائي، 15 جارٍ
  static List<JuzSection> _buildSections1() {
    final now = DateTime.now();
    const teacher = 'الأستاذ عبد الله شعار';
    final sections = <JuzSection>[];

    for (int i = 0; i < 30; i++) {
      final juzNum = i + 1;
      final firstPage = i * 20 + 1;
      final lastPage = firstPage + 19;

      if (juzNum <= 12) {
        // Fully completed juzs (1–12): done + final exam
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
          sessions: [
            RecitationSession(
                fromPage: firstPage,
                toPage: firstPage + 4,
                date: now.subtract(Duration(days: 300 - juzNum * 20 + 15)),
                teacherName: teacher),
            RecitationSession(
                fromPage: firstPage + 5,
                toPage: firstPage + 9,
                date: now.subtract(Duration(days: 300 - juzNum * 20 + 10)),
                teacherName: teacher),
            RecitationSession(
                fromPage: firstPage + 10,
                toPage: firstPage + 14,
                date: now.subtract(Duration(days: 300 - juzNum * 20 + 5)),
                teacherName: teacher),
            RecitationSession(
                fromPage: firstPage + 15,
                toPage: lastPage,
                date: now.subtract(Duration(days: 300 - juzNum * 20)),
                teacherName: teacher),
          ],
          pendingPages: const [],
          practiceStages: [
            PracticeExamStage(
                stageNumber: 1,
                date: now.subtract(Duration(days: 290 - juzNum * 20)),
                errorCount: 2 + juzNum % 3,
                wasRetaken: juzNum % 5 == 0),
            PracticeExamStage(
                stageNumber: 2,
                date: now.subtract(Duration(days: 286 - juzNum * 20)),
                errorCount: 1,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 3,
                date: now.subtract(Duration(days: 282 - juzNum * 20)),
                errorCount: 0,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 4,
                date: now.subtract(Duration(days: 278 - juzNum * 20)),
                errorCount: 0,
                wasRetaken: false),
          ],
          finalExam: FinalExam(
            date: now.subtract(Duration(days: 270 - juzNum * 20)),
            score: 85.0 + (juzNum % 4) * 2.5,
          ),
        ));
      } else if (juzNum == 13) {
        // Practice stages done, awaiting final exam
        sections.add(JuzSection(
          juzNumber: 13,
          juzName: _juzNames[12],
          firstPage: 241,
          lastPage: 260,
          sessions: [
            RecitationSession(
                fromPage: 241,
                toPage: 245,
                date: now.subtract(const Duration(days: 65)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 246,
                toPage: 250,
                date: now.subtract(const Duration(days: 60)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 251,
                toPage: 255,
                date: now.subtract(const Duration(days: 55)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 256,
                toPage: 260,
                date: now.subtract(const Duration(days: 50)),
                teacherName: teacher),
          ],
          pendingPages: const [],
          practiceStages: [
            PracticeExamStage(
                stageNumber: 1,
                date: now.subtract(const Duration(days: 45)),
                errorCount: 3,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 2,
                date: now.subtract(const Duration(days: 40)),
                errorCount: 1,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 3,
                date: now.subtract(const Duration(days: 36)),
                errorCount: 2,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 4,
                date: now.subtract(const Duration(days: 32)),
                errorCount: 0,
                wasRetaken: false),
          ],
          finalExam: FinalExam(
              date: now.subtract(const Duration(days: 30)), score: 90.0),
        ));
      } else if (juzNum == 14) {
        // All recited, practice done, no final yet
        sections.add(JuzSection(
          juzNumber: 14,
          juzName: _juzNames[13],
          firstPage: 261,
          lastPage: 280,
          sessions: [
            RecitationSession(
                fromPage: 261,
                toPage: 265,
                date: now.subtract(const Duration(days: 38)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 266,
                toPage: 270,
                date: now.subtract(const Duration(days: 33)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 271,
                toPage: 275,
                date: now.subtract(const Duration(days: 28)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 276,
                toPage: 280,
                date: now.subtract(const Duration(days: 23)),
                teacherName: teacher),
          ],
          pendingPages: const [],
          practiceStages: [
            PracticeExamStage(
                stageNumber: 1,
                date: now.subtract(const Duration(days: 18)),
                errorCount: 5,
                wasRetaken: true),
            PracticeExamStage(
                stageNumber: 2,
                date: now.subtract(const Duration(days: 14)),
                errorCount: 2,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 3,
                date: now.subtract(const Duration(days: 10)),
                errorCount: 1,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 4,
                date: now.subtract(const Duration(days: 7)),
                errorCount: 0,
                wasRetaken: false),
          ],
          finalExam: null,
        ));
      } else if (juzNum == 15) {
        // In progress — some sessions done, pages 291–300 pending
        sections.add(JuzSection(
          juzNumber: 15,
          juzName: _juzNames[14],
          firstPage: 281,
          lastPage: 300,
          sessions: [
            RecitationSession(
                fromPage: 281,
                toPage: 284,
                date: now.subtract(const Duration(days: 9)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 285,
                toPage: 288,
                date: now.subtract(const Duration(days: 6)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 289,
                toPage: 290,
                date: now.subtract(const Duration(days: 3)),
                teacherName: teacher),
          ],
          pendingPages: const [
            291,
            292,
            293,
            294,
            295,
            296,
            297,
            298,
            299,
            300
          ],
          practiceStages: const [],
          finalExam: null,
        ));
      } else {
        // Not started (16–30)
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
        ));
      }
    }
    return sections;
  }

  static final _memorizationProgress1 = MemorizationProgress(
    totalPagesMemorized: 290,
    totalQuranPages: 604,
    currentSurah: 'سورة الكهف',
    currentJuz: 15,
    sections: _buildSections1(),
  );

  static final List<SabrRecord> _sabrRecords1 = [
    SabrRecord(
      id: 'SAB-001',
      date: DateTime.now().subtract(const Duration(days: 5)),
      type: SabrType.trial,
      title: 'سبر تجريبي - الجزء الخامس عشر (5 صفحات)',
      surahFrom: 'سورة الإسراء',
      surahTo: 'سورة الكهف',
      pageNumbers: [281, 282, 285, 287, 288],
      totalPages: 5,
      rating: EvaluationRating.veryGood,
      score: 82.0,
      examinerName: 'الأستاذ عبد الله شعار',
      notes: 'أداء جيد جداً، بعض الأخطاء البسيطة في التجويد يمكن تصحيحها',
      isPassed: true,
    ),
    SabrRecord(
      id: 'SAB-002',
      date: DateTime.now().subtract(const Duration(days: 30)),
      type: SabrType.final_,
      title: 'سبر شامل - الجزء الثالث عشر (8 أسئلة)',
      surahFrom: 'سورة يوسف',
      surahTo: 'سورة إبراهيم',
      pageNumbers: List<int>.generate(20, (i) => 241 + i),
      totalPages: 20,
      rating: EvaluationRating.excellent,
      score: 90.0,
      examinerName: 'الأستاذ أحمد القاضي',
      notes: 'ممتاز! 8 أسئلة × 12 درجة = 96 درجة. حصل على 90. أداء رائع.',
      isPassed: true,
    ),
    SabrRecord(
      id: 'SAB-003',
      date: DateTime.now().subtract(const Duration(days: 60)),
      type: SabrType.awqaf,
      title: 'سبر الأوقاف - الأجزاء 1-10',
      surahFrom: 'سورة الفاتحة',
      surahTo: 'سورة يونس',
      pageNumbers: List<int>.generate(200, (i) => i + 1),
      totalPages: 200,
      rating: EvaluationRating.excellent,
      score: 91.0,
      examinerName: 'لجنة الأوقاف - مسجد الخير',
      notes:
          'اجتاز سبر الأوقاف بنجاح للأجزاء 1-10. أتقن أحكام الوقف والابتداء.',
      isPassed: true,
    ),
  ];

  static final List<NoteMessage> _notes1 = [
    NoteMessage(
      id: 'N001',
      dateTime: DateTime.now().subtract(const Duration(hours: 3)),
      author: NoteAuthor.teacher,
      authorName: 'الأستاذ عبد الله شعار',
      content:
          'أحسنتم، عبد الرحمن يتقدم بشكل ممتاز هذا الأسبوع. أرجو المتابعة معه في المراجعة المسائية.',
      isRead: false,
    ),
    NoteMessage(
      id: 'N002',
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      author: NoteAuthor.parent,
      authorName: 'ولي الأمر',
      content:
          'جزاكم الله خيراً شيخنا، سنحرص على المراجعة اليومية إن شاء الله.',
      isRead: true,
    ),
    NoteMessage(
      id: 'N003',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      author: NoteAuthor.admin,
      authorName: 'إدارة مسجد الخير',
      content:
          'تذكير: موعد السبر النهائي للجزء الخامس عشر يوم الأحد القادم الساعة 10:00 صباحاً.',
      isRead: false,
    ),
  ];

  static final List<PointRecord> _pointRecords1 = [
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 1)),
        points: 50,
        reason: 'حفظ ممتاز - سورة الكهف (60-74)',
        isBonus: false),
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 2)),
        points: 25,
        reason: 'حضور منتظم هذا الأسبوع',
        isBonus: true),
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 4)),
        points: 40,
        reason: 'حفظ جيد جداً - سورة الكهف (45-59)',
        isBonus: false),
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 7)),
        points: 30,
        reason: 'مشاركة فعّالة في الحلقة',
        isBonus: true),
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 10)),
        points: 50,
        reason: 'حفظ ممتاز - سورة الكهف (10-27)',
        isBonus: false),
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 5)),
        points: 100,
        reason: 'اجتياز السبر التجريبي بتقدير جيد جداً',
        isBonus: true),
  ];

  static final List<EvaluationRecord> _evaluations1 = [
    EvaluationRecord(
      date: DateTime.now().subtract(const Duration(days: 1)),
      subject: 'الحفظ والتلاوة',
      rating: EvaluationRating.excellent,
      teacherComment: 'أداء استثنائي في هذا الأسبوع، يحفظ بسرعة ويتقن التجويد',
    ),
    EvaluationRecord(
      date: DateTime.now().subtract(const Duration(days: 7)),
      subject: 'المراجعة والمتابعة',
      rating: EvaluationRating.veryGood,
      teacherComment: 'مراجعة جيدة جداً، يواظب على الحفظ في البيت',
    ),
  ];

  // ─── Child 2 ────────────────────────────────────────────────────────────────
  static ChildData _childData2() {
    return ChildData(
      student: _student2,
      attendanceRecords: _generateAttendance2(),
      memorizationProgress: _memorizationProgress2,
      pointRecords: _pointRecords2,
      evaluations: _evaluations2,
      sabrRecords: _sabrRecords2,
      notes: _notes2,
      totalPoints: 640,
    );
  }

  static const _student2 = StudentModel(
    id: 'STU-2025-017',
    name: 'محمد ناظم المسوتي',
    avatarInitials: 'س م',
    groupName: 'حلقة الزهراء 1',
    courseName: 'دورة صيف 2026',
    teacherName: 'الأستاذ وليد',
    academicYear: '2025 - 2026 م',
    enrollmentYear: 2025,
    phone: '+966 50 123 4567',
  );

  static List<AttendanceRecord> _generateAttendance2() {
    final now = DateTime.now();
    final statuses = [
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.late,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.excusedAbsence,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.excusedEarlyDeparture,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.absent,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.present,
    ];
    final notes = {
      AttendanceStatus.absent: 'غياب بدون عذر',
      AttendanceStatus.late: 'تأخر عن موعد الحلقة',
      AttendanceStatus.excused: 'غياب بعذر مقبول',
      AttendanceStatus.excusedEarlyDeparture: 'انصراف مبكر بعذر',
      AttendanceStatus.excusedAbsence: 'غياب مع تقديم عذر مسبق',
    };
    final records = <AttendanceRecord>[];
    for (int i = statuses.length - 1; i >= 0; i--) {
      final date = now.subtract(Duration(days: statuses.length - 1 - i));
      if (date.weekday != DateTime.friday &&
          date.weekday != DateTime.saturday) {
        records.add(AttendanceRecord(
            date: date, status: statuses[i], note: notes[statuses[i]]));
      }
    }
    return records;
  }

  // ─── Juz Sections for Child 2 ───────────────────────────────────────────────
  // ناظم: أتمّت الأجزاء 1–5، الجزء 6 في سبر، 7 جارٍ
  static List<JuzSection> _buildSections2() {
    final now = DateTime.now();
    const teacher = 'الأستاذ وليد';
    final sections = <JuzSection>[];

    for (int i = 0; i < 30; i++) {
      final juzNum = i + 1;
      final firstPage = i * 20 + 1;
      final lastPage = firstPage + 19;

      if (juzNum <= 5) {
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
          sessions: [
            RecitationSession(
                fromPage: firstPage,
                toPage: firstPage + 6,
                date: now.subtract(Duration(days: 180 - juzNum * 25 + 18)),
                teacherName: teacher),
            RecitationSession(
                fromPage: firstPage + 7,
                toPage: firstPage + 13,
                date: now.subtract(Duration(days: 180 - juzNum * 25 + 10)),
                teacherName: teacher),
            RecitationSession(
                fromPage: firstPage + 14,
                toPage: lastPage,
                date: now.subtract(Duration(days: 180 - juzNum * 25 + 3)),
                teacherName: teacher),
          ],
          pendingPages: const [],
          practiceStages: [
            PracticeExamStage(
                stageNumber: 1,
                date: now.subtract(Duration(days: 170 - juzNum * 25)),
                errorCount: 3 + juzNum % 3,
                wasRetaken: juzNum == 3),
            PracticeExamStage(
                stageNumber: 2,
                date: now.subtract(Duration(days: 166 - juzNum * 25)),
                errorCount: 1,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 3,
                date: now.subtract(Duration(days: 162 - juzNum * 25)),
                errorCount: 0,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 4,
                date: now.subtract(Duration(days: 158 - juzNum * 25)),
                errorCount: 0,
                wasRetaken: false),
          ],
          finalExam: FinalExam(
              date: now.subtract(Duration(days: 150 - juzNum * 25)),
              score: 82.0 + juzNum * 1.5),
        ));
      } else if (juzNum == 6) {
        sections.add(JuzSection(
          juzNumber: 6,
          juzName: _juzNames[5],
          firstPage: 101,
          lastPage: 120,
          sessions: [
            RecitationSession(
                fromPage: 101,
                toPage: 107,
                date: now.subtract(const Duration(days: 35)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 108,
                toPage: 114,
                date: now.subtract(const Duration(days: 28)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 115,
                toPage: 120,
                date: now.subtract(const Duration(days: 21)),
                teacherName: teacher),
          ],
          pendingPages: const [],
          practiceStages: [
            PracticeExamStage(
                stageNumber: 1,
                date: now.subtract(const Duration(days: 16)),
                errorCount: 6,
                wasRetaken: true),
            PracticeExamStage(
                stageNumber: 2,
                date: now.subtract(const Duration(days: 12)),
                errorCount: 2,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 3,
                date: now.subtract(const Duration(days: 8)),
                errorCount: 1,
                wasRetaken: false),
            PracticeExamStage(
                stageNumber: 4,
                date: now.subtract(const Duration(days: 4)),
                errorCount: 0,
                wasRetaken: false),
          ],
          finalExam: null,
        ));
      } else if (juzNum == 7) {
        sections.add(JuzSection(
          juzNumber: 7,
          juzName: _juzNames[6],
          firstPage: 121,
          lastPage: 140,
          sessions: [
            RecitationSession(
                fromPage: 121,
                toPage: 125,
                date: now.subtract(const Duration(days: 5)),
                teacherName: teacher),
            RecitationSession(
                fromPage: 126,
                toPage: 129,
                date: now.subtract(const Duration(days: 2)),
                teacherName: teacher),
          ],
          pendingPages: const [
            130,
            131,
            132,
            133,
            134,
            135,
            136,
            137,
            138,
            139,
            140
          ],
          practiceStages: const [],
          finalExam: null,
        ));
      } else {
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
        ));
      }
    }
    return sections;
  }

  static final _memorizationProgress2 = MemorizationProgress(
    totalPagesMemorized: 109,
    totalQuranPages: 604,
    currentSurah: 'سورة الأنعام',
    currentJuz: 7,
    sections: _buildSections2(),
  );

  static final List<SabrRecord> _sabrRecords2 = [
    SabrRecord(
      id: 'SAB-S001',
      date: DateTime.now().subtract(const Duration(days: 10)),
      type: SabrType.awqaf,
      title: 'سبر الأوقاف - الأجزاء 1-5',
      surahFrom: 'سورة الفاتحة',
      surahTo: 'سورة النساء',
      pageNumbers: List<int>.generate(100, (i) => i + 1),
      totalPages: 100,
      rating: EvaluationRating.excellent,
      score: 88.0,
      examinerName: 'لجنة الأوقاف - مسجد الخير',
      notes: 'اجتازت سبر الأوقاف بنجاح. إتقان تام لأحكام الوقف والابتداء.',
      isPassed: true,
    ),
  ];

  static final List<NoteMessage> _notes2 = [
    NoteMessage(
      id: 'N-S001',
      dateTime: DateTime.now().subtract(const Duration(hours: 5)),
      author: NoteAuthor.teacher,
      authorName: 'الأستاذ وليد',
      content:
          'ناظم تبذل جهداً رائعاً. أنصح بمراجعة بداية سورة الأنعام هذا الأسبوع.',
      isRead: false,
    ),
    NoteMessage(
      id: 'N-S002',
      dateTime: DateTime.now().subtract(const Duration(days: 3)),
      author: NoteAuthor.admin,
      authorName: 'إدارة مسجد الخير',
      content: 'تذكير: رحلة الحلقات الصيفية الأسبوع القادم، يرجى المتابعة.',
      isRead: true,
    ),
  ];

  static final List<PointRecord> _pointRecords2 = [
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 2)),
        points: 40,
        reason: 'حفظ جيد جداً - سورة الأنعام (1-50)',
        isBonus: false),
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 5)),
        points: 20,
        reason: 'حضور منتظم',
        isBonus: true),
    PointRecord(
        date: DateTime.now().subtract(const Duration(days: 10)),
        points: 80,
        reason: 'اجتياز سبر الأوقاف للأجزاء 1-5',
        isBonus: true),
  ];

  static final List<EvaluationRecord> _evaluations2 = [
    EvaluationRecord(
      date: DateTime.now().subtract(const Duration(days: 2)),
      subject: 'الحفظ والتلاوة',
      rating: EvaluationRating.veryGood,
      teacherComment: 'تقدم ملحوظ هذا الأسبوع، مشاء الله',
    ),
  ];

  // ─── Notifications (shared across children) ─────────────────────────────────
  static final List<AppNotification> _notifications = [
    AppNotification(
      id: 'n1',
      title: 'تقييم جديد',
      body: 'حصل عبد الرحمن على تقييم ممتاز في الحفظ والتلاوة هذا الأسبوع',
      dateTime: DateTime.now().subtract(const Duration(hours: 2)),
      type: NotificationType.evaluation,
      isRead: false,
    ),
    AppNotification(
      id: 'n2',
      title: 'نقاط مضافة',
      body: 'تم إضافة 50 نقطة لحساب عبد الرحمن على حفظ ممتاز في سورة الكهف',
      dateTime: DateTime.now().subtract(const Duration(hours: 3)),
      type: NotificationType.points,
      isRead: false,
    ),
    AppNotification(
      id: 'n3',
      title: 'رسالة من الأستاذ',
      body: 'لديك رسالة جديدة من الأستاذة فاطمة بخصوص تقدم الطالبة ناظم',
      dateTime: DateTime.now().subtract(const Duration(hours: 5)),
      type: NotificationType.notes,
      isRead: false,
    ),
    AppNotification(
      id: 'n4',
      title: 'نتيجة السبر التجريبي',
      body: 'اجتاز عبد الرحمن السبر التجريبي للجزء الخامس عشر بتقدير جيد جداً',
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
      type: NotificationType.sabr,
      isRead: true,
    ),
    AppNotification(
      id: 'n5',
      title: 'سبر الأوقاف',
      body: 'اجتازت ناظم سبر الأوقاف للأجزاء 1-5 بنجاح',
      dateTime: DateTime.now().subtract(const Duration(days: 10)),
      type: NotificationType.sabr,
      isRead: true,
    ),
    AppNotification(
      id: 'n6',
      title: 'تذكير - السبر النهائي',
      body: 'تذكير: موعد السبر النهائي للجزء الخامس عشر يوم الأحد القادم',
      dateTime: DateTime.now().subtract(const Duration(days: 2)),
      type: NotificationType.sabr,
      isRead: true,
    ),
  ];
}
