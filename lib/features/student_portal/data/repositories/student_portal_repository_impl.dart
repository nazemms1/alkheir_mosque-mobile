import '../../domain/entities/student_portal_entity.dart';
import '../../domain/repositories/student_portal_repository.dart';

class StudentPortalRepositoryImpl implements StudentPortalRepository {
  const StudentPortalRepositoryImpl();

  @override
  Future<List<StudentPortalEntity>> getAll() async => const [];
}
