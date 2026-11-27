import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/shared/students/ui/providers/student_file_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:alkheir_mosque/ui/themes/app_color.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

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
typedef ManagementOpener = void Function(BuildContext context, String route,
    {Object? extra});

/// الأقسام الإدارية المتاحة لحساب الدخول — كل وحدة تظهر فقط إذا وُجدت صلاحيتها.
List<ManagementSection> managementSections(
    AppColors c, AuthToken t, ManagementOpener push) {
  return [
    ManagementSection(L10nGateway.current.studentsAndGroups, [
      if (ModuleAccess.canViewGroups(t))
        ManagementEntry(
          icon: Icons.calendar_view_week_rounded,
          color: c.warning,
          title: L10nGateway.current.groupSchedules,
          subtitle: L10nGateway.current.sessionsAndTimesForEach,
          open: (ctx) => push(ctx, AppRoutes.groupPickerRoute, extra: t),
        ),
      if (ModuleAccess.canViewEnrollments(t))
        ManagementEntry(
          icon: Icons.how_to_reg_rounded,
          color: c.info,
          title: L10nGateway.current.registrations,
          subtitle: L10nGateway.current.enrollStudentsInGroupsAnd,
          open: (ctx) => push(ctx, AppRoutes.enrollmentsRoute, extra: (
            token: t,
            studentId: null,
            studentName: null,
            groupId: null,
            groupName: null
          )),
        ),
      if (ModuleAccess.canViewCourses(t))
        ManagementEntry(
          icon: Icons.menu_book_rounded,
          color: c.brandPrimary,
          title: L10nGateway.current.courses,
          subtitle: L10nGateway.current.createFinishAndReactivateCourses,
          open: (ctx) => push(ctx, AppRoutes.coursesRoute, extra: t),
        ),
      if (ModuleAccess.canViewParents(t))
        ManagementEntry(
          icon: Icons.family_restroom_rounded,
          color: c.info,
          title: L10nGateway.current.parents,
          subtitle: L10nGateway.current.parentFilesAndAccounts,
          open: (ctx) => push(ctx, AppRoutes.parentsRoute, extra: t),
        ),
      if (ModuleAccess.canViewTeachers(t))
        ManagementEntry(
          icon: Icons.school_rounded,
          color: c.primaryLight,
          title: L10nGateway.current.teachers,
          subtitle: L10nGateway.current.teacherFilesAccountsAndCourses,
          open: (ctx) => push(ctx, AppRoutes.teachersRoute, extra: t),
        ),
    ]),
    ManagementSection(L10nGateway.current.attendanceAndMemorization, [
      if (ModuleAccess.canViewStudentAttendance(t))
        ManagementEntry(
          icon: Icons.event_available_rounded,
          color: c.success,
          title: L10nGateway.current.studentAttendance,
          subtitle: L10nGateway.current.attendanceDaysAndTakingA,
          open: (ctx) => push(ctx, AppRoutes.studentAttendanceRoute, extra: t),
        ),
      if (ModuleAccess.canViewTeacherAttendance(t))
        ManagementEntry(
          icon: Icons.badge_rounded,
          color: c.info,
          title: L10nGateway.current.teacherAttendance,
          subtitle: L10nGateway.current.recordTeacherAttendanceForEach,
          open: (ctx) => push(ctx, AppRoutes.teacherAttendanceRoute, extra: t),
        ),
      if (ModuleAccess.canViewMemorization(t))
        ManagementEntry(
          icon: Icons.menu_book_outlined,
          color: c.primaryGlow,
          title: L10nGateway.current.memorization,
          subtitle: L10nGateway.current.memorizationAndReviewLogAnd,
          open: (ctx) => push(ctx, AppRoutes.staffMemorizationRoute, extra: t),
        ),
      if (ModuleAccess.canViewQuranTests(t))
        ManagementEntry(
          icon: Icons.record_voice_over_rounded,
          color: c.primaryGlow,
          title: L10nGateway.current.quranTests,
          subtitle: L10nGateway.current.partialAndFinalQuranTests,
          open: (ctx) => push(
            ctx,
            AppRoutes.studentPickerRoute,
            extra: (
              token: t,
              title: L10nGateway.current.quranTests,
              onPicked: (BuildContext pickerCtx, StudentListItem s) =>
                  _openQuranTests(pickerCtx, t, s, push),
            ),
          ),
        ),
      if (ModuleAccess.canRecordPartialTests(t) ||
          ModuleAccess.canViewQuranTests(t))
        ManagementEntry(
          icon: Icons.playlist_add_check_circle_rounded,
          color: c.brandPrimary,
          title: L10nGateway.current.testEntry,
          subtitle: L10nGateway.current.testEntrySubtitle,
          open: (ctx) => push(ctx, AppRoutes.saberEntryRoute,
              extra: (token: t, initialStudent: null)),
        ),
      if (ModuleAccess.canViewAwqafTests(t))
        ManagementEntry(
          icon: Icons.fact_check_rounded,
          color: c.gold,
          title: L10nGateway.current.awqafTests,
          subtitle: L10nGateway.current.recordAndViewAwqafTests,
          open: (ctx) => push(ctx, AppRoutes.awqafTestsRoute, extra: t),
        ),
      if (ModuleAccess.canViewPoints(t))
        ManagementEntry(
          icon: Icons.star_rounded,
          color: c.gold,
          title: L10nGateway.current.pointsLog,
          subtitle: L10nGateway.current.pointsManualPointsAndVoiding,
          open: (ctx) => push(ctx, AppRoutes.pointsLedgerRoute, extra: t),
        ),
    ]),
    ManagementSection(L10nGateway.current.assessmentsAndCurricula, [
      if (ModuleAccess.canViewAssessments(t))
        ManagementEntry(
          icon: Icons.assignment_rounded,
          color: c.warning,
          title: L10nGateway.current.assessments,
          subtitle: L10nGateway.current.assessmentResultsAndRecordingThem,
          open: (ctx) => push(ctx, AppRoutes.assessmentsRoute, extra: t),
        ),
      if (ModuleAccess.canViewNotes(t))
        ManagementEntry(
          icon: Icons.sticky_note_2_outlined,
          color: c.gold,
          title: L10nGateway.current.studentNotes,
          subtitle: L10nGateway.current.managementAndTeacherNotes,
          open: (ctx) => push(ctx, AppRoutes.studentNotesRoute,
              extra: (token: t, studentId: null, studentName: null)),
        ),
      if (ModuleAccess.canCurricula(t))
        ManagementEntry(
          icon: Icons.auto_stories_rounded,
          color: c.info,
          title: L10nGateway.current.curricula,
          subtitle: L10nGateway.current.subjectsLessonsGroupProgressAnd,
          open: (ctx) => push(ctx, AppRoutes.curriculaRoute, extra: t),
        ),
    ]),
    ManagementSection(L10nGateway.current.finance, [
      if (ModuleAccess.canViewFinance(t))
        ManagementEntry(
          icon: Icons.account_balance_wallet_rounded,
          color: c.gold,
          title: L10nGateway.current.finance,
          subtitle: L10nGateway.current.cashBoxesLedgerTransfersAnd,
          open: (ctx) => push(ctx, AppRoutes.financeRoute, extra: t),
        ),
      if (ModuleAccess.canViewActivities(t))
        ManagementEntry(
          icon: Icons.celebration_rounded,
          color: c.primaryLight,
          title: L10nGateway.current.activities,
          subtitle: L10nGateway.current.enrollmentsPaymentsAndExpenses,
          open: (ctx) => push(ctx, AppRoutes.adminActivitiesRoute, extra: t),
        ),
      if (ModuleAccess.canViewInvoices(t))
        ManagementEntry(
          icon: Icons.receipt_long_rounded,
          color: c.info,
          title: L10nGateway.current.invoices,
          subtitle: L10nGateway.current.itemsPaymentsAndPaymentVoiding,
          open: (ctx) => push(ctx, AppRoutes.invoicesRoute, extra: t),
        ),
    ]),
    ManagementSection(L10nGateway.current.reports, [
      if (ModuleAccess.canViewReports(t))
        ManagementEntry(
          icon: Icons.bar_chart_rounded,
          color: c.primaryLight,
          title: L10nGateway.current.reports,
          subtitle: L10nGateway.current.overviewWithFiltersAndDaily,
          open: (ctx) => push(ctx, AppRoutes.reportsRoute, extra: t),
        ),
    ]),
    ManagementSection(L10nGateway.current.account, [
      ManagementEntry(
        icon: Icons.person_rounded,
        color: c.info,
        title: L10nGateway.current.myAccount,
        subtitle: L10nGateway.current.personalDetailsPasswordAndSessions,
        open: (ctx) => push(ctx, AppRoutes.accountRoute),
      ),
    ]),
  ].where((s) => s.entries.isNotEmpty).toList();
}

