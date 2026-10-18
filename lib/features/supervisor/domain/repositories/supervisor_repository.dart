import '../entities/supervisor_entity.dart';

abstract class SupervisorRepository {
  Future<List<SupervisorEntity>> getAll();
}
