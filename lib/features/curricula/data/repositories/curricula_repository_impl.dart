import '../../domain/entities/curricula_entity.dart';
import '../../domain/repositories/curricula_repository.dart';

class CurriculaRepositoryImpl implements CurriculaRepository {
  const CurriculaRepositoryImpl();

  @override
  Future<List<CurriculaEntity>> getAll() async => const [];
}
