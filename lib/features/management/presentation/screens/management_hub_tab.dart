import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/students/data/repositories/student_file_repository_impl.dart';
import 'package:alkheir_mosque/features/account/presentation/screens/account_screen.dart';
import 'package:alkheir_mosque/features/assessments/presentation/screens/assessments_screen.dart';
import 'package:alkheir_mosque/features/attendance/presentation/screens/student_attendance_screen.dart';
import 'package:alkheir_mosque/features/attendance/presentation/screens/teacher_attendance_screen.dart';
import 'package:alkheir_mosque/features/curricula/presentation/screens/curricula_screen.dart';
import 'package:alkheir_mosque/features/finance/presentation/screens/finance_screen.dart';
import 'package:alkheir_mosque/features/finance_ops/presentation/screens/activities_screen.dart';
import 'package:alkheir_mosque/features/finance_ops/presentation/screens/invoices_screen.dart';
import 'package:alkheir_mosque/features/memorization/presentation/screens/staff_memorization_screen.dart';
import 'package:alkheir_mosque/features/notes/presentation/screens/student_notes_screen.dart';
import 'package:alkheir_mosque/features/points/presentation/screens/points_ledger_screen.dart';
import 'package:alkheir_mosque/features/quran_tests/presentation/screens/awqaf_tests_screen.dart';
import 'package:alkheir_mosque/features/quran_tests/presentation/screens/quran_tests_screen.dart';
import 'package:alkheir_mosque/features/reports/presentation/screens/reports_screen.dart';
import 'package:alkheir_mosque/features/sabr/presentation/screens/saber_entry_screen.dart';
import 'package:alkheir_mosque/features/students/presentation/screens/student_picker_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import '../widgets/module_widgets.dart';
import 'courses_screen.dart';
import 'enrollments_screen.dart';
import 'group_schedules_screen.dart';
import 'parents_screen.dart';
import 'teachers_screen.dart';

/// وحدة إدارية واحدة: تظهر في صفحة الإدارة وفي القائمة الجانبية.
class ManagementEntry {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final void Function(BuildContext context) open;

  const ManagementEntry({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.open,
  });
}

/// قسم من الوحدات الإدارية (مثل "المالية").
class ManagementSection {
  final String title;
  final List<ManagementEntry> entries;

  const ManagementSection(this.title, this.entries);
}

/// يفتح شاشة وحدة. القائمة الجانبية تغلق نفسها قبل الفتح.
typedef ManagementOpener = void Function(BuildContext context, Widget screen);

