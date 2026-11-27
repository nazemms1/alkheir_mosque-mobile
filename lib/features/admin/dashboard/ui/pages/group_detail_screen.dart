import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/group_detail_controller.dart';

class GroupDetailScreen extends ConsumerStatefulWidget {
  final AdminGroupItem group;
  final AuthToken token;

  const GroupDetailScreen({
    super.key,
    required this.group,
    required this.token,
  });

  @override
  ConsumerState<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends ConsumerState<GroupDetailScreen> {
  GroupDetailControllerProvider get _provider =>
      groupDetailControllerProvider(widget.group);
  AdminGroupDetail? get _detail => ref.watch(_provider).valueOrNull;
  bool _deleting = false;

  bool get _canUpdate => widget.token.hasPermission(Permissions.groupsUpdate);
  bool get _canDelete => widget.token.hasPermission(Permissions.groupsDelete);

  Future<void> _editGroup() async {
    final saved = await context.push<bool>(AppRoutes.groupFormRoute,
        extra: (token: widget.token, group: _detail));
    if (saved == true && mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> _deleteGroup() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10nGateway.current.deleteGroup,
            style: appTextStyle(fontWeight: FontWeight.w700)),
        content: Text(L10nGateway.current.areYouSureYouWant(widget.group.name),
            style: appTextStyle(fontSize: FontSize.body)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(L10nGateway.current.cancel, style: appTextStyle()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style:
                TextButton.styleFrom(foregroundColor: context.appColors.error),
            child: Text(L10nGateway.current.delete,
                style: appTextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    setState(() => _deleting = true);
    final error = await ref.read(_provider.notifier).deleteGroup();
    if (!mounted) return;
    if (error == null) {
      Navigator.pop(context, true);
      return;
    }
    setState(() => _deleting = false);
    showAppSnack(context, error, error: true);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);
    return Scaffold(
      appBar: AdminAppBar(
        title: widget.group.name,
        subtitle: context.l10n.groupSessionDetails,
        actions: [
          if (_canDelete)
            _deleting
                ? const Padding(
                    padding: EdgeInsets.all(14),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.5),
                    ),
                  )
                : IconButton(
                    tooltip: context.l10n.deleteGroup,
                    icon: const Icon(Icons.delete_outline_rounded,
                        color: Colors.white),
                    onPressed: _deleteGroup,
                  ),
        ],
      ),
      body: switch (state) {
        AsyncData(:final value) => _Body(group: value),
        AsyncError(:final error) => _errorBody(errorText(error)),
        _ => const Center(child: CircularProgressIndicator()),
      },
      floatingActionButton: (state is AsyncData && _canUpdate)
          ? AdminFab(
              label: context.l10n.edit,
              icon: Icons.edit_rounded,
              onPressed: _editGroup,
            )
          : null,
    );
  }

  /// رفض الصلاحية يظهر كحالة قفل بدون زر إعادة محاولة.
  Widget _errorBody(String message) {
    if (message.contains('صلاحية') || message.contains('403')) {
      return AdminEmptyState(
        icon: Icons.lock_outline_rounded,
        title: L10nGateway.current.youDonTHavePermission3,
        subtitle: message,
      );
    }
    return AdminErrorState(
      message: message,
      onRetry: () => ref.invalidate(_provider),
      retryLabel: L10nGateway.current.tryAgain,
    );
  }
}

// ─── Group Hero Banner ────────────────────────────────────────────────────────
class _GroupHeroBanner extends StatelessWidget {
  final AdminGroupDetail group;
  const _GroupHeroBanner({required this.group});

