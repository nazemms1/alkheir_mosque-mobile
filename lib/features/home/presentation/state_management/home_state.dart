import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/home_repository.dart';
import '../../data/repositories/home_repository_impl.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return const HomeRepositoryImpl();
});
