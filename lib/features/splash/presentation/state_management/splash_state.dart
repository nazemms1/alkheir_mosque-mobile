import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/splash_repository.dart';
import '../../data/repositories/splash_repository_impl.dart';

final splashRepositoryProvider = Provider<SplashRepository>((ref) {
  return const SplashRepositoryImpl();
});
