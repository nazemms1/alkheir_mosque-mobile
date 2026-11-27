import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/widgets/geometric_pattern.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/brand_logo.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/admin_home_controller.dart';
import 'package:alkheir_mosque/features/shared/main/ui/providers/home_widget_registry.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

/// بيانات لوحة الإداري بعد جلبها — تُمرَّر لويدجتس [adminHomeWidgets].
class AdminHomeData {
  final String userName;
  final AuthToken token;
  final AdminStats stats;
  final List<AdminGroupItem> groups;
  final List<AdminStudentItem> students;
  const AdminHomeData({
    required this.userName,
    required this.token,
    required this.stats,
    required this.groups,
    required this.students,
  });
}

/// أي صلاحية تكفي لعرض شبكة الإحصائيات (كل بطاقة تُقيَّد بصلاحيتها داخلها).
const _statsPermissions = [
  Permissions.studentsView,
  Permissions.groupsView,
  Permissions.enrollmentsView,
  Permissions.invoicesView,
  Permissions.assessmentsView,
  Permissions.activitiesView,
];

/// ويدجتس الشاشة الرئيسية للمشرف الإداري — مرتّبة حسب ظهورها.
/// كل قسم يظهر فقط إذا كانت صلاحيته موجودة في الحساب.
/// لإضافة ويدجت جديد: أنشئ الويدجت ثم أضف HomeWidgetDef هنا فقط.
final List<HomeWidgetDef<AdminHomeData>> adminHomeWidgets = [
  // البطاقة الترحيبية
  HomeWidgetDef(
    id: 'admin-welcome',
    slivers: (context, d) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _WelcomeBanner(
            userName: d.userName,
            token: d.token,
            stats: d.stats,
          )
              .animate()
              .fadeIn(duration: 450.ms)
              .slideY(begin: -0.04, end: 0, duration: 450.ms),
        ),
      ),
    ],
  ),
  // شبكة الإحصائيات
  HomeWidgetDef(
    id: 'admin-stats',
    anyOfPermissions: _statsPermissions,
    slivers: (context, d) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _StatsGrid(stats: d.stats, token: d.token)
              .animate()
              .fadeIn(delay: 100.ms, duration: 400.ms)
              .slideY(begin: 0.05, end: 0, delay: 100.ms),
        ),
      ),
    ],
  ),
  // الحلقات النشطة
  HomeWidgetDef(
    id: 'admin-groups',
    anyOfPermissions: const [Permissions.groupsView],
    slivers: (context, d) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
        sliver: SliverToBoxAdapter(
          child: AdminSectionTitle(
            title: L10nGateway.current.activeGroups,
            icon: Icons.groups_rounded,
            color: context.appColors.primaryLight,
          ),
        ),
      ),
      if (d.groups.isEmpty)
        SliverToBoxAdapter(
          child: AdminEmptyState(
            icon: Icons.groups_outlined,
            title: L10nGateway.current.noActiveGroupsRightNow,
          ),
        )
      else
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _MiniGroupTile(group: d.groups[i])
                    .animate()
                    .fadeIn(delay: (160 + i * 45).ms, duration: 360.ms)
                    .slideX(begin: 0.04, end: 0, delay: (160 + i * 45).ms),
              ),
              childCount: d.groups.length,
            ),
          ),
        ),
    ],
  ),
  // آخر الطلاب المسجّلين
  HomeWidgetDef(
    id: 'admin-recent-students',
    anyOfPermissions: const [Permissions.studentsView],
    slivers: (context, d) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
        sliver: SliverToBoxAdapter(
          child: AdminSectionTitle(
            title: L10nGateway.current.recentlyRegisteredStudents,
            icon: Icons.school_rounded,
            color: context.appColors.gold,
          ),
        ),
      ),
      if (d.students.isEmpty)
        SliverToBoxAdapter(
          child: AdminEmptyState(
            icon: Icons.school_outlined,
            title: L10nGateway.current.noStudentsEnrolledYet,
          ),
        )
      else
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, kAdminBottomInset),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _MiniStudentTile(student: d.students[i])
                    .animate()
                    .fadeIn(delay: (300 + i * 45).ms, duration: 360.ms)
                    .slideX(begin: 0.04, end: 0, delay: (300 + i * 45).ms),
              ),
              childCount: d.students.length,
            ),
          ),
        ),
    ],
  ),
];

// ─── Home tab (overview) ──────────────────────────────────────────────────────
class AdminHomeTab extends ConsumerStatefulWidget {
  final AuthToken token;
  const AdminHomeTab({super.key, required this.token});

  @override
  ConsumerState<AdminHomeTab> createState() => _AdminHomeTabState();
}

class _AdminHomeTabState extends ConsumerState<AdminHomeTab> {
  AdminHomeControllerProvider get _provider =>
      adminHomeControllerProvider(widget.token);

  Future<void> _load() => ref.refresh(_provider.future);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);
    if (state.hasError) {
      return AdminErrorState(
        message: errorText(state.error!),
        onRetry: _load,
        retryLabel: L10nGateway.current.tryAgain,
      );
    }

    if (!state.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }
    final d = state.requireValue;
    final data = AdminHomeData(
      userName: widget.token.user?.name ?? context.l10n.manager,
      token: widget.token,
      stats: d.stats,
      groups: d.groups,
      students: d.students,
    );

    return RefreshIndicator(
      onRefresh: _load,
      color: context.appColors.primaryLight,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: buildHomeSlivers(
          context: context,
          token: widget.token,
          registry: adminHomeWidgets,
          data: data,
        ),
      ),
    );
  }
}

