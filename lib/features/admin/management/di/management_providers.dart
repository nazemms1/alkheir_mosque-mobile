import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/management_apis.dart';
import '../domain/repository/management_repository.dart';

final managementApisProvider = Provider<ManagementApis>((ref) {
  final dio = ref.read(dioProvider);
  return ManagementApis(dio);
});

final managementRepositoryProvider = Provider<ManagementRepository>((ref) {
  final api = ref.read(managementApisProvider);
  return ManagementRepositoryImpl(api);
});
