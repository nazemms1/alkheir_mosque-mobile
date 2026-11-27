import '../../domain/entities/auth_token.dart';
import '../models/auth_token_model.dart';

extension AuthTokenModelMapper on AuthTokenModel? {
  /// `null` عندما لا يحمل الرد رمزاً (جلسة غير صالحة).
  AuthToken? toDomain() {
    final token = this?.token;
    if (token == null || token.isEmpty) return null;
    return AuthToken(
      token: token,
      tokenType: this?.tokenType ?? 'Bearer',
      user: this?.user?.toDomain(),
      abilities: this?.abilities ?? const [],
    );
  }
}

extension AuthUserModelMapper on AuthUserModel? {
  AuthUser toDomain() {
    return AuthUser(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      username: this?.username ?? '',
      roles: this?.roles ?? const [],
      permissions: this?.permissions ?? const [],
      teacherId: this?.teacherId,
    );
  }
}
