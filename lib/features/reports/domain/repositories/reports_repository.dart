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