/// الأقسام الإدارية المتاحة لحساب الدخول — كل وحدة تظهر فقط إذا وُجدت صلاحيتها.
List<ManagementSection> managementSections(
    AuthToken t, ManagementOpener push) {
  return [
    ManagementSection(tr('الطلاب والحلقات'), [
      if (ModuleAccess.canViewGroups(t))
        ManagementEntry(
          icon: Icons.calendar_view_week_rounded,
          color: AppColors.warning,
          title: tr('جداول الحلقات'),
          subtitle: tr('حصص كل حلقة وأوقاتها'),
          open: (ctx) => push(ctx, GroupPickerScreen(token: t)),
        ),
      if (ModuleAccess.canViewEnrollments(t))
        ManagementEntry(
          icon: Icons.how_to_reg_rounded,
          color: AppColors.info,
          title: tr('التسجيلات'),
          subtitle: tr('تسجيل الطلاب في الحلقات وإنهاؤها'),
          open: (ctx) => push(ctx, EnrollmentsScreen(token: t)),
        ),
      if (ModuleAccess.canViewCourses(t))
        ManagementEntry(
          icon: Icons.menu_book_rounded,
          color: AppColors.primary,
          title: tr('الكورسات'),
          subtitle: tr('إنشاء الكورسات وإنهاؤها وإعادة تفعيلها'),
          open: (ctx) => push(ctx, CoursesScreen(token: t)),
        ),
      if (ModuleAccess.canViewParents(t))
        ManagementEntry(
          icon: Icons.family_restroom_rounded,
          color: AppColors.info,
          title: tr('الأولياء'),
          subtitle: tr('ملفات أولياء الأمور وحساباتهم'),
          open: (ctx) => push(ctx, ParentsScreen(token: t)),
        ),
      if (ModuleAccess.canViewTeachers(t))
        ManagementEntry(
          icon: Icons.school_rounded,
          color: AppColors.primaryLight,
          title: tr('المعلمون'),
          subtitle: tr('ملفات المعلمين وحساباتهم وكورساتهم'),
          open: (ctx) => push(ctx, TeachersScreen(token: t)),
        ),
    ]),
    ManagementSection(tr('الحضور والحفظ'), [
      if (ModuleAccess.canViewStudentAttendance(t))
        ManagementEntry(
          icon: Icons.event_available_rounded,
          color: AppColors.success,
          title: tr('حضور الطلاب'),
          subtitle: tr('أيام الحضور، وأخذ حضور الحلقة'),
          open: (ctx) => push(ctx, StudentAttendanceScreen(token: t)),
        ),
      if (ModuleAccess.canViewTeacherAttendance(t))
        ManagementEntry(
          icon: Icons.badge_rounded,
          color: AppColors.info,
          title: tr('حضور المعلمين'),
          subtitle: tr('تسجيل حضور المعلمين لكل يوم'),
          open: (ctx) => push(ctx, TeacherAttendanceScreen(token: t)),
        ),
      if (ModuleAccess.canViewMemorization(t))
        ManagementEntry(
          icon: Icons.menu_book_outlined,
          color: AppColors.primaryGlow,
          title: tr('الحفظ'),
          subtitle: tr('سجل الحفظ والمراجعة وتسجيل الصفحات'),
          open: (ctx) => push(ctx, StaffMemorizationScreen(token: t)),
        ),
      if (ModuleAccess.canViewQuranTests(t))
        ManagementEntry(
          icon: Icons.record_voice_over_rounded,
          color: AppColors.primaryGlow,
          title: tr('اختبارات القرآن'),
          subtitle: tr('الاختبارات الجزئية والنهائية لكل طالب'),
          open: (ctx) => push(
            ctx,
            StudentPickerScreen(
              token: t,
              title: tr('اختبارات القرآن'),
              onPicked: (pickerCtx, s) =>
                  _openQuranTests(pickerCtx, t, s, push),
            ),
          ),
        ),
      if (ModuleAccess.canRecordPartialTests(t) ||
          ModuleAccess.canViewQuranTests(t))
        ManagementEntry(
          icon: Icons.playlist_add_check_circle_rounded,
          color: AppColors.primary,
          title: tr('إدخال سبر'),
          subtitle: tr('تسجيل سبر الأرباع والأجزاء والطلاب'),
          open: (ctx) => push(ctx, SaberEntryScreen(token: t)),
        ),
      if (ModuleAccess.canViewAwqafTests(t))
        ManagementEntry(
          icon: Icons.fact_check_rounded,
          color: AppColors.gold,
          title: tr('اختبارات الأوقاف'),
          subtitle: tr('تسجيل اختبارات الأوقاف وعرضها'),
          open: (ctx) => push(ctx, AwqafTestsScreen(token: t)),
        ),
      if (ModuleAccess.canViewPoints(t))
        ManagementEntry(
          icon: Icons.star_rounded,
          color: AppColors.gold,
          title: tr('سجل النقاط'),
          subtitle: tr('النقاط، والنقاط اليدوية، وإلغاء القيود'),
          open: (ctx) => push(ctx, PointsLedgerScreen(token: t)),
        ),
    ]),
    ManagementSection(tr('التقييم والمناهج'), [
      if (ModuleAccess.canViewAssessments(t))
        ManagementEntry(
          icon: Icons.assignment_rounded,
          color: AppColors.warning,
          title: tr('التقييمات'),
          subtitle: tr('نتائج التقييمات وتسجيلها'),
          open: (ctx) => push(ctx, AssessmentsScreen(token: t)),
        ),
      if (ModuleAccess.canViewNotes(t))
        ManagementEntry(
          icon: Icons.sticky_note_2_outlined,
          color: AppColors.gold,
          title: tr('ملاحظات الطلاب'),
          subtitle: tr('ملاحظات الإدارة والمعلمين'),
          open: (ctx) => push(ctx, StudentNotesScreen(token: t)),
        ),
      if (ModuleAccess.canCurricula(t))
        ManagementEntry(
          icon: Icons.auto_stories_rounded,
          color: AppColors.info,
          title: tr('المناهج'),
          subtitle: tr('المواد والدروس وتقدّم الحلقات وملفات PDF'),
          open: (ctx) => push(ctx, CurriculaScreen(token: t)),
        ),
    ]),
    ManagementSection(tr('المالية'), [
      if (ModuleAccess.canViewFinance(t))
        ManagementEntry(
          icon: Icons.account_balance_wallet_rounded,
          color: AppColors.gold,
          title: tr('المالية'),
          subtitle: tr('الصناديق والسجل والتحويلات والطلبات'),
          open: (ctx) => push(ctx, FinanceScreen(token: t)),
        ),
      if (ModuleAccess.canViewActivities(t))
        ManagementEntry(
          icon: Icons.celebration_rounded,
          color: AppColors.primaryLight,
          title: tr('الأنشطة'),
          subtitle: tr('التسجيلات والمدفوعات والمصروفات'),
          open: (ctx) => push(ctx, ActivitiesScreen(token: t)),
        ),
      if (ModuleAccess.canViewInvoices(t))
        ManagementEntry(
          icon: Icons.receipt_long_rounded,
          color: AppColors.info,
          title: tr('الفواتير'),
          subtitle: tr('البنود والمدفوعات وإلغاء الدفعات'),
          open: (ctx) => push(ctx, InvoicesScreen(token: t)),
        ),
    ]),
    ManagementSection(tr('التقارير'), [
      if (ModuleAccess.canViewReports(t))
        ManagementEntry(
          icon: Icons.bar_chart_rounded,
          color: AppColors.primaryLight,
          title: tr('التقارير'),
          subtitle: tr('نظرة عامة بالفلاتر وملخص المعلمين اليومي'),
          open: (ctx) => push(ctx, ReportsScreen(token: t)),
        ),
    ]),
    ManagementSection(tr('الحساب'), [
      ManagementEntry(
        icon: Icons.person_rounded,
        color: AppColors.info,
        title: tr('حسابي'),
        subtitle: tr('البيانات الشخصية وكلمة المرور والجلسات'),
        open: (ctx) => push(ctx, const AccountScreen()),
      ),
    ]),
  ].where((s) => s.entries.isNotEmpty).toList();
}

