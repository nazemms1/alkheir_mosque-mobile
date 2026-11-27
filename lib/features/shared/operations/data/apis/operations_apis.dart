import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:alkheir_mosque/features/shared/operations/data/params/operations_params.dart';

import 'package:alkheir_mosque/features/admin/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/admin/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/admin/management/data/models/records_model.dart';
import 'package:alkheir_mosque/features/shared/operations/data/models/operations_model.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';

part 'operations_apis.g.dart';

@RestApi()
abstract class OperationsApis {
  factory OperationsApis(Dio dio) = _OperationsApis;

  @GET('student-attendance/days')
  Future<BaseApiModel<List<AttendanceDaySummaryModel>>> studentAttendanceDays(
      @Queries() Map<String, dynamic> query);

  @GET('student-attendance/days/{id}')
  Future<BaseApiModel<AttendanceDayDetailModel>> studentAttendanceDay(
      @Path('id') int id);

  @PATCH('student-attendance/days/{id}/status')
  Future<BaseApiModel<AttendanceDayDetailModel>> setStudentAttendanceDayStatus(
      @Path('id') int id, @Body() SetStudentAttendanceDayStatusParams params);

  @POST('groups/{groupId}/attendance')
  Future<void> takeGroupAttendance(
      @Path('groupId') int groupId, @Body() TakeGroupAttendanceParams params);

  @GET('reference/point-types')
  Future<BaseApiModel<List<RefItemModel>>> manualPointTypes(
      @Queries() Map<String, dynamic> query);

  @GET('reference/attendance-statuses')
  Future<BaseApiModel<List<RefItemModel>>> attendanceStatuses(
      @Queries() Map<String, dynamic> query);

  @GET('teacher-attendance/days')
  Future<BaseApiModel<List<TeacherAttendanceDayModel>>> teacherAttendanceDays(
      @Queries() Map<String, dynamic> query);

  @GET('teacher-attendance/days/{id}')
  Future<BaseApiModel<TeacherAttendanceDayModel>> teacherAttendanceDay(
      @Path('id') int id);

  @POST('teacher-attendance')
  Future<void> recordTeacherAttendance(
      @Body() RecordTeacherAttendanceParams params);

  @GET('memorization')
  Future<BaseApiModel<List<MemorizationEntryModel>>> memorization(
      @Queries() Map<String, dynamic> query);

  @POST('enrollments/{enrollmentId}/memorization')
  Future<void> recordMemorization(@Path('enrollmentId') int enrollmentId,
      @Body() RecordMemorizationParams params);

  @GET('quran-tests')
  Future<BaseApiModel<List<AwqafTestModel>>> awqafTests(
      @Queries() Map<String, dynamic> query);

  @POST('enrollments/{enrollmentId}/quran-tests')
  Future<void> recordAwqafTest(@Path('enrollmentId') int enrollmentId,
      @Body() RecordAwqafTestParams params);

  @GET('points')
  Future<BaseApiModel<List<PointEntryModel>>> points(
      @Queries() Map<String, dynamic> query);

  @POST('enrollments/{enrollmentId}/points/manual')
  Future<void> addManualPoints(@Path('enrollmentId') int enrollmentId,
      @Body() AddManualPointsParams params);

  @POST('points/{pointId}/void')
  Future<void> voidPoint(@Path('pointId') int pointId);

  @GET('assessments')
  Future<BaseApiModel<List<AssessmentSummaryModel>>> assessments(
      @Queries() Map<String, dynamic> query);

  @GET('assessments/{id}')
  Future<BaseApiModel<AssessmentDetailModel>> assessment(@Path('id') int id);

  @POST('assessments/{assessmentId}/results')
  Future<void> saveAssessmentResults(@Path('assessmentId') int assessmentId,
      @Body() SaveAssessmentResultsParams params);

  @GET('student-notes')
  Future<BaseApiModel<List<StudentNoteItemModel>>> studentNotes(
      @Queries() Map<String, dynamic> query);

  @POST('student-notes')
  Future<BaseApiModel<StudentNoteItemModel>> createStudentNote(
      @Body() CreateStudentNoteParams params);

  @PATCH('student-notes/{id}')
  Future<BaseApiModel<StudentNoteItemModel>> updateStudentNote(
      @Path('id') int id, @Body() UpdateStudentNoteParams params);

  @DELETE('student-notes/{id}')
  Future<void> deleteStudentNote(@Path('id') int id);

  @GET('curricula')
  Future<BaseApiModel<List<CurriculumSummaryModel>>> curricula(
      @Queries() Map<String, dynamic> query);

  @GET('curricula/{id}')
  Future<BaseApiModel<CurriculumDetailModel>> curriculum(@Path('id') int id);

  @GET('groups/{groupId}/curriculum')
  Future<BaseApiModel<GroupCurriculumModel>> groupCurriculum(
      @Path('groupId') int groupId);

  @GET('curriculum-resources/{resourceId}/download')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadCurriculumResource(
      @Path('resourceId') int resourceId, @DioOptions() RequestOptions options);

  @POST('groups/{groupId}/curriculum/lessons/{lessonId}')
  Future<void> updateLessonTaught(@Path('groupId') int groupId,
      @Path('lessonId') int lessonId, @Body() UpdateLessonTaughtParams params);

  @PATCH('groups/{groupId}/lessons/{lessonId}')
  Future<void> patchLessonTaught(@Path('groupId') int groupId,
      @Path('lessonId') int lessonId, @Body() PatchLessonTaughtParams params);

  @GET('students/{id}')
  Future<BaseApiModel<StudentRecordModel>> student(@Path('id') int id);

  @POST('students')
  Future<BaseApiModel<StudentRecordModel>> createStudent(
      @Body() SaveStudentParams params);

  @PATCH('students/{id}')
  Future<BaseApiModel<StudentRecordModel>> updateStudent(
      @Path('id') int id, @Body() SaveStudentParams params);

  @DELETE('students/{id}')
  Future<void> deleteStudent(@Path('id') int id);

  @GET('enrollments')
  Future<BaseApiModel<List<EnrollmentRecordModel>>> enrollments(
      @Queries() Map<String, dynamic> query);

  @GET('enrollments/{id}')
  Future<BaseApiModel<EnrollmentRecordModel>> enrollment(@Path('id') int id);

  @POST('enrollments')
  Future<BaseApiModel<EnrollmentRecordModel>> createEnrollment(
      @Body() SaveEnrollmentParams params);

  @PATCH('enrollments/{id}')
  Future<BaseApiModel<EnrollmentRecordModel>> updateEnrollment(
      @Path('id') int id, @Body() SaveEnrollmentParams params);

  @DELETE('enrollments/{id}')
  Future<void> deleteEnrollment(@Path('id') int id);

  @POST('groups')
  Future<BaseApiModel<GroupRecordModel>> createGroup(
      @Body() SaveGroupParams params);

  @PATCH('groups/{id}')
  Future<BaseApiModel<GroupRecordModel>> updateGroup(
      @Path('id') int id, @Body() SaveGroupParams params);

  @GET('groups/{id}')
  Future<BaseApiModel<GroupRecordModel>> group(@Path('id') int id);

  @GET('groups')
  Future<BaseApiModel<List<GroupItemModel>>> groupsForPicker(
      @Queries() Map<String, dynamic> query);
}
