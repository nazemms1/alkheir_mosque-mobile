import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/theme/app_theme.dart';
import '../../../main.dart' show themeNotifier;
import '../../../data/models/student_model.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/permissions.dart';
import '../../../data/services/student_service.dart';
import '../../../data/services/auth_service.dart';
import '../../auth/screens/login_screen.dart';
import 'home_screen.dart';
import '../../child_profile/screens/child_profile_screen.dart';
import '../../attendance/screens/attendance_screen.dart';
import '../../memorization/screens/memorization_screen.dart';
import '../../points/screens/points_screen.dart';
import '../../notifications/screens/notifications_screen.dart';
import '../../admin/screens/admin_dashboard_screen.dart';
import '../../admin/screens/admin_groups_screen.dart';
import '../../admin/screens/admin_students_screen.dart';
import '../../admin/screens/admin_assessments_screen.dart';
import '../../admin/screens/admin_finance_screen.dart';
import '../../supervisor/screens/supervisor_shell.dart';

class MainShell extends StatefulWidget {
  final AuthToken token;
  const MainShell({super.key, required this.token});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> with TickerProviderStateMixin {
  int _currentIndex = 0;
  int _selectedChildIndex = 0;
  ParentDashboardData? _data;
  ParentProfile? _parentProfile;
  ParentSummary? _parentSummary;
  bool _loading = true;
  String? _error;
  late final AnimationController _appBarCtrl;
  late final AnimationController _pulseCtrl;
  late final Animation<double> _appBarAnim;
  late final Animation<double> _pulseAnim;

  final _studentService = StudentService();

  @override
  void initState() {
    super.initState();
    _appBarCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _appBarAnim =
        CurvedAnimation(parent: _appBarCtrl, curve: Curves.easeOutCubic);
    _pulseAnim = CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut);
    _appBarCtrl.forward();
    _loadData();
  }

