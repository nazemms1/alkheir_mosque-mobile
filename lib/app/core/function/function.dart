import 'dart:developer' as developer;

/// Wraps data source execution in try/catch, logs any exceptions, and rethrows.
Future<T> handleRepoData<T>(Future<T> Function() handleData) async {
  try {
    return await handleData();
  } catch (error, stackTrace) {
    developer.log(
      'Exception in handleRepoData: $error',
      name: 'handleRepoData',
      error: error,
      stackTrace: stackTrace,
    );
    rethrow;
  }
}
