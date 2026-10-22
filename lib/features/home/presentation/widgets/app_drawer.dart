import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/navigation/app_tab.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/app/core/widgets/brand_logo.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/presentation/screens/management_hub_tab.dart';

/// القائمة الجانبية: الصفحات التي لا تتسع في الشريط السفلي، ثم الوحدات الإدارية
/// مجمّعة حسب أقسامها، ثم الحساب وتسجيل الخروج.
class AppDrawer extends StatelessWidget {
  final AuthToken token;
  final String userName;
  final String roleLabel;
  final List<AppTab> tabs;

  /// أول تبويب يظهر في الدرج لأنه لا يتسع في الشريط السفلي.
  final int overflowFrom;
  final int activeIndex;
  final ValueChanged<int> onPageSelected;
  final VoidCallback onAccount;
  final VoidCallback onLogout;

  const AppDrawer({
    super.key,
    required this.token,
    required this.userName,
    required this.roleLabel,
    required this.tabs,
    required this.overflowFrom,
    required this.activeIndex,
    required this.onPageSelected,
    required this.onAccount,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final pages = [
      for (var i = overflowFrom; i < tabs.length; i++) MapEntry(i, tabs[i]),
    ];
    final sections = managementSections(token, _openFromDrawer)
        .where((s) => s.title != tr('الحساب'))
        .toList();

    return Drawer(
      width: (MediaQuery.sizeOf(context).width * 0.84).clamp(260.0, 340.0),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            _DrawerHeader(userName: userName, roleLabel: roleLabel),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                children: [
                  if (pages.isNotEmpty) ...[
                    _GroupTitle(text: tr('الصفحات')),
                    for (final page in pages)
                      _DrawerTile(
                        icon: page.value.icon,
                        iconColor: AppColors.primaryLight,
                        title: page.value.label,
                        subtitle: page.value.subtitle,
                        selected: page.key == activeIndex,
                        onTap: () {
                          _close(context);
                          onPageSelected(page.key);
                        },
                      ),
                  ],
                  if (sections.isNotEmpty) ...[
                    _GroupTitle(text: tr('الإدارة')),
                    for (final section in sections)
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          tilePadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          childrenPadding: EdgeInsets.zero,
                          shape: const Border(),
                          collapsedShape: const Border(),
                          title: Text(
                            section.title,
                            style: appTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AdminTheme.text(context),
                            ),
                          ),
                          children: [
                            for (final entry in section.entries)
                              _DrawerTile(
                                icon: entry.icon,
                                iconColor: entry.color,
                                title: entry.title,
                                subtitle: entry.subtitle,
                                onTap: () {
                                  _close(context);
                                  entry.open(context);
                                },
                              ),
                          ],
                        ),
                      ),
                  ],
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _DrawerTile(
                    icon: Icons.person_rounded,
                    iconColor: AppColors.info,
                    title: tr('حسابي'),
                    subtitle: tr('البيانات الشخصية وكلمة المرور والجلسات'),
                    onTap: () {
                      _close(context);
                      onAccount();
                    },
                  ),
                  _DrawerTile(
                    icon: Icons.logout_rounded,
                    title: tr('تسجيل الخروج'),
                    danger: true,
                    onTap: () {
                      _close(context);
                      onLogout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _close(BuildContext context) => Scaffold.maybeOf(context)?.closeDrawer();

/// يغلق الدرج ثم يفتح الشاشة (الوحدات الإدارية تُفتح من الدرج مباشرة).
void _openFromDrawer(BuildContext context, Widget screen) {
  _close(context);
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}

class _DrawerHeader extends StatelessWidget {
  final String userName;
  final String roleLabel;

  const _DrawerHeader({required this.userName, required this.roleLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const BrandLogo(size: 58, glow: false),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('مسجد الخير'),
                  style: appTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                if (userName.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    userName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appTextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ],
                if (roleLabel.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      roleLabel,
                      style: appTextStyle(fontSize: 11, color: Colors.white),
                    ),
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

class _GroupTitle extends StatelessWidget {
  final String text;

  const _GroupTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
      child: Text(
        text,
        style: appTextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AdminTheme.muted(context),
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String? subtitle;
  final bool selected;
  final bool danger;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.icon,
    this.iconColor,
    required this.title,
    this.subtitle,
    this.selected = false,
    this.danger = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = danger ? AppColors.error : (iconColor ?? AppColors.primary);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: selected ? color.withValues(alpha: 0.14) : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 20, color: color),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color:
                              danger ? AppColors.error : AdminTheme.text(context),
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(
                            fontSize: 11,
                            color: AdminTheme.muted(context),
                          ),
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
