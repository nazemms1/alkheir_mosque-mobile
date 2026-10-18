import 'package:dio/dio.dart';

import 'api_error.dart';
import 'dio_client.dart';

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
    } catch (error) {
      final apiError = ApiError(
        type: ApiErrorType.unexpected,
        message: error.toString(),
      );
      if (errorHandler != null) {
        errorHandler(apiError);
      }
      return null;
    } finally {
      after?.call();
    }
  }
}
