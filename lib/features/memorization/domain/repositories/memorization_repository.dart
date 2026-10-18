import '../entities/memorization_entity.dart';

abstract class MemorizationRepository {
  Future<List<MemorizationEntity>> getAll();
}
