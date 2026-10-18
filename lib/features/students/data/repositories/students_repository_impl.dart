import '../../domain/entities/students_entity.dart';
import '../../domain/repositories/students_repository.dart';

class StudentsRepositoryImpl implements StudentsRepository {
  const StudentsRepositoryImpl();

  @override
  Future<List<StudentsEntity>> getAll() async => const [];
}
