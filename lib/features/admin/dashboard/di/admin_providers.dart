import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/admin_apis.dart';
import '../domain/repository/admin_repository.dart';

final adminApisProvider = Provider<AdminApis>((ref) {
  final dio = ref.read(dioProvider);
  return AdminApis(dio);
});

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  final api = ref.read(adminApisProvider);
  return AdminRepositoryImpl(api);
});
