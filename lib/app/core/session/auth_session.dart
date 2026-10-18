import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/account/data/repositories/account_repository_impl.dart';
import '../api/api_service.dart';
import 'service_providers.dart';

/// جلسة المستخدم الحالية — المصدر الوحيد لبيانات الحساب المسجّل دخوله
/// (الـ token + المستخدم + الأدوار + الصلاحيات).
///
/// الاستخدام:
/// - قراءة الجلسة:      `final session = ref.watch(authSessionProvider);`
/// - بعد تسجيل الدخول:  `ref.read(authSessionProvider.notifier).setToken(token);`
/// - استرجاع محفوظة:    `ref.read(authSessionProvider.notifier).restore();`
/// - تحديث من الخادم:   `ref.read(authSessionProvider.notifier).refreshFromServer();`
/// - تسجيل الخروج:      `ref.read(authSessionProvider.notifier).logout();`
class AuthSessionNotifier extends Notifier<AuthToken?> {
  static const _serverTimeout = Duration(seconds: 6);

  @override
  AuthToken? build() => null;

  /// استرجاع الجلسة المحفوظة من التخزين المحلي (تُستدعى من شاشة البداية).
  Future<AuthToken?> restore() async {
    final token = await ref.read(authServiceProvider).getSavedToken();
    state = token;
    return token;
  }

  /// تعيين الجلسة بعد نجاح تسجيل الدخول.
  void setToken(AuthToken token) => state = token;

  /// يجلب الصلاحيات الحالية من `GET /bootstrap` ويحفظها محلياً.
  /// - رمز مُلغى (401) أو حساب موقوف: يُنهي الجلسة ويُعيد `null`.
  /// - تعذّر الاتصال: تبقى الجلسة المحفوظة كما هي.
  Future<AuthToken?> refreshFromServer() async {
    final current = state;
    if (current == null) return null;
    try {
      final info = await AccountRepositoryImpl().bootstrap().timeout(_serverTimeout);
      final user = info.user;
      final refreshed = AuthToken(
        token: current.token,
        tokenType: current.tokenType,
        abilities: info.permissions,
        user: AuthUser(
          id: user.id,
          name: user.name,
          username: user.username,
          roles: user.roles,
          permissions: info.permissions,
          teacherId: user.teacherId,
        ),
      );
      await ref.read(authServiceProvider).saveSession(refreshed);
      state = refreshed;
      return refreshed;
    } on ApiException catch (error) {
      if (error.isUnauthorized || error.isForbidden) {
        await logout();
        return null;
      }
      return current;
    } catch (_) {
      return current;
    }
  }

  /// تسجيل الخروج — يمسح الـ token من الخادم والتخزين المحلي.
  Future<void> logout() async {
    await ref.read(authServiceProvider).logout();
    state = null;
  }
}

final authSessionProvider =
    NotifierProvider<AuthSessionNotifier, AuthToken?>(AuthSessionNotifier.new);
