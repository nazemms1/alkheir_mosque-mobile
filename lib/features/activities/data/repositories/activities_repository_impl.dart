import '../../domain/entities/activities_entity.dart';
import '../../domain/repositories/activities_repository.dart';

class ActivitiesRepositoryImpl implements ActivitiesRepository {
  const ActivitiesRepositoryImpl();

  @override
  Future<List<ActivitiesEntity>> getAll() async => const [];
}
