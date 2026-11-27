import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/repository/student_file_repository.dart';

part 'student_file_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [StudentFileRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class StudentFileActionsController extends _$StudentFileActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(StudentFileRepository repo) action,
  ) =>
      runAction(() => action(ref.read(studentFileRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(StudentFileRepository repo) action) =>
      action(ref.read(studentFileRepositoryProvider));
}
