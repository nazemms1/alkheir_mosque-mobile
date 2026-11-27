import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/admin_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/widgets/geometric_pattern.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/ui/widgets/toast/app_toast.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';
import 'package:alkheir_mosque/features/shared/attendance/ui/pages/take_attendance_screen.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/features/shared/main/ui/providers/home_widget_registry.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';

/// بيانات لوحة الدور الإشرافي بعد جلبها — تُمرَّر لويدجتس [supervisorHomeWidgets].
class SupervisorHomeData {
  final String userName;
  final String roleLabel;
  final AuthToken token;
  final AdminStats stats;
  final List<AdminGroupItem> groups;
  final List<AdminStudentItem> students;
  const SupervisorHomeData({
    required this.userName,
    required this.roleLabel,
    required this.token,
    required this.stats,
    required this.groups,
    required this.students,
  });
}

/// ويدجتس الشاشة الرئيسية للأدوار الإشرافية — مرتّبة حسب ظهورها.
/// لإضافة ويدجت جديد: أنشئ الويدجت ثم أضف HomeWidgetDef هنا فقط.
final List<HomeWidgetDef<SupervisorHomeData>> supervisorHomeWidgets = [
  // البطاقة الترحيبية
  HomeWidgetDef(
    id: 'sup-welcome',
    slivers: (context, d) => [
      SliverToBoxAdapter(
        child: _SupervisorWelcomeBanner(
          userName: d.userName,
          roleLabel: d.roleLabel,
          stats: d.stats,
          token: d.token,
        )
            .animate()
            .fadeIn(duration: 450.ms)
            .slideY(begin: -0.04, end: 0, duration: 450.ms),
      ),
    ],
  ),
  // شبكة الإحصائيات
  HomeWidgetDef(
    id: 'sup-stats',
    anyOfPermissions: const [
      Permissions.studentsView,
      Permissions.groupsView,
      Permissions.enrollmentsView,
      Permissions.assessmentsView,
      Permissions.activitiesView,
      Permissions.invoicesView,
    ],
    slivers: (context, d) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _SupervisorStatsGrid(stats: d.stats, token: d.token)
              .animate()
              .fadeIn(delay: 100.ms, duration: 400.ms)
              .slideY(begin: 0.05, end: 0, delay: 100.ms),
        ),
      ),
    ],
  ),
  // الحلقات — يظهر فقط عند وجود حلقات
  HomeWidgetDef(
    id: 'sup-groups',
    visibleWhen: (_, d) => d.groups.isNotEmpty,
    slivers: (context, d) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _SectionHeader(
              title: L10nGateway.current.groups,
              icon: Icons.groups_rounded,
              color: context.appColors.primaryLight),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => _MiniGroupTile(group: d.groups[i])
                .animate()
                .fadeIn(delay: (160 + i * 45).ms, duration: 360.ms)
                .slideX(begin: 0.04, end: 0, delay: (160 + i * 45).ms),
            childCount: d.groups.length,
          ),
        ),
      ),
    ],
  ),
  // آخر الطلاب — يظهر فقط عند وجود طلاب، وإلا مسافة سفلية فقط
  HomeWidgetDef(
    id: 'sup-recent-students',
    slivers: (context, d) => d.students.isNotEmpty
        ? [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
              sliver: SliverToBoxAdapter(
                child: _SectionHeader(
                    title: L10nGateway.current.recentStudents,
                    icon: Icons.school_rounded,
                    color: context.appColors.gold),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) => _MiniStudentTile(student: d.students[i])
                      .animate()
                      .fadeIn(delay: (300 + i * 45).ms, duration: 360.ms)
                      .slideX(begin: 0.04, end: 0, delay: (300 + i * 45).ms),
                  childCount: d.students.length,
                ),
              ),
            ),
          ]
        : [const SliverPadding(padding: EdgeInsets.only(bottom: 120))],
  ),
];

// ─── Home tab (overview dashboard) ─────────────────────────────────────────────
class SupervisorHomeTab extends ConsumerStatefulWidget {
  final AuthToken token;
  const SupervisorHomeTab({super.key, required this.token});

  @override
  ConsumerState<SupervisorHomeTab> createState() => _SupervisorHomeTabState();
}

class _SupervisorHomeTabState extends ConsumerState<SupervisorHomeTab> {
  late final _service = ref.read(adminActionsControllerProvider.notifier);

