import '../../domain/entities/notes_entity.dart';
import '../../domain/repositories/notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository {
  const NotesRepositoryImpl();

  @override
  Future<List<NotesEntity>> getAll() async => const [];
}
