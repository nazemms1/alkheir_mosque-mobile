import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/app/core/navigation/tab_registry.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/auth/domain/repositories/auth_repository.dart';

/// حساب بأدوار وصلاحيات محددة — الصلاحيات هي المصدر الوحيد لما يظهر.
AuthToken _account(List<String> roles, List<String> permissions) {
  return AuthToken(
    token: 'test-token',
    tokenType: 'Bearer',
    user: AuthUser(
      id: 1,
      name: 'مستخدم',
      username: 'user',
      roles: roles,
      permissions: permissions,
    ),
  );
}

List<String> _tabIds(AuthToken token) =>
    tabsFor(token).map((tab) => tab.id).toList();

/// مستودع اتصال يسجّل المسارات المطلوبة دون شبكة.
class _RecordingApi extends ApiService {
  _RecordingApi() : super(dio: Dio(), auth: _NoAuth());

  final List<String> paths = [];

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? query}) async {
    paths.add(path);
    return {'total': 3};
  }
}

class _NoAuth implements AuthRepository {
  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  group('تبويبات الحساب تتبع صلاحياته لا دوره', () {
    test('مشرف يملك صلاحية الحضور فقط يرى تبويب الحضور ولا غيره', () {
      final token = _account(
        ['supervisor'],
        [Permissions.attendanceStudentTake],
      );
      expect(_tabIds(token), ['sup-home', 'sup-attendance']);
    });

    test('معلم يملك صلاحية التقارير يراها (لم تعد محصورة بالمشرف)', () {
      final token = _account(['teacher'], [Permissions.reportsView]);
      expect(_tabIds(token), ['sup-home', 'sup-reports', 'management']);
    });

    test('حساب بلا دور إشرافي يرى تبويب الإدارة فقط إذا كانت له وحدة', () {
      final withModule = _account([], [Permissions.groupsView]);
      expect(_tabIds(withModule), ['management']);

      final withoutModule = _account([], []);
      expect(_tabIds(withoutModule), isEmpty);
    });

    test('إداري يملك الفواتير فقط: يرى المالية ولا يرى الطلاب أو الحلقات', () {
      final token = _account(['admin'], [Permissions.invoicesView]);
      expect(_tabIds(token), ['admin-home', 'admin-finance', 'management']);
    });
  });

  group('إحصاءات لوحة الإداري', () {
    test('لا تطلب إلا ما تسمح به صلاحيات الحساب', () async {
      final api = _RecordingApi();
      final repo = AdminRepositoryImpl(api: api);
      final token = _account(
        ['admin'],
        [Permissions.studentsView, Permissions.invoicesView],
      );

      final stats = await repo.fetchStats(token);

      expect(api.paths, unorderedEquals(['students', 'invoices']));
      expect(stats.totalStudents, 3);
      expect(stats.totalInvoices, 3);
      expect(stats.totalGroups, 0);
      expect(stats.totalEnrollments, 0);
    });

    test('بلا أي صلاحية لا يُرسل أي طلب للخادم', () async {
      final api = _RecordingApi();
      final repo = AdminRepositoryImpl(api: api);

      final dashboard = await repo.fetchDashboard(_account(['admin'], []));

      expect(api.paths, isEmpty);
      expect(dashboard.groups, isEmpty);
      expect(dashboard.students, isEmpty);
    });
  });
}
