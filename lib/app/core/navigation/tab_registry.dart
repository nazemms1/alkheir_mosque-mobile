import 'package:flutter/material.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/admin/presentation/screens/admin_assessments_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/screens/admin_dashboard_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/screens/admin_finance_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/screens/admin_groups_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/screens/admin_reports_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/screens/admin_students_screen.dart';
import 'package:alkheir_mosque/features/attendance/presentation/screens/attendance_screen.dart';
import 'package:alkheir_mosque/features/child_profile/presentation/screens/child_profile_screen.dart';
import 'package:alkheir_mosque/features/home/presentation/screens/home_screen.dart';
import 'package:alkheir_mosque/features/management/presentation/screens/management_hub_tab.dart';
import 'package:alkheir_mosque/features/memorization/presentation/screens/memorization_screen.dart';
import 'package:alkheir_mosque/features/points/presentation/screens/points_screen.dart';
import 'package:alkheir_mosque/features/supervisor/presentation/screens/supervisor_shell.dart';
import '../rbac/module_access.dart';
import '../rbac/permissions.dart';
import 'app_tab.dart';
import '../i18n/app_language.dart';

/// ─────────────────────────────────────────────────────────────────────────────
/// سجل التبويبات المركزي — المكان الوحيد الذي تُعرَّف فيه صفحات التطبيق
/// وشروط ظهورها (الأدوار والصلاحيات).
///
/// لإضافة صفحة جديدة:
///   1. أنشئ شاشتك في lib/features/<الميزة>/screens/.
///   2. أضف AppTab واحداً في القائمة المناسبة أدناه (حسب عائلة الدور).
///   3. حدّد شرط الظهور عبر anyOfPermissions و/أو visibleWhen.
/// لا حاجة لتعديل MainShell أو أي منطق تنقل آخر.
/// ─────────────────────────────────────────────────────────────────────────────

/// تبويبات ولي الأمر / الطالب.
///
/// ملاحظة: كل التبويبات أدناه `getter` وليست `final`، لأن عناوينها تستدعي `tr()`
/// وأي قيمة `final` ستُحسب مرة واحدة فتبقى بلغة الإقلاع ولا تتغيّر عند التبديل.
List<AppTab> get parentTabs => [
      AppTab(
        id: 'parent-home',
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: tr('الرئيسية'),
        subtitle: tr('مرحباً بك في مسجد الخير'),
        builder: (ctx) => HomeScreen(ctx: ctx),
      ),
      AppTab(
        id: 'parent-student',
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
        label: tr('الطالب'),
        title: tr('بيانات الطالب'),
        subtitle: tr('ملفات أبنائك'),
        builder: (ctx) => ChildProfileScreen(student: ctx.activeChild.student),
      ),
      AppTab(
        id: 'parent-attendance',
        icon: Icons.calendar_month_outlined,
        activeIcon: Icons.calendar_month_rounded,
        label: tr('الحضور'),
        title: tr('سجل الحضور'),
        subtitle: tr('سجلات الحضور'),
        builder: (ctx) => AttendanceScreen(
          records: ctx.activeChild.attendanceRecords,
          studentId: int.tryParse(ctx.activeChild.student.id),
        ),
      ),
      AppTab(
        id: 'parent-memorization',
        icon: Icons.menu_book_outlined,
        activeIcon: Icons.menu_book_rounded,
        label: tr('الحفظ'),
        title: tr('المحفوظات'),
        subtitle: tr('سجلات الحفظ'),
        builder: (ctx) => MemorizationScreen(
          progress: ctx.activeChild.memorizationProgress,
          studentId: int.tryParse(ctx.activeChild.student.id),
        ),
      ),
      AppTab(
        id: 'parent-points',
        icon: Icons.star_outline_rounded,
        activeIcon: Icons.star_rounded,
        label: tr('النقاط'),
        title: tr('النقاط والتقييمات'),
        subtitle: tr('النقاط والتقييمات'),
        builder: (ctx) => PointsScreen(
          pointRecords: ctx.activeChild.pointRecords,
          evaluations: ctx.activeChild.evaluations,
          totalPoints: ctx.activeChild.totalPoints,
          studentId: int.tryParse(ctx.activeChild.student.id),
        ),
      ),
    ];

