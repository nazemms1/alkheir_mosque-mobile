import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/management_repository.dart';
import '../../data/repositories/management_repository_impl.dart';

final managementRepositoryProvider = Provider<ManagementRepository>((ref) {
  return ManagementRepositoryImpl();
});
