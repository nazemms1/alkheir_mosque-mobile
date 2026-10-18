import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/notes_repository.dart';
import '../../data/repositories/notes_repository_impl.dart';

final notesRepositoryProvider = Provider<NotesRepository>((ref) {
  return const NotesRepositoryImpl();
});
