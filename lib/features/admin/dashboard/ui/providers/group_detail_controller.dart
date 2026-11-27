import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/features/admin/dashboard/di/admin_providers.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';

part 'group_detail_controller.g.dart';

/// تفاصيل الحلقة وطلابها، وحذفها.
@riverpod
class GroupDetailController extends _$GroupDetailController
    with ApiHelperMixin {
  @override
  Future<AdminGroupDetail> build(AdminGroupItem group) =>
      ref.read(adminRepositoryProvider).fetchGroupDetail(group);

  /// يعيد رسالة الخطأ أو `null` عند النجاح.
  Future<String?> deleteGroup() async {
    String? error;
    await executeApi(
      action: () => ref.read(adminRepositoryProvider).deleteGroup(group.id),
      errorHandler: (e) => error = '$e',
    );
    return error;
  }
}
