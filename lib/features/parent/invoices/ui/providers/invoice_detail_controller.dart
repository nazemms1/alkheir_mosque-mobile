import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

part 'invoice_detail_controller.g.dart';

/// تفاصيل فاتورة واحدة لولي الأمر.
@riverpod
class InvoiceDetailController extends _$InvoiceDetailController {
  @override
  Future<InvoiceDetail> build(int invoiceId) =>
      ref.read(studentRepositoryProvider).fetchInvoiceDetail(invoiceId);
}
