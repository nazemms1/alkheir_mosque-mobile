import '../models/admin_dashboard_model.dart';
import '../models/student_model.dart'
    show ChildDetail, AttendanceEntry, PointEntry, StudentParentInfo;
import 'api_service.dart';

class AdminService {
  final ApiService _api = ApiService();

  // ─── Dashboard stats (parallel) ───────────────────────────────────────────
  Future<AdminStats> fetchStats() async {
    final results = await Future.wait([
      _api.get('students', query: {'per_page': '1'}),
      _api.get('groups', query: {'per_page': '1'}),
      _api.get('groups', query: {'per_page': '1', 'is_active': '1'}),
      _api.get('enrollments', query: {'per_page': '1'}),
      _api.get('invoices', query: {'per_page': '1'}),
      _api.get('activities', query: {'per_page': '1'}),
      _api.get('assessments', query: {'per_page': '1'}),
    ]);

    int total(dynamic r) =>
        (r as Map<String, dynamic>?)?['total'] as int? ?? 0;

    return AdminStats(
      totalStudents: total(results[0]),
      totalGroups: total(results[1]),
      activeGroups: total(results[2]),
      totalEnrollments: total(results[3]),
      totalInvoices: total(results[4]),
      totalActivities: total(results[5]),
      totalAssessments: total(results[6]),
    );
  }

  /// إحصائيات آمنة لأدوار الإشراف — تتجاهل الاستدعاءات التي لا تملك صلاحيتها
  /// (مثل invoices) بدل أن تفشل الشاشة كلها بخطأ 403.
  Future<AdminStats> fetchSupervisorStats() async {
    final results = await Future.wait([
      _api.get('students', query: {'per_page': '1'}).catchError((_) => null),
      _api.get('groups', query: {'per_page': '1'}).catchError((_) => null),
      _api.get('groups', query: {'per_page': '1', 'is_active': '1'}).catchError((_) => null),
      _api.get('enrollments', query: {'per_page': '1'}).catchError((_) => null),
      _api.get('activities', query: {'per_page': '1'}).catchError((_) => null),
      _api.get('assessments', query: {'per_page': '1'}).catchError((_) => null),
    ]);

    int total(dynamic r) =>
        (r as Map<String, dynamic>?)?['total'] as int? ?? 0;

    return AdminStats(
      totalStudents: total(results[0]),
      totalGroups: total(results[1]),
      activeGroups: total(results[2]),
      totalEnrollments: total(results[3]),
      totalInvoices: 0,
      totalActivities: total(results[4]),
      totalAssessments: total(results[5]),
    );
  }

