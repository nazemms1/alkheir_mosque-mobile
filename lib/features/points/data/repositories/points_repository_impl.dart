import '../../domain/entities/points_entity.dart';
import '../../domain/repositories/points_repository.dart';

class PointsRepositoryImpl implements PointsRepository {
  const PointsRepositoryImpl();

  @override
  Future<List<PointsEntity>> getAll() async => const [];
}
