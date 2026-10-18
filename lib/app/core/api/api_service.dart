import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../http/dio_client.dart';
import '../services/secure_storage_service.dart';
import '../i18n/app_language.dart';
import 'package:alkheir_mosque/features/auth/domain/repositories/auth_repository.dart';
import 'package:alkheir_mosque/features/auth/data/repositories/auth_repository_impl.dart';

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
  final Dio _dio;
  final AuthRepository _auth;

  ApiService({Dio? dio, AuthRepository? auth})
      : _dio = dio ?? DioClient.defaultDio,
        _auth = auth ?? AuthRepositoryImpl();

  String _cleanPath(String path) {
    if (path.startsWith('/')) {
      return path.substring(1);
    }
    return path;
  }

  Future<void> _ensureAuth() async {
    final token = await _auth.getSavedToken();
    if (token == null) {
      final secureToken = await SecureStorageService().getAccessToken();
      if (secureToken == null || secureToken.isEmpty) {
        throw ApiException(tr('غير مسجّل الدخول'));
      }
    }
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? query}) async {
    await _ensureAuth();
    try {
      final response = await _dio.get(
        _cleanPath(path),
        queryParameters: query?.map((k, v) => MapEntry(k, v)),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<dynamic> post(String path, {dynamic body}) async {
    await _ensureAuth();
    try {
      final response = await _dio.post(
        _cleanPath(path),
        data: body ?? {},
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<dynamic> put(String path, {dynamic body}) async {
    await _ensureAuth();
    try {
      final response = await _dio.put(
        _cleanPath(path),
        data: body ?? {},
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<dynamic> patch(String path, {dynamic body}) async {
    await _ensureAuth();
    try {
      final response = await _dio.patch(
        _cleanPath(path),
        data: body ?? {},
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<dynamic> delete(String path) async {
    await _ensureAuth();
    try {
      final response = await _dio.delete(
        _cleanPath(path),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// رفع ملف بصيغة multipart مع حقول نصية عبر Dio FormData.
  Future<dynamic> postMultipart(
    String path, {
    required MultipartFile file,
    String fileField = 'file',
    Map<String, String> fields = const {},
  }) async {
    await _ensureAuth();
    try {
      final formData = FormData.fromMap({
        ...fields,
        fileField: file,
      });
      final response = await _dio.post(
        _cleanPath(path),
        data: formData,
        options: Options(
          sendTimeout: const Duration(seconds: 90),
          receiveTimeout: const Duration(seconds: 90),
        ),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// تنزيل ملف محمي كبايتات خام عبر Dio.
  Future<Uint8List> getBytes(String path) async {
    await _ensureAuth();
    try {
      final response = await _dio.get<List<int>>(
        _cleanPath(path),
        options: Options(
          responseType: ResponseType.bytes,
          sendTimeout: const Duration(seconds: 90),
          receiveTimeout: const Duration(seconds: 90),
        ),
      );
      if (response.data != null) {
        return Uint8List.fromList(response.data!);
      }
      throw ApiException(
        trf('خطأ في الخادم ({0})', [response.statusCode ?? 500]),
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

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

  dynamic _handleResponse(Response response) {
    final statusCode = response.statusCode ?? 200;
    final isSuccess = statusCode >= 200 && statusCode < 300;
    dynamic data = response.data;

    if (data is String && data.isNotEmpty) {
      try {
        data = jsonDecode(data);
      } catch (_) {}
    }

    // 204 No Content (حذف/إلغاء) يصل بجسم فارغ
    if (data == null || (data is String && data.isEmpty)) {
      if (isSuccess) return null;
      throw ApiException(
        trf('خطأ في الخادم ({0})', [statusCode]),
        statusCode: statusCode,
      );
    }

    if (isSuccess) return data;

    _throwFromData(data, statusCode);
  }

  Never _handleDioError(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    dynamic data = response?.data;

    if (data is String && data.isNotEmpty) {
      try {
        data = jsonDecode(data);
      } catch (_) {}
    }

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      throw ApiException(
        tr('انتهت مهلة الاتصال بالخادم. حاول مجدداً.'),
        statusCode: statusCode,
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      final rawError = '${error.error ?? ''} ${error.message ?? ''}';
      final isReset = rawError.contains('Connection reset') || rawError.contains('Connection closed');
      throw ApiException(
        isReset
            ? tr('تعذّر الاتصال بالخادم (تم قطع الاتصال). يرجى التأكد من تشغيل الـ VPN على هاتفك أو التحقق من عنوان الخادم.')
            : tr('تعذّر الاتصال بالخادم. تحقق من الشبكة وعنوان الخادم.'),
        statusCode: statusCode,
      );
    }

    if (statusCode == 403) {
      throw ApiException(
        tr('ليس لديك صلاحية للوصول إلى هذه البيانات'),
        statusCode: 403,
      );
    }
    if (statusCode == 401) {
      throw ApiException(
        tr('انتهت جلستك، يرجى تسجيل الدخول مجدداً'),
        statusCode: 401,
      );
    }

    if (data != null) {
      _throwFromData(data, statusCode);
    }

    throw ApiException(
      error.message ?? trf('خطأ في الخادم ({0})', [statusCode ?? 500]),
      statusCode: statusCode,
    );
  }

  Never _throwFromData(dynamic body, int? statusCode) {
    if (statusCode == 403) {
      throw ApiException(
        tr('ليس لديك صلاحية للوصول إلى هذه البيانات'),
        statusCode: 403,
      );
    }
    if (statusCode == 401) {
      throw ApiException(
        tr('انتهت جلستك، يرجى تسجيل الدخول مجدداً'),
        statusCode: 401,
      );
    }

    final message = _firstValidationError(body) ??
        (body is Map ? body['message'] as String? : null) ??
        trf('خطأ في الخادم ({0})', [statusCode ?? 500]);
    final duplicates =
        (body is Map ? body['duplicates'] as List<dynamic>? : null)
            ?.map((e) => (e as num).toInt())
            .toList();
    throw ApiException(
      message,
      statusCode: statusCode,
      duplicatePages: duplicates,
    );
  }
}
