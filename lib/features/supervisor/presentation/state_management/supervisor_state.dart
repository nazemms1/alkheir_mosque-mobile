import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/supervisor_repository.dart';
import '../../data/repositories/supervisor_repository_impl.dart';

final supervisorRepositoryProvider = Provider<SupervisorRepository>((ref) {
  return const SupervisorRepositoryImpl();
});