  late final _loadProvider = screenDataProvider(() async {
    // كل قائمة تُطلب فقط إذا كانت صلاحيتها في الحساب.
    final token = widget.token;
    final groupsFuture = token.hasPermission(Permissions.groupsView)
        ? _service
            .query((r) => r.fetchGroups(perPage: 6, isActive: true))
            .then((p) => p.items)
        : Future.value(const <AdminGroupItem>[]);
    final studentsFuture = token.hasPermission(Permissions.studentsView)
        ? _service
            .query((r) => r.fetchStudents(perPage: 6, status: 'active'))
            .then((p) => p.items)
        : Future.value(const <AdminStudentItem>[]);
    final stats = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchSupervisorStats(token));
    final groups = await groupsFuture;
    final students = await studentsFuture;
    return (stats: stats, groups: groups, students: students);
  });
  AdminStats? get _stats => ref.watch(_loadProvider).valueOrNull?.stats;
  List<AdminGroupItem> get _groups =>
      ref.watch(_loadProvider).valueOrNull?.groups ?? const [];
  List<AdminStudentItem> get _students =>
      ref.watch(_loadProvider).valueOrNull?.students ?? const [];
  bool get _loading => ref.watch(_loadProvider).isLoading;
  String? get _error {
    final e = ref.watch(_loadProvider).error;
    return e == null ? null : errorText(e);
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }

    final data = SupervisorHomeData(
      userName: widget.token.user?.name ?? context.l10n.supervisor,
      roleLabel: widget.token.displayRole,
      token: widget.token,
      stats: _stats!,
      groups: _groups,
      students: _students,
    );

    return RefreshIndicator(
      onRefresh: _load,
      color: context.appColors.primaryLight,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: buildHomeSlivers(
          context: context,
          token: widget.token,
          registry: supervisorHomeWidgets,
          data: data,
        ),
      ),
    );
  }
}

// ─── Welcome banner ───────────────────────────────────────────────────────────
class _SupervisorWelcomeBanner extends StatelessWidget {
  final String userName;
  final String roleLabel;
  final AdminStats stats;
  final AuthToken token;
  const _SupervisorWelcomeBanner({
    required this.userName,
    required this.roleLabel,
    required this.stats,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    final pills = [
      if (token.hasPermission(Permissions.studentsView))
        _HeroPill(
            label: context.l10n.student2,
            value: '${stats.totalStudents}',
            icon: Icons.people_rounded),
      if (token.hasPermission(Permissions.groupsView))
        _HeroPill(
            label: context.l10n.activeGroup,
            value: '${stats.activeGroups}',
            icon: Icons.groups_rounded),
      if (token.hasPermission(Permissions.enrollmentsView))
        _HeroPill(
            label: context.l10n.register,
            value: '${stats.totalEnrollments}',
            icon: Icons.how_to_reg_rounded),
      if (!token.hasPermission(Permissions.studentsView) &&
          token.hasPermission(Permissions.assessmentsView))
        _HeroPill(
            label: context.l10n.evaluation,
            value: '${stats.totalAssessments}',
            icon: Icons.assignment_rounded),
      if (!token.hasPermission(Permissions.enrollmentsView) &&
          token.hasPermission(Permissions.activitiesView))
        _HeroPill(
            label: context.l10n.activity,
            value: '${stats.totalActivities}',
            icon: Icons.event_rounded),
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceDeepGreen,
            context.appColors.brandDeep,
            context.appColors.brandGreen
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
              color: context.appColors.brandPrimary.withValues(alpha: 0.4),
              blurRadius: 28,
              offset: const Offset(0, 10)),
        ],
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: GeometricPattern(opacity: 0.05)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: context.appColors.gradientGold,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  context.appColors.gold.withValues(alpha: 0.4),
                              blurRadius: 14,
                              spreadRadius: 1)
                        ],
                      ),
                      child: const Icon(Icons.shield_rounded,
                          color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.welcome3(userName),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: FontSize.title,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Dubai'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.25)),
                            ),
                            child: Text(roleLabel,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSize.caption,
                                    fontFamily: 'Dubai')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (pills.isNotEmpty) ...[
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      for (var i = 0; i < pills.length; i++) ...[
                        if (i > 0) const SizedBox(width: 8),
                        pills[i],
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroPill extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const _HeroPill(
      {required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
        ),
        child: Column(
          children: [
            Icon(icon, color: context.appColors.goldLight, size: 18),
            const SizedBox(height: 4),
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.title,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai')),
            Text(label,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.65),
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai')),
          ],
        ),
      ),
    );
  }
}

// ─── Stats grid ───────────────────────────────────────────────────────────────
class _SupervisorStatsGrid extends StatelessWidget {
  final AdminStats stats;
  final AuthToken token;
  const _SupervisorStatsGrid({required this.stats, required this.token});

  @override
  Widget build(BuildContext context) {
    final tiles = <Widget>[
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
    ];

    if (tiles.isEmpty) {
      return const SizedBox.shrink();
    }

    return AdminStatGrid(tiles: tiles);
  }
}

