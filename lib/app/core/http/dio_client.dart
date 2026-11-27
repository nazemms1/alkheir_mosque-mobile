import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:alkheir_mosque/app/core/config/server_config.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/config/flavor_config.dart';
import 'package:alkheir_mosque/app/core/services/secure_storage_service.dart';
import 'package:alkheir_mosque/app/core/services/shared_prefs_service.dart';
import 'package:alkheir_mosque/app/core/http/api_error.dart';

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

    // Bearer token lives only in secure storage.
    if (!options.headers.containsKey('Authorization')) {
      final token = await _secureStorage.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer ${token.trim()}';
      }
    }

    // Inject language code into headers (not queryParameters to keep endpoints clean)
    final lang =
        _sharedPrefs?.getLanguageCode() ?? AppLanguage.current.languageCode;
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
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final rawError = '${err.error ?? ''} ${err.message ?? ''}';
    final isConnectionReset = err.type == DioExceptionType.connectionError &&
        (rawError.contains('Connection reset') ||
            rawError.contains('Connection closed') ||
            rawError.contains('Broken pipe'));

    final isAlreadyRetried =
        err.requestOptions.extra['is_connection_retry'] == true;

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
      final count = response.data is List ? (response.data as List).length : 0;
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

/// مهلة رفع وتنزيل الملفات (أطول من مهلة الطلبات العادية).
const kUploadTimeout = Duration(seconds: 90);

/// خيارات طلبات رفع الملفات (`@DioOptions`).
RequestOptions get kFileRequestOptions => RequestOptions(
      sendTimeout: kUploadTimeout,
      receiveTimeout: kUploadTimeout,
    );

/// خيارات تنزيل الملفات كبايتات خام (`@DioOptions`).
RequestOptions get kBytesRequestOptions => RequestOptions(
      responseType: ResponseType.bytes,
      sendTimeout: kUploadTimeout,
      receiveTimeout: kUploadTimeout,
    );

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
        // Self-signed certificates are accepted only in debug builds (local
        // test servers). Release builds verify TLS: the production server has a
        // valid Let's Encrypt certificate.
        if (kDebugMode) {
          client.badCertificateCallback = (cert, host, port) => true;
        }
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

  /// يحوّل أي [DioException] إلى [ApiError] برسالة جاهزة للعرض.
  static ApiError handleDioError(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    dynamic data = response?.data;
    if (data is String && data.isNotEmpty) {
      try {
        data = jsonDecode(data);
      } catch (_) {}
    }

    ApiError build(ApiErrorType type, String message) => ApiError(
          type: type,
          message: message,
          statusCode: statusCode,
          data: data,
        );

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return build(ApiErrorType.requestTimeout,
            L10nGateway.current.connectionTimedOutPleaseTry);
      case DioExceptionType.connectionError:
        final raw = '${error.error ?? ''} ${error.message ?? ''}';
        final isReset = raw.contains('Connection reset') ||
            raw.contains('Connection closed');
        return build(
          ApiErrorType.network,
          isReset
              ? L10nGateway.current.couldNotConnectToServer
              : L10nGateway.current.couldnTReachTheServer,
        );
      case DioExceptionType.cancel:
        return build(ApiErrorType.cancelled, 'Request was cancelled');
      default:
        break;
    }

    if (statusCode == 401) {
      return build(ApiErrorType.unauthorized,
          L10nGateway.current.yourSessionHasExpiredPlease);
    }
    if (statusCode == 403) {
      return build(
          ApiErrorType.forbidden, L10nGateway.current.youDonTHavePermission);
    }

    final message = _firstValidationError(data) ??
        (data is Map && data['message'] is String
            ? data['message'] as String
            : null) ??
        (statusCode == null
            ? error.message
            : L10nGateway.current.serverError(statusCode)) ??
        L10nGateway.current.somethingWentWrong;
    final type = switch (statusCode) {
      400 => ApiErrorType.badRequest,
      404 => ApiErrorType.notFound,
      409 => ApiErrorType.conflict,
      422 => ApiErrorType.validation,
      500 => ApiErrorType.internalServer,
      502 || 503 || 504 => ApiErrorType.badGateway,
      _ => ApiErrorType.unexpected,
    };
    return build(type, message);
  }

  /// أول رسالة من `errors` في رد التحقق (422) من Laravel.
  static String? _firstValidationError(dynamic body) {
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
}
