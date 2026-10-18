import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alkheir_mosque/app/core/http/dio_client.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/services/secure_storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_token.dart';

class AuthRepositoryImpl implements AuthRepository {
  static const _tokenJsonKey = 'auth_token_json';
  static const _loginTimeout = Duration(seconds: 15);
  static const _logoutTimeout = Duration(seconds: 10);

  final Dio _dio;

  AuthRepositoryImpl({Dio? dio}) : _dio = dio ?? DioClient.defaultDio;

  Map<String, String> get _headers => {
        'Accept': 'application/json',
        'X-Locale': AppLanguage.current.languageCode,
      };

  /// تسجيل الدخول — يحفظ الـ token كاملاً مع user/roles والصلاحيات.
  @override
  Future<AuthToken> login({
    required String login,
    required String password,
    bool remember = false,
  }) async {
    final Response response;
    try {
      response = await _dio.post(
        'auth/token',
        options: Options(
          headers: _headers,
          validateStatus: (status) => true,
          sendTimeout: _loginTimeout,
          receiveTimeout: _loginTimeout,
        ),
        data: {
          'login': login,
          'password': password,
          'remember': remember,
          'device_name': 'MOBILE',
        },
      );
    } catch (e) {
      final rawError = e.toString();
      final isReset = rawError.contains('Connection reset') || rawError.contains('Connection closed');
      throw AuthException(
        isReset
            ? tr('تعذّر الاتصال بالخادم (تم قطع الاتصال). يرجى التأكد من تشغيل الـ VPN على هاتفك أو التحقق من عنوان الخادم.')
            : tr('تعذّر الاتصال بالخادم. تحقق من الشبكة وعنوان الخادم.'),
      );
    }

    if (response.statusCode == 429) {
      throw AuthException(
        tr('تم تجاوز عدد المحاولات المسموح بها. حاول مجدداً بعد قليل.'),
      );
    }

    final body = _decodeJsonMap(response.data);

    if (response.statusCode == 201 && body != null) {
      try {
        final token = AuthToken.fromJson(body);
        await _saveToken(body);
        await SecureStorageService().setAccessToken(token.token);
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
  @override
  Future<void> logout() async {
    final token = await getSavedToken();
    if (token != null) {
      try {
        await _dio.delete(
          'auth/token',
          options: Options(
            headers: {'Authorization': token.authorizationHeader},
            sendTimeout: _logoutTimeout,
            receiveTimeout: _logoutTimeout,
          ),
        );
      } catch (_) {
        // لا نمنع تسجيل الخروج المحلي بسبب خطأ شبكة.
      }
    }
    await _clearToken();
    await SecureStorageService().clearTokens();
  }

  /// يحفظ استجابة الدخول كاملة (token + user + roles + permissions).
  Future<void> _saveToken(Map<String, dynamic> raw) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenJsonKey, jsonEncode(raw));
  }

  /// يحفظ الجلسة المحدّثة (بعد `bootstrap`) بنفس بنية استجابة الدخول.
  @override
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
    await SecureStorageService().setAccessToken(session.token);
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenJsonKey);
  }

  /// يسترجع الـ token المحفوظ مع الدور والصلاحيات.
  @override
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

  @override
  Future<bool> isLoggedIn() async => (await getSavedToken()) != null;

  /// يفكّ JSON الاستجابة إن كان كائناً؛ وإلا يُعيد `null` (مثل صفحة HTML).
  Map<String, dynamic>? _decodeJsonMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) {
      try {
        final decoded = jsonDecode(data);
        return decoded is Map<String, dynamic> ? decoded : null;
      } catch (_) {
        return null;
      }
    }
    return null;
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
