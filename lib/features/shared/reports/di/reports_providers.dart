import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/reports_apis.dart';
import '../domain/repository/reports_repository.dart';

final reportsApisProvider = Provider<ReportsApis>((ref) {
  final dio = ref.read(dioProvider);
  return ReportsApis(dio);
});

final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  final api = ref.read(reportsApisProvider);
  return ReportsRepositoryImpl(api);
});
