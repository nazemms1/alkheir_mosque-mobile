import 'package:alkheir_mosque/app/core/api/api_service.dart';
import '../../domain/repositories/reports_repository.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  final ApiService _api;

  ReportsRepositoryImpl([ApiService? api]) : _api = api ?? ApiService();

  /// نظرة عامة — كل الفلاتر اختيارية، التواريخ بصيغة YYYY-MM-DD.
  @override
  Future<Map<String, dynamic>> fetchOverview({
    int? academicYearId,
    String? dateFrom,
    String? dateTo,
    int? groupId,
  }) async {
    final body = await _api.get('reports/overview', query: {
      'lang': 'ar',
      if (academicYearId != null) 'academic_year_id': academicYearId,
      if (dateFrom != null) 'date_from': dateFrom,
      if (dateTo != null) 'date_to': dateTo,
      if (groupId != null) 'group_id': groupId,
    });
    return _unwrap(body);
  }

  /// ملخص المعلمين اليومي — التاريخ بصيغة YYYY-MM-DD.
  @override
  Future<Map<String, dynamic>> fetchTeachersDailySummary({
    String? date,
    bool includeEmpty = false,
    int? teacherId,
  }) async {
    final body = await _api.get('reports/teachers/daily-summary', query: {
      'lang': 'ar',
      if (date != null) 'date': date,
      'include_empty': includeEmpty ? '1' : '0',
      if (teacherId != null) 'teacher_id': teacherId,
    });
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
