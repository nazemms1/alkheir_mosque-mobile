import '../../domain/entities/child_profile_entity.dart';
import '../../domain/repositories/child_profile_repository.dart';

class ChildProfileRepositoryImpl implements ChildProfileRepository {
  const ChildProfileRepositoryImpl();

  @override
  Future<List<ChildProfileEntity>> getAll() async => const [];
}
