import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/params/quran_tests_params.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';

import '../models/quran_test_model.dart';

part 'quran_tests_apis.g.dart';

@RestApi()
abstract class QuranTestsApis {
  factory QuranTestsApis(Dio dio) = _QuranTestsApis;

  // ─── الجزئي ────────────────────────────────────────────────────────────────
  @GET('quran-partial-tests')
  Future<BaseApiModel<List<QuranPartialCycleModel>>> partialCycles(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('student_id') int? studentId,
    @Query('status') String? status,
  });

  @GET('quran-partial-tests/{id}')
  Future<BaseApiModel<QuranPartialCycleModel>> partialCycle(@Path('id') int id);

  @GET('enrollments/{enrollmentId}/quran-partial-tests/eligible-juz')
  Future<BaseApiModel<List<QuranJuzModel>>> partialEligibleJuz(
      @Path('enrollmentId') int enrollmentId);

  @POST('enrollments/{enrollmentId}/quran-partial-tests')
  Future<BaseApiModel<QuranPartialCycleModel>> startPartial(
    @Path('enrollmentId') int enrollmentId,
    @Body() StartPartialParams params,
  );

  @POST('quran-partial-tests/{cycleId}/parts/{partId}/attempts')
  Future<BaseApiModel<QuranPartialAttemptModel>> recordPartialAttempt(
    @Path('cycleId') int cycleId,
    @Path('partId') int partId,
    @Body() RecordPartialAttemptParams params,
  );

  // ─── النهائي ───────────────────────────────────────────────────────────────
  @GET('quran-final-tests')
  Future<BaseApiModel<List<QuranFinalCycleModel>>> finalCycles(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('student_id') int? studentId,
    @Query('status') String? status,
  });

  @GET('quran-final-tests/{id}')
  Future<BaseApiModel<QuranFinalCycleModel>> finalCycle(@Path('id') int id);

  @GET('enrollments/{enrollmentId}/quran-final-tests/eligible-juz')
  Future<BaseApiModel<List<QuranJuzModel>>> finalEligibleJuz(
      @Path('enrollmentId') int enrollmentId);

  @POST('enrollments/{enrollmentId}/quran-final-tests')
  Future<BaseApiModel<QuranFinalCycleModel>> startFinal(
    @Path('enrollmentId') int enrollmentId,
    @Body() StartFinalParams params,
  );

  @POST('quran-final-tests/{cycleId}/attempts')
  Future<BaseApiModel<QuranFinalAttemptModel>> recordFinalAttempt(
    @Path('cycleId') int cycleId,
    @Body() RecordFinalAttemptParams params,
  );
}
