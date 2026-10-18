import '../entities/students_entity.dart';

abstract class StudentsRepository {
  Future<List<StudentsEntity>> getAll();
}
