import '../../domain/entities/sabr_entity.dart';
import '../../domain/repositories/sabr_repository.dart';

class SabrRepositoryImpl implements SabrRepository {
  const SabrRepositoryImpl();

  @override
  Future<List<SabrEntity>> getAll() async => const [];
}
