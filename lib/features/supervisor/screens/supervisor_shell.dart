import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_toast.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/permissions.dart';
import '../../../data/services/admin_service.dart';
import '../../../data/models/admin_dashboard_model.dart';
import 'supervisor_student_detail.dart';

// ─── Supervisor nav tab definition (nav config + screen, permission-gated) ────
class SupervisorNavTab {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String subtitle;
  final Widget body;
  const SupervisorNavTab({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.subtitle,
    required this.body,
  });
}

/// يبني تبويبات شريط التنقل السفلي المناسبة لدور المستخدم الإشرافي، كل
/// تبويب مرتبط بالصلاحية المطلوبة للوصول إليه (نفس نمط تبويبات المدير).
List<SupervisorNavTab> supervisorNavTabs(AuthToken t) {
  final tabs = <SupervisorNavTab>[
    // الرئيسية — لوحة تحكم موجزة، متاحة للجميع
    SupervisorNavTab(
      icon: Icons.dashboard_outlined,
      activeIcon: Icons.dashboard_rounded,
      label: 'الرئيسية',
      subtitle: 'لوحة التحكم',
      body: SupervisorHomeTab(token: t),
    ),
    // تقدم الطالب — متاح للجميع
    SupervisorNavTab(
      icon: Icons.trending_up_outlined,
      activeIcon: Icons.trending_up_rounded,
      label: 'التقدم',
      subtitle: 'تقدّم الطلاب',
      body: _StudentsProgressTab(token: t),
    ),
  ];

  // التسميع (الحفظ واختبارات القرآن) — تظهر لمن يملك صلاحية عرض أو تسجيل
  final canRecordRecitation = t.hasPermission(Permissions.assessmentsView) ||
      t.hasPermission(Permissions.quranTestsRecord) ||
      t.hasPermission(Permissions.quranAwqafTestsRecord);
  final canViewRecitation = canRecordRecitation ||
      t.hasPermission(Permissions.memorizationView) ||
      t.hasPermission(Permissions.quranTestsView) ||
      t.hasPermission(Permissions.quranAwqafTestsView);
  if ((t.isSupervisor ||
          t.isAssistantSupervisor ||
          t.isReciter ||
          t.isTrialExamSupervisor ||
          t.isFinalExamSupervisor ||
          t.isAdmin) &&
      canViewRecitation) {
    tabs.add(SupervisorNavTab(
      icon: Icons.record_voice_over_outlined,
      activeIcon: Icons.record_voice_over_rounded,
      label: 'التسميع',
      subtitle: 'الحفظ واختبارات القرآن',
      body: _RecitationTab(
        token: t,
        canRecordMemorization: t.hasPermission(Permissions.assessmentsView),
      ),
    ));
  }

  // ملاحظات — مشرف الحلقة ومساعده والإداري
  if (t.isSupervisor || t.isAssistantSupervisor || t.isAdmin) {
    tabs.add(const SupervisorNavTab(
      icon: Icons.note_alt_outlined,
      activeIcon: Icons.note_alt_rounded,
      label: 'الملاحظات',
      subtitle: 'ملاحظات الطلاب والحلقة',
      body: _NotesTab(),
    ));
  }

  // حضور الحلقة — يتطلب صلاحية تسجيل حضور الطلاب
  if ((t.isSupervisor || t.isAssistantSupervisor || t.isAdmin) &&
      t.hasPermission(Permissions.attendanceStudentTake)) {
    tabs.add(const SupervisorNavTab(
      icon: Icons.event_available_outlined,
      activeIcon: Icons.event_available_rounded,
      label: 'الحضور',
      subtitle: 'سجل حضور الطلاب',
      body: _AttendanceTab(),
    ));
  }

  // سبر تجريبي — يظهر لمن يملك صلاحية عرض أو تسجيل اختبارات القرآن
  final canRecordExams = t.hasPermission(Permissions.quranTestsRecord) ||
      t.hasPermission(Permissions.quranAwqafTestsRecord);
  final canViewExams = canRecordExams ||
      t.hasPermission(Permissions.quranTestsView) ||
      t.hasPermission(Permissions.quranAwqafTestsView);
  if ((t.isTrialExamSupervisor || t.isFinalExamSupervisor || t.isAdmin) &&
      canViewExams) {
    tabs.add(SupervisorNavTab(
      icon: Icons.science_outlined,
      activeIcon: Icons.science_rounded,
      label: 'تجريبي',
      subtitle: 'نتائج السبر التجريبي',
      body: _TrialExamTab(canRecord: canRecordExams),
    ));
  }

  // سير نهائي — يظهر لمن يملك صلاحية عرض أو تسجيل اختبارات القرآن
  if ((t.isFinalExamSupervisor || t.isAdmin) && canViewExams) {
    tabs.add(SupervisorNavTab(
      icon: Icons.verified_outlined,
      activeIcon: Icons.verified_rounded,
      label: 'نهائي',
      subtitle: 'نتائج السير النهائي',
      body: _FinalExamTab(canRecord: canRecordExams),
    ));
  }

  // تقارير الحلقة — يتطلب صلاحية عرض التقارير
  if ((t.isSupervisor || t.isAdmin) &&
      t.hasPermission(Permissions.reportsView)) {
    tabs.add(const SupervisorNavTab(
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart_rounded,
      label: 'التقارير',
      subtitle: 'تقارير الحلقة',
      body: _ReportsTab(),
    ));
  }

  // نقاط الطلاب — تظهر لمن يملك صلاحية عرض النقاط
  if (t.hasPermission(Permissions.pointsView)) {
    tabs.add(const SupervisorNavTab(
      icon: Icons.star_outline_rounded,
      activeIcon: Icons.star_rounded,
      label: 'النقاط',
      subtitle: 'نقاط الطلاب',
      body: _PointsTab(),
    ));
  }

  // الأنشطة — تظهر لمن يملك صلاحية عرض الأنشطة
  if (t.hasPermission(Permissions.activitiesView)) {
    tabs.add(const SupervisorNavTab(
      icon: Icons.event_note_outlined,
      activeIcon: Icons.event_note_rounded,
      label: 'الأنشطة',
      subtitle: 'أنشطة المسجد',
      body: _ActivitiesTab(),
    ));
  }

  // التقييمات — تظهر لمن يملك صلاحية عرض التقييمات أو نتائجها
  if (t.hasPermission(Permissions.assessmentsView) ||
      t.hasPermission(Permissions.assessmentResultsView)) {
    tabs.add(const SupervisorNavTab(
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment_rounded,
      label: 'التقييمات',
      subtitle: 'التقييمات والاختبارات',
      body: _AssessmentsTab(),
    ));
  }

  return tabs;
}

