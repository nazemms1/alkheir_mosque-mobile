import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/shared/reports/di/reports_providers.dart';
import 'package:alkheir_mosque/features/shared/reports/domain/repository/reports_repository.dart';

part 'reports_actions_controller.g.dart';

/// طلبات التقارير التي تستدعيها الشاشات عبر [ReportsRepository].
// keepAlive: the call may outlive the frame that started it.
@Riverpod(keepAlive: true)
class ReportsActionsController extends _$ReportsActionsController
    with ApiHelperMixin {
  @override
  void build() {}

  /// يعيد قيمة العملية أو الخطأ.
  Future<({T? value, ApiError? error})> run<T>(
    Future<T> Function(ReportsRepository repo) action,
  ) =>
      runAction(() => action(ref.read(reportsRepositoryProvider)));

  /// قراءة تمرّر الاستدعاء كما هو (الخطأ يصل [ApiError] كما يرميه المستودع).
  Future<T> query<T>(Future<T> Function(ReportsRepository repo) action) =>
      action(ref.read(reportsRepositoryProvider));
}
