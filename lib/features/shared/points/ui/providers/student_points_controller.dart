import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

part 'student_points_controller.g.dart';

/// نقاط الطالب من الخادم. فارغة عند الفشل: تُعرض البيانات الممرّرة للشاشة.
@riverpod
class StudentPointsController extends _$StudentPointsController {
  @override
  Future<List<PointEntry>> build(int? studentId) async {
    if (studentId == null) return const [];
    try {
      return await ref.read(studentRepositoryProvider).fetchPoints(studentId);
    } catch (_) {
      return const [];
    }
  }
}
