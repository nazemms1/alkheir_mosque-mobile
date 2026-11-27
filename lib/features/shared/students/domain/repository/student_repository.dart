import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/shared/students/data/params/student_params.dart';
import 'package:alkheir_mosque/features/shared/students/data/models/student_model.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/shared/students/data/mapper/student_mapper.dart';
import '../../data/apis/student_apis.dart';
import 'package:alkheir_mosque/app/core/function/function.dart';

abstract class StudentRepository {
  Future<ParentProfile> fetchParentProfile();

  Future<ParentSummary> fetchParentSummary();

  Future<List<ChildDetail>> fetchChildren();

  Future<ChildDetail> fetchChildDetail(int studentId);

  Future<List<MemorizationEntry>> fetchMemorization(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    String? entryType,
    int perPage = 50,
  });

  Future<List<PointEntry>> fetchPoints(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  });

  Future<List<NoteEntry>> fetchNotes(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  });

  Future<List<QuranTestEntry>> fetchQuranTests(
    int studentId, {
    int perPage = 50,
  });

  Future<List<AttendanceEntry>> fetchAttendance(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  });

  Future<List<ParentActivity>> fetchActivities();

  Future<void> respondToActivity(
    int activityId, {
    required int studentId,
    required String response,
  });

  Future<List<InvoiceListItem>> fetchInvoices({
    String? status,
    int perPage = 50,
  });

  Future<InvoiceDetail> fetchInvoiceDetail(int invoiceId);

  Future<
      ({
        ParentProfile profile,
        ParentSummary summary,
        List<ChildDetail> children
      })> fetchDashboard();

  ChildData childDetailToChildData(ChildDetail child);

  MemorizationProgress buildProgressFromEntries({
    required List<MemorizationEntry> entries,
    required int totalMemorizedPages,
    required int currentJuz,
    required String teacherName,
  });
}

class StudentRepositoryImpl implements StudentRepository {
  final StudentApis api;

  StudentRepositoryImpl(this.api);

  @override
  Future<ParentProfile> fetchParentProfile() async {
    final result = await handleRepoData(() => api.fetchParentProfile());
    return result.data.toDomain();
  }

  @override
  Future<ParentSummary> fetchParentSummary() async {
    final result = await handleRepoData(() => api.fetchParentSummary());
    return result.data.toDomain();
  }

  @override
  Future<List<ChildDetail>> fetchChildren() async {
    final result = await handleRepoData(() => api.fetchChildren());
    return [
      for (final e in result.data ?? const <ChildDetailModel>[]) e.toDomain()
    ];
  }

  @override
  Future<ChildDetail> fetchChildDetail(int studentId) async {
    final result = await handleRepoData(() => api.fetchChildDetail(studentId));
    return result.data.toDomain();
  }

  /// جلب سجلات الحفظ لطالب محدد مع دعم التصفية
  @override
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
      final res =
          await handleRepoData(() => api.fetchMemorization(studentId, query));
      final items = [
        for (final e in res.data ?? const <MemorizationEntryModel>[])
          e.toDomain()
      ];
      result.addAll(items);
      final lastPage = res.meta?.lastPage ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب سجلات النقاط لطالب محدد
  @override
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
      final res = await handleRepoData(() => api.fetchPoints(studentId, query));
      final items = [
        for (final e in res.data ?? const <PointEntryModel>[]) e.toDomain()
      ];
      result.addAll(items);
      final lastPage = res.meta?.lastPage ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب الملاحظات لطالب محدد مع دعم التصفية بالتاريخ
  @override
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
      final res = await handleRepoData(() => api.fetchNotes(studentId, query));
      final items = [
        for (final e in res.data ?? const <NoteEntryModel>[]) e.toDomain()
      ];
      result.addAll(items);
      final lastPage = res.meta?.lastPage ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب اختبارات القرآن لطالب محدد
  @override
  Future<List<QuranTestEntry>> fetchQuranTests(
    int studentId, {
    int perPage = 50,
  }) async {
    final query = <String, dynamic>{'per_page': perPage};
    final result = <QuranTestEntry>[];
    int page = 1;
    while (true) {
      query['page'] = page;
      final res =
          await handleRepoData(() => api.fetchQuranTests(studentId, query));
      final items = [
        for (final e in res.data ?? const <QuranTestEntryModel>[]) e.toDomain()
      ];
      result.addAll(items);
      final lastPage = res.meta?.lastPage ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب سجلات الحضور لطالب محدد مع دعم التصفية
  @override
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
      final res =
          await handleRepoData(() => api.fetchAttendance(studentId, query));
      final items = [
        for (final e in res.data ?? const <AttendanceEntryModel>[]) e.toDomain()
      ];
      result.addAll(items);
      final lastPage = res.meta?.lastPage ?? 1;
      if (page >= lastPage) break;
      page++;
    }
    return result;
  }

  /// جلب الأنشطة المتاحة لأبناء ولي الأمر مع أهلية كل ابن للتسجيل
  @override
  Future<List<ParentActivity>> fetchActivities() async {
    final result = await handleRepoData(() => api.fetchActivities());
    return [
      for (final e in result.data ?? const <ParentActivityModel>[]) e.toDomain()
    ];
  }

