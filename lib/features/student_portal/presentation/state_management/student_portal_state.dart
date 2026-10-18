import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/student_portal_repository.dart';
import '../../data/repositories/student_portal_repository_impl.dart';

final studentPortalRepositoryProvider = Provider<StudentPortalRepository>((ref) {
  return const StudentPortalRepositoryImpl();
});
