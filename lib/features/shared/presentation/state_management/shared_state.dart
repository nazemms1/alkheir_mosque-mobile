import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/shared_repository.dart';
import '../../data/repositories/shared_repository_impl.dart';

final sharedRepositoryProvider = Provider<SharedRepository>((ref) {
  return const SharedRepositoryImpl();
});