/// الطالب المختار: يُحمَّل تقدّمه لاستخراج تسجيلاته ثم تُفتح شاشة الاختبارات.
Future<void> _openQuranTests(BuildContext context, AuthToken t,
    StudentListItem student, ManagementOpener push) async {
  try {
    final progress = await StudentFileRepositoryImpl().progress(student.id);
    if (!context.mounted) return;
    push(
      context,
      QuranTestsScreen(
        token: t,
        student: student,
        enrollments: progress.enrollments,
      ),
    );
  } catch (error) {
    if (!context.mounted) return;
    showModuleSnack(context, errorText(error), error: true);
  }
}

/// تبويب "الإدارة" — يُستخدم للحسابات التي لا تملك تبويبات أخرى.
class ManagementHubTab extends StatelessWidget {
  final AuthToken token;

  const ManagementHubTab({super.key, required this.token});

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final visible = managementSections(token, _push);
    final moduleCount = visible.fold<int>(0, (n, s) => n + s.entries.length);

    return ListView(
      padding: kAdminPagePadding,
      children: [
        AdminHero(
          icon: Icons.apps_rounded,
          title: tr('الإدارة'),
          subtitle: tr('الوحدات الإدارية حسب صلاحياتك'),
          metrics: [
            AdminHeroMetric(
              icon: Icons.apps_rounded,
              label: tr('وحدة متاحة'),
              value: '$moduleCount',
            ),
            AdminHeroMetric(
              icon: Icons.category_rounded,
              label: tr('الأقسام'),
              value: '${visible.length}',
            ),
          ],
        ),
        if (visible.isEmpty)
          AdminEmptyState(
            icon: Icons.lock_outline_rounded,
            title: tr('لا توجد وحدات إدارية متاحة لحسابك'),
          )
        else
          for (final section in visible) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 18, 4, 10),
              child: AdminSectionTitle(title: section.title),
            ),
            for (final entry in section.entries) _Tile(entry: entry),
          ],
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  final ManagementEntry entry;

  const _Tile({required this.entry});

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      accent: entry.color,
      onTap: () => entry.open(context),
      child: Row(
        children: [
          AdminIconBubble(icon: entry.icon, color: entry.color, size: 46),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.title,
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AdminTheme.text(context),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  entry.subtitle,
                  style: appTextStyle(
                      fontSize: 12, color: AdminTheme.muted(context)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            AdminTheme.chevron(context),
            color: AdminTheme.muted(context),
          ),
        ],
      ),
    );
  }
}
