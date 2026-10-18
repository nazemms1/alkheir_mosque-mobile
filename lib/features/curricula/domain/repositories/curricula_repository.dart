import '../entities/curricula_entity.dart';

abstract class CurriculaRepository {
  Future<List<CurriculaEntity>> getAll();
}
