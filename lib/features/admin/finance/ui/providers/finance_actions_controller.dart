import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/admin/finance/di/finance_providers.dart';
import 'package:alkheir_mosque/features/admin/finance/domain/repository/finance_repository.dart';

part 'finance_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [FinanceRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class FinanceActionsController extends _$FinanceActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(FinanceRepository repo) action,
  ) =>
      runAction(() => action(ref.read(financeRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(FinanceRepository repo) action) =>
      action(ref.read(financeRepositoryProvider));
}
