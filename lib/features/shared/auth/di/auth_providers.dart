import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/auth_apis.dart';
import '../domain/repository/auth_repository.dart';

final authApisProvider = Provider<AuthApis>((ref) {
  final dio = ref.read(dioProvider);
  return AuthApis(dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.read(authApisProvider);
  return AuthRepositoryImpl(api, ref.read(secureStorageServiceProvider));
});
