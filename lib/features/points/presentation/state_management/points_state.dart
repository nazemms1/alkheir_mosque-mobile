import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/points_repository.dart';
import '../../data/repositories/points_repository_impl.dart';

final pointsRepositoryProvider = Provider<PointsRepository>((ref) {
  return const PointsRepositoryImpl();
});
