import '../entities/child_profile_entity.dart';

abstract class ChildProfileRepository {
  Future<List<ChildProfileEntity>> getAll();
}
