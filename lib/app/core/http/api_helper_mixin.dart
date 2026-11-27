import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/dio_client.dart';

mixin ApiHelperMixin {
  Future<T?> executeApi<T>({
    required Future<T> Function() action,
    dynamic Function(ApiError error)? errorHandler,
    void Function()? after,
  }) async {
    try {
      final result = await action();
      return result;
    } on DioException catch (dioError) {
      final apiError = DioClient.handleDioError(dioError);
      if (errorHandler != null) {
        errorHandler(apiError);
      }
      return null;
    } on ApiError catch (apiError) {
      if (errorHandler != null) {
        errorHandler(apiError);
      }
      return null;
    } catch (error, stack) {
      developer.log('$error',
          name: 'executeApi', error: error, stackTrace: stack);
      final apiError = ApiError(
        type: ApiErrorType.unexpected,
        message: L10nGateway.current.couldnTCompleteTheRequest,
      );
      if (errorHandler != null) {
        errorHandler(apiError);
      }
      return null;
    } finally {
      after?.call();
    }
  }

  /// ينفّذ عملية كتابة ويعيد قيمتها أو الخطأ (`'$error'` نصه الجاهز للعرض).
  Future<({T? value, ApiError? error})> runAction<T>(
    Future<T> Function() action,
  ) async {
    ApiError? error;
    final value = await executeApi(
      action: action,
      errorHandler: (e) => error = e,
    );
    return (value: value, error: error);
  }
}
