import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final List<int>? duplicatePages;
  const ApiException(this.message, {this.statusCode, this.duplicatePages});

  bool get isForbidden => statusCode == 403;
  bool get isUnauthorized => statusCode == 401;
  bool get hasDuplicatePages => duplicatePages != null && duplicatePages!.isNotEmpty;

  @override
  String toString() => message;
}

class ApiService {
  static const _baseUrl = 'https://www.alkheir-mosque.com/api/v1';
  static const _timeout = Duration(seconds: 20);

  final AuthService _auth = AuthService();

  Future<Map<String, String>> _authHeaders() async {
    final token = await _auth.getSavedToken();
    if (token == null) throw const ApiException('غير مسجّل الدخول');
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token.authorizationHeader,
    };
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? query}) async {
    final uri = Uri.parse('$_baseUrl/$path').replace(
      queryParameters: query?.map((k, v) => MapEntry(k, v.toString())),
    );
    final response =
        await http.get(uri, headers: await _authHeaders()).timeout(_timeout);
    return _handle(response);
  }

  Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('$_baseUrl/$path');
    final response = await http
        .post(uri, headers: await _authHeaders(), body: jsonEncode(body ?? {}))
        .timeout(_timeout);
    return _handle(response);
  }

  Future<dynamic> put(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('$_baseUrl/$path');
    final response = await http
        .put(uri, headers: await _authHeaders(), body: jsonEncode(body ?? {}))
        .timeout(_timeout);
    return _handle(response);
  }

  Future<dynamic> patch(String path, {Map<String, dynamic>? body}) async {
    final uri = Uri.parse('$_baseUrl/$path');
    final response = await http
        .patch(uri, headers: await _authHeaders(), body: jsonEncode(body ?? {}))
        .timeout(_timeout);
    return _handle(response);
  }

  Future<dynamic> delete(String path) async {
    final uri = Uri.parse('$_baseUrl/$path');
    final response =
        await http.delete(uri, headers: await _authHeaders()).timeout(_timeout);
    return _handle(response);
  }

  dynamic _handle(http.Response response) {
    final body = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) return body;
    if (response.statusCode == 403) {
      throw const ApiException(
        'ليس لديك صلاحية للوصول إلى هذه البيانات',
        statusCode: 403,
      );
    }
    if (response.statusCode == 401) {
      throw const ApiException(
        'انتهت جلستك، يرجى تسجيل الدخول مجدداً',
        statusCode: 401,
      );
    }
    final message = (body is Map ? body['message'] as String? : null) ??
        'خطأ في الخادم (${response.statusCode})';
    final duplicates = (body is Map ? body['duplicates'] as List<dynamic>? : null)
        ?.map((e) => (e as num).toInt())
        .toList();
    throw ApiException(message, statusCode: response.statusCode, duplicatePages: duplicates);
  }
}
