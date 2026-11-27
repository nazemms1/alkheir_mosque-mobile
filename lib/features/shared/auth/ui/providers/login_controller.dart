import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/app/core/session/auth_session.dart';
import 'package:alkheir_mosque/features/shared/auth/di/auth_providers.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';

part 'login_controller.g.dart';

class LoginState {
  const LoginState({this.isLoading = false, this.errorMessage});

  final bool isLoading;
  final String? errorMessage;
}

@riverpod
class LoginController extends _$LoginController with ApiHelperMixin {
  @override
  LoginState build() => const LoginState();

  /// يعيد الجلسة عند النجاح ويحفظها في [authSessionProvider]؛ وإلا `null`
  /// مع رسالة الخطأ في [LoginState.errorMessage].
  Future<AuthToken?> login({
    required String login,
    required String password,
    required bool remember,
  }) async {
    state = const LoginState(isLoading: true);
    final token = await executeApi(
      action: () => ref
          .read(authRepositoryProvider)
          .login(login: login, password: password, remember: remember),
      errorHandler: (e) => state = LoginState(errorMessage: '$e'),
    );
    if (token == null) return null;
    ref.read(authSessionProvider.notifier).setToken(token);
    state = const LoginState();
    return token;
  }
}
