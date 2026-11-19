import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/app/core/navigation/app_tab.dart';
import 'package:alkheir_mosque/app/core/navigation/tab_registry.dart';
import 'package:alkheir_mosque/app/core/session/auth_session.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/students/data/models/student_model.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/students/data/repositories/student_repository_impl.dart';
import 'package:alkheir_mosque/features/account/presentation/screens/account_screen.dart';
import 'package:alkheir_mosque/features/auth/presentation/screens/login_screen.dart';
import 'package:alkheir_mosque/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/di/di_locator.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/home/presentation/widgets/app_drawer.dart';
import 'package:alkheir_mosque/app/core/widgets/app_feedback.dart';
import 'package:alkheir_mosque/app/core/widgets/geometric_pattern.dart';
import 'package:alkheir_mosque/app/core/config/support_contact.dart';

class MainShell extends ConsumerStatefulWidget {
  final AuthToken token;
  const MainShell({super.key, required this.token});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  int _selectedChildIndex = 0;
  static const _maxBarItems = 4;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ParentDashboardData? _data;
  ParentProfile? _parentProfile;
  ParentSummary? _parentSummary;
  bool _loading = true;
  String? _error;
  late final AnimationController _appBarCtrl;
  late final Animation<double> _appBarAnim;

  final _studentService = StudentRepositoryImpl();

