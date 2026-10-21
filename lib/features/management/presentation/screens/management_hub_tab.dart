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
import 'package:alkheir_mosque/features/students/presentation/screens/student_picker_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import '../widgets/module_widgets.dart';
import 'courses_screen.dart';
import 'enrollments_screen.dart';
import 'group_schedules_screen.dart';
import 'parents_screen.dart';
import 'teachers_screen.dart';

/// تبويب "الإدارة": مؤشرات اليوم، ثم وحدات مجمّعة. كل وحدة تظهر فقط إذا وُجدت
/// صلاحيتها في تسجيل الدخول — لا يُقرأ اسم الدور هنا.
class ManagementHubTab extends StatefulWidget {
  final AuthToken token;

  const ManagementHubTab({super.key, required this.token});

  @override
  State<ManagementHubTab> createState() => _ManagementHubTabState();
}

class _ManagementHubTabState extends State<ManagementHubTab> {
  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  /// الطالب المختار: يُحمَّل تقدّمه لاستخراج تسجيلاته ثم تُفتح شاشة الاختبارات.
  Future<void> _openQuranTests(
      BuildContext context, StudentListItem student) async {
    try {
      final progress = await StudentFileRepositoryImpl().progress(student.id);
      if (!context.mounted) return;
      _push(
        context,
        QuranTestsScreen(
          token: widget.token,
          student: student,
          enrollments: progress.enrollments,
        ),
      );
    } catch (error) {
      if (!context.mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final sections = <_Section>[
      _Section(tr('الطلاب والحلقات'), [
        // if (ModuleAccess.canViewStudents(t))
        //   _Tile(
        //     Icons.groups_rounded,
        //     AppColors.primaryLight,
        //     tr('الطلاب'),
        //     tr('بحث وإضافة وتعديل، والوصول لملف الطالب'),
        //     () => _push(context, StudentsDirectoryScreen(token: t)),
        //   ),
        // if (ModuleAccess.canViewGroups(t))
        //   _Tile(
        //     Icons.class_rounded,
        //     AppColors.primary,
        //     tr('الحلقات'),
        //     tr('إنشاء الحلقات وتعديلها'),
        //     () => _push(context, AdminGroupsScreen(token: t)),
        //   ),
        if (ModuleAccess.canViewGroups(t))
          _Tile(
            Icons.calendar_view_week_rounded,
            AppColors.warning,
            tr('جداول الحلقات'),
            tr('حصص كل حلقة وأوقاتها'),
            () => _push(context, GroupPickerScreen(token: t)),
          ),
        if (ModuleAccess.canViewEnrollments(t))
          _Tile(
            Icons.how_to_reg_rounded,
            AppColors.info,
            tr('التسجيلات'),
            tr('تسجيل الطلاب في الحلقات وإنهاؤها'),
            () => _push(context, EnrollmentsScreen(token: t)),
          ),
        if (ModuleAccess.canViewCourses(t))
          _Tile(
            Icons.menu_book_rounded,
            AppColors.primary,
            tr('الكورسات'),
            tr('إنشاء الكورسات وإنهاؤها وإعادة تفعيلها'),
            () => _push(context, CoursesScreen(token: t)),
          ),
        if (ModuleAccess.canViewParents(t))
          _Tile(
            Icons.family_restroom_rounded,
            AppColors.info,
            tr('الأولياء'),
            tr('ملفات أولياء الأمور وحساباتهم'),
            () => _push(context, ParentsScreen(token: t)),
          ),
        if (ModuleAccess.canViewTeachers(t))
          _Tile(
            Icons.school_rounded,
            AppColors.primaryLight,
            tr('المعلمون'),
            tr('ملفات المعلمين وحساباتهم وكورساتهم'),
            () => _push(context, TeachersScreen(token: t)),
          ),
      ]),
      _Section(tr('الحضور والحفظ'), [
        if (ModuleAccess.canViewStudentAttendance(t))
          _Tile(
            Icons.event_available_rounded,
            AppColors.success,
            tr('حضور الطلاب'),
            tr('أيام الحضور، وأخذ حضور الحلقة'),
            () => _push(context, StudentAttendanceScreen(token: t)),
          ),
        if (ModuleAccess.canViewTeacherAttendance(t))
          _Tile(
            Icons.badge_rounded,
            AppColors.info,
            tr('حضور المعلمين'),
            tr('تسجيل حضور المعلمين لكل يوم'),
            () => _push(context, TeacherAttendanceScreen(token: t)),
          ),
        if (ModuleAccess.canViewMemorization(t))
          _Tile(
            Icons.menu_book_outlined,
            AppColors.primaryGlow,
            tr('الحفظ'),
            tr('سجل الحفظ والمراجعة وتسجيل الصفحات'),
            () => _push(context, StaffMemorizationScreen(token: t)),
          ),
        if (ModuleAccess.canViewQuranTests(t))
          _Tile(
            Icons.record_voice_over_rounded,
            AppColors.primaryGlow,
            tr('اختبارات القرآن'),
            tr('الاختبارات الجزئية والنهائية لكل طالب'),
            () => _push(
              context,
              StudentPickerScreen(
                token: t,
                title: tr('اختبارات القرآن'),
                onPicked: (ctx, s) => _openQuranTests(ctx, s),
              ),
            ),
          ),
        if (ModuleAccess.canViewAwqafTests(t))
          _Tile(
            Icons.fact_check_rounded,
            AppColors.gold,
            tr('اختبارات الأوقاف'),
            tr('تسجيل اختبارات الأوقاف وعرضها'),
            () => _push(context, AwqafTestsScreen(token: t)),
          ),
        if (ModuleAccess.canViewPoints(t))
          _Tile(
            Icons.star_rounded,
            AppColors.gold,
            tr('سجل النقاط'),
            tr('النقاط، والنقاط اليدوية، وإلغاء القيود'),
            () => _push(context, PointsLedgerScreen(token: t)),
          ),
      ]),
      _Section(tr('التقييم والمناهج'), [
        if (ModuleAccess.canViewAssessments(t))
          _Tile(
            Icons.assignment_rounded,
            AppColors.warning,
            tr('التقييمات'),
            tr('نتائج التقييمات وتسجيلها'),
            () => _push(context, AssessmentsScreen(token: t)),
          ),
        if (ModuleAccess.canViewNotes(t))
          _Tile(
            Icons.sticky_note_2_outlined,
            AppColors.gold,
            tr('ملاحظات الطلاب'),
            tr('ملاحظات الإدارة والمعلمين'),
            () => _push(context, StudentNotesScreen(token: t)),
          ),
        if (ModuleAccess.canCurricula(t))
          _Tile(
            Icons.auto_stories_rounded,
            AppColors.info,
            tr('المناهج'),
            tr('المواد والدروس وتقدّم الحلقات وملفات PDF'),
            () => _push(context, CurriculaScreen(token: t)),
          ),
      ]),
      _Section(tr('المالية'), [
        if (ModuleAccess.canViewFinance(t))
          _Tile(
            Icons.account_balance_wallet_rounded,
            AppColors.gold,
            tr('المالية'),
            tr('الصناديق والسجل والتحويلات والطلبات'),
            () => _push(context, FinanceScreen(token: t)),
          ),
        if (ModuleAccess.canViewActivities(t))
          _Tile(
            Icons.celebration_rounded,
            AppColors.primaryLight,
            tr('الأنشطة'),
            tr('التسجيلات والمدفوعات والمصروفات'),
            () => _push(context, ActivitiesScreen(token: t)),
          ),
        if (ModuleAccess.canViewInvoices(t))
          _Tile(
            Icons.receipt_long_rounded,
            AppColors.info,
            tr('الفواتير'),
            tr('البنود والمدفوعات وإلغاء الدفعات'),
            () => _push(context, InvoicesScreen(token: t)),
          ),
      ]),
      _Section(tr('التقارير'), [
        if (ModuleAccess.canViewReports(t))
          _Tile(
            Icons.bar_chart_rounded,
            AppColors.primaryLight,
            tr('التقارير'),
            tr('نظرة عامة بالفلاتر وملخص المعلمين اليومي'),
            () => _push(context, ReportsScreen(token: t)),
          ),
      ]),
      _Section(tr('الحساب'), [
        _Tile(
          Icons.person_rounded,
          AppColors.info,
          tr('حسابي'),
          tr('البيانات الشخصية وكلمة المرور والجلسات'),
          () => _push(context, const AccountScreen()),
        ),
      ]),
    ];

    final visible = [
      for (final s in sections)
        if (s.tiles.isNotEmpty) s,
    ];

    final moduleCount = visible.fold<int>(0, (n, s) => n + s.tiles.length);

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
            ...section.tiles,
          ],
      ],
    );
  }
}

class _Section {
  final String title;
  final List<Widget> tiles;

  const _Section(this.title, this.tiles);
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _Tile(this.icon, this.color, this.title, this.subtitle, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      accent: color,
      onTap: onTap,
      child: Row(
        children: [
          AdminIconBubble(icon: icon, color: color, size: 46),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AdminTheme.text(context),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style:
                      appTextStyle(fontSize: 12, color: AdminTheme.muted(context)),
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
