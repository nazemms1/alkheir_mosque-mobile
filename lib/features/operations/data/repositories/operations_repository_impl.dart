import 'dart:typed_data';

import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/models/records_model.dart';
import '../../domain/repositories/operations_repository.dart';
import '../models/operations_model.dart';

class OperationsRepositoryImpl implements OperationsRepository {
  final ApiService _api;

  OperationsRepositoryImpl({ApiService? api}) : _api = api ?? ApiService();

  Map<String, dynamic> _filters({
    String? search,
    int? studentId,
    int? groupId,
    int? enrollmentId,
    String? status,
    String? dateFrom,
    String? dateTo,
    int page = 1,
  }) {
    return {
      'page': page,
      'per_page': 20,
      if (search != null && search.isNotEmpty) 'search': search,
      if (studentId != null) 'student_id': studentId,
      if (groupId != null) 'group_id': groupId,
      if (enrollmentId != null) 'enrollment_id': enrollmentId,
      if (status != null) 'status': status,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
    };
  }

  // ─── حضور الطلاب ──────────────────────────────────────────────────────────
  @override
  Future<PagedResult<AttendanceDaySummary>> studentAttendanceDays({
    int page = 1,
    String? status,
    String? dateFrom,
    String? dateTo,
  }) async {
    final json = await _api.get(
      'student-attendance/days',
      query: _filters(
        page: page,
        status: status,
        dateFrom: dateFrom,
        dateTo: dateTo,
      ),
    ) as Map<String, dynamic>;
    return PagedResult.fromJson(json, AttendanceDaySummary.fromJson);
  }

  @override
  Future<AttendanceDayDetail> studentAttendanceDay(int id) async {
    final json =
        await _api.get('student-attendance/days/$id') as Map<String, dynamic>;
    return AttendanceDayDetail.fromJson(jsonMap(json['data']) ?? const {});
  }

  /// `open` أو `closed`. اليوم المغلق للدورة المنتهية يبقى للقراءة فقط.
  @override
  Future<AttendanceDayDetail> setStudentAttendanceDayStatus(
    int id,
    String status,
  ) async {
    final json = await _api.patch(
      'student-attendance/days/$id/status',
      body: {'status': status},
    ) as Map<String, dynamic>;
    return AttendanceDayDetail.fromJson(jsonMap(json['data']) ?? const {});
  }

