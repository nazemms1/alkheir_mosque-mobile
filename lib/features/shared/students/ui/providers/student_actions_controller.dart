import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/shared/students/domain/repository/student_repository.dart';

part 'student_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [StudentRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class StudentActionsController extends _$StudentActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(StudentRepository repo) action,
  ) =>
      runAction(() => action(ref.read(studentRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(StudentRepository repo) action) =>
      action(ref.read(studentRepositoryProvider));

  /// تحويل بيانات الطالب لنموذج لوحة ولي الأمر (حساب محلي، بلا طلب).
  ChildData childDetailToChildData(ChildDetail child) =>
      ref.read(studentRepositoryProvider).childDetailToChildData(child);

  /// تقدّم الحفظ محسوباً من السجلات (حساب محلي، بلا طلب).
  MemorizationProgress buildProgressFromEntries({
    required List<MemorizationEntry> entries,
    required int totalMemorizedPages,
    required int currentJuz,
    required String teacherName,
  }) =>
      ref.read(studentRepositoryProvider).buildProgressFromEntries(
            entries: entries,
            totalMemorizedPages: totalMemorizedPages,
            currentJuz: currentJuz,
            teacherName: teacherName,
          );
}
