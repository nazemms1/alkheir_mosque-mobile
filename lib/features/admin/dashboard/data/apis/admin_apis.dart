import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:alkheir_mosque/features/admin/dashboard/data/params/admin_params.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';
import 'package:alkheir_mosque/features/admin/dashboard/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/shared/students/data/models/student_model.dart';

part 'admin_apis.g.dart';

@RestApi()
abstract class AdminApis {
  factory AdminApis(Dio dio) = _AdminApis;

  // count / student / openStudentAttendanceDay stay raw JSON on purpose: the
  // first reads `total` from three possible places, the second may or may not
  // be wrapped in `data`, and the third returns a bare `{id}`.

  /// عدد عناصر أي قائمة (`total`) — [path] مثل `students` أو `groups`.
  @GET('{path}')
  Future<dynamic> count(
      @Path('path') String path, @Queries() Map<String, dynamic> query);

  @GET('groups')
  Future<BaseApiModel<List<AdminGroupItemModel>>> groups(
      @Queries() Map<String, dynamic> query);

  @GET('enrollments')
  Future<BaseApiModel<List<AdminEnrollmentItemModel>>> groupEnrollments(
      @Queries() Map<String, dynamic> query);

  @POST('groups')
  Future<void> createGroup(@Body() CreateGroupParams params);

  @PATCH('groups/{groupId}')
  Future<void> updateGroup(
      @Path('groupId') int groupId, @Body() UpdateGroupParams params);

  @DELETE('groups/{groupId}')
  Future<void> deleteGroup(@Path('groupId') int groupId);

  @GET('students')
  Future<BaseApiModel<List<AdminStudentItemModel>>> fetchStudents(
      @Queries() Map<String, dynamic> query);

  @GET('enrollments')
  Future<BaseApiModel<List<AdminEnrollmentItemModel>>> fetchEnrollments(
      @Queries() Map<String, dynamic> query);

  @GET('parent/children/{studentId}')
  Future<BaseApiModel<ChildDetailModel>> childDetail(
      @Path('studentId') int studentId);

  @GET('parent/children/{studentId}/attendance')
  Future<BaseApiModel<List<AttendanceEntryModel>>> childAttendance(
      @Path('studentId') int studentId, @Queries() Map<String, dynamic> query);

  @GET('parent/children/{studentId}/points')
  Future<BaseApiModel<List<PointEntryModel>>> childPoints(
      @Path('studentId') int studentId, @Queries() Map<String, dynamic> query);

  @GET('students/{studentId}')
  Future<dynamic> student(@Path('studentId') int studentId);

  @GET('enrollments')
  Future<BaseApiModel<List<AdminEnrollmentItemModel>>> studentEnrollments(
      @Queries() Map<String, dynamic> query);

  @GET('assessments')
  Future<BaseApiModel<List<AdminAssessmentItemModel>>> groupAssessments(
      @Queries() Map<String, dynamic> query);

  @POST('enrollments/{enrollmentId}/memorization')
  Future<void> recordMemorization(@Path('enrollmentId') int enrollmentId,
      @Body() RecordMemorizationParams params);

  @POST('groups/{groupId}/attendance')
  Future<void> recordGroupAttendance(
      @Path('groupId') int groupId, @Body() RecordGroupAttendanceParams params);

  @POST('student-attendance/days')
  Future<dynamic> openStudentAttendanceDay(
      @Body() OpenStudentAttendanceDayParams params);

  @POST('student-attendance/days/{studentAttendanceDayId}/scan')
  Future<ScanAttendanceResultModel> scanStudentAttendance(
      @Path('studentAttendanceDayId') int studentAttendanceDayId,
      @Body() ScanStudentAttendanceParams params);

  @POST('student-attendance/quick-scan')
  Future<ScanAttendanceResultModel> quickScanStudentAttendance(
      @Body() QuickScanStudentAttendanceParams params);

  @GET('assessments')
  Future<BaseApiModel<List<AdminAssessmentItemModel>>> fetchAssessments(
      @Queries() Map<String, dynamic> query);

  @GET('invoices')
  Future<BaseApiModel<List<AdminInvoiceItemModel>>> fetchInvoices(
      @Queries() Map<String, dynamic> query);

  @GET('activities')
  Future<BaseApiModel<List<AdminActivityItemModel>>> activities(
      @Queries() Map<String, dynamic> query);
}
