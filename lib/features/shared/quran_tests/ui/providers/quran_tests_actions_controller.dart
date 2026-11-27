import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/di/quran_tests_providers.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/domain/repository/quran_tests_repository.dart';

part 'quran_tests_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [QuranTestsRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class QuranTestsActionsController extends _$QuranTestsActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(QuranTestsRepository repo) action,
  ) =>
      runAction(() => action(ref.read(quranTestsRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(QuranTestsRepository repo) action) =>
      action(ref.read(quranTestsRepositoryProvider));
}
