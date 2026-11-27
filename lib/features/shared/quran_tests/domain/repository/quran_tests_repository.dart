import 'package:alkheir_mosque/features/shared/quran_tests/data/params/quran_tests_params.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/mapper/quran_test_mapper.dart';
import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/data/mapper/shared_mapper.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../data/apis/quran_tests_apis.dart';

abstract class QuranTestsRepository {
  Future<PagedResult<QuranPartialCycle>> partialCycles({
    int page = 1,
    int? studentId,
    String? status,
  });

  Future<QuranPartialCycle> partialCycle(int id);

  Future<List<QuranJuz>> partialEligibleJuz(int enrollmentId);

  Future<QuranPartialCycle> startPartial(
    int enrollmentId, {
    required int juzId,
    bool allowParallelCycle = false,
  });

  Future<QuranPartialAttempt> recordPartialAttempt(
    int cycleId,
    int partId, {
    required int mistakeCount,
    required String testedOn,
    String? notes,
    int? teacherId,
  });

  Future<PagedResult<QuranFinalCycle>> finalCycles({
    int page = 1,
    int? studentId,
    String? status,
  });

  Future<QuranFinalCycle> finalCycle(int id);

  Future<List<QuranJuz>> finalEligibleJuz(int enrollmentId);

  Future<QuranFinalCycle> startFinal(
    int enrollmentId, {
    required int juzId,
  });

  Future<QuranFinalAttempt> recordFinalAttempt(
    int cycleId, {
    required double score,
    required String testedOn,
    String? notes,
    int? teacherId,
  });
}

class QuranTestsRepositoryImpl implements QuranTestsRepository {
  static const _perPage = 20;

  final QuranTestsApis api;

  QuranTestsRepositoryImpl(this.api);

  // ─── الجزئي ────────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<QuranPartialCycle>> partialCycles({
    int page = 1,
    int? studentId,
    String? status,
  }) async {
    final result = await handleRepoData(() => api.partialCycles(page, _perPage,
        studentId: studentId, status: status));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<QuranPartialCycle> partialCycle(int id) async {
    final result = await handleRepoData(() => api.partialCycle(id));
    return result.data.toDomain();
  }

  @override
  Future<List<QuranJuz>> partialEligibleJuz(int enrollmentId) async {
    final result =
        await handleRepoData(() => api.partialEligibleJuz(enrollmentId));
    return result.data?.map((e) => e.toDomain()).toList() ?? const [];
  }

  /// بدء دورة جزئية. `allowParallelCycle` لا يُفعَّل إلا بعد تأكيد المستخدم
  /// لتحذير الدورة المفتوحة (كما في الموقع).
  @override
  Future<QuranPartialCycle> startPartial(
    int enrollmentId, {
    required int juzId,
    bool allowParallelCycle = false,
  }) async {
    final result = await handleRepoData(() => api.startPartial(
          enrollmentId,
          StartPartialParams(
              juzId: juzId, allowParallelCycle: allowParallelCycle),
        ));
    return result.data.toDomain();
  }

  @override
  Future<QuranPartialAttempt> recordPartialAttempt(
    int cycleId,
    int partId, {
    required int mistakeCount,
    required String testedOn,
    String? notes,
    int? teacherId,
  }) async {
    final result = await handleRepoData(() => api.recordPartialAttempt(
          cycleId,
          partId,
          RecordPartialAttemptParams(
              mistakeCount: mistakeCount,
              testedOn: testedOn,
              notes: (notes != null && notes.isNotEmpty) ? notes : null,
              teacherId: (teacherId != null) ? teacherId : null),
        ));
    return result.data.toDomain();
  }

  // ─── النهائي ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<QuranFinalCycle>> finalCycles({
    int page = 1,
    int? studentId,
    String? status,
  }) async {
    final result = await handleRepoData(() =>
        api.finalCycles(page, _perPage, studentId: studentId, status: status));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<QuranFinalCycle> finalCycle(int id) async {
    final result = await handleRepoData(() => api.finalCycle(id));
    return result.data.toDomain();
  }

  @override
  Future<List<QuranJuz>> finalEligibleJuz(int enrollmentId) async {
    final result =
        await handleRepoData(() => api.finalEligibleJuz(enrollmentId));
    return result.data?.map((e) => e.toDomain()).toList() ?? const [];
  }

  @override
  Future<QuranFinalCycle> startFinal(
    int enrollmentId, {
    required int juzId,
  }) async {
    final result = await handleRepoData(
        () => api.startFinal(enrollmentId, StartFinalParams(juzId: juzId)));
    return result.data.toDomain();
  }

  @override
  Future<QuranFinalAttempt> recordFinalAttempt(
    int cycleId, {
    required double score,
    required String testedOn,
    String? notes,
    int? teacherId,
  }) async {
    final result = await handleRepoData(() => api.recordFinalAttempt(
          cycleId,
          RecordFinalAttemptParams(
              score: score,
              testedOn: testedOn,
              notes: (notes != null && notes.isNotEmpty) ? notes : null,
              teacherId: (teacherId != null) ? teacherId : null),
        ));
    return result.data.toDomain();
  }
}
