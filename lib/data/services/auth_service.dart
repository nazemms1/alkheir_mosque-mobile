import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth_token.dart';

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);
  @override
  String toString() => message;
}

class AuthService {
  static const _baseUrl = 'https://www.alkheir-mosque.com/api/v1';
  static const _tokenJsonKey = 'auth_token_json';

  /// تسجيل الدخول — يحفظ الـ token كاملاً مع user/roles
  Future<AuthToken> login({
    required String login,
    required String password,
    bool remember = false,
  }) async {
    final uri = Uri.parse('$_baseUrl/auth/token');
    final http.Response response;

    try {
      response = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'login': login,
              'password': password,
              'remember': remember,
              'device_name': 'MOBILE',
            }),
          )
          .timeout(const Duration(seconds: 15));
    } catch (_) {
      throw const AuthException('تعذّر الاتصال بالخادم. تأكد من تشغيل الـ backend.');
    }

    if (response.statusCode == 429) {
      throw const AuthException('تم تجاوز عدد المحاولات المسموح بها. حاول مجدداً بعد قليل.');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 201) {
      try {
        final token = AuthToken.fromJson(body);
        await _saveToken(token, body);
        return token;
      } catch (e) {
        throw AuthException('خطأ في معالجة بيانات الدخول: $e');
      }
    }

    final message = body['message'] as String? ??
        body['error'] as String? ??
        'بيانات الدخول غير صحيحة';
    throw AuthException(message);
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    final token = await getSavedToken();
    if (token != null) {
      try {
        await http.delete(
          Uri.parse('$_baseUrl/auth/token'),
          headers: {
            'Authorization': token.authorizationHeader,
            'Accept': 'application/json',
          },
        ).timeout(const Duration(seconds: 10));
      } catch (_) {
        // نمسح الـ token محلياً حتى لو فشل الـ request
      }
    }
    await _clearToken();
  }

  /// حفظ الـ token JSON كاملاً (token + user + roles + abilities)
  Future<void> _saveToken(AuthToken token, Map<String, dynamic> raw) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenJsonKey, jsonEncode(raw));
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenJsonKey);
  }

  /// استرجاع الـ token كاملاً مع roles
  Future<AuthToken?> getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_tokenJsonKey);
    if (raw == null) return null;
    try {
      return AuthToken.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<bool> isLoggedIn() async => (await getSavedToken()) != null;
}
