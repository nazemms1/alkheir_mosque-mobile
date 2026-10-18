import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../../data/repositories/attendance_repository_impl.dart';

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  return const AttendanceRepositoryImpl();
});