// ─── Home tab (overview dashboard) ─────────────────────────────────────────────
class SupervisorHomeTab extends StatefulWidget {
  final AuthToken token;
  const SupervisorHomeTab({super.key, required this.token});

  @override
  State<SupervisorHomeTab> createState() => _SupervisorHomeTabState();
}

class _SupervisorHomeTabState extends State<SupervisorHomeTab> {
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
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final results = await Future.wait([
        _service.fetchSupervisorStats(),
        _service.fetchGroups(perPage: 6, isActive: true),
        _service.fetchStudents(perPage: 6),
      ]);
      if (!mounted) return;
      setState(() {
        _stats = results[0] as AdminStats;
        _groups = (results[1] as ({
          List<AdminGroupItem> items,
          int total,
          int lastPage
        }))
            .items;
        _students = (results[2] as ({
          List<AdminStudentItem> items,
          int total,
          int lastPage
        }))
            .items;
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
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }

    final stats = _stats!;
    final userName = widget.token.user?.name ?? 'المشرف';

    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: _SupervisorWelcomeBanner(
              userName: userName,
              roleLabel: widget.token.displayRole,
              stats: stats,
            )
                .animate()
                .fadeIn(duration: 450.ms)
                .slideY(begin: -0.04, end: 0, duration: 450.ms),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            sliver: SliverToBoxAdapter(
              child: _SupervisorStatsGrid(stats: stats)
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 400.ms)
                  .slideY(begin: 0.05, end: 0, delay: 100.ms),
            ),
          ),
          if (_groups.isNotEmpty) ...[
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 28, 16, 0),
              sliver: SliverToBoxAdapter(
                child: _SectionHeader(
                    title: 'الحلقات',
                    icon: Icons.groups_rounded,
                    color: AppColors.primaryLight),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) => _MiniGroupTile(group: _groups[i])
                      .animate()
                      .fadeIn(delay: (160 + i * 45).ms, duration: 360.ms)
                      .slideX(begin: 0.04, end: 0, delay: (160 + i * 45).ms),
                  childCount: _groups.length,
                ),
              ),
            ),
          ],
          if (_students.isNotEmpty) ...[
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 28, 16, 0),
              sliver: SliverToBoxAdapter(
                child: _SectionHeader(
                    title: 'آخر الطلاب',
                    icon: Icons.school_rounded,
                    color: AppColors.gold),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) => _MiniStudentTile(student: _students[i])
                      .animate()
                      .fadeIn(delay: (300 + i * 45).ms, duration: 360.ms)
                      .slideX(begin: 0.04, end: 0, delay: (300 + i * 45).ms),
                  childCount: _students.length,
                ),
              ),
            ),
          ] else
            const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
        ],
      ),
    );
  }
}

