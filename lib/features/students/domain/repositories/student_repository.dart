import '../../data/models/student_model.dart';

abstract class StudentRepository {
  Future<ParentProfile> fetchParentProfile();

  Future<ParentSummary> fetchParentSummary();

  Future<List<ChildDetail>> fetchChildren();

  Future<ChildDetail> fetchChildDetail(int studentId);

  Future<List<MemorizationEntry>> fetchMemorization(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    String? entryType,
    int perPage = 50,
  });

  Future<List<PointEntry>> fetchPoints(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  });

  Future<List<NoteEntry>> fetchNotes(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  });

  Future<List<QuranTestEntry>> fetchQuranTests(
    int studentId, {
    int perPage = 50,
  });

  Future<List<AttendanceEntry>> fetchAttendance(
    int studentId, {
    String? dateFrom,
    String? dateTo,
    int perPage = 50,
  });

  Future<List<ParentActivity>> fetchActivities();

  Future<void> respondToActivity(
    int activityId, {
    required int studentId,
    required String response,
  });

  Future<List<InvoiceListItem>> fetchInvoices({
    String? status,
    int perPage = 50,
  });

  Future<InvoiceDetail> fetchInvoiceDetail(int invoiceId);

  Future<
      ({
        ParentProfile profile,
        ParentSummary summary,
        List<ChildDetail> children
      })> fetchDashboard();

  ChildData childDetailToChildData(ChildDetail child);

  MemorizationProgress buildProgressFromEntries({
    required List<MemorizationEntry> entries,
    required int totalMemorizedPages,
    required int currentJuz,
    required String teacherName,
  });
}
