import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/finance_ops_repository.dart';
import '../../data/repositories/finance_ops_repository_impl.dart';

final financeOpsRepositoryProvider = Provider<FinanceOpsRepository>((ref) {
  return FinanceOpsRepositoryImpl();
});
