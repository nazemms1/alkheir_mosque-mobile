import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

part 'parent_invoices_controller.g.dart';

/// فواتير ولي الأمر.
@riverpod
class ParentInvoicesController extends _$ParentInvoicesController {
  @override
  Future<List<InvoiceListItem>> build() =>
      ref.read(studentRepositoryProvider).fetchInvoices();
}