// ─── Welcome banner ───────────────────────────────────────────────────────────
class _SupervisorWelcomeBanner extends StatelessWidget {
  final String userName;
  final String roleLabel;
  final AdminStats stats;
  const _SupervisorWelcomeBanner(
      {required this.userName, required this.roleLabel, required this.stats});

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
          BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 28,
              offset: const Offset(0, 10)),
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
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.gold.withOpacity(0.4),
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
                      'مرحباً، $userName',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Cairo'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.25)),
                      ),
                      child: Text(roleLabel,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Cairo')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _HeroPill(
                  label: 'طالب',
                  value: '${stats.totalStudents}',
                  icon: Icons.people_rounded),
              const SizedBox(width: 8),
              _HeroPill(
                  label: 'حلقة نشطة',
                  value: '${stats.activeGroups}',
                  icon: Icons.groups_rounded),
              const SizedBox(width: 8),
              _HeroPill(
                  label: 'تسجيل',
                  value: '${stats.totalEnrollments}',
                  icon: Icons.how_to_reg_rounded),
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
  const _HeroPill(
      {required this.label, required this.value, required this.icon});

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
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo')),
            Text(label,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 10,
                    fontFamily: 'Cairo')),
          ],
        ),
      ),
    );
  }
}

// ─── Stats grid ───────────────────────────────────────────────────────────────
class _SupervisorStatsGrid extends StatelessWidget {
  final AdminStats stats;
  const _SupervisorStatsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    final items = [
      _SI(Icons.people_rounded, 'إجمالي الطلاب', '${stats.totalStudents}',
          AppColors.info),
      _SI(Icons.groups_rounded, 'حلقات نشطة', '${stats.activeGroups}',
          AppColors.success),
      _SI(Icons.how_to_reg_rounded, 'التسجيلات', '${stats.totalEnrollments}',
          AppColors.primaryLight),
      _SI(Icons.assignment_rounded, 'التقييمات', '${stats.totalAssessments}',
          AppColors.gold),
      _SI(Icons.event_rounded, 'الأنشطة', '${stats.totalActivities}',
          AppColors.error),
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
        boxShadow: [
          BoxShadow(
              color: item.color.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  item.color.withOpacity(0.18),
                  item.color.withOpacity(0.08)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: item.color, size: 22),
          ),
          const SizedBox(height: 8),
          Text(item.value,
              style: TextStyle(
                  color: item.color,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Cairo')),
          const SizedBox(height: 2),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.55),
                fontSize: 10,
                fontFamily: 'Cairo',
                height: 1.3),
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
  const _SectionHeader(
      {required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface),
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
        boxShadow: [
          BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
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
                gradient: AppColors.gradientPrimary,
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
                        fontFamily: 'Cairo',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(group.teacher.isEmpty ? group.course : group.teacher,
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 11,
                        color: AppColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.primaryLight.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Text('${group.enrollmentsCount} طالب',
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryLight)),
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
        boxShadow: [
          BoxShadow(
              color: AppColors.gold.withOpacity(0.05),
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
                gradient: AppColors.gradientGold,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(student.initials,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Cairo')),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(student.fullName,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text('${student.gradeLevel} · ${student.studentNumber}',
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 11,
                        color: AppColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Text('ج ${student.currentJuz}',
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gold)),
          ),
        ],
      ),
    );
  }
}

