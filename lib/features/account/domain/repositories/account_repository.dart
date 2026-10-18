import 'dart:typed_data';
import '../../data/models/account_model.dart';

abstract class AccountRepository {
  Future<MobileUser> me();
  Future<MobileUser> updateUsername(String username);
  Future<MobileUser> uploadProfilePhoto({
    required String fileName,
    required Uint8List bytes,
  });
  Future<int> changePassword({
    required String currentPassword,
    required String password,
  });
  Future<void> logoutEverywhere();
  Future<BootstrapInfo> bootstrap();
  Future<DashboardInfo> dashboard();
}
