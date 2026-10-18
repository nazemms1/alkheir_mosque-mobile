import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/account_repository.dart';
import '../../data/repositories/account_repository_impl.dart';

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepositoryImpl();
});
