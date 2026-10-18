import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_service.dart';
import 'package:alkheir_mosque/features/auth/domain/repositories/auth_repository.dart';
import 'package:alkheir_mosque/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:alkheir_mosque/features/admin/domain/repositories/admin_repository.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/features/reports/domain/repositories/reports_repository.dart';
import 'package:alkheir_mosque/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:alkheir_mosque/features/students/domain/repositories/student_repository.dart';
import 'package:alkheir_mosque/features/students/data/repositories/student_repository_impl.dart';

/// مزوّدات الخدمات والمستودعات — نسخة واحدة مشتركة على مستوى التطبيق.
final authServiceProvider = Provider<AuthRepository>((ref) => AuthRepositoryImpl());

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final adminServiceProvider = Provider<AdminRepository>((ref) => AdminRepositoryImpl());

final studentServiceProvider =
    Provider<StudentRepository>((ref) => StudentRepositoryImpl());

final reportsServiceProvider = Provider<ReportsRepository>(
    (ref) => ReportsRepositoryImpl(ref.read(apiServiceProvider)));