// ─── Students Progress Tab ────────────────────────────────────────────────────
class _StudentsProgressTab extends StatefulWidget {
  final AuthToken token;
  const _StudentsProgressTab({required this.token});

  @override
  State<_StudentsProgressTab> createState() => _StudentsProgressTabState();
}

class _StudentsProgressTabState extends State<_StudentsProgressTab> {
  final _service = AdminService();
  List<AdminStudentItem> _students = [];
  List<AdminGroupItem> _groups = [];
  int? _selectedGroupId;
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
      final results = await Future.wait([
        _service.fetchStudents(perPage: 50, groupId: _selectedGroupId),
        _service.fetchGroups(perPage: 100),
      ]);
      if (!mounted) return;
      setState(() {
        _students = (results[0] as ({
          List<AdminStudentItem> items,
          int total,
          int lastPage
        }))
            .items;
        _groups = (results[1] as ({
          List<AdminGroupItem> items,
          int total,
          int lastPage
        }))
            .items;
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
              ? const _EmptyState(
                  icon: Icons.people_outline_rounded,
                  message: 'لا يوجد طلاب في الحلقة',
                )
              : RefreshIndicator(
                  onRefresh: _load,
                  color: AppColors.primaryLight,
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
                    itemCount: _students.length,
                    itemBuilder: (_, i) {
                      final s = _students[i];
                      return _StudentProgressCard(
                        student: s,
                        onTap: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, a, __) => SupervisorStudentDetail(
                              studentId: s.id,
                              studentName: s.fullName,
                              token: widget.token,
                            ),
                            transitionsBuilder: (_, a, __, child) =>
                                SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                  parent: a, curve: Curves.easeOutCubic)),
                              child: child,
                            ),
                            transitionDuration:
                                const Duration(milliseconds: 380),
                          ),
                        ),
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
            label: 'الكل',
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
          gradient: isSelected ? AppColors.gradientPrimary : null,
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
            fontFamily: 'Cairo',
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.textSecondary,
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
    final statusColor =
        student.isActive ? AppColors.success : AppColors.textMuted;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: statusColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
                color: AppColors.primary.withOpacity(0.06),
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
                gradient: AppColors.gradientPrimary,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Center(
                child: Text(
                  student.fullName.isNotEmpty
                      ? student.fullName.trim()[0]
                      : '؟',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo',
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
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  if (student.gradeLevel.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.school_rounded,
                            size: 12, color: AppColors.textMuted),
                        const SizedBox(width: 4),
                        Text(
                          student.gradeLevel,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 11,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (student.parent.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.person_outline_rounded,
                            size: 12, color: AppColors.textMuted),
                        const SizedBox(width: 4),
                        Text(
                          'ولي الأمر: ${student.parent}',
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 11,
                            color: AppColors.textMuted,
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
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                student.isActive ? 'نشط' : 'غير نشط',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 10,
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
class _RecitationTab extends StatefulWidget {
  final AuthToken token;
  final bool canRecordMemorization;
  const _RecitationTab(
      {required this.token, required this.canRecordMemorization});

  @override
  State<_RecitationTab> createState() => _RecitationTabState();
}

class _RecitationTabState extends State<_RecitationTab> {
  final _service = AdminService();
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
    final result = await _service.fetchStudents(search: query.trim(), perPage: 20);
    return result.items;
  }

  Future<void> _submit() async {
    if (_selectedStudent == null) {
      AppToast.error(context, 'الرجاء اختيار الطالب أولاً');
      return;
    }
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);
    try {
      final enrollments = await _service.fetchEnrollments(
        studentId: _selectedStudent!.id,
        status: 'active',
        perPage: 5,
      );
      if (enrollments.items.isEmpty) {
        if (!mounted) return;
        AppToast.error(context, 'لا يوجد تسجيل نشط لهذا الطالب');
        setState(() => _submitting = false);
        return;
      }

      final recordedOn =
          '${_recordedOn.year.toString().padLeft(4, '0')}-${_recordedOn.month.toString().padLeft(2, '0')}-${_recordedOn.day.toString().padLeft(2, '0')}';

      await _service.recordMemorization(
        enrollments.items.first.id,
        entryType: _entryType,
        fromPage: int.parse(_fromPageCtrl.text),
        toPage: int.parse(_toPageCtrl.text),
        recordedOn: recordedOn,
        teacherId: '${widget.token.user?.id}',
        notes: '',
      );

      if (!mounted) return;
      AppToast.success(context, 'تم تسجيل الحفظ بنجاح');
      setState(() {
        _selectedStudent = null;
        _fromPageCtrl.clear();
        _toPageCtrl.clear();
        _entryType = 'new';
        _submitting = false;
      });
      FocusScope.of(context).unfocus();
    } catch (e) {
      if (!mounted) return;
      AppToast.error(context, e.toString());
      setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.canRecordMemorization) {
      return const _ComingSoonTab(
        icon: Icons.record_voice_over_rounded,
        title: 'التسميع',
        subtitle: 'عرض سجلات التسميع (بدون صلاحية تسجيل)',
      );
    }

    final dateStr = DateFormat('d MMMM yyyy', 'ar').format(_recordedOn);
    final fillColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withOpacity(0.06)
        : AppColors.primaryLight.withOpacity(0.06);

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        children: [
          Text('الطالب',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
          const SizedBox(height: 10),
          _StudentSelectField(
            selected: _selectedStudent,
            fillColor: fillColor,
            onSearch: _searchStudents,
            onSelected: (s) => setState(() => _selectedStudent = s),
            onCleared: () => setState(() => _selectedStudent = null),
          ),
          const SizedBox(height: 20),
          Text('نوع التسجيل',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _EntryTypeChip(
                  label: 'حفظ جديد',
                  icon: Icons.auto_stories_rounded,
                  selected: _entryType == 'new',
                  onTap: () => setState(() => _entryType = 'new'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _EntryTypeChip(
                  label: 'مراجعة',
                  icon: Icons.replay_rounded,
                  selected: _entryType == 'review',
                  onTap: () => setState(() => _entryType = 'review'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('نطاق الصفحات',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _fromPageCtrl,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
                  decoration: InputDecoration(
                    labelText: 'من صفحة',
                    labelStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13),
                    prefixIcon: const Icon(Icons.first_page_rounded, size: 20, color: AppColors.primaryLight),
                    filled: true,
                    fillColor: fillColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                  validator: (v) => (v == null || int.tryParse(v) == null) ? 'مطلوب' : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _toPageCtrl,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
                  decoration: InputDecoration(
                    labelText: 'إلى صفحة',
                    labelStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13),
                    prefixIcon: const Icon(Icons.last_page_rounded, size: 20, color: AppColors.primaryLight),
                    filled: true,
                    fillColor: fillColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                  validator: (v) {
                    final to = int.tryParse(v ?? '');
                    final from = int.tryParse(_fromPageCtrl.text);
                    if (to == null) return 'مطلوب';
                    if (from != null && to < from) return 'غير صحيح';
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('التاريخ',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(color: fillColor, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                const Icon(Icons.today_rounded, size: 20, color: AppColors.primaryLight),
                const SizedBox(width: 12),
                Text(dateStr, style: const TextStyle(fontFamily: 'Cairo', fontSize: 15)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('اليوم',
                      style: TextStyle(fontFamily: 'Cairo', fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primaryLight)),
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
                backgroundColor: AppColors.primaryLight,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              child: _submitting
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white))
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.send_rounded, size: 18),
                        SizedBox(width: 8),
                        Text('إرسال', style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w800, fontSize: 15)),
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
          border: Border.all(color: AppColors.primaryLight.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(11)),
              child: Center(
                child: Text(
                  selected!.fullName.isNotEmpty ? selected!.fullName.trim()[0] : '؟',
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800, fontFamily: 'Cairo'),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selected!.fullName,
                      style: TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface)),
                  if (selected!.gradeLevel.isNotEmpty)
                    Text(selected!.gradeLevel, style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 20),
              onPressed: onCleared,
              color: AppColors.textMuted,
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
          style: const TextStyle(fontFamily: 'Cairo', fontSize: 14),
          decoration: InputDecoration(
            hintText: 'اكتب اسم الطالب للبحث...',
            hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13),
            prefixIcon: const Icon(Icons.search_rounded),
            suffixIcon: const Icon(Icons.arrow_drop_down_rounded),
            filled: true,
            fillColor: fillColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
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
                      decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(s.fullName.isNotEmpty ? s.fullName.trim()[0] : '؟',
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
                      ),
                    ),
                    title: Text(s.fullName, style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w600)),
                    subtitle: s.gradeLevel.isNotEmpty
                        ? Text(s.gradeLevel, style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted))
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
  const _EntryTypeChip({required this.label, required this.icon, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: selected ? AppColors.gradientPrimary : null,
          color: selected ? null : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? Colors.transparent : Theme.of(context).dividerColor,
            width: 1.4,
          ),
          boxShadow: selected
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))]
              : null,
        ),
        child: Column(
          children: [
            Icon(icon, size: 22, color: selected ? Colors.white : AppColors.textMuted),
            const SizedBox(height: 6),
            Text(label,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : Theme.of(context).colorScheme.onSurface,
                )),
          ],
        ),
      ),
    );
  }
}

