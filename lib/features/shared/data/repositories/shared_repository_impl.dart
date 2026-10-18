import '../../domain/entities/shared_entity.dart';
import '../../domain/repositories/shared_repository.dart';

class SharedRepositoryImpl implements SharedRepository {
  const SharedRepositoryImpl();

  @override
  Future<List<SharedEntity>> getAll() async => const [];
}
