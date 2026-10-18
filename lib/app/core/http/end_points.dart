abstract final class EndPoints {
  // API Version Prefix
  static const String defaultApiPrefix = '/api/v1';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refresh = '/auth/refresh';
  static const String profile = '/auth/profile';

  // Common endpoints
  static const String notifications = '/notifications';
  static const String settings = '/settings';
}