  @override
  Widget build(BuildContext context) {
    return AdminHero(
      icon: Icons.groups_rounded,
      title: group.name,
      subtitle: group.course,
      metrics: [
        AdminHeroMetric(
          icon: group.isActive
              ? Icons.check_circle_rounded
              : Icons.archive_rounded,
          label: context.l10n.status,
          value: group.isActive ? context.l10n.active2 : context.l10n.ended,
        ),
        AdminHeroMetric(
          icon: Icons.people_rounded,
          label: context.l10n.students,
          value: '${group.enrollments.length}',
        ),
      ],
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────
class _Body extends StatelessWidget {
  final AdminGroupDetail group;
  const _Body({required this.group});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        _GroupHeroBanner(group: group),
        const SizedBox(height: 14),
        _Card(
          title: context.l10n.groupDetails,
          icon: Icons.info_outline_rounded,
          color: context.appColors.gold,
          children: [
            AdminInfoRow(
                icon: Icons.person_rounded,
                label: context.l10n.teacher,
                value: group.teacher),
            if (group.assistantTeacher.isNotEmpty)
              AdminInfoRow(
                  icon: Icons.person_outline_rounded,
                  label: context.l10n.assistant,
                  value: group.assistantTeacher),
            AdminInfoRow(
                icon: Icons.menu_book_rounded,
                label: context.l10n.course2,
                value: group.course),
            AdminInfoRow(
                icon: Icons.calendar_month_rounded,
                label: context.l10n.academicYear,
                value: group.academicYear),
            if (group.startsOn != null)
              AdminInfoRow(
                  icon: Icons.play_circle_outline_rounded,
                  label: context.l10n.startDate2,
                  value: group.startsOn!),
            if (group.endsOn != null)
              AdminInfoRow(
                  icon: Icons.stop_circle_outlined,
                  label: context.l10n.endDate2,
                  value: group.endsOn!),
          ],
        ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0),
        const SizedBox(height: 12),
        _Card(
          title: context.l10n.enrolledStudents(group.enrollments.length),
          icon: Icons.people_rounded,
          color: context.appColors.primaryLight,
          children: group.enrollments.isEmpty
              ? [_EmptyRow(message: context.l10n.noStudentsRegisteredInThis)]
              : group.enrollments
                  .map((e) => _EnrollmentRow(enrollment: e))
                  .toList(),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 300.ms)
            .slideY(begin: 0.05, end: 0),
      ],
    );
  }
}

class _EnrollmentRow extends StatelessWidget {
  final AdminEnrollmentItem enrollment;
  const _EnrollmentRow({required this.enrollment});

  @override
  Widget build(BuildContext context) {
    final isActive = enrollment.status == 'active';
    final statusColor =
        isActive ? context.appColors.success : AdminTheme.muted(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AdminTheme.card(context),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: statusColor.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(enrollment.studentName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appTextStyle(
                      fontSize: FontSize.body,
                      fontWeight: FontWeight.w700,
                      color: AdminTheme.text(context),
                    )),
              ),
              const SizedBox(width: 8),
              AdminBadge(
                label: isActive ? context.l10n.active : context.l10n.inactive,
                color: statusColor,
              ),
            ],
          ),
          if (enrollment.parentName?.isNotEmpty == true) ...[
            const SizedBox(height: 4),
            Text(enrollment.parentName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: appTextStyle(
                  fontSize: FontSize.caption,
                  color: AdminTheme.muted(context),
                )),
          ],
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              AdminBadge(
                icon: Icons.menu_book_rounded,
                label: context.l10n.pages2(enrollment.memorizedPages),
                color: context.appColors.gold,
              ),
              AdminBadge(
                icon: Icons.star_rounded,
                label: context.l10n.pointS(enrollment.finalPoints),
                color: context.appColors.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Shared ───────────────────────────────────────────────────────────────────
class _Card extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Widget> children;
  const _Card(
      {required this.title,
      required this.icon,
      required this.color,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      accent: color,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            AdminIconBubble(icon: icon, color: color, size: 36),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: appTextStyle(
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w800,
                    color: AdminTheme.text(context),
                  )),
            ),
          ]),
          const SizedBox(height: 10),
          Divider(color: AdminTheme.border(context), height: 1),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class _EmptyRow extends StatelessWidget {
  final String message;
  const _EmptyRow({required this.message});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(message,
            textAlign: TextAlign.center,
            style: appTextStyle(
                fontSize: FontSize.label, color: AdminTheme.muted(context))),
      );
}
