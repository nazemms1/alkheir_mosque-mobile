import 'package:alkheir_mosque/features/shared/operations/data/params/operations_params.dart';
import 'package:alkheir_mosque/app/core/http/data/mapper/shared_mapper.dart';
import 'package:alkheir_mosque/features/admin/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/admin/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/records_entity.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/data/mapper/group_student_mapper.dart';
import 'package:alkheir_mosque/features/admin/management/data/mapper/management_mapper.dart';
import 'package:alkheir_mosque/features/admin/management/data/mapper/records_mapper.dart';
import 'package:alkheir_mosque/features/shared/operations/data/mapper/operations_mapper.dart';
import '../../data/apis/operations_apis.dart';
import 'dart:typed_data';
import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/dio_client.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

abstract class OperationsRepository {
  Future<PagedResult<AttendanceDaySummary>> studentAttendanceDays({
    int page = 1,
    String? status,
    String? dateFrom,
    String? dateTo,
  });

  Future<AttendanceDayDetail> studentAttendanceDay(int id);

  Future<AttendanceDayDetail> setStudentAttendanceDayStatus(
    int id,
    String status,
  );

  Future<void> takeGroupAttendance({
    required int groupId,
    required String attendanceDate,
    required List<Map<String, dynamic>> records,
    String? notes,
  });

  Future<List<RefItem>> manualPointTypes();

  Future<List<RefItem>> attendanceStatuses(String scope);

  Future<PagedResult<TeacherAttendanceDay>> teacherAttendanceDays({
    int page = 1,
    String? status,
    String? dateFrom,
    String? dateTo,
  });

  Future<TeacherAttendanceDay> teacherAttendanceDay(int id);

  Future<void> recordTeacherAttendance({
    required String attendanceDate,
    required List<Map<String, dynamic>> records,
    required int courseId,
    String? notes,
  });

  Future<PagedResult<MemorizationEntry>> memorization({
    int page = 1,
    int? studentId,
    int? groupId,
    String? entryType,
    String? dateFrom,
    String? dateTo,
  });

  Future<void> recordMemorization(
    int enrollmentId, {
    required String entryType,
    required int fromPage,
    required int toPage,
    required String recordedOn,
    int? teacherId,
    String? notes,
  });

  Future<PagedResult<AwqafTest>> awqafTests({
    int page = 1,
    int? studentId,
    int? groupId,
    String? status,
    String? dateFrom,
    String? dateTo,
  });

  Future<void> recordAwqafTest(
    int enrollmentId, {
    required int juzId,
    required int quranTestTypeId,
    required String testedOn,
    required String status,
    double? score,
    int? teacherId,
    String? notes,
  });

  Future<PagedResult<PointEntry>> points({
    int page = 1,
    int? studentId,
    int? groupId,
    int? pointTypeId,
    String? state,
  });

  Future<void> addManualPoints(
    int enrollmentId, {
    required int pointTypeId,
    required int points,
    String? notes,
  });

  Future<void> voidPoint(int pointId);

  Future<PagedResult<AssessmentSummary>> assessments({
    int page = 1,
    int? groupId,
    bool? isActive,
  });

  Future<AssessmentDetail> assessment(int id);

  Future<void> saveAssessmentResults(
    int assessmentId,
    List<Map<String, dynamic>> results,
  );

  Future<PagedResult<StudentNoteItem>> studentNotes({
    int page = 1,
    int? studentId,
    int? enrollmentId,
    String? source,
    String? visibility,
    String? dateFrom,
    String? dateTo,
  });

  Future<StudentNoteItem> createStudentNote({
    required int studentId,
    required String body,
    required String notedAt,
    required String source,
    required String visibility,
    int? enrollmentId,
  });

  Future<StudentNoteItem> updateStudentNote(
    int id, {
    required String body,
    required String notedAt,
    required String source,
    required String visibility,
  });

  Future<void> deleteStudentNote(int id);