  @override
  void initState() {
    super.initState();
    _appBarCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _appBarAnim =
        CurvedAnimation(parent: _appBarCtrl, curve: Curves.easeOutCubic);
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
        _error = errorText(e);
        _loading = false;
      });
    }
  }

  ChildData _emptyChild() => ChildData(
        student: StudentModel(
          id: '-',
          name: tr('لا يوجد طلاب مسجّلون'),
          avatarInitials: tr('؟'),
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
    super.dispose();
  }

  void _changeTab(int index) {
    if (_currentIndex == index) return;
    HapticFeedback.selectionClick();
    setState(() => _currentIndex = index);
  }

  void _openDrawer() {
    HapticFeedback.selectionClick();
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openAccountFromDrawer() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AccountScreen()),
    );
  }

  void _openNotifications() {
    final studentId =
        (!widget.token.isAdmin && _data != null && _data!.children.isNotEmpty)
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) => _StaffProfileSheet(
        token: widget.token,
        onOpenAccount: () {
          Navigator.pop(sheetCtx);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AccountScreen()),
          );
        },
        onLogout: () {
          Navigator.pop(sheetCtx);
          _confirmLogout();
        },
      ),
    );
  }

  /// يغلق ورقة الملف الشخصي ثم يسأل عن تسجيل الخروج.
  void _handleLogout() {
    Navigator.of(context).pop(); // close sheet
    _confirmLogout();
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (ctx) {
        final scheme = Theme.of(ctx).colorScheme;
        return Dialog(
          backgroundColor: scheme.surface,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 26, 22, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.logout_rounded,
                      color: AppColors.error, size: 30),
                ),
                const SizedBox(height: 16),
                Text(
                  tr('تسجيل الخروج'),
                  style: appTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tr('هل تريد تسجيل الخروج من الحساب؟'),
                  textAlign: TextAlign.center,
                  style: appTextStyle(
                    fontSize: 14,
                    color: scheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(ctx),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(
                          tr('إلغاء'),
                          style: appTextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FilledButton(
                        onPressed: () async {
                          Navigator.pop(ctx);
                          await ref
                              .read(authSessionProvider.notifier)
                              .logout();
                          if (!mounted) return;
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()),
                            (_) => false,
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.error,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(
                          tr('تسجيل الخروج'),
                          style: appTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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

  /// كل حساب ليس ولي أمر/طالب يُعامل كحساب طاقم (ملف إداري بلا بيانات أبناء).
  bool get _isStaff => !_isParentOrStudent;

  /// تبويبات الحساب الحالي — تأتي جاهزة ومرشَّحة بالأدوار والصلاحيات من
  /// السجل المركزي (core/navigation/tab_registry.dart). لإضافة صفحة جديدة
  /// عدّل السجل هناك فقط؛ لا شيء هنا يحتاج تعديلاً.
  List<AppTab> get _tabs => tabsFor(widget.token);

  /// السياق الذي تُبنى به شاشات التبويبات (الجلسة + بيانات ولي الأمر + التنقل).
  TabContext get _tabContext => TabContext(
        token: widget.token,
        parentData: _data,
        selectedChildIndex: _selectedChildIndex,
        onChildSelected: _onChildSelected,
        onTabChange: _changeTab,
      );

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
                  style: const TextStyle(fontFamily: 'Dubai')),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _loading = true;
                    _error = null;
                  });
                  _loadData();
                },
                child: Text(tr('إعادة المحاولة'),
                    style: const TextStyle(fontFamily: 'Dubai')),
              ),
            ],
          ),
        ),
      );
    }
    final tabs = _tabs;
    // دور بلا تبويبات معرّفة في السجل — شاشة "قيد الإنشاء"
    if (tabs.isEmpty || (_isParentOrStudent && _data == null)) {
      return Scaffold(
        body: _RoleComingSoon(role: widget.token.roles.join(', ')),
      );
    }
    final ctx = _tabContext;
    final safeIndex = _currentIndex.clamp(0, tabs.length - 1);
    // الشريط السفلي 4 عناصر كحدّ أقصى: إذا زادت التبويبات تظهر 3 منها و"المزيد"
    // الذي يفتح القائمة الجانبية، وتبقى كل الصفحات متاحة من الدرج.
    final overflow = tabs.length > _maxBarItems;
    final directCount = overflow ? _maxBarItems - 1 : tabs.length;
    final navItems = [
      for (final t in tabs.take(directCount))
        _NavConfig(icon: t.icon, activeIcon: t.activeIcon, label: t.label),
      if (overflow)
        _NavConfig(
          icon: Icons.apps_outlined,
          activeIcon: Icons.apps_rounded,
          label: tr('المزيد'),
        ),
    ];
    final navIndex =
        safeIndex < directCount ? safeIndex : (overflow ? directCount : 0);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      appBar: _buildAppBar(tabs, safeIndex),
      drawer: AppDrawer(
        token: widget.token,
        userName: widget.token.user?.name ?? '',
        roleLabel: widget.token.displayRole,
        tabs: tabs,
        overflowFrom: directCount,
        activeIndex: safeIndex,
        onPageSelected: _changeTab,
        onAccount: _openAccountFromDrawer,
        onLogout: _confirmLogout,
      ),
      body: IndexedStack(
          key: ValueKey(_selectedChildIndex),
          index: safeIndex,
          children: tabs.map((t) => t.builder(ctx)).toList()),
      // تبويب واحد لا يحتاج شريط تنقل (NavigationBar يتطلب عنصرين على الأقل).
      bottomNavigationBar: navItems.length < 2
          ? null
          : _PremiumNavBar(
              items: navItems,
              currentIndex: navIndex,
              onTap: (i) =>
                  overflow && i == directCount ? _openDrawer() : _changeTab(i),
            ),
    );
  }

  PreferredSizeWidget _buildAppBar(List<AppTab> tabs, int index) {
    final titles = tabs.map((t) => t.effectiveTitle).toList();

    return PreferredSize(
      preferredSize: const Size.fromHeight(72),
      child: FadeTransition(
        opacity: _appBarAnim,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.surfaceDeepGreen,
                AppColors.brandDeep,
                AppColors.brandGreen,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.brandDeep.withValues(alpha: 0.5),
                blurRadius: 28,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Stack(
              children: [
                const Positioned.fill(child: GeometricPattern(opacity: 0.05)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      _HeaderButton(
                        icon: Icons.menu_rounded,
                        tooltip: tr('القائمة'),
                        onTap: _openDrawer,
                      ),
                      const SizedBox(width: 12),
                      // Current page title (pill)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 7),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.15)),
                          ),
                          child: Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Dubai',
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
                      const SizedBox(width: 10),
                      _HeaderButton(
                        icon: Icons.account_circle_rounded,
                        tooltip: tr('الملف الشخصي'),
                        onTap: _showUserProfileSheet,
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

/// يغلق نافذة الملف الشخصي ثم يفتح شاشة "حسابي".
void _openAccount(BuildContext sheetContext) {
  final navigator = Navigator.of(sheetContext);
  navigator.pop();
  navigator.push(MaterialPageRoute(builder: (_) => const AccountScreen()));
}

// ─── Notification Button ──────────────────────────────────────────────────────
class _NotificationButton extends StatelessWidget {
  final int count;
  final VoidCallback onTap;
  const _NotificationButton({required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final label = count > 0
        ? '${tr('الإشعارات')} ($count)'
        : tr('الإشعارات');
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: Badge(
        isLabelVisible: count > 0,
        label: Text(count > 99 ? '99+' : '$count'),
        backgroundColor: AppColors.error,
        offset: const Offset(4, -4),
        child: _HeaderButton(
          icon: Icons.notifications_rounded,
          tooltip: label,
          onTap: onTap,
        ),
      ),
    );
  }
}

// ─── User Profile Bottom Sheet ────────────────────────────────────────────────
class _UserProfileSheet extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final student = data.children.first.student;
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);
    final c = context.appColors;

    // بيانات الوالد من الـ API أو fallback للبيانات القديمة
    final displayName = parentProfile != null
        ? trf('ولي أمر: {0}', [parentProfile!.fatherName])
        : trf('ولي أمر: {0}', [student.name.split(' ').take(3).join(' ')]);
    final displayInitials =
        parentProfile?.avatarInitials ?? student.avatarInitials;
    final displayGroup = parentProfile != null
        ? trf('رقم الوالد: {0}', [parentProfile!.parentNumber])
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
        color: c.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border(top: BorderSide(color: c.border, width: 1.5)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 6),
                width: 48,
                height: 5,
                decoration: BoxDecoration(
                  color: c.border,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 2, 16, 6),
              child: Row(
                children: [
                  Text(
                    tr('الملف الشخصي'),
                    style: TextStyle(
                      color: c.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Dubai',
                    ),
                  ),
                  const Spacer(),
                  AdminSheetCloseButton(
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            // Hero section
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
              padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.surfaceDeepGreen,
                  AppColors.brandDeep,
                  AppColors.brandGreen
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.15),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3)),
                  ),
                  child: Center(
                    child: Text(
                      displayInitials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Dubai',
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
                          fontFamily: 'Dubai',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.25)),
                        ),
                        child: Text(
                          displayGroup,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Dubai',
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.badge_rounded,
                              color: Colors.white.withValues(alpha: 0.6),
                              size: 13),
                          const SizedBox(width: 4),
                          Text(
                            displayId,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.65),
                              fontSize: 12,
                              fontFamily: 'Dubai',
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
          ),
          const SizedBox(height: 16),
          // Quick stats row — totals across all children
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _SheetStat(
                    label: tr('إجمالي النقاط'),
                    value: '$totalPoints',
                    icon: Icons.star_rounded,
                    color: c.goldText),
                const SizedBox(width: 10),
                _SheetStat(
                    label: tr('عدد الأبناء'),
                    value: '$childrenCount',
                    icon: Icons.group_rounded,
                    color: c.primary),
                const SizedBox(width: 10),
                _SheetStat(
                    label: tr('إجمالي صفحات'),
                    value: '$totalMemorized',
                    icon: Icons.menu_book_rounded,
                    color: c.goldText),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Menu items
          _SheetMenuItem(
            icon: Icons.person_rounded,
            label: tr('بيانات الحساب'),
            subtitle: tr('معلومات ولي الأمر والطالب'),
            color: c.primary,
            onTap: () => _openAccount(context),
          ),
          _SheetMenuItem(
            icon: Icons.help_rounded,
            label: tr('المساعدة والدعم'),
            subtitle: tr('تواصل مع إدارة المسجد'),
            color: c.primary,
            onTap: () => openSupportWhatsApp(context),
          ),
          _ThemeToggleItem(isDark: isDark),
          const _LanguageToggleItem(),
          const SizedBox(height: 8),
          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: c.divider, height: 1),
          ),
          const SizedBox(height: 8),
          // Logout
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: _LogoutButton(onTap: onLogout),
          ),
        ],
      ),
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
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.2)),
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
                    fontFamily: 'Dubai')),
            Text(label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall),
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
    final c = context.appColors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Material(
        color: c.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: c.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
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
                            fontFamily: 'Dubai',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface)),
                    Text(subtitle,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Icon(AppIcons.chevronForward(context),
                  color: c.textMuted, size: 20),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

// ─── Theme Toggle Item ────────────────────────────────────────────────────────
// ─── Language Toggle Item ─────────────────────────────────────────────────────
class _LanguageToggleItem extends ConsumerWidget {
  const _LanguageToggleItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);
    final isArabic = locale.languageCode == 'ar';
    final label = isArabic
        ? tr('التبديل إلى الإنجليزية')
        : tr('التبديل إلى العربية');
    final c = context.appColors;
    final color = c.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => ref.read(languageProvider.notifier).toggleLanguage(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c.border),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.translate_rounded, color: color, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: appTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: c.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeToggleItem extends ConsumerWidget {
  final bool? isDark;
  const _ThemeToggleItem({this.isDark});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final activeDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);
    Future<void> toggle() => ref.read(themeProvider.notifier).toggleTheme();
    final c = context.appColors;
    final color = c.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: toggle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c.border),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  activeDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
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
                      activeDark ? tr('الوضع النهاري') : tr('الوضع الليلي'),
                      style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: c.textPrimary,
                      ),
                    ),
                    Text(
                      activeDark
                          ? tr('التبديل إلى المظهر الفاتح')
                          : tr('التبديل إلى المظهر الداكن'),
                      style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 12,
                        color: c.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                child: Switch.adaptive(
                  value: activeDark,
                  onChanged: (_) {},
                  activeTrackColor: c.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// زر أيقوني في الشريط العلوي (القائمة، الملف الشخصي).
class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _HeaderButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: SizedBox(
            width: 48,
            height: 48,
            child: Icon(icon, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}

/// ملف الشخصي للحسابات الإدارية: هوية الحساب، الإعدادات السريعة، الحساب، والخروج.
class _StaffProfileSheet extends StatelessWidget {
  final AuthToken token;
  final VoidCallback onOpenAccount;
  final VoidCallback onLogout;

  const _StaffProfileSheet({
    required this.token,
    required this.onOpenAccount,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = token.user;

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 5,
                  decoration: BoxDecoration(
                    color: scheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: scheme.primary.withValues(alpha: 0.12),
                    ),
                    child: Icon(Icons.admin_panel_settings_rounded,
                        color: scheme.primary, size: 30),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? tr('المدير'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: scheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          token.displayRole,
                          style: appTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: scheme.primary,
                          ),
                        ),
                        if (user?.username.isNotEmpty == true) ...[
                          const SizedBox(height: 2),
                          Text(
                            user!.username,
                            style: appTextStyle(
                              fontSize: 12,
                              color: context.appColors.textMuted,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _SheetMenuItem(
                icon: Icons.person_rounded,
                label: tr('حسابي'),
                subtitle: tr('البيانات الشخصية وكلمة المرور والصورة'),
                color: scheme.primary,
                onTap: onOpenAccount,
              ),
              _ThemeToggleItem(isDark: isDark),
              const _LanguageToggleItem(),
              const SizedBox(height: 12),
              _LogoutButton(onTap: onLogout),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: AppColors.error.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.error.withValues(alpha: 0.35)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout_rounded,
                  color: context.appColors.errorText, size: 20),
              const SizedBox(width: 10),
              Text(
                tr('تسجيل الخروج'),
                style: appTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: context.appColors.errorText,
                ),
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

// ─── Premium Nav Bar ──────────────────────────────────────────────────────────
/// شريط التنقل السفلي: NavigationBar من Material 3 (تسميات ظاهرة دائماً ودلالات
/// قارئ الشاشة مدمجة) داخل حاوية عائمة بهوية التطبيق.
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
    final c = context.appColors;
    final radius = BorderRadius.circular(28);
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(color: c.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: onTap,
              destinations: [
                for (final item in items)
                  NavigationDestination(
                    icon: Icon(item.icon),
                    selectedIcon: Icon(item.activeIcon),
                    label: item.label,
                  ),
              ],
            ),
          ),
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
            trf('مرحباً — {0}', [role]),
            style: const TextStyle(
                fontFamily: 'Dubai', fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            tr('شاشات هذا الدور قيد الإنشاء'),
            style: TextStyle(
                fontFamily: 'Dubai', fontSize: 13, color: context.appColors.textMuted),
          ),
        ],
      ),
    );
  }
}
