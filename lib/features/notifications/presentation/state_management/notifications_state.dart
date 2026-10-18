import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../../data/repositories/notifications_repository_impl.dart';

final notificationsRepositoryProvider = Provider<NotificationsRepository>((ref) {
  return const NotificationsRepositoryImpl();
});
