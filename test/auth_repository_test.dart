import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/services/secure_storage_service.dart';
import 'package:alkheir_mosque/features/shared/auth/data/apis/auth_apis.dart';
import 'package:alkheir_mosque/features/shared/auth/data/models/auth_token_model.dart';
import 'package:alkheir_mosque/features/shared/auth/data/params/login_params.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/repository/auth_repository.dart';

/// يرد على `login` بالحالة المحددة (أو بالرمز عند `status == null`).
class _FakeAuthApis implements AuthApis {
  _FakeAuthApis({this.status, this.body});

  final int? status;
  final Map<String, dynamic>? body;

  @override
  Future<AuthTokenModel> login(LoginParams params, RequestOptions options) {
    if (status == null) return Future.value(AuthTokenModel.fromJson(body!));
    final request = RequestOptions(path: 'auth/token');
    throw DioException(
      requestOptions: request,
      type: DioExceptionType.badResponse,
      response:
          Response(requestOptions: request, statusCode: status, data: body),
    );
  }

  @override
  Future<void> logout(RequestOptions options) async {}
}

class _MemoryStorage implements SecureStorageService {
  String? token;

  @override
  Future<void> setAccessToken(String value) async => token = value;

  @override
  Future<String?> getAccessToken() async => token;

  @override
  dynamic noSuchMethod(Invocation invocation) => Future.value();
}

Future<String> _loginError(int status, [Map<String, dynamic>? body]) async {
  final repo = AuthRepositoryImpl(
      _FakeAuthApis(status: status, body: body), _MemoryStorage());
  try {
    await repo.login(login: 'u', password: 'p');
  } on ApiError catch (e) {
    return '$e';
  }
  fail('login should have thrown');
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('login keeps its status-specific messages', () async {
    expect(await _loginError(429), contains('عدد المحاولات'));
    expect(await _loginError(404), contains('واجهة الجوال'));
    expect(
      await _loginError(422, {
        'errors': {
          'login': ['اسم المستخدم غير صحيح'],
        },
      }),
      'اسم المستخدم غير صحيح',
    );
    // 401 here means wrong credentials, not an expired session.
    expect(await _loginError(401), 'بيانات الدخول غير صحيحة');
  });

  test('successful login is saved and restored with roles', () async {
    final storage = _MemoryStorage();
    final repo = AuthRepositoryImpl(
      _FakeAuthApis(body: {
        'token': 'abc',
        'user': {
          'id': '3',
          'name': 'Ali',
          'roles': ['admin'],
          'permissions': ['students.view'],
        },
      }),
      storage,
    );

    final token = await repo.login(login: 'u', password: 'p');
    final restored = await repo.getSavedToken();

    expect(token.isAdmin, isTrue);
    expect(storage.token, 'abc');
    expect(restored?.user?.id, 3);
    expect(restored?.hasPermission('students.view'), isTrue);
  });

  test('the token is kept only in secure storage', () async {
    final storage = _MemoryStorage();
    final repo = AuthRepositoryImpl(
        _FakeAuthApis(body: {
          'token': 'abc',
          'user': {'id': 1}
        }),
        storage);

    await repo.login(login: 'u', password: 'p');

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('auth_token_json'), isNot(contains('abc')));
    expect((await repo.getSavedToken())?.token, 'abc');
  });

  test('a session saved by an older version is migrated, not lost', () async {
    SharedPreferences.setMockInitialValues({
      'auth_token_json': '{"token":"old","user":{"id":5,"roles":["admin"]}}',
    });
    final storage = _MemoryStorage();
    final repo = AuthRepositoryImpl(_FakeAuthApis(), storage);

    final restored = await repo.getSavedToken();

    expect(restored?.token, 'old');
    expect(restored?.isAdmin, isTrue);
    expect(storage.token, 'old');
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('auth_token_json'), isNot(contains('old')));
  });
}
