import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/di/finance_ops_providers.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/domain/repository/finance_ops_repository.dart';

part 'finance_ops_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [FinanceOpsRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class FinanceOpsActionsController extends _$FinanceOpsActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(FinanceOpsRepository repo) action,
  ) =>
      runAction(() => action(ref.read(financeOpsRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(FinanceOpsRepository repo) action) =>
      action(ref.read(financeOpsRepositoryProvider));
}
