import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/reports_repository.dart';
import '../../data/repositories/reports_repository_impl.dart';

final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  return ReportsRepositoryImpl();
});