// ─── Welcome banner ───────────────────────────────────────────────────────────
class _WelcomeBanner extends StatelessWidget {
  final String userName;
  final AuthToken token;
  final AdminStats stats;
  const _WelcomeBanner({
    required this.userName,
    required this.token,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final greeting =
        hour < 12 ? context.l10n.goodMorning : context.l10n.goodEvening;
    final metrics = [
      if (token.hasPermission(Permissions.studentsView))
        _BannerMetric(
          icon: Icons.people_rounded,
          label: context.l10n.student2,
          value: '${stats.totalStudents}',
        ),
      if (token.hasPermission(Permissions.groupsView))
        _BannerMetric(
          icon: Icons.groups_rounded,
          label: context.l10n.activeGroup,
          value: '${stats.activeGroups}',
        ),
      if (token.hasPermission(Permissions.enrollmentsView))
        _BannerMetric(
          icon: Icons.how_to_reg_rounded,
          label: context.l10n.register,
          value: '${stats.totalEnrollments}',
        ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.bgDeep,
            Color(0xFF1A3D0A),
            context.appColors.brandMid
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: AppPalette.heroShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Pattern spans the whole banner, past the container padding.
          const Positioned(
            top: -20,
            left: -20,
            right: -20,
            bottom: -20,
            child: GeometricPattern(opacity: 0.05),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BrandLogo(size: 54, glow: false),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greeting,
                          style: appTextStyle(
                            fontSize: FontSize.caption,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(
                            fontSize: FontSize.headlineSmall,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          context.l10n.adminDashboard,
                          style: appTextStyle(
                            fontSize: FontSize.caption,
                            color: context.appColors.goldLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (metrics.isNotEmpty) ...[
                const SizedBox(height: 18),
                Row(
                  children: [
                    for (var i = 0; i < metrics.length; i++) ...[
                      if (i > 0) const SizedBox(width: 8),
                      Expanded(child: metrics[i]),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// مقياس داخل ترويسة لوحة التحكم.
class _BannerMetric extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _BannerMetric({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: context.appColors.goldLight, size: 18),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: appTextStyle(
                fontSize: FontSize.headlineSmall,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTextStyle(
              fontSize: FontSize.caption,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Stats grid ───────────────────────────────────────────────────────────────
/// بطاقات الإحصائيات. كل بطاقة تظهر فقط إذا كانت صلاحية مصدرها في الحساب.
class _StatsGrid extends StatelessWidget {
  final AdminStats stats;
  final AuthToken token;
  const _StatsGrid({required this.stats, required this.token});

  @override
  Widget build(BuildContext context) {
    return AdminStatGrid(
      tiles: [
        if (token.hasPermission(Permissions.studentsView))
          AdminStatTile(
            icon: Icons.people_rounded,
            label: context.l10n.totalStudents,
            value: '${stats.totalStudents}',
            color: context.appColors.info,
          ),
        if (token.hasPermission(Permissions.groupsView))
          AdminStatTile(
            icon: Icons.groups_rounded,
            label: context.l10n.activeGroups2,
            value: '${stats.activeGroups}',
            color: context.appColors.success,
          ),
        if (token.hasPermission(Permissions.enrollmentsView))
          AdminStatTile(
            icon: Icons.how_to_reg_rounded,
            label: context.l10n.registrations,
            value: '${stats.totalEnrollments}',
            color: context.appColors.primaryLight,
          ),
        if (token.hasPermission(Permissions.invoicesView))
          AdminStatTile(
            icon: Icons.receipt_long_rounded,
            label: context.l10n.invoices,
            value: '${stats.totalInvoices}',
            color: context.appColors.warning,
          ),
        if (token.hasPermission(Permissions.assessmentsView))
          AdminStatTile(
            icon: Icons.assignment_rounded,
            label: context.l10n.assessments,
            value: '${stats.totalAssessments}',
            color: context.appColors.gold,
          ),
        if (token.hasPermission(Permissions.activitiesView))
          AdminStatTile(
            icon: Icons.event_rounded,
            label: context.l10n.activities,
            value: '${stats.totalActivities}',
            color: context.appColors.error,
          ),
      ],
    );
  }
}

// ─── Mini group tile (home tab) ───────────────────────────────────────────────
class _MiniGroupTile extends StatelessWidget {
  final AdminGroupItem group;
  const _MiniGroupTile({required this.group});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          AdminIconBubble(
            icon: Icons.groups_rounded,
            color: context.appColors.primaryLight,
            size: 44,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: appTextStyle(
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w700,
                    color: AdminTheme.text(context),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  group.teacher.isEmpty ? group.course : group.teacher,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: appTextStyle(
                    fontSize: FontSize.caption,
                    color: AdminTheme.muted(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AdminBadge(
            label: context.l10n.students3(group.enrollmentsCount),
            color: context.appColors.primaryLight,
          ),
        ],
      ),
    );
  }
}

// ─── Mini student tile (home tab) ─────────────────────────────────────────────
class _MiniStudentTile extends StatelessWidget {
  final AdminStudentItem student;
  const _MiniStudentTile({required this.student});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          AdminAvatar(text: student.initials, color: context.appColors.gold),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.fullName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: appTextStyle(
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w700,
                    color: AdminTheme.text(context),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${student.gradeLevel} · ${student.studentNumber}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: appTextStyle(
                    fontSize: FontSize.caption,
                    color: AdminTheme.muted(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AdminBadge(
            label: context.l10n.juz2(student.currentJuz),
            color: context.appColors.gold,
          ),
        ],
      ),
    );
  }
}
