import '../../domain/entities/notifications_entity.dart';
import '../../domain/repositories/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  const NotificationsRepositoryImpl();

  @override
  Future<List<NotificationsEntity>> getAll() async => const [];
}
