import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/finance_apis.dart';
import '../domain/repository/finance_repository.dart';

final financeApisProvider = Provider<FinanceApis>((ref) {
  final dio = ref.read(dioProvider);
  return FinanceApis(dio);
});

final financeRepositoryProvider = Provider<FinanceRepository>((ref) {
  final api = ref.read(financeApisProvider);
  return FinanceRepositoryImpl(api);
});
