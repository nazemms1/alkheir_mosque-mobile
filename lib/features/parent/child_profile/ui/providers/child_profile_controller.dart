import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

part 'child_profile_controller.g.dart';

/// تفاصيل ملف الطالب. `null` إن تعذّر الجلب: تبقى البيانات المختصرة معروضة.
@riverpod
class ChildProfileController extends _$ChildProfileController {
  @override
  Future<ChildDetail?> build(int? studentId) async {
    if (studentId == null) return null;
    try {
      return await ref
          .read(studentRepositoryProvider)
          .fetchChildDetail(studentId);
    } catch (_) {
      return null;
    }
  }
}
