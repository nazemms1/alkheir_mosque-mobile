import 'package:alkheir_mosque/features/admin/dashboard/data/params/admin_params.dart';
import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';
import 'package:alkheir_mosque/features/admin/dashboard/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/shared/students/data/models/student_model.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/admin/dashboard/data/mapper/admin_dashboard_mapper.dart';
import 'package:alkheir_mosque/features/shared/students/data/mapper/student_mapper.dart';
import '../../data/apis/admin_apis.dart';
import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart'
    show ChildDetail, AttendanceEntry, PointEntry, StudentParentInfo;

abstract class AdminRepository {
  /// إحصائيات الإداري. كل رقم يُجلب فقط إذا كانت صلاحيته في الحساب،
  /// وغيره يعود صفراً دون أي طلب للخادم.
  Future<AdminStats> fetchStats(AuthToken token);

  /// إحصائيات المشرف بالقواعد نفسها (بدون الفواتير).
  Future<AdminStats> fetchSupervisorStats(AuthToken token);

  Future<({List<AdminGroupItem> items, int total, int lastPage})> fetchGroups({
    int page = 1,
    int perPage = 20,
    bool? isActive,
  });

  Future<AdminGroupDetail> fetchGroupDetail(AdminGroupItem item);

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
  });

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
  });

  Future<void> deleteGroup(int groupId);

  Future<({List<AdminStudentItem> items, int total, int lastPage})>
      fetchStudents({
    int page = 1,
    int perPage = 20,
    String? search,
    String? status,
    int? groupId,
    int? parentId,
  });

  Future<AdminStudentItem?> findStudentById(
    int studentId, {
    required int groupId,
  });

  Future<AdminStudentItem?> findStudentByNumber(
    String studentNumber, {
    required int groupId,
  });

  Future<({List<AdminEnrollmentItem> items, int total, int lastPage})>
      fetchEnrollments({
    int page = 1,
    int perPage = 20,
    int? groupId,
    int? studentId,
    String? status,
  });

  Future<
      ({
        ChildDetail child,
        List<AttendanceEntry> attendance,
        List<PointEntry> points,
        StudentParentInfo? parentInfo,
      })> fetchStudentDetail(int studentId);

  Future<
      ({
        List<AdminEnrollmentItem> enrollments,
        List<AdminAssessmentItem> assessments,
        StudentParentInfo? parentInfo,
      })> fetchStudentProgress(int studentId);

  Future<void> recordMemorization(
    int enrollmentId, {
    required String entryType,
    required int fromPage,
    required int toPage,
    required String recordedOn,
    required String teacherId,
    required String notes,
  });

  Future<void> recordGroupAttendance({
    required int groupId,
    required int enrollmentId,
    required String attendanceStatusId,
    required String attendanceDate,
    String notes = '',
  });

  Future<int> openStudentAttendanceDay({
    required int groupId,
    required String attendanceDate,
  });

  Future<ScanAttendanceResult> scanStudentAttendance({
    required int studentAttendanceDayId,
    required String scanValue,
    required String attendanceStatusId,
  });

  Future<ScanAttendanceResult> quickScanStudentAttendance({
    required String scanValue,
    required String attendanceStatusId,
  });

  Future<({List<AdminAssessmentItem> items, int total, int lastPage})>
      fetchAssessments({
    int page = 1,
    int perPage = 20,
  });

  Future<({List<AdminInvoiceItem> items, int total, int lastPage})>
      fetchInvoices({
    int page = 1,
    int perPage = 20,
  });

  Future<({List<AdminActivityItem> items, int total})> fetchActivities({
    int page = 1,
    int perPage = 20,
  });

  Future<
      ({
        AdminStats stats,
        List<AdminGroupItem> groups,
        List<AdminStudentItem> students,
      })> fetchDashboard(AuthToken token);
}

class AdminRepositoryImpl implements AdminRepository {
  final AdminApis api;

  AdminRepositoryImpl(this.api);

  // ─── Dashboard stats (parallel, per-account) ──────────────────────────────
  /// عدد عناصر قائمة واحدة (`total`). إن لم يملك الحساب الصلاحية لا يُرسل
  /// الطلب أصلاً ويعود الرقم صفراً.
  Future<int> _countIf(
    bool allowed,
    String path, {
    Map<String, String> extra = const {},
  }) async {
    if (!allowed) return 0;
    try {
      final json = await handleRepoData(
          () => api.count(path, {'per_page': '1', ...extra}));
      if (json is Map<String, dynamic>) {
        if (json.containsKey('total')) {
          return (json['total'] as num?)?.toInt() ?? 0;
        }
        final meta = json['meta'];
        if (meta is Map<String, dynamic> && meta.containsKey('total')) {
          return (meta['total'] as num?)?.toInt() ?? 0;
        }
        final data = json['data'];
        if (data is List) {
          return data.length;
        }
      }
      return 0;
    } catch (_) {
      return 0;
    }
  }

