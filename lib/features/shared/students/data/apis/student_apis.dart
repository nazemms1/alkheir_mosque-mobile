import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:alkheir_mosque/features/shared/students/data/params/student_params.dart';

import 'package:alkheir_mosque/features/shared/students/data/models/student_model.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';

part 'student_apis.g.dart';

@RestApi()
abstract class StudentApis {
  factory StudentApis(Dio dio) = _StudentApis;

  @GET('parent/profile')
  Future<BaseApiModel<ParentProfileModel>> fetchParentProfile();

  @GET('parent/summary')
  Future<BaseApiModel<ParentSummaryModel>> fetchParentSummary();

  @GET('parent/children')
  Future<BaseApiModel<List<ChildDetailModel>>> fetchChildren();

  @GET('parent/children/{studentId}')
  Future<BaseApiModel<ChildDetailModel>> fetchChildDetail(
      @Path('studentId') int studentId);

  @GET('parent/children/{studentId}/memorization')
  Future<BaseApiModel<List<MemorizationEntryModel>>> fetchMemorization(
      @Path('studentId') int studentId, @Queries() Map<String, dynamic> query);

  @GET('parent/children/{studentId}/points')
  Future<BaseApiModel<List<PointEntryModel>>> fetchPoints(
      @Path('studentId') int studentId, @Queries() Map<String, dynamic> query);

  @GET('parent/children/{studentId}/notes')
  Future<BaseApiModel<List<NoteEntryModel>>> fetchNotes(
      @Path('studentId') int studentId, @Queries() Map<String, dynamic> query);

  @GET('parent/children/{studentId}/quran-tests')
  Future<BaseApiModel<List<QuranTestEntryModel>>> fetchQuranTests(
      @Path('studentId') int studentId, @Queries() Map<String, dynamic> query);

  @GET('parent/children/{studentId}/attendance')
  Future<BaseApiModel<List<AttendanceEntryModel>>> fetchAttendance(
      @Path('studentId') int studentId, @Queries() Map<String, dynamic> query);

  @GET('parent/activities')
  Future<BaseApiModel<List<ParentActivityModel>>> fetchActivities();

  @POST('parent/activities/{activityId}/responses')
  Future<void> respondToActivity(@Path('activityId') int activityId,
      @Body() RespondToActivityParams params);

  @GET('parent/invoices')
  Future<BaseApiModel<List<InvoiceListItemModel>>> fetchInvoices(
      @Queries() Map<String, dynamic> query);

  @GET('parent/invoices/{invoiceId}')
  Future<BaseApiModel<InvoiceDetailModel>> fetchInvoiceDetail(
      @Path('invoiceId') int invoiceId);
}