// ─── Notes Tab ────────────────────────────────────────────────────────────────
class _NotesTab extends StatelessWidget {
  const _NotesTab();

  @override
  Widget build(BuildContext context) {
    return const _ComingSoonTab(
      icon: Icons.note_alt_rounded,
      title: 'الملاحظات',
      subtitle: 'ملاحظات الطلاب والحلقة',
    );
  }
}

// ─── Attendance Tab ───────────────────────────────────────────────────────────
class _AttendanceTab extends StatelessWidget {
  const _AttendanceTab();

  @override
  Widget build(BuildContext context) {
    return const _ComingSoonTab(
      icon: Icons.event_available_rounded,
      title: 'حضور الحلقة',
      subtitle: 'سجل حضور الطلاب',
    );
  }
}

// ─── Trial Exam Tab ───────────────────────────────────────────────────────────
class _TrialExamTab extends StatelessWidget {
  final bool canRecord;
  const _TrialExamTab({this.canRecord = false});

  @override
  Widget build(BuildContext context) {
    return _ComingSoonTab(
      icon: Icons.science_rounded,
      title: 'السبر التجريبي',
      subtitle: canRecord
          ? 'نتائج واختبارات السبر التجريبي'
          : 'عرض نتائج السبر التجريبي (بدون صلاحية تسجيل)',
    );
  }
}