  @override
  Future<AdminStats> fetchStats(AuthToken token) async {
    final counts = await Future.wait<int>([
      _countIf(token.hasPermission(Permissions.studentsView), 'students'),
      _countIf(token.hasPermission(Permissions.groupsView), 'groups'),
      _countIf(token.hasPermission(Permissions.groupsView), 'groups',
          extra: {'is_active': '1'}),
      _countIf(token.hasPermission(Permissions.enrollmentsView), 'enrollments'),
      _countIf(token.hasPermission(Permissions.invoicesView), 'invoices'),
      _countIf(token.hasPermission(Permissions.activitiesView), 'activities'),
      _countIf(token.hasPermission(Permissions.assessmentsView), 'assessments'),
    ]);

    return AdminStats(
      totalStudents: counts[0],
      totalGroups: counts[1],
      activeGroups: counts[2],
      totalEnrollments: counts[3],
      totalInvoices: counts[4],
      totalActivities: counts[5],
      totalAssessments: counts[6],
    );
  }

  /// إحصائيات المشرف: حسب صلاحيات الحساب.
  @override
  Future<AdminStats> fetchSupervisorStats(AuthToken token) async {
    final counts = await Future.wait<int>([
      _countIf(token.hasPermission(Permissions.studentsView), 'students'),
      _countIf(token.hasPermission(Permissions.groupsView), 'groups'),
      _countIf(token.hasPermission(Permissions.groupsView), 'groups',
          extra: {'is_active': '1'}),
      _countIf(token.hasPermission(Permissions.enrollmentsView), 'enrollments'),
      _countIf(token.hasPermission(Permissions.activitiesView), 'activities'),
      _countIf(token.hasPermission(Permissions.assessmentsView), 'assessments'),
      _countIf(token.hasPermission(Permissions.invoicesView), 'invoices'),
    ]);

    return AdminStats(
      totalStudents: counts[0],
      totalGroups: counts[1],
      activeGroups: counts[2],
      totalEnrollments: counts[3],
      totalInvoices: counts[6],
      totalActivities: counts[4],
      totalAssessments: counts[5],
    );
  }

  // ─── Groups ───────────────────────────────────────────────────────────────
  @override
  Future<({List<AdminGroupItem> items, int total, int lastPage})> fetchGroups({
    int page = 1,
    int perPage = 20,
    bool? isActive,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    if (isActive != null) query['is_active'] = isActive ? '1' : '0';

    final result = await handleRepoData(() => api.groups(query));
    final list = [
      for (final e in result.data ?? const <AdminGroupItemModel>[]) e.toDomain()
    ];
    return (
      items: list,
      total: result.total ?? 0,
      lastPage: result.lastPage ?? 1,
    );
  }

  // ─── Group detail / CRUD ────────────────────────────────────────────────────
  @override
  Future<AdminGroupDetail> fetchGroupDetail(AdminGroupItem item) async {
    final result = await handleRepoData(() =>
        api.groupEnrollments({'group_id': '${item.id}', 'per_page': '100'}));
    final enrollments = [
      for (final e in result.data ?? const <AdminEnrollmentItemModel>[])
        e.toDomain()
    ];
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

  @override
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
    await handleRepoData(() => api.createGroup(CreateGroupParams(
        name: name,
        academicYearId: academicYearId,
        courseId: courseId,
        teacherId: teacherId,
        assistantTeacherId: assistantTeacherId,
        gradeLevelId: gradeLevelId,
        capacity: capacity,
        monthlyFee: monthlyFee,
        startsOn: startsOn,
        endsOn: endsOn,
        isActive: isActive)));
  }

  @override
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
    await handleRepoData(() => api.updateGroup(
        groupId,
        UpdateGroupParams(
            name: name,
            academicYearId: academicYearId,
            courseId: courseId,
            teacherId: teacherId,
            assistantTeacherId: assistantTeacherId,
            gradeLevelId: gradeLevelId,
            capacity: capacity,
            monthlyFee: monthlyFee,
            startsOn: startsOn,
            endsOn: endsOn,
            isActive: isActive)));
  }

  @override
  Future<void> deleteGroup(int groupId) async {
    await handleRepoData(() => api.deleteGroup(groupId));
  }

  // ─── Students ─────────────────────────────────────────────────────────────
  @override
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

