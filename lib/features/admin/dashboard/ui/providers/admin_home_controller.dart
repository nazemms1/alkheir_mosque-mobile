import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/admin/dashboard/di/admin_providers.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';

part 'admin_home_controller.g.dart';

typedef AdminHomeDashboard = ({
  AdminStats stats,
  List<AdminGroupItem> groups,
  List<AdminStudentItem> students,
});

/// بيانات الرئيسية للإداري حسب صلاحيات الجلسة [token].
@riverpod
class AdminHomeController extends _$AdminHomeController {
  @override
  Future<AdminHomeDashboard> build(AuthToken token) =>
      ref.read(adminRepositoryProvider).fetchDashboard(token);
}
