import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/student_repository.dart';
import '../../data/repositories/student_repository_impl.dart';
import '../../domain/repositories/student_file_repository.dart';
import '../../data/repositories/student_file_repository_impl.dart';

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  return StudentRepositoryImpl();
});

final studentFileRepositoryProvider = Provider<StudentFileRepository>((ref) {
  return StudentFileRepositoryImpl();
});
