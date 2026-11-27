import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:alkheir_mosque/app/core/http/end_points.dart';

part 'reports_apis.g.dart';

/// التقارير تُرجع بنى ديناميكية تختلف حسب الفلاتر، فتُقرأ كـ JSON خام.
@RestApi()
abstract class ReportsApis {
  factory ReportsApis(Dio dio) = _ReportsApis;

  @GET(EndPoints.reportsOverview)
  Future<dynamic> overview({
    @Query('lang') String lang = 'ar',
    @Query('academic_year_id') int? academicYearId,
    @Query('date_from') String? dateFrom,
    @Query('date_to') String? dateTo,
    @Query('group_id') int? groupId,
  });

  @GET(EndPoints.reportsTeachersDailySummary)
  Future<dynamic> teachersDailySummary({
    @Query('lang') String lang = 'ar',
    @Query('date') String? date,
    @Query('include_empty') String includeEmpty = '0',
    @Query('teacher_id') int? teacherId,
  });
}
