import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../models/account_model.dart';
import '../models/json_helpers.dart';
import 'api_service.dart';

/// الحساب الشخصي وإعداد الجلسة: الملف الشخصي، كلمة المرور، الصورة،
/// تسجيل الخروج من كل الأجهزة، والـ bootstrap والمؤشرات.
class AccountService {
  final ApiService _api;

  AccountService({ApiService? api}) : _api = api ?? ApiService();

  Future<MobileUser> me() async {
    final json = await _api.get('me') as Map<String, dynamic>;
    return MobileUser.fromJson(jsonMap(json['data']) ?? const {});
  }

  /// يعمل فقط إذا كان اسم المستخدم قابلاً للتعديل (ليس ولي أمر أو طالباً).
  Future<MobileUser> updateUsername(String username) async {
    final json = await _api.patch('me', body: {'username': username})
        as Map<String, dynamic>;
    return MobileUser.fromJson(jsonMap(json['data']) ?? const {});
  }

  Future<MobileUser> uploadProfilePhoto({
    required String fileName,
    required Uint8List bytes,
  }) async {
    final json = await _api.postMultipart(
      'me/profile-photo',
      file: http.MultipartFile.fromBytes(
        'profile_photo',
        bytes,
        filename: fileName,
      ),
    ) as Map<String, dynamic>;
    return MobileUser.fromJson(jsonMap(json['data']) ?? const {});
  }

  /// يُبقي الرمز الحالي ويُلغي رموز الأجهزة الأخرى.
  Future<int> changePassword({
    required String currentPassword,
    required String password,
  }) async {
    final json = await _api.patch('me/password', body: {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': password,
    }) as Map<String, dynamic>;
    return jsonInt(jsonMap(json['data'])?['other_tokens_revoked']);
  }

  /// يُلغي كل رموز الحساب بما فيها الرمز الحالي.
  Future<void> logoutEverywhere() => _api.delete('auth/tokens');

  Future<BootstrapInfo> bootstrap() async {
    final json = await _api.get('bootstrap') as Map<String, dynamic>;
    return BootstrapInfo.fromJson(jsonMap(json['data']) ?? const {});
  }

  Future<DashboardInfo> dashboard() async {
    final json = await _api.get('dashboard') as Map<String, dynamic>;
    return DashboardInfo.fromJson(jsonMap(json['data']) ?? const {});
  }
}
