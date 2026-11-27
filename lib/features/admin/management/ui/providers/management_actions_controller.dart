import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/admin/management/di/management_providers.dart';
import 'package:alkheir_mosque/features/admin/management/domain/repository/management_repository.dart';

part 'management_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [ManagementRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class ManagementActionsController extends _$ManagementActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(ManagementRepository repo) action,
  ) =>
      runAction(() => action(ref.read(managementRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(ManagementRepository repo) action) =>
      action(ref.read(managementRepositoryProvider));
}
