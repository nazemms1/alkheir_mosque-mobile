import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/auth_token.dart';
import 'service_providers.dart';

/// جلسة المستخدم الحالية — المصدر الوحيد لبيانات الحساب المسجّل دخوله
/// (الـ token + المستخدم + الأدوار + الصلاحيات).
///
/// الاستخدام:
/// - قراءة الجلسة:      `final session = ref.watch(authSessionProvider);`
/// - بعد تسجيل الدخول:  `ref.read(authSessionProvider.notifier).setToken(token);`
/// - استرجاع محفوظة:    `ref.read(authSessionProvider.notifier).restore();`
/// - تسجيل الخروج:      `ref.read(authSessionProvider.notifier).logout();`
class AuthSessionNotifier extends Notifier<AuthToken?> {
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

  /// تسجيل الخروج — يمسح الـ token من الخادم والتخزين المحلي.
  Future<void> logout() async {
    await ref.read(authServiceProvider).logout();
    state = null;
  }
}

final authSessionProvider =
    NotifierProvider<AuthSessionNotifier, AuthToken?>(AuthSessionNotifier.new);
