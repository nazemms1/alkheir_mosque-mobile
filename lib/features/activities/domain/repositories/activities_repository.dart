import '../entities/activities_entity.dart';

abstract class ActivitiesRepository {
  Future<List<ActivitiesEntity>> getAll();
}