/// الطالب المختار: يُحمَّل تقدّمه لاستخراج تسجيلاته ثم تُفتح شاشة الاختبارات.
Future<void> _openQuranTests(BuildContext context, AuthToken t,
    StudentListItem student, ManagementOpener push) async {
  try {
    final progress = await ProviderScope.containerOf(context, listen: false)
        .read(studentFileActionsControllerProvider.notifier)
        .query((r) => r.progress(student.id));
    if (!context.mounted) return;
    push(context, AppRoutes.quranTestsRoute,
        extra: (token: t, student: student, enrollments: progress.enrollments));
  } catch (error) {
    if (!context.mounted) return;
    showModuleSnack(context, errorText(error), error: true);
  }
}

/// تبويب "الإدارة" — يُستخدم للحسابات التي لا تملك تبويبات أخرى.
class ManagementHubTab extends StatelessWidget {
  final AuthToken token;

  const ManagementHubTab({super.key, required this.token});

  void _push(BuildContext context, String route, {Object? extra}) {
    context.push(route, extra: extra);
  }

  @override
  Widget build(BuildContext context) {
    final visible = managementSections(context.appColors, token, _push);
    final moduleCount = visible.fold<int>(0, (n, s) => n + s.entries.length);

    return ListView(
      padding: kAdminPagePadding,
      children: [
        AdminHero(
          icon: Icons.apps_rounded,
          title: context.l10n.management,
          subtitle: context.l10n.managementModulesBasedOnYour,
          metrics: [
            AdminHeroMetric(
              icon: Icons.apps_rounded,
              label: context.l10n.modulesAvailable,
              value: '$moduleCount',
            ),
            AdminHeroMetric(
              icon: Icons.category_rounded,
              label: context.l10n.sections,
              value: '${visible.length}',
            ),
          ],
        ),
        if (visible.isEmpty)
          AdminEmptyState(
            icon: Icons.lock_outline_rounded,
            title: context.l10n.noManagementModulesAreAvailable,
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
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w800,
                    color: AdminTheme.text(context),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  entry.subtitle,
                  style: appTextStyle(
                      fontSize: FontSize.caption,
                      color: AdminTheme.muted(context)),
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