/// تبويبات المشرف الإداري.
List<AppTab> get adminTabs => [
      AppTab(
        id: 'admin-home',
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard_rounded,
        label: tr('الرئيسية'),
        subtitle: tr('لوحة التحكم'),
        builder: (ctx) => AdminHomeTab(token: ctx.token),
      ),
      AppTab(
        id: 'admin-groups',
        icon: Icons.groups_outlined,
        activeIcon: Icons.groups_rounded,
        label: tr('الحلقات'),
        subtitle: tr('إدارة الحلقات'),
        anyOfPermissions: const [Permissions.groupsView],
        builder: (ctx) => AdminGroupsScreen(token: ctx.token),
      ),
      AppTab(
        id: 'admin-students',
        icon: Icons.people_outline_rounded,
        activeIcon: Icons.people_rounded,
        label: tr('الطلاب'),
        subtitle: tr('قائمة الطلاب'),
        anyOfPermissions: const [Permissions.studentsView],
        builder: (ctx) => AdminStudentsScreen(token: ctx.token),
      ),
      AppTab(
        id: 'admin-assessments',
        icon: Icons.assignment_outlined,
        activeIcon: Icons.assignment_rounded,
        label: tr('التقييمات'),
        subtitle: tr('التقييمات والاختبارات'),
        anyOfPermissions: const [Permissions.assessmentsView],
        builder: (_) => const AdminAssessmentsScreen(),
      ),
      AppTab(
        id: 'admin-reports',
        icon: Icons.bar_chart_outlined,
        activeIcon: Icons.bar_chart_rounded,
        label: tr('التقارير'),
        subtitle: tr('نظرة عامة وملخص المعلمين'),
        anyOfPermissions: const [Permissions.reportsView],
        builder: (_) => const AdminReportsScreen(),
      ),
      AppTab(
        id: 'admin-finance',
        icon: Icons.account_balance_wallet_outlined,
        activeIcon: Icons.account_balance_wallet_rounded,
        label: tr('المالية'),
        subtitle: tr('الفواتير والأنشطة'),
        anyOfPermissions: const [
          Permissions.invoicesView,
          Permissions.activitiesView,
        ],
        builder: (ctx) => AdminFinanceScreen(token: ctx.token),
      ),
    ];

/// تبويب "الإدارة" المشترك: يظهر لكل حساب يملك صلاحية وحدة إدارية واحدة على الأقل.
/// الوحدات نفسها تُرشَّح داخل التبويب بالصلاحيات (لا بأسماء الأدوار).
AppTab get managementTab => AppTab(
      id: 'management',
      icon: Icons.apps_outlined,
      activeIcon: Icons.apps_rounded,
      label: tr('الإدارة'),
      subtitle: tr('الوحدات الإدارية حسب صلاحياتك'),
      visibleWhen: ModuleAccess.hasAnyModule,
      builder: (ctx) => ManagementHubTab(token: ctx.token),
    );

// ─── شروط مركّبة مشتركة بين تبويبات الأدوار الإشرافية ────────────────────────

bool _canRecordRecitation(AuthToken t) =>
    t.hasPermission(Permissions.assessmentsView) ||
    t.hasPermission(Permissions.quranTestsRecord) ||
    t.hasPermission(Permissions.quranAwqafTestsRecord);

bool _canViewRecitation(AuthToken t) =>
    _canRecordRecitation(t) ||
    t.hasPermission(Permissions.memorizationView) ||
    t.hasPermission(Permissions.quranTestsView) ||
    t.hasPermission(Permissions.quranAwqafTestsView);

/// السبر التجريبي: صلاحيات الجزئي، أو الصلاحيات العامة للاختبارات.
bool _canViewPartialExams(AuthToken t) =>
    t.hasPermission(Permissions.quranPartialTestsView) ||
    t.hasPermission(Permissions.quranTestsView) ||
    t.hasPermission(Permissions.quranAwqafTestsView);

bool _canRecordPartialExams(AuthToken t) =>
    t.hasPermission(Permissions.quranPartialTestsRecord) ||
    t.hasPermission(Permissions.quranTestsRecord) ||
    t.hasPermission(Permissions.quranAwqafTestsRecord);

/// السبر النهائي: صلاحيات النهائي، أو الصلاحيات العامة للاختبارات.
bool _canViewFinalExams(AuthToken t) =>
    t.hasPermission(Permissions.quranFinalTestsView) ||
    t.hasPermission(Permissions.quranTestsView) ||
    t.hasPermission(Permissions.quranAwqafTestsView);

bool _canRecordFinalExams(AuthToken t) =>
    t.hasPermission(Permissions.quranFinalTestsRecord) ||
    t.hasPermission(Permissions.quranTestsRecord) ||
    t.hasPermission(Permissions.quranAwqafTestsRecord);