  Future<PagedResult<CurriculumSummary>> curricula({
    int page = 1,
    String? search,
    int? gradeLevelId,
  });

  Future<CurriculumDetail> curriculum(int id);

  Future<GroupCurriculum> groupCurriculum(int groupId);

  Future<Uint8List> downloadCurriculumResource(int resourceId);

  Future<void> updateLessonTaught({
    required int groupId,
    required int lessonId,
    required bool isTaught,
  });

  Future<StudentRecord> student(int id);

  Future<StudentRecord> saveStudent(int? id, SaveStudentParams body);

  Future<void> deleteStudent(int id);

  Future<PagedResult<EnrollmentRecord>> enrollments({
    int page = 1,
    int? groupId,
    int? studentId,
    String? status,
  });

  Future<EnrollmentRecord> enrollment(int id);

  Future<EnrollmentRecord> saveEnrollment(
    int? id,
    SaveEnrollmentParams body,
  );

  Future<void> deleteEnrollment(int id);

  Future<GroupRecord> saveGroup(int? id, SaveGroupParams body);

  Future<GroupRecord> group(int id);

  Future<List<GroupItem>> groupsForPicker({int page = 1});
}

class OperationsRepositoryImpl implements OperationsRepository {
  final OperationsApis api;

  OperationsRepositoryImpl(this.api);

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
    final result =
        await handleRepoData(() => api.studentAttendanceDays(_filters(
              page: page,
              status: status,
              dateFrom: dateFrom,
              dateTo: dateTo,
            )));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<AttendanceDayDetail> studentAttendanceDay(int id) async {
    final result = await handleRepoData(() => api.studentAttendanceDay(id));
    return result.data.toDomain();
  }

  /// `open` أو `closed`. اليوم المغلق للدورة المنتهية يبقى للقراءة فقط.
  @override
  Future<AttendanceDayDetail> setStudentAttendanceDayStatus(
    int id,
    String status,
  ) async {
    final result = await handleRepoData(() => api.setStudentAttendanceDayStatus(
        id, SetStudentAttendanceDayStatusParams(status: status)));
    return result.data.toDomain();
  }

  /// حضور حلقة في تاريخ محدد. كل سجل: `enrollment_id` و`attendance_status_id`.
  @override
  Future<void> takeGroupAttendance({
    required int groupId,
    required String attendanceDate,
    required List<Map<String, dynamic>> records,
    String? notes,
  }) async {
    await handleRepoData(() => api.takeGroupAttendance(
        groupId,
        TakeGroupAttendanceParams(
            attendanceDate: attendanceDate,
            records: records,
            notes: (notes != null && notes.isNotEmpty) ? notes : null)));
  }

  /// أنواع النقاط اليدوية فقط (`manual_only=1`) لنموذج إضافة النقاط.
  @override
  Future<List<RefItem>> manualPointTypes() async {
    final result = await handleRepoData(() => api.manualPointTypes({
          'manual_only': 1,
        }));
    return [
      for (final e in result.data ?? const <RefItemModel>[]) e.toDomain()
    ];
  }

  /// `scope`: student | teacher | both — يحدد الحالات المتاحة للاختيار.
  @override
  Future<List<RefItem>> attendanceStatuses(String scope) async {
    final result =
        await handleRepoData(() => api.attendanceStatuses({'scope': scope}));
    return [
      for (final e in result.data ?? const <RefItemModel>[]) e.toDomain()
    ];
  }

