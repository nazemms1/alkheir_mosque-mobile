import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/admin/dashboard/di/admin_providers.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';

part 'admin_finance_controller.g.dart';

typedef AdminFinanceData = ({
  List<AdminInvoiceItem> invoices,
  List<AdminActivityItem> activities,
});

/// فواتير وأنشطة تبويب المالية؛ يُجلب فقط ما يملك الحساب صلاحية رؤيته.
@riverpod
class AdminFinanceController extends _$AdminFinanceController {
  @override
  Future<AdminFinanceData> build({
    required bool invoices,
    required bool activities,
  }) async {
    final repo = ref.read(adminRepositoryProvider);
    final invoicesFuture = invoices
        ? repo.fetchInvoices(perPage: 50).then((r) => r.items)
        : Future.value(const <AdminInvoiceItem>[]);
    final activitiesFuture = activities
        ? repo.fetchActivities(perPage: 50).then((r) => r.items)
        : Future.value(const <AdminActivityItem>[]);
    return (invoices: await invoicesFuture, activities: await activitiesFuture);
  }
}
