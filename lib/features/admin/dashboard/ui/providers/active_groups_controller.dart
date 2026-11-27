import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/admin/dashboard/di/admin_providers.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';

part 'active_groups_controller.g.dart';

/// الحلقات النشطة لتبويب الحلقات.
@riverpod
class ActiveGroupsController extends _$ActiveGroupsController {
  @override
  Future<List<AdminGroupItem>> build() async {
    final result = await ref
        .read(adminRepositoryProvider)
        .fetchGroups(perPage: 100, isActive: true);
    return result.items;
  }
}