  // ─── Groups ───────────────────────────────────────────────────────────────
  Future<({List<AdminGroupItem> items, int total, int lastPage})> fetchGroups({
    int page = 1,
    int perPage = 20,
    bool? isActive,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    if (isActive != null) query['is_active'] = isActive ? '1' : '0';

    final json = await _api.get('groups', query: query) as Map<String, dynamic>;
    final list = (json['data'] as List<dynamic>)
        .map((e) => AdminGroupItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return (
      items: list,
      total: json['total'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 1,
    );
  }

  // ─── Group detail / CRUD ────────────────────────────────────────────────────
  /// لا يوجد GET /groups/{id} في الـ API، لذا نبني التفاصيل من عنصر القائمة
  /// (الممرَّر كـ [item]) مع تسجيلات الحلقة.
  Future<AdminGroupDetail> fetchGroupDetail(AdminGroupItem item) async {
    final json = await _api.get('enrollments',
        query: {'group_id': '${item.id}', 'per_page': '100'}) as Map<String, dynamic>;
    final enrollments = (json['data'] as List<dynamic>)
        .map((e) => AdminEnrollmentItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return AdminGroupDetail(
      id: item.id,
      name: item.name,
      teacher: item.teacher,
      assistantTeacher: item.assistantTeacher,
      course: item.course,
      academicYear: item.academicYear,
      enrollmentsCount: item.enrollmentsCount,
      isActive: item.isActive,
      startsOn: item.startsOn,
      endsOn: item.endsOn,
      enrollments: enrollments,
    );
  }

  /// إنشاء حلقة. الحقول *_id مطلوبة من الـ API كمعرّفات رقمية
  /// (لا يوجد endpoint لجلب قوائم المقررات/المعلمين/السنوات الدراسية/الصفوف).
  Future<void> createGroup({
    required String name,
    required int academicYearId,
    required int courseId,
    required int teacherId,
    int? assistantTeacherId,
    required int gradeLevelId,
    required int capacity,
    required int monthlyFee,
    required String startsOn,
    required String endsOn,
    bool isActive = true,
  }) async {
    await _api.post('groups', body: {
      'name': name,
      'academic_year_id': academicYearId,
      'course_id': courseId,
      'teacher_id': teacherId,
      'assistant_teacher_id': assistantTeacherId,
      'grade_level_id': gradeLevelId,
      'capacity': capacity,
      'monthly_fee': monthlyFee,
      'starts_on': startsOn,
      'ends_on': endsOn,
      'is_active': isActive,
    });
  }

  Future<void> updateGroup(
    int groupId, {
    required String name,
    required int academicYearId,
    required int courseId,
    required int teacherId,
    int? assistantTeacherId,
    required int gradeLevelId,
    required int capacity,
    required int monthlyFee,
    required String startsOn,
    required String endsOn,
    required bool isActive,
  }) async {
    await _api.patch('groups/$groupId', body: {
      'name': name,
      'academic_year_id': academicYearId,
      'course_id': courseId,
      'teacher_id': teacherId,
      'assistant_teacher_id': assistantTeacherId,
      'grade_level_id': gradeLevelId,
      'capacity': capacity,
      'monthly_fee': monthlyFee,
      'starts_on': startsOn,
      'ends_on': endsOn,
      'is_active': isActive,
    });
  }

  Future<void> deleteGroup(int groupId) async {
    await _api.delete('groups/$groupId');
  }

  // ─── Students ─────────────────────────────────────────────────────────────
  Future<({List<AdminStudentItem> items, int total, int lastPage})>
      fetchStudents({
    int page = 1,
    int perPage = 20,
    String? search,
    String? status,
    int? groupId,
    int? parentId,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    if (search != null && search.isNotEmpty) query['search'] = search;
    if (status != null) query['status'] = status;
    if (groupId != null) query['group_id'] = '$groupId';
    if (parentId != null) query['parent_id'] = '$parentId';

    final json =
        await _api.get('students', query: query) as Map<String, dynamic>;
    final list = (json['data'] as List<dynamic>)
        .map((e) => AdminStudentItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return (
      items: list,
      total: json['total'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 1,
    );
  }

  // ─── Enrollments per group ────────────────────────────────────────────────
  Future<({List<AdminEnrollmentItem> items, int total, int lastPage})>
      fetchEnrollments({
    int page = 1,
    int perPage = 20,
    int? groupId,
    int? studentId,
    String? status,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    if (groupId != null) query['group_id'] = '$groupId';
    if (studentId != null) query['student_id'] = '$studentId';
    if (status != null) query['status'] = status;

    final json =
        await _api.get('enrollments', query: query) as Map<String, dynamic>;
    final list = (json['data'] as List<dynamic>)
        .map((e) => AdminEnrollmentItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return (
      items: list,
      total: json['total'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 1,
    );
  }

  // ─── Student detail — parent/children/{id} + attendance + points + parent info
  /// يعمل فقط لحساب "ولي أمر" مرتبط بملف تعريف والد نشط (parent profile).
  /// لا يعمل لحسابات الطاقم (مشرف/معلم) — استخدم [fetchStudentProgress] بدلاً منه.
  Future<({
    ChildDetail child,
    List<AttendanceEntry> attendance,
    List<PointEntry> points,
    StudentParentInfo? parentInfo,
  })> fetchStudentDetail(int studentId) async {
    final results = await Future.wait([
      _api.get('parent/children/$studentId'),
      _api.get('parent/children/$studentId/attendance',
          query: {'per_page': '50'}),
      _api.get('parent/children/$studentId/points',
          query: {'per_page': '50'}),
      _api.get('students/$studentId').catchError((_) => null),
    ]);

    final childJson =
        (results[0] as Map<String, dynamic>)['data'] as Map<String, dynamic>;
    final child = ChildDetail.fromJson(childJson);

    final attJson = results[1] as Map<String, dynamic>;
    final attendance = (attJson['data'] as List<dynamic>)
        .map((e) => AttendanceEntry.fromJson(e as Map<String, dynamic>))
        .toList();

    final ptsJson = results[2] as Map<String, dynamic>;
    final points = (ptsJson['data'] as List<dynamic>)
        .map((e) => PointEntry.fromJson(e as Map<String, dynamic>))
        .toList();

    StudentParentInfo? parentInfo;
    if (results[3] != null) {
      try {
        final raw = results[3] as Map<String, dynamic>;
        final data = raw['data'] as Map<String, dynamic>? ?? raw;
        parentInfo = StudentParentInfo.fromJson(data);
        if (!parentInfo.hasAnyData) parentInfo = null;
      } catch (_) {}
    }

    return (child: child, attendance: attendance, points: points, parentInfo: parentInfo);
  }

  // ─── Student progress — لأعضاء الطاقم (مشرف/معلم) دون ملف والد ───────────────
  /// يبني صورة تقدم الطالب من enrollments (نقاط/صفحات محفوظة لكل حلقة)
  /// وتقييمات حلقاته النشطة، مع محاولة جلب بيانات الوالد (StudentParentInfo)
  /// عبر students/{id}. لا يوجد سجل جلسات تفصيلي (محفوظات/حضور) متاح
  /// لهذا الدور عبر API الموبايل الحالي.
  Future<({
    List<AdminEnrollmentItem> enrollments,
    List<AdminAssessmentItem> assessments,
    StudentParentInfo? parentInfo,
  })> fetchStudentProgress(int studentId) async {
    final results = await Future.wait([
      _api.get('enrollments', query: {
        'student_id': '$studentId',
        'per_page': '50',
      }),
      _api.get('students/$studentId').catchError((_) => null),
    ]);

    final enrollmentsJson = results[0] as Map<String, dynamic>;
    final enrollments = (enrollmentsJson['data'] as List<dynamic>)
        .map((e) => AdminEnrollmentItem.fromJson(e as Map<String, dynamic>))
        .toList();

    StudentParentInfo? parentInfo;
    if (results[1] != null) {
      try {
        final raw = results[1] as Map<String, dynamic>;
        final data = raw['data'] as Map<String, dynamic>? ?? raw;
        parentInfo = StudentParentInfo.fromJson(data);
        if (!parentInfo.hasAnyData) parentInfo = null;
      } catch (_) {}
    }

    final groupIds = enrollments.map((e) => e.groupId).toSet();
    final assessmentLists = await Future.wait(groupIds.map(
      (groupId) => _api.get('assessments', query: {
        'group_id': '$groupId',
        'per_page': '50',
      }).catchError((_) => {'data': []}),
    ));

    final assessments = assessmentLists
        .expand((json) => (json as Map<String, dynamic>)['data'] as List<dynamic>)
        .map((e) => AdminAssessmentItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return (
      enrollments: enrollments,
      assessments: assessments,
      parentInfo: parentInfo,
    );
  }

  // ─── Memorization ─────────────────────────────────────────────────────────
  /// تسجيل حفظ/مراجعة قرآن جديد لطالب عبر تسجيله (enrollment).
  /// entry_type: new|review
  Future<void> recordMemorization(
    int enrollmentId, {
    required String entryType,
    required int fromPage,
    required int toPage,
    required String recordedOn,
    required String teacherId,
    required String notes,
  }) async {
    await _api.post('enrollments/$enrollmentId/memorization', body: {
      'entry_type': entryType,
      'from_page': fromPage,
      'to_page': toPage,
      'recorded_on': recordedOn,
      'teacher_id': teacherId,
      'notes': notes,
    });
  }

  // ─── Assessments ──────────────────────────────────────────────────────────
  Future<({List<AdminAssessmentItem> items, int total, int lastPage})>
      fetchAssessments({
    int page = 1,
    int perPage = 20,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    final json =
        await _api.get('assessments', query: query) as Map<String, dynamic>;
    final list = (json['data'] as List<dynamic>)
        .map((e) => AdminAssessmentItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return (
      items: list,
      total: json['total'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 1,
    );
  }

  // ─── Invoices ─────────────────────────────────────────────────────────────
  Future<({List<AdminInvoiceItem> items, int total, int lastPage})>
      fetchInvoices({
    int page = 1,
    int perPage = 20,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    final json =
        await _api.get('invoices', query: query) as Map<String, dynamic>;
    final list = (json['data'] as List<dynamic>)
        .map((e) => AdminInvoiceItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return (
      items: list,
      total: json['total'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 1,
    );
  }

  // ─── Activities ───────────────────────────────────────────────────────────
  Future<({List<AdminActivityItem> items, int total})> fetchActivities({
    int page = 1,
    int perPage = 20,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    final json =
        await _api.get('activities', query: query) as Map<String, dynamic>;
    final list = (json['data'] as List<dynamic>)
        .map((e) => AdminActivityItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return (items: list, total: json['total'] as int? ?? 0);
  }

  // ─── Dashboard quick data (home tab) ──────────────────────────────────────
  Future<
      ({
        AdminStats stats,
        List<AdminGroupItem> groups,
        List<AdminStudentItem> students,
      })> fetchDashboard() async {
    final results = await Future.wait([
      fetchStats(),
      fetchGroups(perPage: 6, isActive: true),
      fetchStudents(perPage: 6),
    ]);
    return (
      stats: results[0] as AdminStats,
      groups: (results[1] as ({
        List<AdminGroupItem> items,
        int total,
        int lastPage
      }))
          .items,
      students: (results[2] as ({
        List<AdminStudentItem> items,
        int total,
        int lastPage
      }))
          .items,
    );
  }
}
