import '../entities/invoices_entity.dart';

abstract class InvoicesRepository {
  Future<List<InvoicesEntity>> getAll();
}