  Future<void> _loadData() async {
    if (!_isParentOrStudent) {
      setState(() => _loading = false);
      return;
    }
    try {
      final dashboard = await _studentService.fetchDashboard();
      if (!mounted) return;
      final childDataList = dashboard.children
          .map(_studentService.childDetailToChildData)
          .toList();
      setState(() {
        _parentProfile = dashboard.profile;
        _parentSummary = dashboard.summary;
        _data = ParentDashboardData(
          children: childDataList.isNotEmpty ? childDataList : [_emptyChild()],
          notifications: const [],
        );
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

  ChildData _emptyChild() => ChildData(
        student: const StudentModel(
          id: '-',
          name: 'لا يوجد طلاب مسجّلون',
          avatarInitials: '؟',
          groupName: '',
          courseName: '',
          teacherName: '',
          academicYear: '',
          enrollmentYear: 0,
          phone: '',
        ),
        attendanceRecords: const [],
        memorizationProgress: const MemorizationProgress(
          totalPagesMemorized: 0,
          totalQuranPages: 604,
          currentSurah: '',
          currentJuz: 1,
          sections: [],
        ),
        pointRecords: const [],
        evaluations: const [],
        sabrRecords: const [],
        notes: const [],
        totalPoints: 0,
      );

  @override
  void dispose() {
    _appBarCtrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  void _changeTab(int index) {
    if (_currentIndex == index) return;
    HapticFeedback.selectionClick();
    setState(() => _currentIndex = index);
  }

  void _openNotifications() {
    final studentId = (!widget.token.isAdmin && _data != null && _data!.children.isNotEmpty)
        ? int.tryParse(_activeChild.student.id)
        : null;
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, a, __) => NotificationsScreen(studentId: studentId),
        transitionsBuilder: (_, a, __, child) => SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
          child: FadeTransition(opacity: a, child: child),
        ),
        transitionDuration: const Duration(milliseconds: 420),
      ),
    );
  }

  void _showUserProfileSheet() {
    if (_isStaff) {
      _showAdminProfileSheet();
      return;
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _UserProfileSheet(
        data: _data!,
        parentProfile: _parentProfile,
        parentSummary: _parentSummary,
        onLogout: _handleLogout,
      ),
    );
  }

  void _showAdminProfileSheet() {
    final user = widget.token.user;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetBg = isDark ? const Color(0xFF0A1A0D) : Colors.white;
    final dividerColor = isDark ? const Color(0xFF1E3320) : const Color(0xFFE2EDE4);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: sheetBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.35),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientGold,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.gold.withOpacity(0.45),
                            blurRadius: 18,
                            spreadRadius: 2),
                      ],
                    ),
                    child: const Icon(Icons.admin_panel_settings_rounded,
                        color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? 'المدير',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.25)),
                          ),
                          child: Text(
                            widget.token.displayRole,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        if (user?.username.isNotEmpty == true) ...[
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.badge_rounded,
                                  color: Colors.white.withOpacity(0.6), size: 13),
                              const SizedBox(width: 4),
                              Text(
                                user!.username,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.65),
                                  fontSize: 11,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _ThemeToggleItem(isDark: isDark),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(color: dividerColor, height: 1),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: GestureDetector(
                onTap: _handleLogout,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.error.withOpacity(0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogout() {
    Navigator.of(context).pop(); // close sheet
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('تسجيل الخروج',
            style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700)),
        content: const Text('هل تريد تسجيل الخروج من الحساب؟',
            style: TextStyle(fontFamily: 'Cairo')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('إلغاء',
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                    fontFamily: 'Cairo')),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await AuthService().logout();
              if (!mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (_) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('تسجيل الخروج',
                style: TextStyle(fontFamily: 'Cairo')),
          ),
        ],
      ),
    );
  }

  ChildData get _activeChild => _data!.children[_selectedChildIndex];

  void _onChildSelected(int index) {
    if (_selectedChildIndex == index) return;
    HapticFeedback.selectionClick();
    setState(() => _selectedChildIndex = index);
  }

  bool get _isParentOrStudent =>
      widget.token.isParent || widget.token.isStudent;

  bool get _isStaff => widget.token.isAnyStaff;

  /// تبويبات لوحة المدير — كل تبويب مرتبط بالصلاحية المطلوبة للوصول إليه.
  /// التبويب الأول (الرئيسية) متاح دائماً للمدير.
  List<_AdminTabDef> get _adminTabs {
    final token = widget.token;
    return [
      _AdminTabDef(
        nav: const _NavConfig(
            icon: Icons.dashboard_outlined,
            activeIcon: Icons.dashboard_rounded,
            label: 'الرئيسية'),
        title: 'الرئيسية',
        subtitle: 'لوحة التحكم',
        screen: AdminHomeTab(token: token),
      ),
      if (token.hasPermission(Permissions.groupsView))
        _AdminTabDef(
          nav: const _NavConfig(
              icon: Icons.groups_outlined,
              activeIcon: Icons.groups_rounded,
              label: 'الحلقات'),
          title: 'الحلقات',
          subtitle: 'إدارة الحلقات',
          screen: AdminGroupsScreen(token: token),
        ),
      if (token.hasPermission(Permissions.studentsView))
        _AdminTabDef(
          nav: const _NavConfig(
              icon: Icons.people_outline_rounded,
              activeIcon: Icons.people_rounded,
              label: 'الطلاب'),
          title: 'الطلاب',
          subtitle: 'قائمة الطلاب',
          screen: const AdminStudentsScreen(),
        ),
      if (token.hasPermission(Permissions.assessmentsView))
        _AdminTabDef(
          nav: const _NavConfig(
              icon: Icons.assignment_outlined,
              activeIcon: Icons.assignment_rounded,
              label: 'التقييمات'),
          title: 'التقييمات',
          subtitle: 'التقييمات والاختبارات',
          screen: const AdminAssessmentsScreen(),
        ),
      if (token.hasPermission(Permissions.invoicesView))
        _AdminTabDef(
          nav: const _NavConfig(
              icon: Icons.account_balance_wallet_outlined,
              activeIcon: Icons.account_balance_wallet_rounded,
              label: 'المالية'),
          title: 'المالية',
          subtitle: 'الفواتير والأنشطة',
          screen: const AdminFinanceScreen(),
        ),
    ];
  }

  /// تبويبات الأدوار الإشرافية (مشرف حلقة/مساعد/مسمّع/مشرف سبر...) — كل
  /// تبويب مرتبط بالصلاحية المطلوبة للوصول إليه، والأول (الرئيسية) دائماً متاح.
  List<SupervisorNavTab> get _supervisorTabs => supervisorNavTabs(widget.token);

  List<Widget> get _screens {
    if (_isParentOrStudent && _data != null) {
      return [
        HomeScreen(
          data: _data!,
          selectedChildIndex: _selectedChildIndex,
          onChildSelected: _onChildSelected,
          onTabChange: _changeTab,
        ),
        ChildProfileScreen(student: _activeChild.student),
        AttendanceScreen(
          records: _activeChild.attendanceRecords,
          studentId: int.tryParse(_activeChild.student.id),
        ),
        MemorizationScreen(
          progress: _activeChild.memorizationProgress,
          studentId: int.tryParse(_activeChild.student.id),
        ),
        PointsScreen(
          pointRecords: _activeChild.pointRecords,
          evaluations: _activeChild.evaluations,
          totalPoints: _activeChild.totalPoints,
          studentId: int.tryParse(_activeChild.student.id),
        ),
      ];
    }
    // مشرف إداري — لوحة تحكم كاملة (كل تبويب مرتبط بصلاحية الوصول إليه)
    if (widget.token.isAdmin) {
      return _adminTabs.map((t) => t.screen).toList();
    }
    // أي دور إشرافي آخر — تبويبات مرتبطة بصلاحيات الحساب
    if (_isStaff) {
      return _supervisorTabs.map((t) => t.body).toList();
    }
    return [_RoleComingSoon(role: widget.token.roles.join(', '))];
  }

  List<_NavConfig> get _navItems {
    if (_isParentOrStudent) {
      return const [
        _NavConfig(
            icon: Icons.home_outlined,
            activeIcon: Icons.home_rounded,
            label: 'الرئيسية'),
        _NavConfig(
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person_rounded,
            label: 'الطالب'),
        _NavConfig(
            icon: Icons.calendar_month_outlined,
            activeIcon: Icons.calendar_month_rounded,
            label: 'الحضور'),
        _NavConfig(
            icon: Icons.menu_book_outlined,
            activeIcon: Icons.menu_book_rounded,
            label: 'الحفظ'),
        _NavConfig(
            icon: Icons.star_outline_rounded,
            activeIcon: Icons.star_rounded,
            label: 'النقاط'),
      ];
    }
    if (widget.token.isAdmin) {
      return _adminTabs.map((t) => t.nav).toList();
    }
    // أدوار إشرافية — تبويبات مرتبطة بصلاحيات الحساب
    if (_isStaff) {
      return _supervisorTabs
          .map((t) => _NavConfig(icon: t.icon, activeIcon: t.activeIcon, label: t.label))
          .toList();
    }
    return const [
      _NavConfig(
          icon: Icons.home_outlined,
          activeIcon: Icons.home_rounded,
          label: 'الرئيسية'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline_rounded,
                  size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text(_error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'Cairo')),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _loading = true;
                    _error = null;
                  });
                  _loadData();
                },
                child: const Text('إعادة المحاولة',
                    style: TextStyle(fontFamily: 'Cairo')),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      appBar: _buildAppBar(),
      body: IndexedStack(
          key: ValueKey(_selectedChildIndex),
          index: _currentIndex,
          children: _screens),
      bottomNavigationBar: _PremiumNavBar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: _changeTab,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final List<String> titles;
    final List<String> subtitles;

    if (widget.token.isAdmin) {
      final tabs = _adminTabs;
      titles    = tabs.map((t) => t.title).toList();
      subtitles = tabs.map((t) => t.subtitle).toList();
    } else if (_isStaff) {
      final tabs = _supervisorTabs;
      titles    = tabs.map((t) => t.label).toList();
      subtitles = tabs.map((t) => t.subtitle).toList();
    } else {
      titles    = ['الرئيسية', 'بيانات الطالب', 'سجل الحضور', 'المحفوظات', 'النقاط والتقييمات'];
      subtitles = ['مرحباً بك في مسجد الخير', 'ملفات أبنائك', 'سجلات الحضور', 'سجلات الحفظ', 'النقاط والتقييمات'];
    }

    return PreferredSize(
      preferredSize: const Size.fromHeight(72),
      child: FadeTransition(
        opacity: _appBarAnim,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF071A0A),
                Color(0xFF0D5016),
                Color(0xFF1A7A26),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0D5016).withOpacity(0.5),
                blurRadius: 28,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Stack(
              children: [
                // Decorative arc in top-right
                Positioned(
                  top: -30,
                  left: -20,
                  child: _GlowOrb(
                      size: 100,
                      color: AppColors.primaryLight,
                      opacity: 0.08,
                      pulseAnim: _pulseAnim),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      // Brand logo + name
                      GestureDetector(
                        onTap: _showUserProfileSheet,
                        child: Row(
                          children: [
                            AnimatedBuilder(
                              animation: _pulseAnim,
                              builder: (_, child) => Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF2EA043),
                                      Color(0xFF1A7A26)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(
                                          0.2 + 0.1 * _pulseAnim.value),
                                      width: 1.5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryLight.withOpacity(
                                          0.3 + 0.15 * _pulseAnim.value),
                                      blurRadius: 12,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.mosque_rounded,
                                    color: Colors.white, size: 24),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'مسجد الخير',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Cairo',
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                Text(
                                  subtitles[_currentIndex],
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 10,
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Current page title (pill)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.15)),
                          ),
                          child: Text(
                            titles[_currentIndex],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Notification bell
                      _NotificationButton(
                        count: _data?.unreadNotifications ?? 0,
                        onTap: _openNotifications,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Glow Orb decoration ──────────────────────────────────────────────────────
class _GlowOrb extends StatelessWidget {
  final double size, opacity;
  final Color color;
  final Animation<double> pulseAnim;

  const _GlowOrb({
    required this.size,
    required this.color,
    required this.opacity,
    required this.pulseAnim,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulseAnim,
      builder: (_, __) => Container(
        width: size + 10 * pulseAnim.value,
        height: size + 10 * pulseAnim.value,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(opacity + 0.03 * pulseAnim.value),
        ),
      ),
    );
  }
}

// ─── Notification Button ──────────────────────────────────────────────────────
class _NotificationButton extends StatelessWidget {
  final int count;
  final VoidCallback onTap;
  const _NotificationButton({required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.notifications_rounded,
                color: Colors.white, size: 22),
          ),
          if (count > 0)
            Positioned(
              top: -5,
              left: -5,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFF7070), Color(0xFFEF4444)]),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF0D5016), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.error.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$count',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ).animate().scale(
                    begin: const Offset(0.5, 0.5),
                    end: const Offset(1, 1),
                    curve: Curves.elasticOut,
                    duration: 600.ms,
                  ),
            ),
        ],
      ),
    );
  }
}

