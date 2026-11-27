import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

part 'parent_activities_controller.g.dart';

/// أنشطة المسجد المتاحة لأبناء ولي الأمر.
@riverpod
class ParentActivitiesController extends _$ParentActivitiesController
    with ApiHelperMixin {
  @override
  Future<List<ParentActivity>> build() =>
      ref.read(studentRepositoryProvider).fetchActivities();

  /// `response`: registered | declined. يعيد رسالة الخطأ أو `null` عند النجاح.
  Future<String?> respond(
    ParentActivity activity,
    ActivityChildEligibility child,
    String response,
  ) async {
    String? error;
    await executeApi(
      action: () => ref.read(studentRepositoryProvider).respondToActivity(
          activity.id,
          studentId: child.studentId,
          response: response),
      errorHandler: (e) => error = '$e',
    );
    if (error == null) ref.invalidateSelf();
    return error;
  }
}
