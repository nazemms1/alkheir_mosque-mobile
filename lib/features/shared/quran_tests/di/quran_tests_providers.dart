import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/quran_tests_apis.dart';
import '../domain/repository/quran_tests_repository.dart';

final quranTestsApisProvider = Provider<QuranTestsApis>((ref) {
  final dio = ref.read(dioProvider);
  return QuranTestsApis(dio);
});

final quranTestsRepositoryProvider = Provider<QuranTestsRepository>((ref) {
  final api = ref.read(quranTestsApisProvider);
  return QuranTestsRepositoryImpl(api);
});
