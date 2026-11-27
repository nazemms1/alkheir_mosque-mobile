import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/finance_ops_apis.dart';
import '../domain/repository/finance_ops_repository.dart';

final financeOpsApisProvider = Provider<FinanceOpsApis>((ref) {
  final dio = ref.read(dioProvider);
  return FinanceOpsApis(dio);
});

final financeOpsRepositoryProvider = Provider<FinanceOpsRepository>((ref) {
  final api = ref.read(financeOpsApisProvider);
  return FinanceOpsRepositoryImpl(api);
});
