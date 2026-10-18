import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../data/repositories/admin_repository_impl.dart';

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepositoryImpl();
});
