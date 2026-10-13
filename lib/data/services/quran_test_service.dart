import '../models/json_helpers.dart';
import '../models/quran_test_model.dart';
import 'api_service.dart';

/// خدمة اختبارات القرآن الجزئية والنهائية. قواعد الأهلية والمحاولات والنجاح
/// كلها في الخادم (نفس خدمات الموقع)، والتطبيق يعرض النتائج ويرسل الإدخالات.
class QuranTestService {
  final ApiService _api;

  QuranTestService({ApiService? api}) : _api = api ?? ApiService();

  // ─── الجزئي ────────────────────────────────────────────────────────────────
  Future<PagedResult<QuranPartialCycle>> partialCycles({
    int page = 1,
    int? studentId,
    String? status,
  }) async {
    final json = await _api.get('quran-partial-tests', query: {
      'page': page,
      'per_page': 20,
      if (studentId != null) 'student_id': studentId,
      if (status != null) 'status': status,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, QuranPartialCycle.fromJson);
  }

  Future<QuranPartialCycle> partialCycle(int id) async {
    final json =
        await _api.get('quran-partial-tests/$id') as Map<String, dynamic>;
    return QuranPartialCycle.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<List<QuranJuz>> partialEligibleJuz(int enrollmentId) async {
    final json = await _api
            .get('enrollments/$enrollmentId/quran-partial-tests/eligible-juz')
        as Map<String, dynamic>;
    return jsonList(json['data'], QuranJuz.fromJson);
  }

  /// بدء دورة جزئية. `allowParallelCycle` لا يُفعَّل إلا بعد تأكيد المستخدم
  /// لتحذير الدورة المفتوحة (كما في الموقع).
  Future<QuranPartialCycle> startPartial(
    int enrollmentId, {
    required int juzId,
    bool allowParallelCycle = false,
  }) async {
    final json = await _api.post(
      'enrollments/$enrollmentId/quran-partial-tests',
      body: {
        'juz_id': juzId,
        'allow_parallel_cycle': allowParallelCycle,
      },
    ) as Map<String, dynamic>;
    return QuranPartialCycle.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<QuranPartialAttempt> recordPartialAttempt(
    int cycleId,
    int partId, {
    required int mistakeCount,
    required String testedOn,
    String? notes,
    int? teacherId,
  }) async {
    final json = await _api.post(
      'quran-partial-tests/$cycleId/parts/$partId/attempts',
      body: {
        'mistake_count': mistakeCount,
        'tested_on': testedOn,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
        if (teacherId != null) 'teacher_id': teacherId,
      },
    ) as Map<String, dynamic>;
    return QuranPartialAttempt.fromJson(json['data'] as Map<String, dynamic>);
  }

  // ─── النهائي ───────────────────────────────────────────────────────────────
  Future<PagedResult<QuranFinalCycle>> finalCycles({
    int page = 1,
    int? studentId,
    String? status,
  }) async {
    final json = await _api.get('quran-final-tests', query: {
      'page': page,
      'per_page': 20,
      if (studentId != null) 'student_id': studentId,
      if (status != null) 'status': status,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, QuranFinalCycle.fromJson);
  }

  Future<QuranFinalCycle> finalCycle(int id) async {
    final json =
        await _api.get('quran-final-tests/$id') as Map<String, dynamic>;
    return QuranFinalCycle.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<List<QuranJuz>> finalEligibleJuz(int enrollmentId) async {
    final json = await _api
            .get('enrollments/$enrollmentId/quran-final-tests/eligible-juz')
        as Map<String, dynamic>;
    return jsonList(json['data'], QuranJuz.fromJson);
  }

  Future<QuranFinalCycle> startFinal(
    int enrollmentId, {
    required int juzId,
  }) async {
    final json = await _api.post(
      'enrollments/$enrollmentId/quran-final-tests',
      body: {'juz_id': juzId},
    ) as Map<String, dynamic>;
    return QuranFinalCycle.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<QuranFinalAttempt> recordFinalAttempt(
    int cycleId, {
    required double score,
    required String testedOn,
    String? notes,
    int? teacherId,
  }) async {
    final json = await _api.post(
      'quran-final-tests/$cycleId/attempts',
      body: {
        'score': score,
        'tested_on': testedOn,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
        if (teacherId != null) 'teacher_id': teacherId,
      },
    ) as Map<String, dynamic>;
    return QuranFinalAttempt.fromJson(json['data'] as Map<String, dynamic>);
  }
}
