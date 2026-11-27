import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/admin/dashboard/di/admin_providers.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/repository/admin_repository.dart';

part 'admin_actions_controller.g.dart';

/// عمليات الكتابة (حفظ/حذف/إلغاء) التي تطلبها الشاشات عبر [AdminRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class AdminActionsController extends _$AdminActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(AdminRepository repo) action,
  ) =>
      runAction(() => action(ref.read(adminRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(AdminRepository repo) action) =>
      action(ref.read(adminRepositoryProvider));
}