    final result = await handleRepoData(() => api.fetchStudents(query));
    final list = [
      for (final e in result.data ?? const <AdminStudentItemModel>[])
        e.toDomain()
    ];
    return (
      items: list,
      total: result.total ?? 0,
      lastPage: result.lastPage ?? 1,
    );
  }

  @override
  Future<AdminStudentItem?> findStudentById(
    int studentId, {
    required int groupId,
  }) async {
    final result = await fetchStudents(groupId: groupId, perPage: 100);
    for (final s in result.items) {
      if (s.id == studentId) return s;
    }
    return null;
  }

  @override
  Future<AdminStudentItem?> findStudentByNumber(
    String studentNumber, {
    required int groupId,
  }) async {
    final result = await fetchStudents(groupId: groupId, perPage: 100);
    for (final s in result.items) {
      if (s.studentNumber == studentNumber) return s;
    }
    return null;
  }

  // ─── Enrollments per group ────────────────────────────────────────────────
  @override
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

    final result = await handleRepoData(() => api.fetchEnrollments(query));
    final list = [
      for (final e in result.data ?? const <AdminEnrollmentItemModel>[])
        e.toDomain()
    ];
    return (
      items: list,
      total: result.total ?? 0,
      lastPage: result.lastPage ?? 1,
    );
  }

  // ─── Student detail — parent/children/{id} + attendance + points + parent info
  @override
  Future<
      ({
        ChildDetail child,
        List<AttendanceEntry> attendance,
        List<PointEntry> points,
        StudentParentInfo? parentInfo,
      })> fetchStudentDetail(int studentId) async {
    final results = await Future.wait([
      handleRepoData(() => api.childDetail(studentId)),
      handleRepoData(() => api.childAttendance(studentId, {'per_page': '50'})),
      handleRepoData(() => api.childPoints(studentId, {'per_page': '50'})),
      handleRepoData(() => api.student(studentId)).catchError((_) => null),
    ]);

    final child =
        (results[0] as BaseApiModel<ChildDetailModel>).data.toDomain();
    final attendance = [
      for (final e
          in (results[1] as BaseApiModel<List<AttendanceEntryModel>>).data ??
              const <AttendanceEntryModel>[])
        e.toDomain()
    ];
    final points = [
      for (final e
          in (results[2] as BaseApiModel<List<PointEntryModel>>).data ??
              const <PointEntryModel>[])
        e.toDomain()
    ];

    StudentParentInfo? parentInfo;
    if (results[3] != null) {
      try {
        final raw = results[3] as Map<String, dynamic>;
        final data = raw['data'] as Map<String, dynamic>? ?? raw;
        parentInfo = StudentParentInfoModel.fromJson(data).toDomain();
        if (!parentInfo.hasAnyData) parentInfo = null;
      } catch (_) {}
    }

    return (
      child: child,
      attendance: attendance,
      points: points,
      parentInfo: parentInfo
    );
  }

  // ─── Student progress — لأعضاء الطاقم (مشرف/معلم) دون ملف والد ───────────────
  @override
  Future<
      ({
        List<AdminEnrollmentItem> enrollments,
        List<AdminAssessmentItem> assessments,
        StudentParentInfo? parentInfo,
      })> fetchStudentProgress(int studentId) async {
    final results = await Future.wait([
      handleRepoData(() => api.studentEnrollments({
            'student_id': '$studentId',
            'per_page': '50',
          })),
      handleRepoData(() => api.student(studentId)).catchError((_) => null),
    ]);

    final enrollments = [
      for (final e
          in (results[0] as BaseApiModel<List<AdminEnrollmentItemModel>>)
                  .data ??
              const <AdminEnrollmentItemModel>[])
        e.toDomain()
    ];

    StudentParentInfo? parentInfo;
    if (results[1] != null) {
      try {
        final raw = results[1] as Map<String, dynamic>;
        final data = raw['data'] as Map<String, dynamic>? ?? raw;
        parentInfo = StudentParentInfoModel.fromJson(data).toDomain();
        if (!parentInfo.hasAnyData) parentInfo = null;
      } catch (_) {}
    }

    final groupIds = enrollments.map((e) => e.groupId).toSet();
    final assessmentLists = await Future.wait(groupIds.map(
      (groupId) => handleRepoData(() => api.groupAssessments({
            'group_id': '$groupId',
            'per_page': '50',
          })).catchError((_) => BaseApiModel<List<AdminAssessmentItemModel>>()),
    ));
    final assessments = [
      for (final list in assessmentLists)
        for (final e in list.data ?? const <AdminAssessmentItemModel>[])
          e.toDomain()
    ];

    return (
      enrollments: enrollments,
      assessments: assessments,
      parentInfo: parentInfo,
    );
  }

  // ─── Memorization ─────────────────────────────────────────────────────────
  @override
  Future<void> recordMemorization(
    int enrollmentId, {
    required String entryType,
    required int fromPage,
    required int toPage,
    required String recordedOn,
    required String teacherId,
    required String notes,
  }) async {
    await handleRepoData(() => api.recordMemorization(
        enrollmentId,
        RecordMemorizationParams(
            entryType: entryType,
            fromPage: fromPage,
            toPage: toPage,
            recordedOn: recordedOn,
            teacherId: teacherId,
            notes: notes)));
  }

  @override
  Future<void> recordGroupAttendance({
    required int groupId,
    required int enrollmentId,
    required String attendanceStatusId,
    required String attendanceDate,
    String notes = '',
  }) async {
    await handleRepoData(() => api.recordGroupAttendance(
        groupId,
        RecordGroupAttendanceParams(
            attendanceDate: attendanceDate,
            notes: notes,
            records: [
              {
                'enrollment_id': '$enrollmentId',
                'attendance_status_id': attendanceStatusId,
                'notes': null,
              }
            ])));
  }

  @override
  Future<int> openStudentAttendanceDay({
    required int groupId,
    required String attendanceDate,
  }) async {
    final json = await handleRepoData(() => api.openStudentAttendanceDay(
        OpenStudentAttendanceDayParams(
            groupId: groupId,
            attendanceDate: attendanceDate))) as Map<String, dynamic>;
    return json['id'] as int;
  }

  @override
  Future<ScanAttendanceResult> scanStudentAttendance({
    required int studentAttendanceDayId,
    required String scanValue,
    required String attendanceStatusId,
  }) async {
    final result = await handleRepoData(() => api.scanStudentAttendance(
        studentAttendanceDayId,
        ScanStudentAttendanceParams(
            scanValue: scanValue,
            attendanceStatusId: int.parse(attendanceStatusId))));
    return result.toDomain();
  }

  @override
  Future<ScanAttendanceResult> quickScanStudentAttendance({
    required String scanValue,
    required String attendanceStatusId,
  }) async {
    final result = await handleRepoData(() => api.quickScanStudentAttendance(
        QuickScanStudentAttendanceParams(
            scanValue: scanValue,
            attendanceStatusId: int.parse(attendanceStatusId))));
    return result.toDomain();
  }

  // ─── Assessments ──────────────────────────────────────────────────────────
  @override
  Future<({List<AdminAssessmentItem> items, int total, int lastPage})>
      fetchAssessments({
    int page = 1,
    int perPage = 20,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    final result = await handleRepoData(() => api.fetchAssessments(query));
    final list = [
      for (final e in result.data ?? const <AdminAssessmentItemModel>[])
        e.toDomain()
    ];
    return (
      items: list,
      total: result.total ?? 0,
      lastPage: result.lastPage ?? 1,
    );
  }

  // ─── Invoices ─────────────────────────────────────────────────────────────
  @override
  Future<({List<AdminInvoiceItem> items, int total, int lastPage})>
      fetchInvoices({
    int page = 1,
    int perPage = 20,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    final result = await handleRepoData(() => api.fetchInvoices(query));
    final list = [
      for (final e in result.data ?? const <AdminInvoiceItemModel>[])
        e.toDomain()
    ];
    return (
      items: list,
      total: result.total ?? 0,
      lastPage: result.lastPage ?? 1,
    );
  }

  // ─── Activities ───────────────────────────────────────────────────────────
  @override
  Future<({List<AdminActivityItem> items, int total})> fetchActivities({
    int page = 1,
    int perPage = 20,
  }) async {
    final query = <String, dynamic>{'per_page': '$perPage', 'page': '$page'};
    final result = await handleRepoData(() => api.activities(query));
    final list = [
      for (final e in result.data ?? const <AdminActivityItemModel>[])
        e.toDomain()
    ];
    return (items: list, total: result.total ?? 0);
  }

  // ─── Dashboard quick data (home tab) ──────────────────────────────────────
  @override
  Future<
      ({
        AdminStats stats,
        List<AdminGroupItem> groups,
        List<AdminStudentItem> students,
      })> fetchDashboard(AuthToken token) async {
    final stats = fetchStats(token);
    final groups = token.hasPermission(Permissions.groupsView)
        ? fetchGroups(perPage: 6, isActive: true).then((p) => p.items)
        : Future.value(const <AdminGroupItem>[]);
    final students = token.hasPermission(Permissions.studentsView)
        ? fetchStudents(perPage: 6).then((p) => p.items)
        : Future.value(const <AdminStudentItem>[]);
    return (
      stats: await stats,
      groups: await groups,
      students: await students,
    );
  }
}
