import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:alkheir_mosque/app/core/config/server_config.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import '../config/flavor_config.dart';
import '../services/secure_storage_service.dart';
import '../services/shared_prefs_service.dart';
import 'api_error.dart';

class AuthInterceptor extends QueuedInterceptor {
  final SecureStorageService _secureStorage;
  final SharedPrefsService? _sharedPrefs;

  AuthInterceptor({
    required SecureStorageService secureStorageService,
    SharedPrefsService? sharedPrefsService,
  })  : _secureStorage = secureStorageService,
        _sharedPrefs = sharedPrefsService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Dynamic baseUrl sync with ServerConfig
    var currentBaseUrl = ServerConfig.apiBaseUrl;
    if (currentBaseUrl.isNotEmpty) {
      if (!currentBaseUrl.endsWith('/')) {
        currentBaseUrl = '$currentBaseUrl/';
      }
      options.baseUrl = currentBaseUrl;
    }

    // Clean leading slash to avoid stripping baseUrl's api prefix
    if (options.path.startsWith('/')) {
      options.path = options.path.substring(1);
    }

    // Inject Bearer token from SecureStorageService or fallback to SharedPreferences
    if (!options.headers.containsKey('Authorization')) {
      String? token = await _secureStorage.getAccessToken();
      if (token == null || token.isEmpty) {
        final prefs = await SharedPreferences.getInstance();
        final raw = prefs.getString('auth_token_json');
        if (raw != null) {
          try {
            final map = jsonDecode(raw);
            if (map is Map && map['token'] is String) {
              token = map['token'] as String;
            }
          } catch (_) {}
        }
      }
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer ${token.trim()}';
      }
    }

    // Inject language code into headers (not queryParameters to keep endpoints clean)
    final lang = _sharedPrefs?.getLanguageCode() ?? AppLanguage.current.languageCode;
    options.headers['Accept-Language'] = lang;
    options.headers['X-Locale'] = AppLanguage.current.languageCode;

    if (kDebugMode) {
      debugPrint('🌐 [Dio Request] ${options.method} ${options.uri}');
    }

    return handler.next(options);
  }
}

/// Interceptor to automatically retry requests once when a TCP socket is reset by peer
/// (e.g. stale keep-alive connection closed by single-threaded or dev server).
class RetryOnConnectionResetInterceptor extends Interceptor {
  final Dio dio;

  RetryOnConnectionResetInterceptor(this.dio);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final rawError = '${err.error ?? ''} ${err.message ?? ''}';
    final isConnectionReset = err.type == DioExceptionType.connectionError &&
        (rawError.contains('Connection reset') ||
            rawError.contains('Connection closed') ||
            rawError.contains('Broken pipe'));

    final isAlreadyRetried = err.requestOptions.extra['is_connection_retry'] == true;

    if (isConnectionReset && !isAlreadyRetried) {
      try {
        final options = err.requestOptions;
        options.extra['is_connection_retry'] = true;
        // Small delay to allow remote server/socket to clear
        await Future.delayed(const Duration(milliseconds: 300));
        final response = await dio.fetch(options);
        return handler.resolve(response);
      } catch (retryError) {
        if (retryError is DioException) {
          return handler.next(retryError);
        }
      }
    }
    return handler.next(err);
  }
}

/// غلاف لـ [PrettyDioLogger] يمنع طباعة مصفوفات البايتات الخام للصور والملفات
/// في نافذة التصحيح (Debug Console)، مع الحفاظ على البيانات الأصلية للطلب.
class _BinarySafePrettyDioLogger extends Interceptor {
  final PrettyDioLogger _logger;
  _BinarySafePrettyDioLogger(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.responseType == ResponseType.bytes ||
        response.data is List<int>) {
      final count =
          response.data is List ? (response.data as List).length : 0;
      final safeResponse = Response(
        requestOptions: response.requestOptions,
        data: '<Binary data: $count bytes>',
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        extra: response.extra,
      );
      _logger.onResponse(safeResponse, _NoopResponseHandler());
      handler.next(response);
      return;
    }
    _logger.onResponse(response, handler);
  }
}

class _NoopResponseHandler extends ResponseInterceptorHandler {
  @override
  void next(Response response) {}
}

class DioClient {
  final Dio dio;
  final SecureStorageService secureStorageService;
  final SharedPrefsService? sharedPrefsService;

  static DioClient? _defaultInstance;
  static Dio get defaultDio => (_defaultInstance ??= DioClient()).dio;

  DioClient({
    Dio? dioInstance,
    SecureStorageService? secureStorageService,
    this.sharedPrefsService,
    String? baseUrl,
  })  : secureStorageService = secureStorageService ?? SecureStorageService(),
        dio = dioInstance ?? Dio() {
    var effectiveBaseUrl = baseUrl ??
        (ServerConfig.apiBaseUrl.isNotEmpty
            ? ServerConfig.apiBaseUrl
            : (FlavorConfig.isInitialized
                ? '${FlavorConfig.instance.baseUrl}${FlavorConfig.instance.apiPrefix}'
                : ''));

    if (effectiveBaseUrl.isNotEmpty && !effectiveBaseUrl.endsWith('/')) {
      effectiveBaseUrl = '$effectiveBaseUrl/';
    }

    dio.options = BaseOptions(
      baseUrl: effectiveBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'User-Agent': 'AlkheirMosqueApp/1.0 (Mobile; Dio)',
      },
    );

