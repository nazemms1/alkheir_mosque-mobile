import '../models/student_model.dart';
import 'api_service.dart';

class StudentService {
  final ApiService _api = ApiService();

  Future<ParentProfile> fetchParentProfile() async {
    final json = await _api.get('parent/profile') as Map<String, dynamic>;
    return ParentProfile.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<ParentSummary> fetchParentSummary() async {
    final json = await _api.get('parent/summary') as Map<String, dynamic>;
    return ParentSummary.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<List<ChildDetail>> fetchChildren() async {
    final json = await _api.get('parent/children') as Map<String, dynamic>;
    final list = json['data'] as List<dynamic>;
    return list
        .map((e) => ChildDetail.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ChildDetail> fetchChildDetail(int studentId) async {
    final json =
        await _api.get('parent/children/$studentId') as Map<String, dynamic>;
    return ChildDetail.fromJson(json['data'] as Map<String, dynamic>);
  }

  /// جلب سجلات الحفظ لطالب محدد مع دعم التصفية
  Future<List<MemorizationEntry>> fetchMemorization(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    String? entryType,
    int perPage = 50,
  }) async {
    final query = <String, dynamic>{'per_page': perPage};
    if (dateFrom != null) query['date_from'] = dateFrom;
    if (dateTo != null) query['date_to'] = dateTo;
    if (entryType != null) query['entry_type'] = entryType;

    final result = <MemorizationEntry>[];
    int page = 1;
    while (true) {
      query['page'] = page;
      final json = await _api.get(
        'parent/children/$studentId/memorization',
        query: query,
      ) as Map<String, dynamic>;
      final items = (json['data'] as List<dynamic>)
          .map((e) => MemorizationEntry.fromJson(e as Map<String, dynamic>))
          .toList();
      result.addAll(items);
      final meta = json['meta'] as Map<String, dynamic>?;
      final lastPage = (meta?['last_page'] as int?) ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب سجلات النقاط لطالب محدد
  Future<List<PointEntry>> fetchPoints(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  }) async {
    final query = <String, dynamic>{'per_page': perPage};
    if (dateFrom != null) query['date_from'] = dateFrom;
    if (dateTo != null) query['date_to'] = dateTo;

    final result = <PointEntry>[];
    int page = 1;
    while (true) {
      query['page'] = page;
      final json = await _api.get(
        'parent/children/$studentId/points',
        query: query,
      ) as Map<String, dynamic>;
      final items = (json['data'] as List<dynamic>)
          .map((e) => PointEntry.fromJson(e as Map<String, dynamic>))
          .toList();
      result.addAll(items);
      final meta = json['meta'] as Map<String, dynamic>?;
      final lastPage = (meta?['last_page'] as int?) ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب الملاحظات لطالب محدد مع دعم التصفية بالتاريخ
  Future<List<NoteEntry>> fetchNotes(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  }) async {
    final query = <String, dynamic>{'per_page': perPage};
    if (dateFrom != null) query['date_from'] = dateFrom;
    if (dateTo != null) query['date_to'] = dateTo;

    final result = <NoteEntry>[];
    int page = 1;
    while (true) {
      query['page'] = page;
      final json = await _api.get(
        'parent/children/$studentId/notes',
        query: query,
      ) as Map<String, dynamic>;
      final items = (json['data'] as List<dynamic>)
          .map((e) => NoteEntry.fromJson(e as Map<String, dynamic>))
          .toList();
      result.addAll(items);
      final meta = json['meta'] as Map<String, dynamic>?;
      final lastPage = (meta?['last_page'] as int?) ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب اختبارات القرآن لطالب محدد
  Future<List<QuranTestEntry>> fetchQuranTests(
    int studentId, {
    int perPage = 50,
  }) async {
    final query = <String, dynamic>{'per_page': perPage};
    final result = <QuranTestEntry>[];
    int page = 1;
    while (true) {
      query['page'] = page;
      final json = await _api.get(
        'parent/children/$studentId/quran-tests',
        query: query,
      ) as Map<String, dynamic>;
      final items = (json['data'] as List<dynamic>)
          .map((e) => QuranTestEntry.fromJson(e as Map<String, dynamic>))
          .toList();
      result.addAll(items);
      final meta = json['meta'] as Map<String, dynamic>?;
      final lastPage = (meta?['last_page'] as int?) ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب سجلات الحضور لطالب محدد مع دعم التصفية
  Future<List<AttendanceEntry>> fetchAttendance(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  }) async {
    final query = <String, dynamic>{'per_page': perPage};
    if (dateFrom != null) query['date_from'] = dateFrom;
    if (dateTo != null) query['date_to'] = dateTo;

    final result = <AttendanceEntry>[];
    int page = 1;
    while (true) {
      query['page'] = page;
      final json = await _api.get(
        'parent/children/$studentId/attendance',
        query: query,
      ) as Map<String, dynamic>;
      final items = (json['data'] as List<dynamic>)
          .map((e) => AttendanceEntry.fromJson(e as Map<String, dynamic>))
          .toList();
      result.addAll(items);
      final meta = json['meta'] as Map<String, dynamic>?;
      final lastPage = (meta?['last_page'] as int?) ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب كل البيانات اللازمة للـ Dashboard دفعة واحدة
  Future<({ParentProfile profile, ParentSummary summary, List<ChildDetail> children})>
      fetchDashboard() async {
    final results = await Future.wait([
      fetchParentProfile(),
      fetchParentSummary(),
      fetchChildren(),
    ]);
    return (
      profile: results[0] as ParentProfile,
      summary: results[1] as ParentSummary,
      children: results[2] as List<ChildDetail>,
    );
  }

  /// تحويل ChildDetail إلى ChildData المستخدم في الواجهة
  ChildData childDetailToChildData(ChildDetail child) {
    final parts = child.fullName.trim().split(RegExp(r'\s+'));
    final initials = parts.length >= 2
        ? '${parts.first[0]} ${parts.last[0]}'
        : (parts.isNotEmpty && parts.first.isNotEmpty ? parts.first[0] : '؟');

    final enrollment =
        child.activeEnrollments.isNotEmpty ? child.activeEnrollments.first : null;
    final currentJuz = child.quranCurrentJuz ?? 1;
    final teacherName = enrollment?.group.teacherName ?? '';

    final student = StudentModel(
      id: child.id.toString(),
      name: child.fullName,
      avatarInitials: initials,
      groupName: enrollment?.group.name ?? '',
      courseName: enrollment?.group.courseName ?? '',
      teacherName: teacherName,
      academicYear: child.gradeLevelName ?? '',
      enrollmentYear: _parseYear(child.joinedAt),
      phone: enrollment?.group.teacherPhone ?? '',
      enrollmentId: enrollment?.id,
    );

    return ChildData(
      student: student,
      attendanceRecords: const [],
      memorizationProgress: MemorizationProgress(
        totalPagesMemorized: child.memorizedPages,
        totalQuranPages: 604,
        currentSurah: 'الجزء $currentJuz',
        currentJuz: currentJuz,
        // الأجزاء تُبنى لاحقاً من fetchMemorization — هنا placeholder
        sections: _buildJuzSectionsFromSummary(
          currentJuz: currentJuz,
          totalMemorizedPages: child.memorizedPages,
          teacherName: teacherName,
        ),
      ),
      pointRecords: const [],
      evaluations: const [],
      sabrRecords: const [],
      notes: const [],
      totalPoints: child.points,
    );
  }

  /// بناء MemorizationProgress من سجلات الحفظ الحقيقية من الـ API
  MemorizationProgress buildProgressFromEntries({
    required List<MemorizationEntry> entries,
    required int totalMemorizedPages,
    required int currentJuz,
    required String teacherName,
  }) {
    // نجمع السجلات per-juz بناءً على جدول الصفحات الحقيقي
    final Map<int, List<MemorizationEntry>> byJuz = {};
    for (final e in entries) {
      final juz = StudentService._pageToJuz(e.fromPage);
      byJuz.putIfAbsent(juz, () => []).add(e);
    }

    final sections = _buildJuzSectionsFromEntries(
      byJuz: byJuz,
      currentJuz: currentJuz,
      teacherName: teacherName,
    );

    return MemorizationProgress(
      totalPagesMemorized: totalMemorizedPages,
      totalQuranPages: 604,
      currentSurah: 'الجزء $currentJuz',
      currentJuz: currentJuz,
      sections: sections,
    );
  }

  // ─── Juz sections from real API entries ──────────────────────────────────────
  // كل جزء يُحدَّد حالته بناءً على الصفحات المسموعة فعلاً وليس بـ currentJuz
  static List<JuzSection> _buildJuzSectionsFromEntries({
    required Map<int, List<MemorizationEntry>> byJuz,
    required int currentJuz,
    required String teacherName,
  }) {
    final sections = <JuzSection>[];

    for (int i = 0; i < 30; i++) {
      final juzNum = i + 1;
      final firstPage = _juzFirstPage[i];
      final lastPage = _juzLastPage[i];
      final totalPages = lastPage - firstPage + 1;
      final juzEntries = byJuz[juzNum] ?? [];

      // نحسب مجموعة الصفحات المسموعة فعلاً لهذا الجزء
      final heardPages = <int>{};
      for (final e in juzEntries) {
        for (int p = e.fromPage; p <= e.toPage; p++) {
          if (p >= firstPage && p <= lastPage) heardPages.add(p);
        }
      }

      final sessions = juzEntries.map((e) => RecitationSession(
            fromPage: e.fromPage,
            toPage: e.toPage,
            date: e.date,
            teacherName: e.teacherName.isNotEmpty ? e.teacherName : teacherName,
          )).toList();

      if (heardPages.length >= totalPages) {
        // جميع صفحات الجزء مسموعة — مكتمل
        sessions.sort((a, b) => a.date.compareTo(b.date));
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
          sessions: sessions,
          pendingPages: const [],
          practiceStages: const [],
          finalExam: FinalExam(
            date: sessions.isNotEmpty ? sessions.last.date : DateTime.now(),
            score: 85.0,
          ),
        ));
      } else if (heardPages.isNotEmpty) {
        // بعض الصفحات مسموعة — جارٍ
        final pending = [
          for (int p = firstPage; p <= lastPage; p++)
            if (!heardPages.contains(p)) p
        ];
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
          sessions: sessions,
          pendingPages: pending,
          practiceStages: const [],
          finalExam: null,
        ));
      } else {
        // لا توجد صفحات مسموعة — لم يبدأ
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

  // ─── Juz sections from summary only (no entries yet loaded) ──────────────────
  static List<JuzSection> _buildJuzSectionsFromSummary({
    required int currentJuz,
    required int totalMemorizedPages,
    required String teacherName,
  }) {
    final now = DateTime.now();

    // نحسب الصفحات المحفوظة في الجزء الحالي من الإجمالي
    int pagesBeforeCurrent = 0;
    for (int i = 0; i < currentJuz - 1 && i < 30; i++) {
      pagesBeforeCurrent += _juzLastPage[i] - _juzFirstPage[i] + 1;
    }
    final pagesInCurrentJuz = (totalMemorizedPages - pagesBeforeCurrent).clamp(0, 20);

    final sections = <JuzSection>[];
    for (int i = 0; i < 30; i++) {
      final juzNum = i + 1;
      final firstPage = _juzFirstPage[i];
      final lastPage = _juzLastPage[i];

      if (juzNum < currentJuz) {
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
          sessions: [
            RecitationSession(
              fromPage: firstPage,
              toPage: lastPage,
              date: now.subtract(Duration(days: (currentJuz - juzNum) * 14)),
              teacherName: teacherName,
            ),
          ],
          pendingPages: const [],
          practiceStages: const [],
          finalExam: FinalExam(
            date: now.subtract(Duration(days: (currentJuz - juzNum) * 14 - 7)),
            score: 85.0,
          ),
        ));
      } else if (juzNum == currentJuz) {
        final recitedTo = firstPage + pagesInCurrentJuz - 1;
        final pending = [for (int p = recitedTo + 1; p <= lastPage; p++) p];
        sections.add(JuzSection(
          juzNumber: juzNum,
          juzName: _juzNames[i],
          firstPage: firstPage,
          lastPage: lastPage,
          sessions: pagesInCurrentJuz > 0
              ? [
                  RecitationSession(
                    fromPage: firstPage,
                    toPage: recitedTo,
                    date: now.subtract(const Duration(days: 3)),
                    teacherName: teacherName,
                  ),
                ]
              : const [],
          pendingPages: pending,
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

  static const _juzNames = [
    'الجزء الأول', 'الجزء الثاني', 'الجزء الثالث', 'الجزء الرابع',
    'الجزء الخامس', 'الجزء السادس', 'الجزء السابع', 'الجزء الثامن',
    'الجزء التاسع', 'الجزء العاشر', 'الجزء الحادي عشر', 'الجزء الثاني عشر',
    'الجزء الثالث عشر', 'الجزء الرابع عشر', 'الجزء الخامس عشر',
    'الجزء السادس عشر', 'الجزء السابع عشر', 'الجزء الثامن عشر',
    'الجزء التاسع عشر', 'الجزء العشرون', 'الجزء الحادي والعشرون',
    'الجزء الثاني والعشرون', 'الجزء الثالث والعشرون', 'الجزء الرابع والعشرون',
    'الجزء الخامس والعشرون', 'الجزء السادس والعشرون', 'الجزء السابع والعشرون',
    'الجزء الثامن والعشرون', 'الجزء التاسع والعشرون', 'الجزء الثلاثون',
  ];

  // الصفحة الأولى لكل جزء (مصحف المدينة 604 صفحة)
  static const _juzFirstPage = [
     1,  22,  42,  62,  82, 102, 122, 142, 162, 182,
   202, 222, 242, 262, 282, 302, 322, 342, 362, 382,
   402, 422, 442, 462, 482, 502, 522, 542, 562, 582,
  ];

  // الصفحة الأخيرة لكل جزء
  static const _juzLastPage = [
    21,  41,  61,  81, 101, 121, 141, 161, 181, 201,
   221, 241, 261, 281, 301, 321, 341, 361, 381, 401,
   421, 441, 461, 481, 501, 521, 541, 561, 581, 604,
  ];

  /// يُحدّد رقم الجزء من رقم الصفحة
  static int _pageToJuz(int page) {
    for (int i = 0; i < 30; i++) {
      if (page <= _juzLastPage[i]) return i + 1;
    }
    return 30;
  }

  int _parseYear(String? date) {
    if (date == null || date.isEmpty) return DateTime.now().year;
    return int.tryParse(date.split('-').first) ?? DateTime.now().year;
  }
}
