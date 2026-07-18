import 'package:flutter/material.dart';
import '../../data/models/auth_token.dart';
import '../../features/admin/screens/admin_assessments_screen.dart';
import '../../features/admin/screens/admin_dashboard_screen.dart';
import '../../features/admin/screens/admin_finance_screen.dart';
import '../../features/admin/screens/admin_groups_screen.dart';
import '../../features/admin/screens/admin_reports_screen.dart';
import '../../features/admin/screens/admin_students_screen.dart';
import '../../features/attendance/screens/attendance_screen.dart';
import '../../features/child_profile/screens/child_profile_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/memorization/screens/memorization_screen.dart';
import '../../features/points/screens/points_screen.dart';
import '../../features/supervisor/screens/supervisor_shell.dart';
import '../rbac/permissions.dart';
import 'app_tab.dart';

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
final List<AppTab> parentTabs = [
  AppTab(
    id: 'parent-home',
    icon: Icons.home_outlined,
    activeIcon: Icons.home_rounded,
    label: 'الرئيسية',
    subtitle: 'مرحباً بك في مسجد الخير',
    builder: (ctx) => HomeScreen(ctx: ctx),
  ),
  AppTab(
    id: 'parent-student',
    icon: Icons.person_outline_rounded,
    activeIcon: Icons.person_rounded,
    label: 'الطالب',
    title: 'بيانات الطالب',
    subtitle: 'ملفات أبنائك',
    builder: (ctx) => ChildProfileScreen(student: ctx.activeChild.student),
  ),
  AppTab(
    id: 'parent-attendance',
    icon: Icons.calendar_month_outlined,
    activeIcon: Icons.calendar_month_rounded,
    label: 'الحضور',
    title: 'سجل الحضور',
    subtitle: 'سجلات الحضور',
    builder: (ctx) => AttendanceScreen(
      records: ctx.activeChild.attendanceRecords,
      studentId: int.tryParse(ctx.activeChild.student.id),
    ),
  ),
  AppTab(
    id: 'parent-memorization',
    icon: Icons.menu_book_outlined,
    activeIcon: Icons.menu_book_rounded,
    label: 'الحفظ',
    title: 'المحفوظات',
    subtitle: 'سجلات الحفظ',
    builder: (ctx) => MemorizationScreen(
      progress: ctx.activeChild.memorizationProgress,
      studentId: int.tryParse(ctx.activeChild.student.id),
    ),
  ),
  AppTab(
    id: 'parent-points',
    icon: Icons.star_outline_rounded,
    activeIcon: Icons.star_rounded,
    label: 'النقاط',
    title: 'النقاط والتقييمات',
    subtitle: 'النقاط والتقييمات',
    builder: (ctx) => PointsScreen(
      pointRecords: ctx.activeChild.pointRecords,
      evaluations: ctx.activeChild.evaluations,
      totalPoints: ctx.activeChild.totalPoints,
      studentId: int.tryParse(ctx.activeChild.student.id),
    ),
  ),
];

/// تبويبات المشرف الإداري.
final List<AppTab> adminTabs = [
  AppTab(
    id: 'admin-home',
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard_rounded,
    label: 'الرئيسية',
    subtitle: 'لوحة التحكم',
    builder: (ctx) => AdminHomeTab(token: ctx.token),
  ),
  AppTab(
    id: 'admin-groups',
    icon: Icons.groups_outlined,
    activeIcon: Icons.groups_rounded,
    label: 'الحلقات',
    subtitle: 'إدارة الحلقات',
    anyOfPermissions: const [Permissions.groupsView],
    builder: (ctx) => AdminGroupsScreen(token: ctx.token),
  ),
  AppTab(
    id: 'admin-students',
    icon: Icons.people_outline_rounded,
    activeIcon: Icons.people_rounded,
    label: 'الطلاب',
    subtitle: 'قائمة الطلاب',
    anyOfPermissions: const [Permissions.studentsView],
    builder: (_) => const AdminStudentsScreen(),
  ),
  AppTab(
    id: 'admin-assessments',
    icon: Icons.assignment_outlined,
    activeIcon: Icons.assignment_rounded,
    label: 'التقييمات',
    subtitle: 'التقييمات والاختبارات',
    anyOfPermissions: const [Permissions.assessmentsView],
    builder: (_) => const AdminAssessmentsScreen(),
  ),
  AppTab(
    id: 'admin-reports',
    icon: Icons.bar_chart_outlined,
    activeIcon: Icons.bar_chart_rounded,
    label: 'التقارير',
    subtitle: 'نظرة عامة وملخص المعلمين',
    anyOfPermissions: const [Permissions.reportsView],
    builder: (_) => const AdminReportsScreen(),
  ),
  AppTab(
    id: 'admin-finance',
    icon: Icons.account_balance_wallet_outlined,
    activeIcon: Icons.account_balance_wallet_rounded,
    label: 'المالية',
    subtitle: 'الفواتير والأنشطة',
    anyOfPermissions: const [Permissions.invoicesView],
    builder: (_) => const AdminFinanceScreen(),
  ),
];

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

