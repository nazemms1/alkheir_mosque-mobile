import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/memorization_repository.dart';
import '../../data/repositories/memorization_repository_impl.dart';

final memorizationRepositoryProvider = Provider<MemorizationRepository>((ref) {
  return const MemorizationRepositoryImpl();
});