// ─── User Profile Bottom Sheet ────────────────────────────────────────────────
class _UserProfileSheet extends StatelessWidget {
  final ParentDashboardData data;
  final ParentProfile? parentProfile;
  final ParentSummary? parentSummary;
  final VoidCallback onLogout;

  const _UserProfileSheet({
    required this.data,
    this.parentProfile,
    this.parentSummary,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final student = data.children.first.student;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetBg = isDark ? const Color(0xFF0A1A0D) : Colors.white;
    final dividerColor =
        isDark ? const Color(0xFF1E3320) : const Color(0xFFE2EDE4);

    // بيانات الوالد من الـ API أو fallback للبيانات القديمة
    final displayName = parentProfile != null
        ? 'ولي أمر: ${parentProfile!.fatherName}'
        : 'ولي أمر: ${student.name.split(' ').take(3).join(' ')}';
    final displayInitials =
        parentProfile?.avatarInitials ?? student.avatarInitials;
    final displayGroup = parentProfile != null
        ? 'رقم الوالد: ${parentProfile!.parentNumber}'
        : student.groupName;
    final displayId = parentProfile?.parentNumber ?? student.id;
    final totalPoints = parentSummary?.points ??
        data.children.fold<int>(0, (s, c) => s + c.totalPoints);
    final childrenCount = parentSummary?.children ?? data.children.length;
    final totalMemorized = parentSummary?.memorizedPages ??
        data.children.fold<int>(
            0, (s, c) => s + c.memorizationProgress.totalPagesMemorized);

    return Container(
      decoration: BoxDecoration(
        color: sheetBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 44,
            height: 4,
            decoration: BoxDecoration(
              color: dividerColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Hero section
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF071A0A),
                  Color(0xFF0D5016),
                  Color(0xFF1A7A26)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.gradientGold,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.gold.withOpacity(0.45),
                          blurRadius: 18,
                          spreadRadius: 2),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      displayInitials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.25)),
                        ),
                        child: Text(
                          displayGroup,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.badge_rounded,
                              color: Colors.white.withOpacity(0.6), size: 13),
                          const SizedBox(width: 4),
                          Text(
                            displayId,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.65),
                              fontSize: 11,
                              fontFamily: 'Cairo',
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
              .animate()
              .fadeIn(duration: 300.ms)
              .slideY(begin: 0.1, end: 0, curve: Curves.easeOutCubic),
          const SizedBox(height: 16),
          // Quick stats row — totals across all children
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _SheetStat(
                    label: 'إجمالي النقاط',
                    value: '$totalPoints',
                    icon: Icons.star_rounded,
                    color: AppColors.gold),
                const SizedBox(width: 10),
                _SheetStat(
                    label: 'عدد الأبناء',
                    value: '$childrenCount',
                    icon: Icons.group_rounded,
                    color: AppColors.success),
                const SizedBox(width: 10),
                _SheetStat(
                    label: 'إجمالي صفحات',
                    value: '$totalMemorized',
                    icon: Icons.menu_book_rounded,
                    color: AppColors.primaryLight),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms, duration: 300.ms),
          const SizedBox(height: 16),
          // Menu items
          _SheetMenuItem(
            icon: Icons.person_rounded,
            label: 'بيانات الحساب',
            subtitle: 'معلومات ولي الأمر والطالب',
            color: AppColors.info,
            onTap: () => Navigator.pop(context),
          ).animate().fadeIn(delay: 150.ms).slideX(begin: 0.05, end: 0),
          _SheetMenuItem(
            icon: Icons.notifications_rounded,
            label: 'إعدادات الإشعارات',
            subtitle: 'تخصيص التنبيهات والإشعارات',
            color: AppColors.warning,
            onTap: () => Navigator.pop(context),
          ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.05, end: 0),
          _SheetMenuItem(
            icon: Icons.help_rounded,
            label: 'المساعدة والدعم',
            subtitle: 'تواصل مع إدارة المسجد',
            color: AppColors.primaryLight,
            onTap: () => Navigator.pop(context),
          ).animate().fadeIn(delay: 250.ms).slideX(begin: 0.05, end: 0),
          _ThemeToggleItem(isDark: isDark)
              .animate()
              .fadeIn(delay: 300.ms)
              .slideX(begin: 0.05, end: 0),
          const SizedBox(height: 8),
          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: dividerColor, height: 1),
          ),
          const SizedBox(height: 8),
          // Logout
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: GestureDetector(
              onTap: onLogout,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.error.withOpacity(0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_rounded, color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0),
          ),
        ],
      ),
    );
  }
}

