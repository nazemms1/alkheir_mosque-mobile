import '../../domain/entities/invoices_entity.dart';
import '../../domain/repositories/invoices_repository.dart';

class InvoicesRepositoryImpl implements InvoicesRepository {
  const InvoicesRepositoryImpl();

  @override
  Future<List<InvoicesEntity>> getAll() async => const [];
}