  // ─── حضور المعلمين ─────────────────────────────────────────────────────────
  @override
  Future<PagedResult<TeacherAttendanceDay>> teacherAttendanceDays({
    int page = 1,
    String? status,
    String? dateFrom,
    String? dateTo,
  }) async {
    final result =
        await handleRepoData(() => api.teacherAttendanceDays(_filters(
              page: page,
              status: status,
              dateFrom: dateFrom,
              dateTo: dateTo,
            )));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<TeacherAttendanceDay> teacherAttendanceDay(int id) async {
    final result = await handleRepoData(() => api.teacherAttendanceDay(id));
    return result.data.toDomain();
  }

  @override
  Future<void> recordTeacherAttendance({
    required String attendanceDate,
    required List<Map<String, dynamic>> records,
    required int courseId,
    String? notes,
  }) async {
    await handleRepoData(() => api.recordTeacherAttendance(
        RecordTeacherAttendanceParams(
            attendanceDate: attendanceDate,
            courseId: courseId,
            records: records,
            notes: (notes != null && notes.isNotEmpty) ? notes : null)));
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
    final result = await handleRepoData(() => api.memorization(query));
    return result.toPaged((e) => e.toDomain());
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
    await handleRepoData(() => api.recordMemorization(
        enrollmentId,
        RecordMemorizationParams(
            entryType: entryType,
            fromPage: fromPage,
            toPage: toPage,
            recordedOn: recordedOn,
            teacherId: (teacherId != null) ? teacherId : null,
            notes: (notes != null && notes.isNotEmpty) ? notes : null)));
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
    final result = await handleRepoData(() => api.awqafTests(query));
    return result.toPaged((e) => e.toDomain());
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
    await handleRepoData(() => api.recordAwqafTest(
        enrollmentId,
        RecordAwqafTestParams(
            juzId: juzId,
            quranTestTypeId: quranTestTypeId,
            testedOn: testedOn,
            status: status,
            score: (score != null) ? score : null,
            teacherId: (teacherId != null) ? teacherId : null,
            notes: (notes != null && notes.isNotEmpty) ? notes : null)));
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
    final result = await handleRepoData(() => api.points(query));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<void> addManualPoints(
    int enrollmentId, {
    required int pointTypeId,
    required int points,
    String? notes,
  }) async {
    await handleRepoData(() => api.addManualPoints(
        enrollmentId,
        AddManualPointsParams(
            pointTypeId: pointTypeId,
            points: points,
            notes: (notes != null && notes.isNotEmpty) ? notes : null)));
  }

  @override
  Future<void> voidPoint(int pointId) =>
      handleRepoData(() => api.voidPoint(pointId));

  // ─── التقييمات ─────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<AssessmentSummary>> assessments({
    int page = 1,
    int? groupId,
    bool? isActive,
  }) async {
    final query = _filters(page: page, groupId: groupId);
    if (isActive != null) query['is_active'] = isActive ? 1 : 0;
    final result = await handleRepoData(() => api.assessments(query));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<AssessmentDetail> assessment(int id) async {
    final result = await handleRepoData(() => api.assessment(id));
    return result.data.toDomain();
  }

  /// `status`: passed | failed | absent | pending.
  @override
  Future<void> saveAssessmentResults(
    int assessmentId,
    List<Map<String, dynamic>> results,
  ) async {
    await handleRepoData(() => api.saveAssessmentResults(
        assessmentId, SaveAssessmentResultsParams(results: results)));
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
    final result = await handleRepoData(() => api.studentNotes(query));
    return result.toPaged((e) => e.toDomain());
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
    final result = await handleRepoData(() => api.createStudentNote(
        CreateStudentNoteParams(
            studentId: studentId,
            body: body,
            notedAt: notedAt,
            source: source,
            visibility: visibility,
            enrollmentId: (enrollmentId != null) ? enrollmentId : null)));
    return result.data.toDomain();
  }

  @override
  Future<StudentNoteItem> updateStudentNote(
    int id, {
    required String body,
    required String notedAt,
    required String source,
    required String visibility,
  }) async {
    final result = await handleRepoData(() => api.updateStudentNote(
        id,
        UpdateStudentNoteParams(
            body: body,
            notedAt: notedAt,
            source: source,
            visibility: visibility)));
    return result.data.toDomain();
  }

  @override
  Future<void> deleteStudentNote(int id) =>
      handleRepoData(() => api.deleteStudentNote(id));

  // ─── المناهج ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<CurriculumSummary>> curricula({
    int page = 1,
    String? search,
    int? gradeLevelId,
  }) async {
    final query = _filters(page: page, search: search);
    if (gradeLevelId != null) query['grade_level_id'] = gradeLevelId;
    final result = await handleRepoData(() => api.curricula(query));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<CurriculumDetail> curriculum(int id) async {
    final result = await handleRepoData(() => api.curriculum(id));
    return result.data.toDomain();
  }

  @override
  Future<GroupCurriculum> groupCurriculum(int groupId) async {
    final result = await handleRepoData(() => api.groupCurriculum(groupId));
    return result.data.toDomain();
  }

  @override
  Future<Uint8List> downloadCurriculumResource(int resourceId) =>
      handleRepoData(() =>
              api.downloadCurriculumResource(resourceId, kBytesRequestOptions))
          .then((r) => Uint8List.fromList(r.data));

  @override
  Future<void> updateLessonTaught({
    required int groupId,
    required int lessonId,
    required bool isTaught,
  }) async {
    final status = isTaught ? 'taught' : 'untaught';
    try {
      await handleRepoData(() => api.updateLessonTaught(groupId, lessonId,
          UpdateLessonTaughtParams(status: status, isTaught: isTaught)));
    } catch (_) {
      try {
        await handleRepoData(() => api.patchLessonTaught(
            groupId, lessonId, PatchLessonTaughtParams(status: status)));
      } catch (_) {
        // Fallback or local state handled by caller
      }
    }
  }

  // ─── الطلاب ────────────────────────────────────────────────────────────────
  @override
  Future<StudentRecord> student(int id) async {
    final result = await handleRepoData(() => api.student(id));
    return result.data.toDomain();
  }

  @override
  Future<StudentRecord> saveStudent(int? id, SaveStudentParams body) async {
    final result = id == null
        ? await handleRepoData(() => api.createStudent(body))
        : await handleRepoData(() => api.updateStudent(id, body));
    return result.data.toDomain();
  }

  @override
  Future<void> deleteStudent(int id) =>
      handleRepoData(() => api.deleteStudent(id));

  // ─── التسجيلات ─────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<EnrollmentRecord>> enrollments({
    int page = 1,
    int? groupId,
    int? studentId,
    String? status,
  }) async {
    final result = await handleRepoData(() => api.enrollments(_filters(
          page: page,
          groupId: groupId,
          studentId: studentId,
          status: status,
        )));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<EnrollmentRecord> enrollment(int id) async {
    final result = await handleRepoData(() => api.enrollment(id));
    return result.data.toDomain();
  }

  @override
  Future<EnrollmentRecord> saveEnrollment(
    int? id,
    SaveEnrollmentParams body,
  ) async {
    final result = id == null
        ? await handleRepoData(() => api.createEnrollment(body))
        : await handleRepoData(() => api.updateEnrollment(id, body));
    return result.data.toDomain();
  }

  @override
  Future<void> deleteEnrollment(int id) =>
      handleRepoData(() => api.deleteEnrollment(id));

  // ─── الحلقات (تفاصيل كاملة للنموذج) ────────────────────────────────────────
  @override
  Future<GroupRecord> saveGroup(int? id, SaveGroupParams body) async {
    final result = id == null
        ? await handleRepoData(() => api.createGroup(body))
        : await handleRepoData(() => api.updateGroup(id, body));
    return result.data.toDomain();
  }

  @override
  Future<GroupRecord> group(int id) async {
    final result = await handleRepoData(() => api.group(id));
    return result.data.toDomain();
  }

  @override
  Future<List<GroupItem>> groupsForPicker({int page = 1}) async {
    final result = await handleRepoData(() => api.groupsForPicker({
          'page': page,
          'per_page': 100,
        }));
    return [
      for (final e in result.data ?? const <GroupItemModel>[]) e.toDomain()
    ];
  }
}
