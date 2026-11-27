import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/operations_apis.dart';
import '../domain/repository/operations_repository.dart';

final operationsApisProvider = Provider<OperationsApis>((ref) {
  final dio = ref.read(dioProvider);
  return OperationsApis(dio);
});

final operationsRepositoryProvider = Provider<OperationsRepository>((ref) {
  final api = ref.read(operationsApisProvider);
  return OperationsRepositoryImpl(api);
});
