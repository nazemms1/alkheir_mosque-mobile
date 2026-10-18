import '../entities/assessments_entity.dart';

abstract class AssessmentsRepository {
  Future<List<AssessmentsEntity>> getAll();
}
