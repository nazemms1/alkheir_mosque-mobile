import '../../domain/entities/splash_entity.dart';
import '../../domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  const SplashRepositoryImpl();

  @override
  Future<List<SplashEntity>> getAll() async => const [];
}
