import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/assessments_repository.dart';
import '../../data/repositories/assessments_repository_impl.dart';

final assessmentsRepositoryProvider = Provider<AssessmentsRepository>((ref) {
  return const AssessmentsRepositoryImpl();
});
