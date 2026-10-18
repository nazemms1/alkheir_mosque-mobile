import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/sabr_repository.dart';
import '../../data/repositories/sabr_repository_impl.dart';

final sabrRepositoryProvider = Provider<SabrRepository>((ref) {
  return const SabrRepositoryImpl();
});