// ─── Final Exam Tab ───────────────────────────────────────────────────────────
class _FinalExamTab extends StatelessWidget {
  final bool canRecord;
  const _FinalExamTab({this.canRecord = false});

  @override
  Widget build(BuildContext context) {
    return _ComingSoonTab(
      icon: Icons.verified_rounded,
      title: 'السير النهائي',
      subtitle: canRecord
          ? 'نتائج السير النهائي'
          : 'عرض نتائج السير النهائي (بدون صلاحية تسجيل)',
    );
  }
}

// ─── Points Tab — نقاط الطلاب من enrollments (final_points/memorized_pages) ──
class _PointsTab extends StatefulWidget {
  const _PointsTab();

  @override
  State<_PointsTab> createState() => _PointsTabState();
}

class _PointsTabState extends State<_PointsTab> {
  final _service = AdminService();
  List<AdminEnrollmentItem> _enrollments = [];
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
      final result = await _service.fetchEnrollments(perPage: 50);
      if (!mounted) return;
      setState(() {
        _enrollments = result.items;
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
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_enrollments.isEmpty) {
      return const _EmptyState(
        icon: Icons.star_outline_rounded,
        message: 'لا يوجد طلاب مسجّلون',
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
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
        border: Border.all(color: AppColors.gold.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
              color: AppColors.gold.withOpacity(0.06),
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
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  enrollment.groupName,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          _InfoChip(
            icon: Icons.star_rounded,
            label: '${enrollment.finalPoints} نقطة',
            color: AppColors.gold,
          ),
          const SizedBox(width: 8),
          _InfoChip(
            icon: Icons.menu_book_rounded,
            label: '${enrollment.memorizedPages} صفحة',
            color: AppColors.primaryLight,
          ),
        ],
      ),
    );
  }
}

