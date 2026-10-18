import '../entities/student_portal_entity.dart';

abstract class StudentPortalRepository {
  Future<List<StudentPortalEntity>> getAll();
}