// ─── Section header ───────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const _SectionHeader(
      {required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) =>
      AdminSectionTitle(title: title, icon: icon, color: color);
}

// ─── Mini group tile (home tab) ───────────────────────────────────────────────
class _MiniGroupTile extends StatelessWidget {
  final AdminGroupItem group;
  const _MiniGroupTile({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: context.appColors.primaryLight.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
              color: context.appColors.brandPrimary.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                gradient: context.appColors.gradientPrimary,
                borderRadius: BorderRadius.circular(12)),
            child:
                const Icon(Icons.groups_rounded, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(group.name,
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.label,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(group.teacher.isEmpty ? group.course : group.teacher,
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.caption,
                        color: context.appColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: context.appColors.primaryLight.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Text(context.l10n.students3(group.enrollmentsCount),
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w700,
                    color: context.appColors.primaryLight)),
          ),
        ],
      ),
    );
  }
}

// ─── Mini student tile (home tab) ────────────────────────────────────────────
class _MiniStudentTile extends StatelessWidget {
  final AdminStudentItem student;
  const _MiniStudentTile({required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: context.appColors.gold.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
              color: context.appColors.gold.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                gradient: context.appColors.gradientGold,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(student.initials,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.label,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Dubai')),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.fullName,
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.label,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text('${student.gradeLevel} · ${student.studentNumber}',
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.caption,
                        color: context.appColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: context.appColors.gold.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Text(context.l10n.juz2(student.currentJuz),
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w700,
                    color: context.appColors.goldText)),
          ),
        ],
      ),
    );
  }
}

// ─── Students Progress Tab ────────────────────────────────────────────────────
class StudentsProgressTab extends ConsumerStatefulWidget {
  final AuthToken token;
  const StudentsProgressTab({super.key, required this.token});

  @override
  ConsumerState<StudentsProgressTab> createState() =>
      StudentsProgressTabState();
}

