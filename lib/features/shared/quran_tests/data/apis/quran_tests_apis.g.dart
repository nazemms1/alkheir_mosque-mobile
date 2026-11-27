// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_tests_apis.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _QuranTestsApis implements QuranTestsApis {
  _QuranTestsApis(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<BaseApiModel<List<QuranPartialCycleModel>>> partialCycles(
    int page,
    int perPage, {
    int? studentId,
    String? status,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage,
      r'student_id': studentId,
      r'status': status,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseApiModel<List<QuranPartialCycleModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'quran-partial-tests',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<List<QuranPartialCycleModel>> _value;
    try {
      _value = BaseApiModel<List<QuranPartialCycleModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<QuranPartialCycleModel>(
                  (i) => QuranPartialCycleModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<QuranPartialCycleModel>> partialCycle(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseApiModel<QuranPartialCycleModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'quran-partial-tests/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<QuranPartialCycleModel> _value;
    try {
      _value = BaseApiModel<QuranPartialCycleModel>.fromJson(
        _result.data!,
        (json) => QuranPartialCycleModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<List<QuranJuzModel>>> partialEligibleJuz(
    int enrollmentId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseApiModel<List<QuranJuzModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'enrollments/${enrollmentId}/quran-partial-tests/eligible-juz',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<List<QuranJuzModel>> _value;
    try {
      _value = BaseApiModel<List<QuranJuzModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<QuranJuzModel>(
                  (i) => QuranJuzModel.fromJson(i as Map<String, dynamic>),
                )
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<QuranPartialCycleModel>> startPartial(
    int enrollmentId,
    StartPartialParams params,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = params;
    final _options = _setStreamType<BaseApiModel<QuranPartialCycleModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'enrollments/${enrollmentId}/quran-partial-tests',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<QuranPartialCycleModel> _value;
    try {
      _value = BaseApiModel<QuranPartialCycleModel>.fromJson(
        _result.data!,
        (json) => QuranPartialCycleModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<QuranPartialAttemptModel>> recordPartialAttempt(
    int cycleId,
    int partId,
    RecordPartialAttemptParams params,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = params;
    final _options = _setStreamType<BaseApiModel<QuranPartialAttemptModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'quran-partial-tests/${cycleId}/parts/${partId}/attempts',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<QuranPartialAttemptModel> _value;
    try {
      _value = BaseApiModel<QuranPartialAttemptModel>.fromJson(
        _result.data!,
        (json) =>
            QuranPartialAttemptModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<List<QuranFinalCycleModel>>> finalCycles(
    int page,
    int perPage, {
    int? studentId,
    String? status,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage,
      r'student_id': studentId,
      r'status': status,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseApiModel<List<QuranFinalCycleModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'quran-final-tests',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<List<QuranFinalCycleModel>> _value;
    try {
      _value = BaseApiModel<List<QuranFinalCycleModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<QuranFinalCycleModel>(
                  (i) => QuranFinalCycleModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<QuranFinalCycleModel>> finalCycle(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseApiModel<QuranFinalCycleModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'quran-final-tests/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<QuranFinalCycleModel> _value;
    try {
      _value = BaseApiModel<QuranFinalCycleModel>.fromJson(
        _result.data!,
        (json) => QuranFinalCycleModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<List<QuranJuzModel>>> finalEligibleJuz(
    int enrollmentId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<BaseApiModel<List<QuranJuzModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'enrollments/${enrollmentId}/quran-final-tests/eligible-juz',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<List<QuranJuzModel>> _value;
    try {
      _value = BaseApiModel<List<QuranJuzModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                .map<QuranJuzModel>(
                  (i) => QuranJuzModel.fromJson(i as Map<String, dynamic>),
                )
                .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<QuranFinalCycleModel>> startFinal(
    int enrollmentId,
    StartFinalParams params,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = params;
    final _options = _setStreamType<BaseApiModel<QuranFinalCycleModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'enrollments/${enrollmentId}/quran-final-tests',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<QuranFinalCycleModel> _value;
    try {
      _value = BaseApiModel<QuranFinalCycleModel>.fromJson(
        _result.data!,
        (json) => QuranFinalCycleModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<BaseApiModel<QuranFinalAttemptModel>> recordFinalAttempt(
    int cycleId,
    RecordFinalAttemptParams params,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = params;
    final _options = _setStreamType<BaseApiModel<QuranFinalAttemptModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'quran-final-tests/${cycleId}/attempts',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late BaseApiModel<QuranFinalAttemptModel> _value;
    try {
      _value = BaseApiModel<QuranFinalAttemptModel>.fromJson(
        _result.data!,
        (json) => QuranFinalAttemptModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions newRequestOptions(Object? options) {
    if (options is RequestOptions) {
      return options as RequestOptions;
    }
    if (options is Options) {
      return RequestOptions(
        method: options.method,
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
        extra: options.extra,
        headers: options.headers,
        responseType: options.responseType,
        contentType: options.contentType.toString(),
        validateStatus: options.validateStatus,
        receiveDataWhenStatusError: options.receiveDataWhenStatusError,
        followRedirects: options.followRedirects,
        maxRedirects: options.maxRedirects,
        requestEncoder: options.requestEncoder,
        responseDecoder: options.responseDecoder,
        path: '',
      );
    }
    return RequestOptions(path: '');
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
