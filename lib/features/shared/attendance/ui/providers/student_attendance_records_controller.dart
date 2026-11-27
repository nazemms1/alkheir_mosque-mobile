import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

part 'student_attendance_records_controller.g.dart';

/// سجل حضور الطالب من الخادم. فارغ عند الفشل: تُعرض السجلات الممرّرة للشاشة.
@riverpod
class StudentAttendanceRecordsController
    extends _$StudentAttendanceRecordsController {
  @override
  Future<List<AttendanceRecord>> build(int? studentId) async {
    if (studentId == null) return const [];
    try {
      final entries =
          await ref.read(studentRepositoryProvider).fetchAttendance(studentId);
      return entries.map((e) => e.toAttendanceRecord()).toList();
    } catch (_) {
      return const [];
    }
  }
}
