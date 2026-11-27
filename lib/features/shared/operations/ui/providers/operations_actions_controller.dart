import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/shared/operations/di/operations_providers.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/repository/operations_repository.dart';

part 'operations_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [OperationsRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class OperationsActionsController extends _$OperationsActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(OperationsRepository repo) action,
  ) =>
      runAction(() => action(ref.read(operationsRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(OperationsRepository repo) action) =>
      action(ref.read(operationsRepositoryProvider));
}
