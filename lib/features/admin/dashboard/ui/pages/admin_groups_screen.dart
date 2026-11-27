import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/active_groups_controller.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

class AdminGroupsScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const AdminGroupsScreen({super.key, required this.token});

  @override
  ConsumerState<AdminGroupsScreen> createState() => _AdminGroupsScreenState();
}

class _AdminGroupsScreenState extends ConsumerState<AdminGroupsScreen> {
  void _reload() => ref.invalidate(activeGroupsControllerProvider);

  bool get _canCreate => widget.token.hasPermission(Permissions.groupsCreate);

  Future<void> _createGroup() async {
    final created = await context.push<bool>(AppRoutes.groupFormRoute,
        extra: (token: widget.token, group: null));
    if (created == true) _reload();
  }

  void _openScanner() {
    context.push(AppRoutes.qrScannerRoute,
        extra: (token: widget.token, groupId: null, groupName: null));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(activeGroupsControllerProvider);
    if (state.hasError) {
      return AdminErrorState(
        message: errorText(state.error!),
        onRetry: _reload,
        retryLabel: L10nGateway.current.tryAgain,
      );
    }

    if (!state.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }
    final active = state.requireValue;
    final totalStudents =
        active.fold<int>(0, (sum, g) => sum + g.enrollmentsCount);

    return Scaffold(
      // رفع زر الإضافة فوق شريط التنقل السفلي العائم في MainShell.
      floatingActionButton: _canCreate
          ? Padding(
              padding: const EdgeInsets.only(bottom: 96),
              child: AdminFab(
                label: context.l10n.newGroup,
                icon: Icons.add_rounded,
                onPressed: _createGroup,
              ),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(activeGroupsControllerProvider.future),
        color: context.appColors.primaryLight,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: kAdminPagePadding,
          children: [
            AdminHero(
              icon: Icons.groups_rounded,
              title: context.l10n.manageGroups,
              subtitle: context.l10n.activeGroupsAndEnrolledStudent,
              // زر المسح يظهر فقط لمن يملك صلاحية تسجيل الحضور.
              trailing: !ModuleAccess.canTakeStudentAttendance(widget.token)
                  ? null
                  : IconButton(
                      tooltip: context.l10n.scanQrCode,
                      onPressed: _openScanner,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.12),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(44, 44),
                      ),
                      icon: const Icon(Icons.qr_code_scanner_rounded),
                    ),
              metrics: [
                AdminHeroMetric(
                  icon: Icons.check_circle_rounded,
                  label: context.l10n.activeGroups2,
                  value: '${active.length}',
                ),
                AdminHeroMetric(
                  icon: Icons.people_rounded,
                  label: context.l10n.totalStudents,
                  value: '$totalStudents',
                ),
              ],
            ),
            const SizedBox(height: 18),
            if (active.isEmpty)
              AdminEmptyState(
                icon: Icons.groups_outlined,
                title: context.l10n.noGroups,
                subtitle: context.l10n.activeGroupsWillAppearHere,
              )
            else
              for (var i = 0; i < active.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _GroupCard(
                    group: active[i],
                    token: widget.token,
                    onRefresh: () =>
                        ref.refresh(activeGroupsControllerProvider.future),
                  )
                      .animate()
                      .fadeIn(delay: (i * 40).ms, duration: 350.ms)
                      .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
                ),
          ],
        ),
      ),
    );
  }
}

// ─── Group card ───────────────────────────────────────────────────────────────
class _GroupCard extends StatelessWidget {
  final AdminGroupItem group;
  final AuthToken token;
  final Future<void> Function() onRefresh;
  const _GroupCard(
      {required this.group, required this.token, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final color = group.isActive
        ? context.appColors.primaryLight
        : AdminTheme.muted(context);
    return AdminCard(
      padding: EdgeInsets.zero,
      accent: color,
      onTap: () async {
        final changed = await context.push<bool>(AppRoutes.groupDetailRoute,
            extra: (group: group, token: token));
        if (changed == true) onRefresh();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Row(
              children: [
                AdminIconBubble(
                  icon: Icons.groups_rounded,
                  color: color,
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
                          fontSize: FontSize.bodyLarge,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        group.course,
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
                  label: group.isActive
                      ? context.l10n.active2
                      : context.l10n.ended,
                  color: color,
                  icon: group.isActive
                      ? Icons.check_circle_rounded
                      : Icons.pause_circle_rounded,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AdminTheme.border(context)),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
            child: Column(
              children: [
                AdminInfoRow(
                  icon: Icons.person_rounded,
                  label: context.l10n.teacher,
                  value: group.teacher,
                ),
                if (group.assistantTeacher.isNotEmpty)
                  AdminInfoRow(
                    icon: Icons.person_outline_rounded,
                    label: context.l10n.assistant,
                    value: group.assistantTeacher,
                  ),
                AdminInfoRow(
                  icon: Icons.school_rounded,
                  label: context.l10n.academicYear,
                  value: group.academicYear,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_rounded, color: color, size: 18),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      context.l10n.enrolledStudents2(group.enrollmentsCount),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                        fontSize: FontSize.label,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
