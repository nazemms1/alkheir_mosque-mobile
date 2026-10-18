import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/quran_tests_repository.dart';
import '../../data/repositories/quran_tests_repository_impl.dart';

final quranTestsRepositoryProvider = Provider<QuranTestsRepository>((ref) {
  return QuranTestsRepositoryImpl();
});
