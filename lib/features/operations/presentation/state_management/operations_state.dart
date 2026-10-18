import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/operations_repository.dart';
import '../../data/repositories/operations_repository_impl.dart';

final operationsRepositoryProvider = Provider<OperationsRepository>((ref) {
  return OperationsRepositoryImpl();
});
