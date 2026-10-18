import '../../data/models/auth_token.dart';

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}

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
