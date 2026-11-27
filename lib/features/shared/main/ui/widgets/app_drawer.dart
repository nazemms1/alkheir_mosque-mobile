import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/navigation/app_tab.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/brand_logo.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/management_hub_tab.dart';

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
    final sections =
        managementSections(context.appColors, token, _openFromDrawer)
            .where((s) => s.title != L10nGateway.current.account)
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
                    _GroupTitle(text: context.l10n.pages3),
                    for (final page in pages)
                      _DrawerTile(
                        icon: page.value.icon,
                        iconColor: AdminTheme.accent(context),
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
                    _GroupTitle(text: context.l10n.management),
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
                              fontSize: FontSize.body,
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
                    iconColor: AdminTheme.accent(context),
                    title: context.l10n.myAccount,
                    subtitle: context.l10n.personalDetailsPasswordAndSessions,
                    onTap: () {
                      _close(context);
                      onAccount();
                    },
                  ),
                  _DrawerTile(
                    icon: Icons.logout_rounded,
                    title: context.l10n.signOut,
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
void _openFromDrawer(BuildContext context, String route, {Object? extra}) {
  _close(context);
  context.push(route, extra: extra);
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
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceDeepGreen,
            context.appColors.brandDeep,
            context.appColors.brandGreen
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: context.appColors.brandPrimary.withValues(alpha: 0.3),
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
                  context.l10n.alKhairMosque,
                  style: appTextStyle(
                    fontSize: FontSize.title,
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
                      fontSize: FontSize.label,
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
                      style: appTextStyle(
                          fontSize: FontSize.caption, color: Colors.white),
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
          fontSize: FontSize.caption,
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
    final color = danger
        ? context.appColors.errorText
        : (iconColor ?? AdminTheme.accent(context));

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
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w700,
                          color: danger
                              ? context.appColors.errorText
                              : AdminTheme.text(context),
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
