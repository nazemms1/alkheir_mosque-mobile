import '../../domain/entities/supervisor_entity.dart';
import '../../domain/repositories/supervisor_repository.dart';

class SupervisorRepositoryImpl implements SupervisorRepository {
  const SupervisorRepositoryImpl();

  @override
  Future<List<SupervisorEntity>> getAll() async => const [];
}
