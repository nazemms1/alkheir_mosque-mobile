import '../entities/notes_entity.dart';

abstract class NotesRepository {
  Future<List<NotesEntity>> getAll();
}