bool _canRecordExams(AuthToken t) =>
    t.hasPermission(Permissions.quranTestsRecord) ||
    t.hasPermission(Permissions.quranAwqafTestsRecord);

bool _canViewExams(AuthToken t) =>
    _canRecordExams(t) ||
    t.hasPermission(Permissions.quranTestsView) ||
    t.hasPermission(Permissions.quranAwqafTestsView);

/// تبويبات الأدوار الإشرافية (مشرف حلقة / مساعد / مسمّع / مشرف سبر...).
final List<AppTab> supervisorTabs = [
  AppTab(
    id: 'sup-home',
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard_rounded,
    label: 'الرئيسية',
    subtitle: 'لوحة التحكم',
    builder: (ctx) => SupervisorHomeTab(token: ctx.token),
  ),
  AppTab(
    id: 'sup-progress',
    icon: Icons.trending_up_outlined,
    activeIcon: Icons.trending_up_rounded,
    label: 'التقدم',
    subtitle: 'تقدّم الطلاب',
    builder: (ctx) => StudentsProgressTab(token: ctx.token),
  ),
  AppTab(
    id: 'sup-recitation',
    icon: Icons.record_voice_over_outlined,
    activeIcon: Icons.record_voice_over_rounded,
    label: 'التسميع',
    subtitle: 'الحفظ واختبارات القرآن',
    visibleWhen: (t) =>
        (t.isSupervisor ||
            t.isAssistantSupervisor ||
            t.isReciter ||
            t.isTrialExamSupervisor ||
            t.isFinalExamSupervisor ||
            t.isAdmin) &&
        _canViewRecitation(t),
    builder: (ctx) => RecitationTab(
      token: ctx.token,
      canRecordMemorization:
          ctx.token.hasPermission(Permissions.assessmentsView),
    ),
  ),
  AppTab(
    id: 'sup-attendance',
    icon: Icons.event_available_outlined,
    activeIcon: Icons.event_available_rounded,
    label: 'الحضور',
    subtitle: 'سجل حضور الطلاب',
    anyOfPermissions: const [Permissions.attendanceStudentTake],
    visibleWhen: (t) => t.isSupervisor || t.isAssistantSupervisor || t.isAdmin,
    builder: (_) => const SupervisorAttendanceTab(),
  ),
  AppTab(
    id: 'sup-trial-exam',
    icon: Icons.science_outlined,
    activeIcon: Icons.science_rounded,
    label: 'تجريبي',
    subtitle: 'نتائج السبر التجريبي',
    visibleWhen: (t) =>
        (t.isTrialExamSupervisor || t.isFinalExamSupervisor || t.isAdmin) &&
        _canViewExams(t),
    builder: (ctx) => TrialExamTab(canRecord: _canRecordExams(ctx.token)),
  ),
  AppTab(
    id: 'sup-final-exam',
    icon: Icons.verified_outlined,
    activeIcon: Icons.verified_rounded,
    label: 'نهائي',
    subtitle: 'نتائج السير النهائي',
    visibleWhen: (t) => (t.isFinalExamSupervisor || t.isAdmin) && _canViewExams(t),
    builder: (ctx) => FinalExamTab(canRecord: _canRecordExams(ctx.token)),
  ),
  AppTab(
    id: 'sup-reports',
    icon: Icons.bar_chart_outlined,
    activeIcon: Icons.bar_chart_rounded,
    label: 'التقارير',
    subtitle: 'تقارير الحلقة',
    anyOfPermissions: const [Permissions.reportsView],
    visibleWhen: (t) => t.isSupervisor || t.isAdmin,
    builder: (_) => const ReportsTab(),
  ),
  AppTab(
    id: 'sup-points',
    icon: Icons.star_outline_rounded,
    activeIcon: Icons.star_rounded,
    label: 'النقاط',
    subtitle: 'نقاط الطلاب',
    anyOfPermissions: const [Permissions.pointsView],
    builder: (_) => const SupervisorPointsTab(),
  ),
  AppTab(
    id: 'sup-assessments',
    icon: Icons.assignment_outlined,
    activeIcon: Icons.assignment_rounded,
    label: 'التقييمات',
    subtitle: 'التقييمات والاختبارات',
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
  } else {
    return const [];
  }
  return family.where((t) => t.isVisibleFor(token)).toList();
}