/// تبويبات الأدوار الإشرافية (مشرف حلقة / مساعد / مسمّع / مشرف سبر...).
List<AppTab> get supervisorTabs => [
      AppTab(
        id: 'sup-home',
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard_rounded,
        label: tr('الرئيسية'),
        subtitle: tr('لوحة التحكم'),
        builder: (ctx) => SupervisorHomeTab(token: ctx.token),
      ),
      AppTab(
        id: 'sup-progress',
        icon: Icons.trending_up_outlined,
        activeIcon: Icons.trending_up_rounded,
        label: tr('التقدم'),
        subtitle: tr('تقدّم الطلاب'),
        anyOfPermissions: const [Permissions.studentsView],
        builder: (ctx) => StudentsProgressTab(token: ctx.token),
      ),
      AppTab(
        id: 'sup-recitation',
        icon: Icons.record_voice_over_outlined,
        activeIcon: Icons.record_voice_over_rounded,
        label: tr('التسميع'),
        subtitle: tr('الحفظ واختبارات القرآن'),
        visibleWhen: _canViewRecitation,
        builder: (ctx) => RecitationTab(
          token: ctx.token,
          canRecordMemorization:
              ctx.token.hasPermission(Permissions.memorizationRecord) &&
                  ctx.token.teacherId != null,
        ),
      ),
      AppTab(
        id: 'sup-attendance',
        icon: Icons.event_available_outlined,
        activeIcon: Icons.event_available_rounded,
        label: tr('الحضور'),
        subtitle: tr('سجل حضور الطلاب'),
        anyOfPermissions: const [Permissions.attendanceStudentTake],
        builder: (_) => const SupervisorAttendanceTab(),
      ),
      AppTab(
        id: 'sup-trial-exam',
        icon: Icons.science_outlined,
        activeIcon: Icons.science_rounded,
        label: tr('تجريبي'),
        subtitle: tr('نتائج السبر التجريبي'),
        visibleWhen: _canViewPartialExams,
        builder: (ctx) =>
            TrialExamTab(canRecord: _canRecordPartialExams(ctx.token)),
      ),
      AppTab(
        id: 'sup-final-exam',
        icon: Icons.verified_outlined,
        activeIcon: Icons.verified_rounded,
        label: tr('نهائي'),
        subtitle: tr('نتائج السير النهائي'),
        visibleWhen: _canViewFinalExams,
        builder: (ctx) =>
            FinalExamTab(canRecord: _canRecordFinalExams(ctx.token)),
      ),
      AppTab(
        id: 'sup-reports',
        icon: Icons.bar_chart_outlined,
        activeIcon: Icons.bar_chart_rounded,
        label: tr('التقارير'),
        subtitle: tr('تقارير الحلقة'),
        anyOfPermissions: const [Permissions.reportsView],
        builder: (_) => const ReportsTab(),
      ),
      AppTab(
        id: 'sup-points',
        icon: Icons.star_outline_rounded,
        activeIcon: Icons.star_rounded,
        label: tr('النقاط'),
        subtitle: tr('نقاط الطلاب'),
        anyOfPermissions: const [Permissions.pointsView],
        builder: (_) => const SupervisorPointsTab(),
      ),
      AppTab(
        id: 'sup-assessments',
        icon: Icons.assignment_outlined,
        activeIcon: Icons.assignment_rounded,
        label: tr('التقييمات'),
        subtitle: tr('التقييمات والاختبارات'),
        anyOfPermissions: const [
          Permissions.assessmentsView,
          Permissions.assessmentResultsView,
        ],
        builder: (_) => const SupervisorAssessmentsTab(),
      ),
    ];

/// يعيد تبويبات الحساب الحالي: تُختار عائلة التبويبات حسب الدور
/// (ولي أمر/طالب ← إداري ← إشرافي) ثم تُرشَّح بالصلاحيات.
List<AppTab> tabsFor(AuthToken token) {
  final List<AppTab> family;
  if (token.isParent || token.isStudent) {
    family = parentTabs;
  } else if (token.isAdmin) {
    family = adminTabs;
  } else if (token.isAnyStaff) {
    family = supervisorTabs;
  } else if (ModuleAccess.hasAnyModule(token)) {
    // حساب بلا دور إشرافي لكنه يملك صلاحيات وحدات (مثلاً صلاحيات مخصّصة).
    family = [managementTab];
  } else {
    return const [];
  }
  return family.where((t) => t.isVisibleFor(token)).toList();
}