    // Native platform adapter configuration
    if (!kIsWeb && dio.httpClientAdapter is IOHttpClientAdapter) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        // Allow self-signed or custom CA SSL certificates (mirrors Postman with SSL verification disabled)
        client.badCertificateCallback = (cert, host, port) => true;
        client.connectionTimeout = const Duration(seconds: 15);
        return client;
      };
    }

    dio.interceptors.add(
      AuthInterceptor(
        secureStorageService: this.secureStorageService,
        sharedPrefsService: sharedPrefsService,
      ),
    );

    // Add connection-reset auto-retry interceptor
    dio.interceptors.add(RetryOnConnectionResetInterceptor(dio));

    if (kDebugMode) {
      dio.interceptors.add(
        _BinarySafePrettyDioLogger(
          PrettyDioLogger(
            request: true,
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: false,
            maxWidth: 90,
            logPrint: (object) {
              final str = object.toString();
              // Don't print raw byte dumps
              if (RegExp(r'^\s*║\s*(\d{1,3},\s*){4,}').hasMatch(str)) return;
              debugPrint(str);
            },
          ),
        ),
      );
    }
  }

  static ApiError handleDioError(DioException error) {
    String? extractMessage(dynamic data) {
      if (data is Map) {
        if (data['message'] is String) return data['message'] as String;
        if (data['error'] is String) return data['error'] as String;
        if (data['detail'] is String) return data['detail'] as String;
      } else if (data is String && data.isNotEmpty) {
        return data;
      }
      return null;
    }

    final response = error.response;
    final statusCode = response?.statusCode;
    final customMsg = extractMessage(response?.data);

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        final host = error.requestOptions.uri.host;
        String hint = '';
        if (host == 'localhost' || host == '127.0.0.1') {
          hint = ' (${tr('تنبيه: أنت تستخدم localhost على جهاز أندرويد. في المحاكي استخدم 10.0.2.2 أو نفذ adb reverse على الهاتف الحقيقي')})';
        } else {
          hint = ' (${tr('يرجى التحقق من اتصال الإنترنت أو تشغيل الـ VPN على هاتفك')})';
        }
        return ApiError(
          type: ApiErrorType.requestTimeout,
          message: customMsg ?? '${tr('انتهت مهلة الاتصال بالخادم.')}$hint',
          statusCode: statusCode,
          data: response?.data,
        );

      case DioExceptionType.connectionError:
        final rawError = '${error.error ?? ''} ${error.message ?? ''}';
        final isReset = rawError.contains('Connection reset') || rawError.contains('Connection closed');
        final message = isReset
            ? tr('تعذّر الاتصال بالخادم (تم قطع الاتصال). يرجى التأكد من تشغيل الـ VPN على هاتفك أو التحقق من عنوان الخادم.')
            : (customMsg ?? tr('تعذّر الاتصال بالخادم. تحقق من الشبكة وعنوان الخادم.'));
        return ApiError(
          type: ApiErrorType.network,
          message: message,
          statusCode: statusCode,
          data: response?.data,
        );

      case DioExceptionType.cancel:
        return ApiError(
          type: ApiErrorType.cancelled,
          message: customMsg ?? 'Request was cancelled',
          statusCode: statusCode,
          data: response?.data,
        );

      case DioExceptionType.badResponse:
        switch (statusCode) {
          case 400:
            return ApiError(
              type: ApiErrorType.badRequest,
              message: customMsg ?? 'Bad request',
              statusCode: statusCode,
              data: response?.data,
            );
          case 401:
            return ApiError(
              type: ApiErrorType.unauthorized,
              message: customMsg ?? 'Unauthorized',
              statusCode: statusCode,
              data: response?.data,
            );
          case 403:
            return ApiError(
              type: ApiErrorType.forbidden,
              message: customMsg ?? 'Forbidden access',
              statusCode: statusCode,
              data: response?.data,
            );
          case 404:
            return ApiError(
              type: ApiErrorType.notFound,
              message: customMsg ?? 'Resource not found',
              statusCode: statusCode,
              data: response?.data,
            );
          case 409:
            return ApiError(
              type: ApiErrorType.conflict,
              message: customMsg ?? 'Conflict',
              statusCode: statusCode,
              data: response?.data,
            );
          case 500:
            return ApiError(
              type: ApiErrorType.internalServer,
              message: customMsg ?? 'Internal server error',
              statusCode: statusCode,
              data: response?.data,
            );
          case 502:
          case 503:
          case 504:
            return ApiError(
              type: ApiErrorType.badGateway,
              message: customMsg ?? 'Bad gateway / Service unavailable',
              statusCode: statusCode,
              data: response?.data,
            );
          default:
            return ApiError(
              type: ApiErrorType.unexpected,
              message: customMsg ?? 'Unexpected HTTP error: $statusCode',
              statusCode: statusCode,
              data: response?.data,
            );
        }

      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
      default:
        return ApiError(
          type: ApiErrorType.unexpected,
          message: customMsg ?? 'Unknown network error occurred',
          statusCode: statusCode,
          data: response?.data,
        );
    }
  }
}
