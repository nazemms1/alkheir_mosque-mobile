import 'package:alkheir_mosque/features/students/data/models/student_model.dart'
    show ChildDetail, AttendanceEntry, PointEntry, StudentParentInfo;
import '../../data/models/admin_dashboard_model.dart';

abstract class AdminRepository {
  Future<AdminStats> fetchStats();

  Future<AdminStats> fetchSupervisorStats();

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
      })> fetchDashboard();
}
