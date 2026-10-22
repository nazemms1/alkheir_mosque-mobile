import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/app/core/widgets/brand_logo.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/features/home/presentation/state_management/home_widget_registry.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

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
            title: tr('الحلقات النشطة'),
            icon: Icons.groups_rounded,
            color: AppColors.primaryLight,
          ),
        ),
      ),
      if (d.groups.isEmpty)
        SliverToBoxAdapter(
          child: AdminEmptyState(
            icon: Icons.groups_outlined,
            title: tr('لا توجد حلقات نشطة حالياً'),
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
            title: tr('آخر الطلاب المسجّلين'),
            icon: Icons.school_rounded,
            color: AppColors.gold,
          ),
        ),
      ),
      if (d.students.isEmpty)
        SliverToBoxAdapter(
          child: AdminEmptyState(
            icon: Icons.school_outlined,
            title: tr('لا يوجد طلاب مسجّلون بعد'),
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
class AdminHomeTab extends StatefulWidget {
  final AuthToken token;
  const AdminHomeTab({super.key, required this.token});

  @override
  State<AdminHomeTab> createState() => _AdminHomeTabState();
}

class _AdminHomeTabState extends State<AdminHomeTab> {
  final _service = AdminRepositoryImpl();

  AdminStats? _stats;
  List<AdminGroupItem> _groups = [];
  List<AdminStudentItem> _students = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final d = await _service.fetchDashboard(widget.token);
      if (!mounted) return;
      setState(() {
        _stats = d.stats;
        _groups = d.groups;
        _students = d.students;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return AdminErrorState(
        message: _error!,
        onRetry: _load,
        retryLabel: tr('إعادة المحاولة'),
      );
    }

    final data = AdminHomeData(
      userName: widget.token.user?.name ?? tr('المدير'),
      token: widget.token,
      stats: _stats!,
      groups: _groups,
      students: _students,
    );

    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
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
    final greeting = hour < 12 ? tr('صباح الخير') : tr('مساء الخير');
    final metrics = [
      if (token.hasPermission(Permissions.studentsView))
        _BannerMetric(
          icon: Icons.people_rounded,
          label: tr('طالب'),
          value: '${stats.totalStudents}',
        ),
      if (token.hasPermission(Permissions.groupsView))
        _BannerMetric(
          icon: Icons.groups_rounded,
          label: tr('حلقة نشطة'),
          value: '${stats.activeGroups}',
        ),
      if (token.hasPermission(Permissions.enrollmentsView))
        _BannerMetric(
          icon: Icons.how_to_reg_rounded,
          label: tr('تسجيل'),
          value: '${stats.totalEnrollments}',
        ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.bgDeep, Color(0xFF1A3D0A), Color(0xFF0D4515)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: AppColors.heroShadow,
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            top: -50,
            end: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.gold.withValues(alpha: 0.22),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
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
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          tr('لوحة التحكم الإدارية'),
                          style: appTextStyle(
                            fontSize: 12,
                            color: AppColors.goldLight,
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
          Icon(icon, color: AppColors.goldLight, size: 18),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: appTextStyle(
                fontSize: 18,
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
              fontSize: 11,
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
            label: tr('إجمالي الطلاب'),
            value: '${stats.totalStudents}',
            color: AppColors.info,
          ),
        if (token.hasPermission(Permissions.groupsView))
          AdminStatTile(
            icon: Icons.groups_rounded,
            label: tr('حلقات نشطة'),
            value: '${stats.activeGroups}',
            color: AppColors.success,
          ),
        if (token.hasPermission(Permissions.enrollmentsView))
          AdminStatTile(
            icon: Icons.how_to_reg_rounded,
            label: tr('التسجيلات'),
            value: '${stats.totalEnrollments}',
            color: AppColors.primaryLight,
          ),
        if (token.hasPermission(Permissions.invoicesView))
          AdminStatTile(
            icon: Icons.receipt_long_rounded,
            label: tr('الفواتير'),
            value: '${stats.totalInvoices}',
            color: AppColors.warning,
          ),
        if (token.hasPermission(Permissions.assessmentsView))
          AdminStatTile(
            icon: Icons.assignment_rounded,
            label: tr('التقييمات'),
            value: '${stats.totalAssessments}',
            color: AppColors.gold,
          ),
        if (token.hasPermission(Permissions.activitiesView))
          AdminStatTile(
            icon: Icons.event_rounded,
            label: tr('الأنشطة'),
            value: '${stats.totalActivities}',
            color: AppColors.error,
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
            color: AppColors.primaryLight,
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
                    fontSize: 14,
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
                    fontSize: 12,
                    color: AdminTheme.muted(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AdminBadge(
            label: trf('{0} طالب', [group.enrollmentsCount]),
            color: AppColors.primaryLight,
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
          AdminAvatar(text: student.initials, color: AppColors.gold),
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
                    fontSize: 14,
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
                    fontSize: 12,
                    color: AdminTheme.muted(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AdminBadge(
            label: trf('ج {0}', [student.currentJuz]),
            color: AppColors.gold,
          ),
        ],
      ),
    );
  }
}
