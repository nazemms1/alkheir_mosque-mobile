import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/admin_dashboard_model.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/services/admin_service.dart';
import '../../home/home_widget_registry.dart';

/// بيانات لوحة الإداري بعد جلبها — تُمرَّر لويدجتس [adminHomeWidgets].
class AdminHomeData {
  final String userName;
  final AdminStats stats;
  final List<AdminGroupItem> groups;
  final List<AdminStudentItem> students;
  const AdminHomeData({
    required this.userName,
    required this.stats,
    required this.groups,
    required this.students,
  });
}

/// ويدجتس الشاشة الرئيسية للمشرف الإداري — مرتّبة حسب ظهورها.
/// لإضافة ويدجت جديد: أنشئ الويدجت ثم أضف HomeWidgetDef هنا فقط.
final List<HomeWidgetDef<AdminHomeData>> adminHomeWidgets = [
  // البطاقة الترحيبية
  HomeWidgetDef(
    id: 'admin-welcome',
    slivers: (context, d) => [
      SliverToBoxAdapter(
        child: _WelcomeBanner(userName: d.userName, stats: d.stats)
            .animate()
            .fadeIn(duration: 450.ms)
            .slideY(begin: -0.04, end: 0, duration: 450.ms),
      ),
    ],
  ),
  // شبكة الإحصائيات
  HomeWidgetDef(
    id: 'admin-stats',
    slivers: (context, d) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _StatsGrid(stats: d.stats)
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
    slivers: (context, d) => [
      const SliverPadding(
        padding: EdgeInsets.fromLTRB(16, 28, 16, 0),
        sliver: SliverToBoxAdapter(
            child: _SectionHeader(
                title: 'الحلقات النشطة',
                icon: Icons.groups_rounded,
                color: AppColors.primaryLight)),
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
  // آخر الطلاب المسجّلين
  HomeWidgetDef(
    id: 'admin-recent-students',
    slivers: (context, d) => [
      const SliverPadding(
        padding: EdgeInsets.fromLTRB(16, 28, 16, 0),
        sliver: SliverToBoxAdapter(
            child: _SectionHeader(
                title: 'آخر الطلاب المسجّلين',
                icon: Icons.school_rounded,
                color: AppColors.gold)),
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
  final _service = AdminService();

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
    setState(() { _loading = true; _error = null; });
    try {
      final d = await _service.fetchDashboard();
      if (!mounted) return;
      setState(() {
        _stats    = d.stats;
        _groups   = d.groups;
        _students = d.students;
        _loading  = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Cairo')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _load, child: const Text('إعادة المحاولة', style: TextStyle(fontFamily: 'Cairo'))),
          ],
        ),
      );
    }

    final data = AdminHomeData(
      userName: widget.token.user?.name ?? 'المدير',
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
  final AdminStats stats;
  const _WelcomeBanner({required this.userName, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 28, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: AppColors.gradientGold,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.4), blurRadius: 14, spreadRadius: 1)],
                ),
                child: const Icon(Icons.admin_panel_settings_rounded, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مرحباً، $userName',
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Cairo'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.25)),
                      ),
                      child: const Text('لوحة التحكم الإدارية', style: TextStyle(color: Colors.white, fontSize: 11, fontFamily: 'Cairo')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _HeroPill(label: 'طالب', value: '${stats.totalStudents}', icon: Icons.people_rounded),
              const SizedBox(width: 8),
              _HeroPill(label: 'حلقة نشطة', value: '${stats.activeGroups}', icon: Icons.groups_rounded),
              const SizedBox(width: 8),
              _HeroPill(label: 'تسجيل', value: '${stats.totalEnrollments}', icon: Icons.how_to_reg_rounded),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroPill extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const _HeroPill({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.18)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.goldLight, size: 18),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
            Text(label, style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 10, fontFamily: 'Cairo')),
          ],
        ),
      ),
    );
  }
}

// ─── Stats grid ───────────────────────────────────────────────────────────────
class _StatsGrid extends StatelessWidget {
  final AdminStats stats;
  const _StatsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    final items = [
      _SI(Icons.people_rounded,        'إجمالي الطلاب',    '${stats.totalStudents}',    AppColors.info),
      _SI(Icons.groups_rounded,        'حلقات نشطة',       '${stats.activeGroups}',     AppColors.success),
      _SI(Icons.how_to_reg_rounded,    'التسجيلات',        '${stats.totalEnrollments}', AppColors.primaryLight),
      _SI(Icons.receipt_long_rounded,  'الفواتير',         '${stats.totalInvoices}',    AppColors.warning),
      _SI(Icons.assignment_rounded,    'التقييمات',        '${stats.totalAssessments}', AppColors.gold),
      _SI(Icons.event_rounded,         'الأنشطة',          '${stats.totalActivities}',  AppColors.error),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.95,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => _StatCard(item: items[i]),
    );
  }
}

class _SI {
  final IconData icon;
  final String label, value;
  final Color color;
  const _SI(this.icon, this.label, this.value, this.color);
}

class _StatCard extends StatelessWidget {
  final _SI item;
  const _StatCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: item.color.withOpacity(0.18), width: 1.5),
        boxShadow: [BoxShadow(color: item.color.withOpacity(0.1), blurRadius: 16, offset: const Offset(0, 5))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [item.color.withOpacity(0.18), item.color.withOpacity(0.08)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: item.color, size: 22),
          ),
          const SizedBox(height: 8),
          Text(item.value, style: TextStyle(color: item.color, fontSize: 18, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
          const SizedBox(height: 2),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.55), fontSize: 10, fontFamily: 'Cairo', height: 1.3),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// ─── Section header ───────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const _SectionHeader({required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(fontFamily: 'Cairo', fontSize: 15, fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.onSurface),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight.withOpacity(0.15)),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.groups_rounded, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(group.name, style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(group.teacher.isEmpty ? group.course : group.teacher, style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: AppColors.primaryLight.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: Text('${group.enrollmentsCount} طالب', style: const TextStyle(fontFamily: 'Cairo', fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.primaryLight)),
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
        border: Border.all(color: AppColors.gold.withOpacity(0.15)),
        boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(gradient: AppColors.gradientGold, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(student.initials, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.fullName, style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text('${student.gradeLevel} · ${student.studentNumber}', style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: AppColors.gold.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: Text('ج ${student.currentJuz}', style: const TextStyle(fontFamily: 'Cairo', fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.gold)),
          ),
        ],
      ),
    );
  }
}
