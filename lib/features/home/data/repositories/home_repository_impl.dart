import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl();

  @override
  Future<List<HomeEntity>> getAll() async => const [];
}
