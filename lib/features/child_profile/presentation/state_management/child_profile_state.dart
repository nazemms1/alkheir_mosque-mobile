import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/child_profile_repository.dart';
import '../../data/repositories/child_profile_repository_impl.dart';

final childProfileRepositoryProvider = Provider<ChildProfileRepository>((ref) {
  return const ChildProfileRepositoryImpl();
});
