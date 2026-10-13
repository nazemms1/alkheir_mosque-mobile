import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../../core/config/server_config.dart';
import '../../core/i18n/app_language.dart';
import 'auth_service.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final List<int>? duplicatePages;
  const ApiException(this.message, {this.statusCode, this.duplicatePages});

  bool get isForbidden => statusCode == 403;
  bool get isUnauthorized => statusCode == 401;
  bool get hasDuplicatePages =>
      duplicatePages != null && duplicatePages!.isNotEmpty;

  @override
  String toString() => message;
}

class ApiService {
  String get _baseUrl => ServerConfig.apiBaseUrl;
  static const _timeout = Duration(seconds: 20);
  static const _transferTimeout = Duration(seconds: 90);

  final AuthService _auth = AuthService();

  Future<Map<String, String>> _authHeaders() async {
    final token = await _auth.getSavedToken();
    if (token == null) throw ApiException(tr('غير مسجّل الدخول'));
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token.authorizationHeader,
      'X-Locale': AppLanguage.current.languageCode,
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

  /// رفع ملف بصيغة multipart مع حقول نصية. لا يُضبط Content-Type يدوياً
  /// حتى يضيف `http` حدّ الجزء (boundary) تلقائياً.
  Future<dynamic> postMultipart(
    String path, {
    required http.MultipartFile file,
    Map<String, String> fields = const {},
  }) async {
    final token = await _auth.getSavedToken();
    if (token == null) throw ApiException(tr('غير مسجّل الدخول'));
    final request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/$path'))
      ..headers.addAll({
        'Accept': 'application/json',
        'Authorization': token.authorizationHeader,
        'X-Locale': AppLanguage.current.languageCode,
      })
      ..fields.addAll(fields)
      ..files.add(file);
    final streamed = await request.send().timeout(_transferTimeout);
    return _handle(await http.Response.fromStream(streamed));
  }

  /// تنزيل ملف محمي (مستند أو صورة) كبايتات خام. عند الفشل يُرمى خطأ الخادم.
  Future<Uint8List> getBytes(String path) async {
    final uri = Uri.parse('$_baseUrl/$path');
    final response = await http
        .get(uri, headers: await _authHeaders())
        .timeout(_transferTimeout);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.bodyBytes;
    }
    _handle(response);
    throw ApiException(
      trf('خطأ في الخادم ({0})', [response.statusCode]),
      statusCode: response.statusCode,
    );
  }

  /// أول خطأ تحقق مفهوم من الخادم (`errors`) — أدق من الرسالة العامة.
  String? _firstValidationError(dynamic body) {
    if (body is! Map) return null;
    final errors = body['errors'];
    if (errors is! Map) return null;
    for (final value in errors.values) {
      if (value is List && value.isNotEmpty && value.first is String) {
        final text = (value.first as String).trim();
        if (text.isNotEmpty) return text;
      }
    }
    return null;
  }

  dynamic _handle(http.Response response) {
    final isSuccess = response.statusCode >= 200 && response.statusCode < 300;
    // 204 No Content (حذف/إلغاء) يصل بجسم فارغ — لا يُفكّ ترميزه.
    if (response.bodyBytes.isEmpty) {
      if (isSuccess) return null;
      throw ApiException(
        trf('خطأ في الخادم ({0})', [response.statusCode]),
        statusCode: response.statusCode,
      );
    }
    final body = jsonDecode(utf8.decode(response.bodyBytes));
    if (isSuccess) return body;
    if (response.statusCode == 403) {
      throw ApiException(
        tr('ليس لديك صلاحية للوصول إلى هذه البيانات'),
        statusCode: 403,
      );
    }
    if (response.statusCode == 401) {
      throw ApiException(
        tr('انتهت جلستك، يرجى تسجيل الدخول مجدداً'),
        statusCode: 401,
      );
    }
    final message = _firstValidationError(body) ??
        (body is Map ? body['message'] as String? : null) ??
        trf('خطأ في الخادم ({0})', [response.statusCode]);
    final duplicates =
        (body is Map ? body['duplicates'] as List<dynamic>? : null)
            ?.map((e) => (e as num).toInt())
            .toList();
    throw ApiException(message,
        statusCode: response.statusCode, duplicatePages: duplicates);
  }
}
