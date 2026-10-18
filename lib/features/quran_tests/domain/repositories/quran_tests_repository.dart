import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../data/models/quran_test_model.dart';

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
