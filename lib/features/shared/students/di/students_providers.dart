import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/di/di_locator.dart';

import '../data/apis/student_apis.dart';
import '../data/apis/student_file_apis.dart';
import '../domain/repository/student_file_repository.dart';
import '../domain/repository/student_repository.dart';

final studentApisProvider = Provider<StudentApis>((ref) {
  final dio = ref.read(dioProvider);
  return StudentApis(dio);
});

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  final api = ref.read(studentApisProvider);
  return StudentRepositoryImpl(api);
});

final studentFileApisProvider = Provider<StudentFileApis>((ref) {
  final dio = ref.read(dioProvider);
  return StudentFileApis(dio);
});

final studentFileRepositoryProvider = Provider<StudentFileRepository>((ref) {
  final api = ref.read(studentFileApisProvider);
  return StudentFileRepositoryImpl(api);
});
