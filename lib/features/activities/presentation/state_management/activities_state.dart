import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/activities_repository.dart';
import '../../data/repositories/activities_repository_impl.dart';

final activitiesRepositoryProvider = Provider<ActivitiesRepository>((ref) {
  return const ActivitiesRepositoryImpl();
});
