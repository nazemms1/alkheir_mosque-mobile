import '../../domain/entities/memorization_entity.dart';
import '../../domain/repositories/memorization_repository.dart';

class MemorizationRepositoryImpl implements MemorizationRepository {
  const MemorizationRepositoryImpl();

  @override
  Future<List<MemorizationEntity>> getAll() async => const [];
}
