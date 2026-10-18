import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/finance_repository.dart';
import '../../data/repositories/finance_repository_impl.dart';

final financeRepositoryProvider = Provider<FinanceRepository>((ref) {
  return FinanceRepositoryImpl();
});
