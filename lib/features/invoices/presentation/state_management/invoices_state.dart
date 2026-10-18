import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/invoices_repository.dart';
import '../../data/repositories/invoices_repository_impl.dart';

final invoicesRepositoryProvider = Provider<InvoicesRepository>((ref) {
  return const InvoicesRepositoryImpl();
});
