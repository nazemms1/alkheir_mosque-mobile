import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/curricula_repository.dart';
import '../../data/repositories/curricula_repository_impl.dart';

final curriculaRepositoryProvider = Provider<CurriculaRepository>((ref) {
  return const CurriculaRepositoryImpl();
});
