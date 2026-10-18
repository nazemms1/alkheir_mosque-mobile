import 'dart:typed_data';

import 'package:dio/dio.dart' as dio;

import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../domain/repositories/account_repository.dart';
import '../models/account_model.dart';

class AccountRepositoryImpl implements AccountRepository {
  final ApiService _api;

  AccountRepositoryImpl({ApiService? api}) : _api = api ?? ApiService();

  @override
  Future<MobileUser> me() async {
    final json = await _api.get('me') as Map<String, dynamic>;
    return MobileUser.fromJson(jsonMap(json['data']) ?? const {});
  }

  /// يعمل فقط إذا كان اسم المستخدم قابلاً للتعديل (ليس ولي أمر أو طالباً).
  @override
  Future<MobileUser> updateUsername(String username) async {
    final json = await _api.patch('me', body: {'username': username})
        as Map<String, dynamic>;
    return MobileUser.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<MobileUser> uploadProfilePhoto({
    required String fileName,
    required Uint8List bytes,
  }) async {
    final json = await _api.postMultipart(
      'me/profile-photo',
      fileField: 'profile_photo',
      file: dio.MultipartFile.fromBytes(
        bytes,
        filename: fileName,
      ),
    ) as Map<String, dynamic>;
    return MobileUser.fromJson(jsonMap(json['data']) ?? const {});
  }

  /// يُبقي الرمز الحالي ويُلغي رموز الأجهزة الأخرى.
  @override
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
  @override
  Future<void> logoutEverywhere() => _api.delete('auth/tokens');

  @override
  Future<BootstrapInfo> bootstrap() async {
    final json = await _api.get('bootstrap') as Map<String, dynamic>;
    return BootstrapInfo.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<DashboardInfo> dashboard() async {
    final json = await _api.get('dashboard') as Map<String, dynamic>;
    return DashboardInfo.fromJson(jsonMap(json['data']) ?? const {});
  }
}
