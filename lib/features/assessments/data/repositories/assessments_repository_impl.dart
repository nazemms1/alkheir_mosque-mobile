import '../../domain/entities/assessments_entity.dart';
import '../../domain/repositories/assessments_repository.dart';

class AssessmentsRepositoryImpl implements AssessmentsRepository {
  const AssessmentsRepositoryImpl();

  @override
  Future<List<AssessmentsEntity>> getAll() async => const [];
}
