import '../../domain/entities/attendance_entity.dart';
import '../../domain/repositories/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  const AttendanceRepositoryImpl();

  @override
  Future<List<AttendanceEntity>> getAll() async => const [];
}
