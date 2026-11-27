import 'package:alkheir_mosque/app/core/function/function.dart';

import '../../data/apis/reports_apis.dart';

abstract class ReportsRepository {
  Future<Map<String, dynamic>> fetchOverview({
    int? academicYearId,
    String? dateFrom,
    String? dateTo,
    int? groupId,
  });

  Future<Map<String, dynamic>> fetchTeachersDailySummary({
    String? date,
    bool includeEmpty = false,
    int? teacherId,
  });
}

class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsApis api;

  ReportsRepositoryImpl(this.api);

  /// نظرة عامة — كل الفلاتر اختيارية، التواريخ بصيغة YYYY-MM-DD.
  @override
  Future<Map<String, dynamic>> fetchOverview({
    int? academicYearId,
    String? dateFrom,
    String? dateTo,
    int? groupId,
  }) async {
    final body = await handleRepoData(() => api.overview(
          academicYearId: academicYearId,
          dateFrom: dateFrom,
          dateTo: dateTo,
          groupId: groupId,
        ));
    return _unwrap(body);
  }

  /// ملخص المعلمين اليومي — التاريخ بصيغة YYYY-MM-DD.
  @override
  Future<Map<String, dynamic>> fetchTeachersDailySummary({
    String? date,
    bool includeEmpty = false,
    int? teacherId,
  }) async {
    final body = await handleRepoData(() => api.teachersDailySummary(
          date: date,
          includeEmpty: includeEmpty ? '1' : '0',
          teacherId: teacherId,
        ));
    return _unwrap(body);
  }

  /// بعض الـ endpoints تلفّ البيانات داخل مفتاح data — نفكّها إن وُجدت.
  Map<String, dynamic> _unwrap(dynamic body) {
    if (body is Map<String, dynamic>) {
      final data = body['data'];
      if (data is Map<String, dynamic>) return data;
      if (data is List) return {'items': data};
      return body;
    }
    if (body is List) return {'items': body};
    return {};
  }
}
