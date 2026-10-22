import 'dart:typed_data';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/models/records_model.dart';
import '../../data/models/operations_model.dart';

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
    int? courseId,
    String? notes,
  });

  Future<void> deleteTeacherAttendanceDay(int id);


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

  Future<StudentRecord> saveStudent(int? id, Map<String, dynamic> body);

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
    Map<String, dynamic> body,
  );

  Future<void> deleteEnrollment(int id);

  Future<GroupRecord> saveGroup(int? id, Map<String, dynamic> body);

  Future<GroupRecord> group(int id);

  Future<List<GroupItem>> groupsForPicker({int page = 1});
}