  /// تسجيل أو اعتذار ابن عن نشاط. response: registered | declined
  @override
  Future<void> respondToActivity(
    int activityId, {
    required int studentId,
    required String response,
  }) async {
    await handleRepoData(() => api.respondToActivity(activityId,
        RespondToActivityParams(studentId: studentId, response: response)));
  }

  /// جلب فواتير ولي الأمر
  @override
  Future<List<InvoiceListItem>> fetchInvoices({
    String? status,
    int perPage = 50,
  }) async {
    final query = <String, dynamic>{'per_page': perPage};
    if (status != null) query['status'] = status;
    final result = await handleRepoData(() => api.fetchInvoices(query));
    return [
      for (final e in result.data ?? const <InvoiceListItemModel>[])
        e.toDomain()
    ];
  }

  /// جلب تفاصيل فاتورة محددة (بنودها ودفعاتها)
  @override
  Future<InvoiceDetail> fetchInvoiceDetail(int invoiceId) async {
    final result =
        await handleRepoData(() => api.fetchInvoiceDetail(invoiceId));
    return result.data.toDomain();
  }

  /// جلب كل البيانات اللازمة للـ Dashboard دفعة واحدة
  @override
  Future<
      ({
        ParentProfile profile,
        ParentSummary summary,
        List<ChildDetail> children
      })> fetchDashboard() async {
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
  @override
  ChildData childDetailToChildData(ChildDetail child) {
    final parts = child.fullName.trim().split(RegExp(r'\s+'));
    final initials = parts.length >= 2
        ? '${parts.first[0]} ${parts.last[0]}'
        : (parts.isNotEmpty && parts.first.isNotEmpty
            ? parts.first[0]
            : L10nGateway.current.text76);

    final enrollment = child.activeEnrollments.isNotEmpty
        ? child.activeEnrollments.first
        : null;
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
        currentSurah: L10nGateway.current.juz(currentJuz),
        currentJuz: currentJuz,
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
  @override
  MemorizationProgress buildProgressFromEntries({
    required List<MemorizationEntry> entries,
    required int totalMemorizedPages,
    required int currentJuz,
    required String teacherName,
  }) {
    final Map<int, List<MemorizationEntry>> byJuz = {};
    for (final e in entries) {
      final juz = _pageToJuz(e.fromPage);
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
      currentSurah: L10nGateway.current.juz(currentJuz),
      currentJuz: currentJuz,
      sections: sections,
    );
  }

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

      final heardPages = <int>{};
      for (final e in juzEntries) {
        for (int p = e.fromPage; p <= e.toPage; p++) {
          if (p >= firstPage && p <= lastPage) heardPages.add(p);
        }
      }

      final sessions = juzEntries
          .map((e) => RecitationSession(
                fromPage: e.fromPage,
                toPage: e.toPage,
                date: e.date,
                teacherName:
                    e.teacherName.isNotEmpty ? e.teacherName : teacherName,
              ))
          .toList();

      if (heardPages.length >= totalPages) {
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

  static List<JuzSection> _buildJuzSectionsFromSummary({
    required int currentJuz,
    required int totalMemorizedPages,
    required String teacherName,
  }) {
    final now = DateTime.now();

    int pagesBeforeCurrent = 0;
    for (int i = 0; i < currentJuz - 1 && i < 30; i++) {
      pagesBeforeCurrent += _juzLastPage[i] - _juzFirstPage[i] + 1;
    }
    final pagesInCurrentJuz =
        (totalMemorizedPages - pagesBeforeCurrent).clamp(0, 20);

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

  static final _juzNames = [
    L10nGateway.current.juz5,
    L10nGateway.current.juz6,
    L10nGateway.current.juz7,
    L10nGateway.current.juz8,
    L10nGateway.current.juz9,
    L10nGateway.current.juz10,
    L10nGateway.current.juz11,
    L10nGateway.current.juz12,
    L10nGateway.current.juz13,
    L10nGateway.current.juz14,
    L10nGateway.current.juz15,
    L10nGateway.current.juz16,
    L10nGateway.current.juz17,
    L10nGateway.current.juz18,
    L10nGateway.current.juz19,
    L10nGateway.current.juz20,
    L10nGateway.current.juz21,
    L10nGateway.current.juz22,
    L10nGateway.current.juz23,
    L10nGateway.current.juz24,
    L10nGateway.current.juz25,
    L10nGateway.current.juz26,
    L10nGateway.current.juz27,
    L10nGateway.current.juz28,
    L10nGateway.current.juz29,
    L10nGateway.current.juz30,
    L10nGateway.current.juz31,
    L10nGateway.current.juz32,
    L10nGateway.current.juz33,
    L10nGateway.current.juz34,
  ];

  static const _juzFirstPage = [
    1,
    22,
    42,
    62,
    82,
    102,
    122,
    142,
    162,
    182,
    202,
    222,
    242,
    262,
    282,
    302,
    322,
    342,
    362,
    382,
    402,
    422,
    442,
    462,
    482,
    502,
    522,
    542,
    562,
    582,
  ];

  static const _juzLastPage = [
    21,
    41,
    61,
    81,
    101,
    121,
    141,
    161,
    181,
    201,
    221,
    241,
    261,
    281,
    301,
    321,
    341,
    361,
    381,
    401,
    421,
    441,
    461,
    481,
    501,
    521,
    541,
    561,
    581,
    604,
  ];

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
