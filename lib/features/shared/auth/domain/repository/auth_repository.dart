import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/services/secure_storage_service.dart';

import '../../data/apis/auth_apis.dart';
import '../../data/mapper/auth_mapper.dart';
import '../../data/models/auth_token_model.dart';
import '../../data/params/login_params.dart';
import '../entities/auth_token.dart';

abstract class AuthRepository {
  Future<AuthToken> login({
    required String login,
    required String password,
    bool remember = false,
  });

  Future<void> logout();

  Future<void> saveSession(AuthToken session);

  Future<AuthToken?> getSavedToken();

  Future<bool> isLoggedIn();
}

class AuthRepositoryImpl implements AuthRepository {
  static const _tokenJsonKey = 'auth_token_json';
  static const _loginTimeout = Duration(seconds: 15);
  static const _logoutTimeout = Duration(seconds: 10);

  final AuthApis api;
  final SecureStorageService secureStorage;

  AuthRepositoryImpl(this.api, this.secureStorage);

  /// تسجيل الدخول — يحفظ الـ token كاملاً مع user/roles والصلاحيات.
  @override
  Future<AuthToken> login({
    required String login,
    required String password,
    bool remember = false,
  }) async {
    final AuthTokenModel model;
    try {
      model = await handleRepoData(() => api.login(
            LoginParams(
              login: login,
              password: password,
              remember: remember,
              deviceName: 'MOBILE',
            ),
            RequestOptions(
              sendTimeout: _loginTimeout,
              receiveTimeout: _loginTimeout,
            ),
          ));
    } on ApiError catch (error) {
      throw ApiError(
        type: error.type,
        statusCode: error.statusCode,
        data: error.data,
        message: _loginErrorMessage(error),
      );
    } catch (_) {
      throw _unreadableLogin;
    }

    final token = model.toDomain();
    if (token == null) throw _unreadableLogin;
    await _saveRaw(model.toJson());
    await secureStorage.setAccessToken(token.token);
    return token;
  }

  ApiError get _unreadableLogin => ApiError(
        type: ApiErrorType.unexpected,
        message: L10nGateway.current.couldnTReadSignIn,
      );

  String _loginErrorMessage(ApiError error) {
    switch (error.statusCode) {
      case null:
        return error.type == ApiErrorType.network
            ? error.toString()
            : L10nGateway.current.couldnTReachTheServer;
      case 429:
        return L10nGateway.current.tooManyAttemptsPleaseTry;
      // الخادم لا يحمل واجهة الجوال (المسار /api/v1 غير منشور).
      case 404:
        return L10nGateway.current.theMobileApiIsnT;
      default:
        return _serverMessage(error.data) ??
            L10nGateway.current.incorrectLoginDetails;
    }
  }

  /// تسجيل الخروج — يُمسح الرمز محلياً حتى لو فشل الطلب إلى الخادم.
  @override
  Future<void> logout() async {
    if (await getSavedToken() != null) {
      try {
        await handleRepoData(() => api.logout(RequestOptions(
              sendTimeout: _logoutTimeout,
              receiveTimeout: _logoutTimeout,
            )));
      } catch (_) {
        // لا نمنع تسجيل الخروج المحلي بسبب خطأ شبكة.
      }
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenJsonKey);
    await secureStorage.clearTokens();
  }

  /// يحفظ الجلسة المحدّثة (بعد `bootstrap`) بنفس بنية استجابة الدخول.
  @override
  Future<void> saveSession(AuthToken session) async {
    final user = session.user;
    await _saveRaw(AuthTokenModel(
      token: session.token,
      tokenType: session.tokenType,
      abilities: session.abilities,
      user: user == null
          ? null
          : AuthUserModel(
              id: user.id,
              name: user.name,
              username: user.username,
              roles: user.roles,
              permissions: user.permissions,
              teacherId: user.teacherId,
            ),
    ).toJson());
    await secureStorage.setAccessToken(session.token);
  }

  /// الجلسة (المستخدم والأدوار والصلاحيات) فقط؛ الرمز نفسه في التخزين الآمن.
  Future<void> _saveRaw(Map<String, dynamic> raw) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenJsonKey, jsonEncode({...raw}..remove('token')));
  }

  /// يسترجع الـ token المحفوظ مع الدور والصلاحيات.
  @override
  Future<AuthToken?> getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_tokenJsonKey);
    if (raw == null) return null;
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      var token = await secureStorage.getAccessToken();
      // Installs from before this version kept the token in this JSON too:
      // move it to secure storage once, then drop it from SharedPreferences.
      final legacy = json['token'];
      if (legacy is String && legacy.isNotEmpty) {
        if (token == null || token.isEmpty) {
          await secureStorage.setAccessToken(legacy);
          token = legacy;
        }
        await _saveRaw(json);
      }
      return AuthTokenModel.fromJson({...json, 'token': token}).toDomain();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> isLoggedIn() async => (await getSavedToken()) != null;

  /// أول رسالة مفهومة من الخادم: أخطاء التحقق أولاً ثم `message`/`error`.
  /// الرسالة الفارغة تُتجاهل حتى لا تظهر شاشة خطأ بلا نص.
  String? _serverMessage(dynamic body) {
    if (body is! Map) return null;

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