  /// حضور حلقة في تاريخ محدد. كل سجل: `enrollment_id` و`attendance_status_id`.
  @override
  Future<void> takeGroupAttendance({
    required int groupId,
    required String attendanceDate,
    required List<Map<String, dynamic>> records,
    String? notes,
  }) async {
    await _api.post('groups/$groupId/attendance', body: {
      'attendance_date': attendanceDate,
      'records': records,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
  }

  /// أنواع النقاط اليدوية فقط (`manual_only=1`) لنموذج إضافة النقاط.
  @override
  Future<List<RefItem>> manualPointTypes() async {
    final json = await _api.get('reference/point-types', query: {
      'manual_only': 1,
    }) as Map<String, dynamic>;
    return jsonList(json['data'], RefItem.fromJson);
  }

  /// `scope`: student | teacher | both — يحدد الحالات المتاحة للاختيار.
  @override
  Future<List<RefItem>> attendanceStatuses(String scope) async {
    final json = await _api.get(
      'reference/attendance-statuses',
      query: {'scope': scope},
    ) as Map<String, dynamic>;
    return jsonList(json['data'], RefItem.fromJson);
  }

  // ─── حضور المعلمين ─────────────────────────────────────────────────────────
  @override
  Future<PagedResult<TeacherAttendanceDay>> teacherAttendanceDays({
    int page = 1,
    String? status,
    String? dateFrom,
    String? dateTo,
  }) async {
    final json = await _api.get(
      'teacher-attendance/days',
      query: _filters(
        page: page,
        status: status,
        dateFrom: dateFrom,
        dateTo: dateTo,
      ),
    ) as Map<String, dynamic>;
    return PagedResult.fromJson(json, TeacherAttendanceDay.fromJson);
  }

  @override
  Future<TeacherAttendanceDay> teacherAttendanceDay(int id) async {
    final json =
        await _api.get('teacher-attendance/days/$id') as Map<String, dynamic>;
    return TeacherAttendanceDay.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<void> recordTeacherAttendance({
    required String attendanceDate,
    required List<Map<String, dynamic>> records,
    required int courseId,
    String? notes,
  }) async {
    await _api.post('teacher-attendance', body: {
      'attendance_date': attendanceDate,
      'course_id': courseId,
      'records': records,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
  }



  // ─── الحفظ (المحفوظات) ─────────────────────────────────────────────────────
  @override
  Future<PagedResult<MemorizationEntry>> memorization({
    int page = 1,
    int? studentId,
    int? groupId,
    String? entryType,
    String? dateFrom,
    String? dateTo,
  }) async {
    final query = _filters(
      page: page,
      studentId: studentId,
      groupId: groupId,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );
    if (entryType != null) query['entry_type'] = entryType;
    final json =
        await _api.get('memorization', query: query) as Map<String, dynamic>;
    return PagedResult.fromJson(json, MemorizationEntry.fromJson);
  }

  /// `entryType`: new | review. الصفحات المحفوظة مسبقاً تُرجع 422 مع `duplicates`.
  @override
  Future<void> recordMemorization(
    int enrollmentId, {
    required String entryType,
    required int fromPage,
    required int toPage,
    required String recordedOn,
    int? teacherId,
    String? notes,
  }) async {
    await _api.post('enrollments/$enrollmentId/memorization', body: {
      'entry_type': entryType,
      'from_page': fromPage,
      'to_page': toPage,
      'recorded_on': recordedOn,
      if (teacherId != null) 'teacher_id': teacherId,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
  }

  // ─── اختبارات الأوقاف ─────────────────────────────────────────────────────
  @override
  Future<PagedResult<AwqafTest>> awqafTests({
    int page = 1,
    int? studentId,
    int? groupId,
    String? status,
    String? dateFrom,
    String? dateTo,
  }) async {
    final query = _filters(
      page: page,
      studentId: studentId,
      groupId: groupId,
      status: status,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );
    final json =
        await _api.get('quran-tests', query: query) as Map<String, dynamic>;
    return PagedResult.fromJson(json, AwqafTest.fromJson);
  }

  /// يقبل نوع الأوقاف فقط. `status`: passed | failed | cancelled.
  @override
  Future<void> recordAwqafTest(
    int enrollmentId, {
    required int juzId,
    required int quranTestTypeId,
    required String testedOn,
    required String status,
    double? score,
    int? teacherId,
    String? notes,
  }) async {
    await _api.post('enrollments/$enrollmentId/quran-tests', body: {
      'juz_id': juzId,
      'quran_test_type_id': quranTestTypeId,
      'tested_on': testedOn,
      'status': status,
      if (score != null) 'score': score,
      if (teacherId != null) 'teacher_id': teacherId,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
  }

  // ─── النقاط ────────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<PointEntry>> points({
    int page = 1,
    int? studentId,
    int? groupId,
    int? pointTypeId,
    String? state,
  }) async {
    final query = _filters(page: page, studentId: studentId, groupId: groupId);
    if (pointTypeId != null) query['point_type_id'] = pointTypeId;
    if (state != null) query['state'] = state;
    final json = await _api.get('points', query: query) as Map<String, dynamic>;
    return PagedResult.fromJson(json, PointEntry.fromJson);
  }

  @override
  Future<void> addManualPoints(
    int enrollmentId, {
    required int pointTypeId,
    required int points,
    String? notes,
  }) async {
    await _api.post('enrollments/$enrollmentId/points/manual', body: {
      'point_type_id': pointTypeId,
      'points': points,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
  }

  @override
  Future<void> voidPoint(int pointId) => _api.post('points/$pointId/void');

  // ─── التقييمات ─────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<AssessmentSummary>> assessments({
    int page = 1,
    int? groupId,
    bool? isActive,
  }) async {
    final query = _filters(page: page, groupId: groupId);
    if (isActive != null) query['is_active'] = isActive ? 1 : 0;
    final json =
        await _api.get('assessments', query: query) as Map<String, dynamic>;
    return PagedResult.fromJson(json, AssessmentSummary.fromJson);
  }

  @override
  Future<AssessmentDetail> assessment(int id) async {
    final json = await _api.get('assessments/$id') as Map<String, dynamic>;
    return AssessmentDetail.fromJson(jsonMap(json['data']) ?? const {});
  }

  /// `status`: passed | failed | absent | pending.
  @override
  Future<void> saveAssessmentResults(
    int assessmentId,
    List<Map<String, dynamic>> results,
  ) async {
    await _api.post('assessments/$assessmentId/results', body: {
      'results': results,
    });
  }

  // ─── ملاحظات الطلاب ────────────────────────────────────────────────────────
  @override
  Future<PagedResult<StudentNoteItem>> studentNotes({
    int page = 1,
    int? studentId,
    int? enrollmentId,
    String? source,
    String? visibility,
    String? dateFrom,
    String? dateTo,
  }) async {
    final query = _filters(
      page: page,
      studentId: studentId,
      enrollmentId: enrollmentId,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );
    if (source != null) query['source'] = source;
    if (visibility != null) query['visibility'] = visibility;
    final json =
        await _api.get('student-notes', query: query) as Map<String, dynamic>;
    return PagedResult.fromJson(json, StudentNoteItem.fromJson);
  }

  /// الإنشاء يتطلب `studentId`. التعديل لا يغيّر الطالب ولا التسجيل.
  @override
  Future<StudentNoteItem> createStudentNote({
    required int studentId,
    required String body,
    required String notedAt,
    required String source,
    required String visibility,
    int? enrollmentId,
  }) async {
    final json = await _api.post('student-notes', body: {
      'student_id': studentId,
      'body': body,
      'noted_at': notedAt,
      'source': source,
      'visibility': visibility,
      if (enrollmentId != null) 'enrollment_id': enrollmentId,
    }) as Map<String, dynamic>;
    return StudentNoteItem.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<StudentNoteItem> updateStudentNote(
    int id, {
    required String body,
    required String notedAt,
    required String source,
    required String visibility,
  }) async {
    final json = await _api.patch('student-notes/$id', body: {
      'body': body,
      'noted_at': notedAt,
      'source': source,
      'visibility': visibility,
    }) as Map<String, dynamic>;
    return StudentNoteItem.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<void> deleteStudentNote(int id) => _api.delete('student-notes/$id');

  // ─── المناهج ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<CurriculumSummary>> curricula({
    int page = 1,
    String? search,
    int? gradeLevelId,
  }) async {
    final query = _filters(page: page, search: search);
    if (gradeLevelId != null) query['grade_level_id'] = gradeLevelId;
    final json =
        await _api.get('curricula', query: query) as Map<String, dynamic>;
    return PagedResult.fromJson(json, CurriculumSummary.fromJson);
  }

  @override
  Future<CurriculumDetail> curriculum(int id) async {
    final json = await _api.get('curricula/$id') as Map<String, dynamic>;
    return CurriculumDetail.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<GroupCurriculum> groupCurriculum(int groupId) async {
    final json =
        await _api.get('groups/$groupId/curriculum') as Map<String, dynamic>;
    return GroupCurriculum.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<Uint8List> downloadCurriculumResource(int resourceId) =>
      _api.getBytes('curriculum-resources/$resourceId/download');

  @override
  Future<void> updateLessonTaught({
    required int groupId,
    required int lessonId,
    required bool isTaught,
  }) async {
    final status = isTaught ? 'taught' : 'untaught';
    try {
      await _api.post('groups/$groupId/curriculum/lessons/$lessonId', body: {
        'status': status,
        'is_taught': isTaught,
      });
    } catch (_) {
      try {
        await _api.patch('groups/$groupId/lessons/$lessonId', body: {
          'status': status,
        });
      } catch (_) {
        // Fallback or local state handled by caller
      }
    }
  }

  // ─── الطلاب ────────────────────────────────────────────────────────────────
  @override
  Future<StudentRecord> student(int id) async {
    final json = await _api.get('students/$id') as Map<String, dynamic>;
    return StudentRecord.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<StudentRecord> saveStudent(int? id, Map<String, dynamic> body) async {
    final json = id == null
        ? await _api.post('students', body: body)
        : await _api.patch('students/$id', body: body);
    return StudentRecord.fromJson(
      jsonMap((json as Map<String, dynamic>)['data']) ?? const {},
    );
  }

  @override
  Future<void> deleteStudent(int id) => _api.delete('students/$id');

  // ─── التسجيلات ─────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<EnrollmentRecord>> enrollments({
    int page = 1,
    int? groupId,
    int? studentId,
    String? status,
  }) async {
    final json = await _api.get(
      'enrollments',
      query: _filters(
        page: page,
        groupId: groupId,
        studentId: studentId,
        status: status,
      ),
    ) as Map<String, dynamic>;
    return PagedResult.fromJson(json, EnrollmentRecord.fromJson);
  }

  @override
  Future<EnrollmentRecord> enrollment(int id) async {
    final json = await _api.get('enrollments/$id') as Map<String, dynamic>;
    return EnrollmentRecord.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<EnrollmentRecord> saveEnrollment(
    int? id,
    Map<String, dynamic> body,
  ) async {
    final json = id == null
        ? await _api.post('enrollments', body: body)
        : await _api.patch('enrollments/$id', body: body);
    return EnrollmentRecord.fromJson(
      jsonMap((json as Map<String, dynamic>)['data']) ?? const {},
    );
  }

  @override
  Future<void> deleteEnrollment(int id) => _api.delete('enrollments/$id');

  // ─── الحلقات (تفاصيل كاملة للنموذج) ────────────────────────────────────────
  @override
  Future<GroupRecord> saveGroup(int? id, Map<String, dynamic> body) async {
    final json = id == null
        ? await _api.post('groups', body: body)
        : await _api.patch('groups/$id', body: body);
    return GroupRecord.fromJson(
      jsonMap((json as Map<String, dynamic>)['data']) ?? const {},
    );
  }

  @override
  Future<GroupRecord> group(int id) async {
    final json = await _api.get('groups/$id') as Map<String, dynamic>;
    return GroupRecord.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<List<GroupItem>> groupsForPicker({int page = 1}) async {
    final json = await _api.get('groups', query: {
      'page': page,
      'per_page': 100,
    }) as Map<String, dynamic>;
    return jsonList(json['data'], GroupItem.fromJson);
  }
}
