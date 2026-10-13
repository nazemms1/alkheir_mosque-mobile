import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/config/server_config.dart';
import '../../core/i18n/app_language.dart';
import '../models/auth_token.dart';

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  static const _tokenJsonKey = 'auth_token_json';
  static const _loginTimeout = Duration(seconds: 15);
  static const _logoutTimeout = Duration(seconds: 10);

  String get _baseUrl => ServerConfig.apiBaseUrl;

  Map<String, String> get _headers => {
        'Accept': 'application/json',
        'X-Locale': AppLanguage.current.languageCode,
      };

  /// تسجيل الدخول — يحفظ الـ token كاملاً مع user/roles والصلاحيات.
  Future<AuthToken> login({
    required String login,
    required String password,
    bool remember = false,
  }) async {
    final http.Response response;
    try {
      response = await http
          .post(
            Uri.parse('$_baseUrl/auth/token'),
            headers: {..._headers, 'Content-Type': 'application/json'},
            body: jsonEncode({
              'login': login,
              'password': password,
              'remember': remember,
              'device_name': 'MOBILE',
            }),
          )
          .timeout(_loginTimeout);
    } catch (_) {
      throw AuthException(
        tr('تعذّر الاتصال بالخادم. تحقق من الشبكة وعنوان الخادم.'),
      );
    }

    if (response.statusCode == 429) {
      throw AuthException(
        tr('تم تجاوز عدد المحاولات المسموح بها. حاول مجدداً بعد قليل.'),
      );
    }

    final body = _decodeJsonMap(response);

    if (response.statusCode == 201 && body != null) {
      try {
        final token = AuthToken.fromJson(body);
        await _saveToken(body);
        return token;
      } catch (_) {
        throw AuthException(
          tr('تعذّر قراءة بيانات الدخول من الخادم. حاول مرة أخرى.'),
        );
      }
    }

    // 404: الخادم لا يحمل واجهة الجوال (المسار /api/v1 غير منشور).
    if (response.statusCode == 404) {
      throw AuthException(
        tr('واجهة الجوال غير متاحة على هذا الخادم. تحقق من عنوان الخادم.'),
      );
    }

    throw AuthException(
      _serverMessage(body) ?? tr('بيانات الدخول غير صحيحة'),
    );
  }

  /// تسجيل الخروج — يُمسح الرمز محلياً حتى لو فشل الطلب إلى الخادم.
  Future<void> logout() async {
    final token = await getSavedToken();
    if (token != null) {
      try {
        await http.delete(
          Uri.parse('$_baseUrl/auth/token'),
          headers: {..._headers, 'Authorization': token.authorizationHeader},
        ).timeout(_logoutTimeout);
      } catch (_) {
        // لا نمنع تسجيل الخروج المحلي بسبب خطأ شبكة.
      }
    }
    await _clearToken();
  }

  /// يحفظ استجابة الدخول كاملة (token + user + roles + permissions).
  Future<void> _saveToken(Map<String, dynamic> raw) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenJsonKey, jsonEncode(raw));
  }

  /// يحفظ الجلسة المحدّثة (بعد `bootstrap`) بنفس بنية استجابة الدخول.
  Future<void> saveSession(AuthToken session) async {
    final user = session.user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _tokenJsonKey,
      jsonEncode({
        'token': session.token,
        'token_type': session.tokenType,
        'abilities': session.abilities,
        'user': user == null
            ? null
            : {
                'id': user.id,
                'name': user.name,
                'username': user.username,
                'roles': user.roles,
                'permissions': user.permissions,
                'teacher_id': user.teacherId,
              },
      }),
    );
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenJsonKey);
  }

  /// يسترجع الـ token المحفوظ مع الدور والصلاحيات.
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

  /// يفكّ JSON الاستجابة إن كان كائناً؛ وإلا يُعيد `null` (مثل صفحة HTML).
  Map<String, dynamic>? _decodeJsonMap(http.Response response) {
    try {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      return decoded is Map<String, dynamic> ? decoded : null;
    } catch (_) {
      return null;
    }
  }

  /// أول رسالة مفهومة من الخادم: أخطاء التحقق أولاً ثم `message`/`error`.
  /// الرسالة الفارغة تُتجاهل حتى لا تظهر شاشة خطأ بلا نص.
  String? _serverMessage(Map<String, dynamic>? body) {
    if (body == null) return null;

    final errors = body['errors'];
    if (errors is Map) {
      for (final value in errors.values) {
        if (value is List && value.isNotEmpty && value.first is String) {
          final text = (value.first as String).trim();
          if (text.isNotEmpty) return text;
        }
      }
    }

    for (final key in const ['message', 'error']) {
      final text = body[key];
      if (text is String && text.trim().isNotEmpty) return text.trim();
    }
    return null;
  }
}