// ─── Activities Tab ───────────────────────────────────────────────────────────
class _ActivitiesTab extends StatefulWidget {
  const _ActivitiesTab();

  @override
  State<_ActivitiesTab> createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends State<_ActivitiesTab> {
  final _service = AdminService();
  List<AdminActivityItem> _activities = [];
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
      final result = await _service.fetchActivities(perPage: 50);
      if (!mounted) return;
      setState(() {
        _activities = result.items;
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
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_activities.isEmpty) {
      return const _EmptyState(
        icon: Icons.event_note_rounded,
        message: 'لا توجد أنشطة حالياً',
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
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
    final color = activity.isActive ? AppColors.info : AppColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.06),
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
              fontFamily: 'Cairo',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          if (activity.groupName != null) ...[
            const SizedBox(height: 4),
            Text(
              activity.groupName!,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 11,
                color: AppColors.textMuted,
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
class _AssessmentsTab extends StatefulWidget {
  const _AssessmentsTab();

  @override
  State<_AssessmentsTab> createState() => _AssessmentsTabState();
}

class _AssessmentsTabState extends State<_AssessmentsTab> {
  final _service = AdminService();
  List<AdminAssessmentItem> _assessments = [];
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
      final result = await _service.fetchAssessments(perPage: 50);
      if (!mounted) return;
      setState(() {
        _assessments = result.items;
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
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_assessments.isEmpty) {
      return const _EmptyState(
        icon: Icons.assignment_outlined,
        message: 'لا توجد تقييمات حالياً',
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
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
    final color = assessment.isActive ? AppColors.success : AppColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.06),
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
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  assessment.isActive ? 'نشط' : 'غير نشط',
                  style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Cairo'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            assessment.groupName,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _InfoChip(
                icon: Icons.grade_rounded,
                label:
                    '${assessment.passMark.toStringAsFixed(0)}/${assessment.totalMark.toStringAsFixed(0)}',
                color: AppColors.info,
              ),
              const SizedBox(width: 8),
              _InfoChip(
                icon: Icons.fact_check_rounded,
                label: '${assessment.resultsCount} نتيجة',
                color: AppColors.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Reports Tab ──────────────────────────────────────────────────────────────
class _ReportsTab extends StatefulWidget {
  const _ReportsTab();

  @override
  State<_ReportsTab> createState() => _ReportsTabState();
}

class _ReportsTabState extends State<_ReportsTab> {
  final _service = AdminService();
  List<AdminGroupItem> _groups = [];
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
      final result = await _service.fetchGroups(perPage: 50);
      if (!mounted) return;
      setState(() {
        _groups = result.items;
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
      return _PermissionAwareError(message: _error!, onRetry: _load);
    }
    if (_groups.isEmpty) {
      return const _EmptyState(
        icon: Icons.bar_chart_rounded,
        message: 'لا توجد حلقات مرتبطة',
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
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
    final color = group.isActive ? AppColors.primaryLight : AppColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.08),
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
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.groups_rounded, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  group.name,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  group.isActive ? 'نشطة' : 'غير نشطة',
                  style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Cairo'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _InfoChip(
                icon: Icons.people_rounded,
                label: '${group.enrollmentsCount} طالب',
                color: AppColors.info,
              ),
              const SizedBox(width: 8),
              if (group.teacher.isNotEmpty)
                _InfoChip(
                  icon: Icons.person_rounded,
                  label: group.teacher,
                  color: AppColors.warning,
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
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 11,
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
              color: AppColors.primaryLight.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: AppColors.primaryLight),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.gold.withOpacity(0.3)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.construction_rounded,
                    size: 14, color: AppColors.gold),
                SizedBox(width: 6),
                Text(
                  'قيد الإنشاء',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: AppColors.gold,
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
    final color = _isForbidden ? AppColors.warning : AppColors.error;
    final icon =
        _isForbidden ? Icons.lock_outline_rounded : Icons.error_outline_rounded;
    final title = _isForbidden ? 'ليس لديك صلاحية' : 'حدث خطأ';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: color),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
            if (!_isForbidden) ...[
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('إعادة المحاولة',
                    style: TextStyle(fontFamily: 'Cairo')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLight,
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: AppColors.textMuted),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 14,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