class StudentsProgressTabState extends ConsumerState<StudentsProgressTab> {
  late final _loadProvider = screenDataProvider(() async {
    // قائمة الحلقات للتصفية تُطلب فقط إذا كانت صلاحيتها في الحساب.
    final token = widget.token;
    final groupsFuture = token.hasPermission(Permissions.groupsView)
        ? ref
            .read(adminActionsControllerProvider.notifier)
            .query((r) => r.fetchGroups(perPage: 100))
            .then((p) => p.items)
        : Future.value(const <AdminGroupItem>[]);
    final students = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchStudents(
            perPage: 50, groupId: _selectedGroupId, status: 'active'));
    final groups = await groupsFuture;
    return (students: students.items, groups: groups);
  });
  List<AdminStudentItem> get _students =>
      ref.watch(_loadProvider).valueOrNull?.students ?? const [];
  List<AdminGroupItem> get _groups =>
      ref.watch(_loadProvider).valueOrNull?.groups ?? const [];
  bool get _loading => ref.watch(_loadProvider).isLoading;
  String? get _error {
    final e = ref.watch(_loadProvider).error;
    return e == null ? null : errorText(e);
  }

  int? _selectedGroupId;

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  void _onGroupSelected(int? groupId) {
    setState(() => _selectedGroupId = groupId);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    return Column(
      children: [
        if (_groups.isNotEmpty)
          _GroupFilterBar(
            groups: _groups,
            selectedGroupId: _selectedGroupId,
            onSelected: _onGroupSelected,
          ),
        Expanded(
          child: _students.isEmpty
              ? _EmptyState(
                  icon: Icons.people_outline_rounded,
                  message: context.l10n.noStudentsInThisGroup,
                )
              : RefreshIndicator(
                  onRefresh: _load,
                  color: context.appColors.primaryLight,
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
                    itemCount: _students.length,
                    itemBuilder: (_, i) {
                      final s = _students[i];
                      return _StudentProgressCard(
                        student: s,
                        onTap: () => context.push(
                            AppRoutes.supervisorStudentDetailRoute,
                            extra: (
                              studentId: s.id,
                              studentName: s.fullName,
                              token: widget.token
                            )),
                      )
                          .animate()
                          .fadeIn(delay: (i * 40).ms, duration: 350.ms)
                          .slideY(begin: 0.05, end: 0, delay: (i * 40).ms);
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

// ─── Group filter bar — لفلترة قائمة الطلاب حسب الحلقة ────────────────────────
class _GroupFilterBar extends StatelessWidget {
  final List<AdminGroupItem> groups;
  final int? selectedGroupId;
  final void Function(int?) onSelected;

  const _GroupFilterBar({
    required this.groups,
    required this.selectedGroupId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        children: [
          _GroupChip(
            label: context.l10n.all,
            isSelected: selectedGroupId == null,
            onTap: () => onSelected(null),
          ),
          const SizedBox(width: 8),
          for (final g in groups) ...[
            _GroupChip(
              label: g.name,
              isSelected: selectedGroupId == g.id,
              onTap: () => onSelected(g.id),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _GroupChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _GroupChip(
      {required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected ? context.appColors.gradientPrimary : null,
          color: isSelected ? null : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Theme.of(context).dividerColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Dubai',
            fontSize: FontSize.caption,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.white : context.appColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _StudentProgressCard extends StatelessWidget {
  final AdminStudentItem student;
  final VoidCallback? onTap;
  const _StudentProgressCard({required this.student, this.onTap});

  @override
  Widget build(BuildContext context) {
    final statusColor = student.isActive
        ? context.appColors.success
        : context.appColors.textMuted;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: statusColor.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
                color: context.appColors.brandPrimary.withValues(alpha: 0.06),
                blurRadius: 14,
                offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: context.appColors.gradientPrimary,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Center(
                child: Text(
                  student.fullName.isNotEmpty
                      ? student.fullName.trim()[0]
                      : context.l10n.text76,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.headlineSmall,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.fullName,
                    style: TextStyle(
                      fontFamily: 'Dubai',
                      fontSize: FontSize.body,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  if (student.gradeLevel.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.school_rounded,
                            size: 12, color: context.appColors.textMuted),
                        const SizedBox(width: 4),
                        Text(
                          student.gradeLevel,
                          style: TextStyle(
                            fontFamily: 'Dubai',
                            fontSize: FontSize.caption,
                            color: context.appColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (student.parent.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.person_outline_rounded,
                            size: 12, color: context.appColors.textMuted),
                        const SizedBox(width: 4),
                        Text(
                          context.l10n.parent2(student.parent),
                          style: TextStyle(
                            fontFamily: 'Dubai',
                            fontSize: FontSize.caption,
                            color: context.appColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                student.isActive ? context.l10n.active : context.l10n.inactive,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Recitation Tab — نموذج واحد: اختيار طالب (قائمة بحث منسدلة) + صفحات + إرسال
class RecitationTab extends ConsumerStatefulWidget {
  final AuthToken token;
  final bool canRecordMemorization;
  const RecitationTab(
      {super.key, required this.token, required this.canRecordMemorization});

  @override
  ConsumerState<RecitationTab> createState() => RecitationTabState();
}

class RecitationTabState extends ConsumerState<RecitationTab> {
  final _formKey = GlobalKey<FormState>();
  final _fromPageCtrl = TextEditingController();
  final _toPageCtrl = TextEditingController();

  AdminStudentItem? _selectedStudent;
  String _entryType = 'new';
  final DateTime _recordedOn = DateTime.now();
  bool _submitting = false;

  @override
  void dispose() {
    _fromPageCtrl.dispose();
    _toPageCtrl.dispose();
    super.dispose();
  }

  Future<List<AdminStudentItem>> _searchStudents(String query) async {
    if (query.trim().isEmpty) return const [];
    final result = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchStudents(
            search: query.trim(), perPage: 20, status: 'active'));
    return result.items;
  }

  Future<void> _submit() async {
    if (_selectedStudent == null) {
      AppToast.error(context, L10nGateway.current.pleaseSelectAStudentFirst);
      return;
    }
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);
    final outcome = await ref
        .read(adminActionsControllerProvider.notifier)
        .run((r) => r.fetchEnrollments(
              studentId: _selectedStudent!.id,
              status: 'active',
              perPage: 5,
            ));
    if (!mounted) return;
    if (outcome.error case final e?) {
      AppToast.error(context, errorText(e));
      setState(() => _submitting = false);
      return;
    }
    final enrollments = outcome.value!;
    if (enrollments.items.isEmpty) {
      if (!mounted) return;
      AppToast.error(context, L10nGateway.current.noActiveEnrollmentForThis);
      setState(() => _submitting = false);
      return;
    }

    final recordedOn =
        '${_recordedOn.year.toString().padLeft(4, '0')}-${_recordedOn.month.toString().padLeft(2, '0')}-${_recordedOn.day.toString().padLeft(2, '0')}';

    await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.recordMemorization(
              enrollments.items.first.id,
              entryType: _entryType,
              fromPage: int.parse(_fromPageCtrl.text),
              toPage: int.parse(_toPageCtrl.text),
              recordedOn: recordedOn,
              teacherId: '${widget.token.teacherId}',
              notes: '',
            ));

    if (!mounted) return;
    AppToast.success(
        context, L10nGateway.current.memorizationRecordedSuccessfully);
    setState(() {
      _selectedStudent = null;
      _fromPageCtrl.clear();
      _toPageCtrl.clear();
      _entryType = 'new';
      _submitting = false;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.canRecordMemorization) {
      return _ComingSoonTab(
        icon: Icons.record_voice_over_rounded,
        title: L10nGateway.current.memorization2,
        subtitle: L10nGateway.current.viewMemorizationRecordsNoRecording,
      );
    }

    final dateStr =
        DateFormat('d MMMM yyyy', AppLanguage.intlCode).format(_recordedOn);
    final fillColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withValues(alpha: 0.06)
        : context.appColors.primaryLight.withValues(alpha: 0.06);

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        children: [
          Text(context.l10n.student,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7))),
          const SizedBox(height: 10),
          _StudentSelectField(
            selected: _selectedStudent,
            fillColor: fillColor,
            onSearch: _searchStudents,
            onSelected: (s) => setState(() => _selectedStudent = s),
            onCleared: () => setState(() => _selectedStudent = null),
          ),
          const SizedBox(height: 20),
          Text(context.l10n.entryType,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7))),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _EntryTypeChip(
                  label: context.l10n.newMemorization,
                  icon: Icons.auto_stories_rounded,
                  selected: _entryType == 'new',
                  onTap: () => setState(() => _entryType = 'new'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _EntryTypeChip(
                  label: context.l10n.review,
                  icon: Icons.replay_rounded,
                  selected: _entryType == 'review',
                  onTap: () => setState(() => _entryType = 'review'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(context.l10n.pageRange,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7))),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _fromPageCtrl,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontFamily: 'Dubai', fontSize: FontSize.bodyLarge),
                  decoration: InputDecoration(
                    labelText: context.l10n.fromPage,
                    labelStyle: const TextStyle(
                        fontFamily: 'Dubai', fontSize: FontSize.label),
                    prefixIcon: Icon(Icons.first_page_rounded,
                        size: 20, color: context.appColors.primaryLight),
                    filled: true,
                    fillColor: fillColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none),
                  ),
                  validator: (v) => (v == null || int.tryParse(v) == null)
                      ? L10nGateway.current.required
                      : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _toPageCtrl,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontFamily: 'Dubai', fontSize: FontSize.bodyLarge),
                  decoration: InputDecoration(
                    labelText: context.l10n.toPage,
                    labelStyle: const TextStyle(
                        fontFamily: 'Dubai', fontSize: FontSize.label),
                    prefixIcon: Icon(Icons.last_page_rounded,
                        size: 20, color: context.appColors.primaryLight),
                    filled: true,
                    fillColor: fillColor,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none),
                  ),
                  validator: (v) {
                    final to = int.tryParse(v ?? '');
                    final from = int.tryParse(_fromPageCtrl.text);
                    if (to == null) return L10nGateway.current.required;
                    if (from != null && to < from) {
                      return L10nGateway.current.invalid;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(context.l10n.date,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7))),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: fillColor, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Icon(Icons.today_rounded,
                    size: 20, color: context.appColors.primaryLight),
                const SizedBox(width: 12),
                Text(dateStr,
                    style: const TextStyle(
                        fontFamily: 'Dubai', fontSize: FontSize.bodyLarge)),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color:
                        context.appColors.primaryLight.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(context.l10n.today,
                      style: TextStyle(
                          fontFamily: 'Dubai',
                          fontSize: FontSize.caption,
                          fontWeight: FontWeight.w700,
                          color: context.appColors.primaryLight)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitting ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.appColors.primaryLight,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              child: _submitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2.2, color: Colors.white))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send_rounded, size: 18),
                        const SizedBox(width: 8),
                        Text(context.l10n.send,
                            style: const TextStyle(
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w800,
                                fontSize: FontSize.bodyLarge)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Student select field — قائمة منسدلة مع بحث فوري (Autocomplete) ──────────
class _StudentSelectField extends StatelessWidget {
  final AdminStudentItem? selected;
  final Color fillColor;
  final Future<List<AdminStudentItem>> Function(String) onSearch;
  final ValueChanged<AdminStudentItem> onSelected;
  final VoidCallback onCleared;

  const _StudentSelectField({
    required this.selected,
    required this.fillColor,
    required this.onSearch,
    required this.onSelected,
    required this.onCleared,
  });

  @override
  Widget build(BuildContext context) {
    if (selected != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: context.appColors.primaryLight.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                  gradient: context.appColors.gradientPrimary,
                  borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: Text(
                  selected!.fullName.isNotEmpty
                      ? selected!.fullName.trim()[0]
                      : L10nGateway.current.text76,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.body,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Dubai'),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selected!.fullName,
                      style: TextStyle(
                          fontFamily: 'Dubai',
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface)),
                  if (selected!.gradeLevel.isNotEmpty)
                    Text(selected!.gradeLevel,
                        style: TextStyle(
                            fontFamily: 'Dubai',
                            fontSize: FontSize.caption,
                            color: context.appColors.textMuted)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 20),
              onPressed: onCleared,
              color: context.appColors.textMuted,
            ),
          ],
        ),
      );
    }

    return Autocomplete<AdminStudentItem>(
      displayStringForOption: (s) => s.fullName,
      optionsBuilder: (value) => onSearch(value.text),
      onSelected: onSelected,
      fieldViewBuilder: (context, controller, focusNode, onSubmit) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(fontFamily: 'Dubai', fontSize: FontSize.body),
          decoration: InputDecoration(
            hintText: L10nGateway.current.typeTheStudentNameTo,
            hintStyle:
                const TextStyle(fontFamily: 'Dubai', fontSize: FontSize.label),
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
            filled: true,
            fillColor: fillColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        );
      },
      optionsViewBuilder: (context, onSelect, options) {
        return Align(
          alignment: Alignment.topRight,
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 280),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 6),
                itemCount: options.length,
                itemBuilder: (_, i) {
                  final s = options.elementAt(i);
                  return ListTile(
                    dense: true,
                    leading: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                          gradient: context.appColors.gradientPrimary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                            s.fullName.isNotEmpty
                                ? s.fullName.trim()[0]
                                : L10nGateway.current.text76,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: FontSize.caption,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Dubai')),
                      ),
                    ),
                    title: Text(s.fullName,
                        style: const TextStyle(
                            fontFamily: 'Dubai',
                            fontSize: FontSize.label,
                            fontWeight: FontWeight.w600)),
                    subtitle: s.gradeLevel.isNotEmpty
                        ? Text(s.gradeLevel,
                            style: TextStyle(
                                fontFamily: 'Dubai',
                                fontSize: FontSize.caption,
                                color: context.appColors.textMuted))
                        : null,
                    onTap: () => onSelect(s),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EntryTypeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _EntryTypeChip(
      {required this.label,
      required this.icon,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: selected ? context.appColors.gradientPrimary : null,
          color: selected ? null : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                selected ? Colors.transparent : Theme.of(context).dividerColor,
            width: 1.4,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                      color:
                          context.appColors.brandPrimary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4))
                ]
              : null,
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 22,
                color: selected ? Colors.white : context.appColors.textMuted),
            const SizedBox(height: 6),
            Text(label,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w700,
                  color: selected
                      ? Colors.white
                      : Theme.of(context).colorScheme.onSurface,
                )),
          ],
        ),
      ),
    );
  }
}

// ─── Notes Tab ────────────────────────────────────────────────────────────────
class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _ComingSoonTab(
      icon: Icons.note_alt_rounded,
      title: context.l10n.notes2,
      subtitle: context.l10n.studentGroupNotes,
    );
  }
}

// ─── Attendance Tab ───────────────────────────────────────────────────────────
class SupervisorAttendanceTab extends StatelessWidget {
  final AuthToken token;

  const SupervisorAttendanceTab({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return TakeAttendanceBody(token: token);
  }
}

// ─── Trial Exam Tab ───────────────────────────────────────────────────────────
class TrialExamTab extends StatelessWidget {
  final bool canRecord;
  const TrialExamTab({super.key, this.canRecord = false});

  @override
  Widget build(BuildContext context) {
    return _ComingSoonTab(
      icon: Icons.science_rounded,
      title: context.l10n.trialTest,
      subtitle: canRecord
          ? context.l10n.trialTestResultsAndTests
          : context.l10n.viewTrialTestResultsNo,
    );
  }
}

// ─── Final Exam Tab ───────────────────────────────────────────────────────────
class FinalExamTab extends StatelessWidget {
  final bool canRecord;
  const FinalExamTab({super.key, this.canRecord = false});

  @override
  Widget build(BuildContext context) {
    return _ComingSoonTab(
      icon: Icons.verified_rounded,
      title: context.l10n.finalRecitationTest,
      subtitle: canRecord
          ? context.l10n.finalTestResults
          : context.l10n.viewFinalTestResultsNo,
    );
  }
}

// ─── Points Tab — نقاط الطلاب من enrollments (final_points/memorized_pages) ──
class SupervisorPointsTab extends ConsumerStatefulWidget {
  const SupervisorPointsTab({super.key});

  @override
  ConsumerState<SupervisorPointsTab> createState() =>
      SupervisorPointsTabState();
}

class SupervisorPointsTabState extends ConsumerState<SupervisorPointsTab> {
  late final _loadProvider = screenDataProvider(() async {
    final result = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchEnrollments(perPage: 50));
    return result.items;
  });
  List<AdminEnrollmentItem> get _enrollments =>
      ref.watch(_loadProvider).valueOrNull ?? [];
  bool get _loading => ref.watch(_loadProvider).isLoading;
  String? get _error {
    final e = ref.watch(_loadProvider).error;
    return e == null ? null : errorText(e);
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_enrollments.isEmpty) {
      return _EmptyState(
        icon: Icons.star_outline_rounded,
        message: L10nGateway.current.noRegisteredStudents,
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: context.appColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        itemCount: _enrollments.length,
        itemBuilder: (_, i) => _PointsCard(enrollment: _enrollments[i])
            .animate()
            .fadeIn(delay: (i * 40).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
      ),
    );
  }
}

class _PointsCard extends StatelessWidget {
  final AdminEnrollmentItem enrollment;
  const _PointsCard({required this.enrollment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border:
            Border.all(color: context.appColors.gold.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
              color: context.appColors.gold.withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  enrollment.studentName,
                  style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  enrollment.groupName,
                  style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    color: context.appColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          _InfoChip(
            icon: Icons.star_rounded,
            label: context.l10n.pointS(enrollment.finalPoints),
            color: context.appColors.gold,
          ),
          const SizedBox(width: 8),
          _InfoChip(
            icon: Icons.menu_book_rounded,
            label: context.l10n.pages2(enrollment.memorizedPages),
            color: context.appColors.primaryLight,
          ),
        ],
      ),
    );
  }
}

// ─── Activities Tab ───────────────────────────────────────────────────────────
class ActivitiesTab extends ConsumerStatefulWidget {
  const ActivitiesTab({super.key});

  @override
  ConsumerState<ActivitiesTab> createState() => ActivitiesTabState();
}

class ActivitiesTabState extends ConsumerState<ActivitiesTab> {
  late final _loadProvider = screenDataProvider(() async {
    final result = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchActivities(perPage: 50));
    return result.items;
  });
  List<AdminActivityItem> get _activities =>
      ref.watch(_loadProvider).valueOrNull ?? [];
  bool get _loading => ref.watch(_loadProvider).isLoading;
  String? get _error {
    final e = ref.watch(_loadProvider).error;
    return e == null ? null : errorText(e);
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_activities.isEmpty) {
      return _EmptyState(
        icon: Icons.event_note_rounded,
        message: L10nGateway.current.noActivitiesRightNow,
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: context.appColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        itemCount: _activities.length,
        itemBuilder: (_, i) => _ActivityCard(activity: _activities[i])
            .animate()
            .fadeIn(delay: (i * 40).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final AdminActivityItem activity;
  const _ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    final color = activity.isActive
        ? context.appColors.info
        : context.appColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
              color: color.withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            activity.title,
            style: TextStyle(
              fontFamily: 'Dubai',
              fontSize: FontSize.body,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          if (activity.groupName != null) ...[
            const SizedBox(height: 4),
            Text(
              activity.groupName!,
              style: TextStyle(
                fontFamily: 'Dubai',
                fontSize: FontSize.caption,
                color: context.appColors.textMuted,
              ),
            ),
          ],
          if (activity.activityDate != null) ...[
            const SizedBox(height: 8),
            _InfoChip(
              icon: Icons.event_rounded,
              label: activity.activityDate!,
              color: color,
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Assessments Tab ──────────────────────────────────────────────────────────
class SupervisorAssessmentsTab extends ConsumerStatefulWidget {
  const SupervisorAssessmentsTab({super.key});

  @override
  ConsumerState<SupervisorAssessmentsTab> createState() =>
      SupervisorAssessmentsTabState();
}

class SupervisorAssessmentsTabState
    extends ConsumerState<SupervisorAssessmentsTab> {
  late final _loadProvider = screenDataProvider(() async {
    final result = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchAssessments(perPage: 50));
    return result.items;
  });
  List<AdminAssessmentItem> get _assessments =>
      ref.watch(_loadProvider).valueOrNull ?? [];
  bool get _loading => ref.watch(_loadProvider).isLoading;
  String? get _error {
    final e = ref.watch(_loadProvider).error;
    return e == null ? null : errorText(e);
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_assessments.isEmpty) {
      return _EmptyState(
        icon: Icons.assignment_outlined,
        message: L10nGateway.current.noAssessmentsYet,
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: context.appColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        itemCount: _assessments.length,
        itemBuilder: (_, i) => _AssessmentCard(assessment: _assessments[i])
            .animate()
            .fadeIn(delay: (i * 40).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
      ),
    );
  }
}

class _AssessmentCard extends StatelessWidget {
  final AdminAssessmentItem assessment;
  const _AssessmentCard({required this.assessment});

  @override
  Widget build(BuildContext context) {
    final color = assessment.isActive
        ? context.appColors.success
        : context.appColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
              color: color.withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  assessment.title,
                  style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  assessment.isActive
                      ? context.l10n.active
                      : context.l10n.inactive,
                  style: TextStyle(
                      color: color,
                      fontSize: FontSize.caption,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Dubai'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            assessment.groupName,
            style: TextStyle(
              fontFamily: 'Dubai',
              fontSize: FontSize.caption,
              color: context.appColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _InfoChip(
                icon: Icons.grade_rounded,
                label:
                    '${assessment.passMark.toStringAsFixed(0)}/${assessment.totalMark.toStringAsFixed(0)}',
                color: context.appColors.info,
              ),
              const SizedBox(width: 8),
              _InfoChip(
                icon: Icons.fact_check_rounded,
                label: context.l10n.resultS(assessment.resultsCount),
                color: context.appColors.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Reports Tab ──────────────────────────────────────────────────────────────
class ReportsTab extends ConsumerStatefulWidget {
  const ReportsTab({super.key});

  @override
  ConsumerState<ReportsTab> createState() => ReportsTabState();
}

class ReportsTabState extends ConsumerState<ReportsTab> {
  late final _loadProvider = screenDataProvider(() async {
    final result = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchGroups(perPage: 50));
    return result.items;
  });
  List<AdminGroupItem> get _groups =>
      ref.watch(_loadProvider).valueOrNull ?? [];
  bool get _loading => ref.watch(_loadProvider).isLoading;
  String? get _error {
    final e = ref.watch(_loadProvider).error;
    return e == null ? null : errorText(e);
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_groups.isEmpty) {
      return _EmptyState(
        icon: Icons.bar_chart_rounded,
        message: L10nGateway.current.noLinkedGroups,
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: context.appColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        itemCount: _groups.length,
        itemBuilder: (_, i) => _GroupReportCard(group: _groups[i])
            .animate()
            .fadeIn(delay: (i * 50).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 50).ms),
      ),
    );
  }
}

class _GroupReportCard extends StatelessWidget {
  final AdminGroupItem group;
  const _GroupReportCard({required this.group});

  @override
  Widget build(BuildContext context) {
    final color = group.isActive
        ? context.appColors.primaryLight
        : context.appColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.25)),
        boxShadow: [
          BoxShadow(
              color: color.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.groups_rounded, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  group.name,
                  style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  group.isActive
                      ? context.l10n.active2
                      : context.l10n.inactive2,
                  style: TextStyle(
                      color: color,
                      fontSize: FontSize.caption,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Dubai'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _InfoChip(
                icon: Icons.people_rounded,
                label: context.l10n.students3(group.enrollmentsCount),
                color: context.appColors.info,
              ),
              const SizedBox(width: 8),
              if (group.teacher.isNotEmpty)
                _InfoChip(
                  icon: Icons.person_rounded,
                  label: group.teacher,
                  color: context.appColors.warning,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _InfoChip(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  color: color,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ─── Shared widgets ───────────────────────────────────────────────────────────
class _ComingSoonTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _ComingSoonTab(
      {required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.appColors.primaryLight.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: context.appColors.primaryLight),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Dubai',
              fontSize: FontSize.headlineSmall,
              fontWeight: FontWeight.w700,
              color: context.appColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'Dubai',
              fontSize: FontSize.label,
              color: context.appColors.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: context.appColors.gold.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: context.appColors.gold.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.construction_rounded,
                    size: 14, color: context.appColors.gold),
                const SizedBox(width: 6),
                Text(
                  context.l10n.underConstruction,
                  style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    color: context.appColors.goldText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }
}

// ─── Permission-aware error ───────────────────────────────────────────────────
class _PermissionAwareError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _PermissionAwareError({required this.message, required this.onRetry});

  bool get _isForbidden =>
      message.contains('صلاحية') || message.contains('403');

  @override
  Widget build(BuildContext context) {
    final color =
        _isForbidden ? context.appColors.warning : context.appColors.error;
    final icon =
        _isForbidden ? Icons.lock_outline_rounded : Icons.error_outline_rounded;
    final title = _isForbidden
        ? context.l10n.youDonTHavePermission3
        : context.l10n.somethingWentWrong;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: color),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Dubai',
                fontSize: FontSize.headlineSmall,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Dubai',
                fontSize: FontSize.label,
                color: context.appColors.textMuted,
              ),
            ),
            if (!_isForbidden) ...[
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: Text(context.l10n.tryAgain,
                    style: const TextStyle(fontFamily: 'Dubai')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.appColors.primaryLight,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(duration: 350.ms);
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  const _EmptyState({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) =>
      AdminEmptyState(icon: icon, title: message);
}