class _SheetStat extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _SheetStat(
      {required this.label,
      required this.value,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.07),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 4),
            Text(value,
                style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo')),
            Text(label,
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                    fontSize: 10,
                    fontFamily: 'Cairo')),
          ],
        ),
      ),
    );
  }
}

class _SheetMenuItem extends StatelessWidget {
  final IconData icon;
  final String label, subtitle;
  final Color color;
  final VoidCallback onTap;

  const _SheetMenuItem({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).dividerColor),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface)),
                    Text(subtitle,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 11,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5))),
                  ],
                ),
              ),
              Icon(Icons.chevron_left_rounded,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                  size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Theme Toggle Item ────────────────────────────────────────────────────────
class _ThemeToggleItem extends StatelessWidget {
  final bool isDark;
  const _ThemeToggleItem({required this.isDark});

  Future<void> _toggle() async {
    themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', !isDark);
  }

  @override
  Widget build(BuildContext context) {
    final color = isDark ? AppColors.goldLight : AppColors.gold;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: GestureDetector(
        onTap: _toggle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF111F14) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? const Color(0xFF1E3320) : const Color(0xFFE2EDE4),
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: color,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isDark ? 'الوضع النهاري' : 'الوضع الليلي',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textOnDark
                            : AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      isDark
                          ? 'التبديل إلى المظهر الفاتح'
                          : 'التبديل إلى المظهر الداكن',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 11,
                        color: isDark
                            ? AppColors.textOnDarkMute
                            : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: isDark,
                onChanged: (_) => _toggle(),
                activeColor: AppColors.primaryGlow,
                activeTrackColor: AppColors.primaryLight.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Nav Config ───────────────────────────────────────────────────────────────
class _NavConfig {
  final IconData icon, activeIcon;
  final String label;
  const _NavConfig(
      {required this.icon, required this.activeIcon, required this.label});
}

// ─── Admin Tab Definition (nav + title/subtitle + screen, permission-gated) ───
class _AdminTabDef {
  final _NavConfig nav;
  final String title;
  final String subtitle;
  final Widget screen;
  const _AdminTabDef({
    required this.nav,
    required this.title,
    required this.subtitle,
    required this.screen,
  });
}

// ─── Premium Nav Bar ──────────────────────────────────────────────────────────
class _PremiumNavBar extends StatelessWidget {
  final List<_NavConfig> items;
  final int currentIndex;
  final void Function(int) onTap;

  const _PremiumNavBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 22),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D5016).withOpacity(0.18),
            blurRadius: 36,
            spreadRadius: -4,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isActive = i == currentIndex;
          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.opaque,
            child: _NavItem(item: item, isActive: isActive),
          );
        }),
      ),
    );
  }
}

// ─── Nav Item ─────────────────────────────────────────────────────────────────
// Uses AnimatedSize to grow/shrink safely without lerping BoxDecoration.
class _NavItem extends StatefulWidget {
  final _NavConfig item;
  final bool isActive;
  const _NavItem({required this.item, required this.isActive});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: widget.isActive
            ? BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0D5016), Color(0xFF2EA043)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0D5016).withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.isActive ? widget.item.activeIcon : widget.item.icon,
              color: widget.isActive ? Colors.white : AppColors.textMuted,
              size: 22,
            ),
            if (widget.isActive) ...[
              const SizedBox(width: 7),
              Text(
                widget.item.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// شاشة مؤقتة لأدوار لم تُبنَ بعد (معلم / إدارة)
class _RoleComingSoon extends StatelessWidget {
  final String role;
  const _RoleComingSoon({required this.role});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.construction_rounded,
              size: 56, color: AppColors.primaryLight),
          const SizedBox(height: 16),
          Text(
            'مرحباً — $role',
            style: const TextStyle(
                fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'شاشات هذا الدور قيد الإنشاء',
            style: TextStyle(
                fontFamily: 'Cairo', fontSize: 13, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
