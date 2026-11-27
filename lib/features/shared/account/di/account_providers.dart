import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/account_apis.dart';
import '../domain/repository/account_repository.dart';

final accountApisProvider = Provider<AccountApis>((ref) {
  final dio = ref.read(dioProvider);
  return AccountApis(dio);
});

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  final api = ref.read(accountApisProvider);
  return AccountRepositoryImpl(api);
});
