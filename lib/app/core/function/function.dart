import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import 'package:alkheir_mosque/app/core/http/dio_client.dart';

/// Wraps data source execution in try/catch, logs any exceptions, and rethrows.
///
/// Dio errors are rethrown as [ApiError] so a screen that still catches errors
/// itself shows the same message an `ApiHelperMixin` controller would.
Future<T> handleRepoData<T>(Future<T> Function() handleData) async {
  try {
    return await handleData();
  } on DioException catch (error, stackTrace) {
    developer.log('Dio error in handleRepoData: $error',
        name: 'handleRepoData', error: error, stackTrace: stackTrace);
    throw DioClient.handleDioError(error);
  } catch (error, stackTrace) {
    developer.log('Exception in handleRepoData: $error',
        name: 'handleRepoData', error: error, stackTrace: stackTrace);
    rethrow;
  }
}
