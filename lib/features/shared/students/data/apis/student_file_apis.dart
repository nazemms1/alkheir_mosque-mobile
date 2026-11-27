import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:alkheir_mosque/features/shared/students/data/models/student_progress_model.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';

part 'student_file_apis.g.dart';

@RestApi()
abstract class StudentFileApis {
  factory StudentFileApis(Dio dio) = _StudentFileApis;

  @GET('students/{studentId}/progress')
  Future<BaseApiModel<StudentProgressModel>> progress(
      @Path('studentId') int studentId);

  @GET('students/{studentId}/files')
  Future<BaseApiModel<List<StudentFileItemModel>>> files(
      @Path('studentId') int studentId);

  @POST('students/{studentId}/files')
  Future<BaseApiModel<StudentFileItemModel>> uploadFile(
      @Path('studentId') int studentId,
      @Body() FormData data,
      @DioOptions() RequestOptions options);

  @GET('students/{studentId}/files/{fileId}/download')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadFile(@Path('studentId') int studentId,
      @Path('fileId') int fileId, @DioOptions() RequestOptions options);

  @DELETE('students/{studentId}/files/{fileId}')
  Future<void> deleteFile(
      @Path('studentId') int studentId, @Path('fileId') int fileId);

  @GET('students/{studentId}/photo')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> photo(
      @Path('studentId') int studentId, @DioOptions() RequestOptions options);

  @POST('students/{studentId}/photo')
  Future<void> uploadPhoto(@Path('studentId') int studentId,
      @Body() FormData data, @DioOptions() RequestOptions options);

  @DELETE('students/{studentId}/photo')
  Future<void> deletePhoto(@Path('studentId') int studentId);
}
