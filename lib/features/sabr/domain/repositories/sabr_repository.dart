import '../entities/sabr_entity.dart';

abstract class SabrRepository {
  Future<List<SabrEntity>> getAll();
}
