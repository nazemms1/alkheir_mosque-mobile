import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/api_service.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/admin_service.dart';
import '../../data/services/reports_service.dart';
import '../../data/services/student_service.dart';

/// مزوّدات الخدمات (Services) — نسخة واحدة مشتركة لكل خدمة على مستوى التطبيق.
///
/// بدلاً من إنشاء `AuthService()` أو `AdminService()` داخل كل شاشة،
/// اقرأ الخدمة من هنا: `ref.read(adminServiceProvider)`.
/// هذا يسهّل الاستبدال بالـ mocks في الاختبارات ويمنع تعدد النسخ.
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final adminServiceProvider = Provider<AdminService>((ref) => AdminService());

final studentServiceProvider = Provider<StudentService>((ref) => StudentService());

final reportsServiceProvider =
    Provider<ReportsService>((ref) => ReportsService(ref.read(apiServiceProvider)));
