import '../entities/shared_entity.dart';

abstract class SharedRepository {
  Future<List<SharedEntity>> getAll();
}
