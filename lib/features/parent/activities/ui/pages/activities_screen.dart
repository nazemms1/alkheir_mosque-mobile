import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/ui/widgets/toast/app_toast.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/parent/activities/ui/providers/parent_activities_controller.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

class ActivitiesScreen extends ConsumerStatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  ConsumerState<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends ConsumerState<ActivitiesScreen> {
  Future<void> _respond(ParentActivity activity, ActivityChildEligibility child,
      String response) async {
    final error = await ref
        .read(parentActivitiesControllerProvider.notifier)
        .respond(activity, child, response);
    if (!mounted) return;
    if (error != null) {
      AppToast.error(context, error);
      return;
    }
    AppToast.success(
        context,
        response == 'registered'
            ? L10nGateway.current.registered2(child.studentName)
            : L10nGateway.current.excuseRecordedFor(child.studentName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AdminAppBar(
        title: context.l10n.activities,
        subtitle: context.l10n.alkheirMosqueActivities,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return switch (ref.watch(parentActivitiesControllerProvider)) {
      AsyncData(:final value) => _buildList(value),
      AsyncError(:final error) => _buildError(errorText(error)),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }

  Widget _buildError(String error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline_rounded,
              size: 48, color: context.appColors.error),
          const SizedBox(height: 12),
          Text(error,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Dubai')),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () =>
                  ref.invalidate(parentActivitiesControllerProvider),
              child: Text(L10nGateway.current.tryAgain,
                  style: const TextStyle(fontFamily: 'Dubai'))),
        ],
      ),
    );
  }

  Widget _buildList(List<ParentActivity> activities) {
    if (activities.isEmpty) {
      return Center(
        child: Text(L10nGateway.current.noActivitiesAvailableRightNow,
            style: TextStyle(
                fontFamily: 'Dubai', color: context.appColors.textMuted)),
      );
    }
    return RefreshIndicator(
      onRefresh: () => ref.refresh(parentActivitiesControllerProvider.future),
      color: context.appColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        itemCount: activities.length,
        itemBuilder: (_, i) => _ActivityCard(
          activity: activities[i],
          onRespond: (child, response) =>
              _respond(activities[i], child, response),
        )
            .animate()
            .fadeIn(delay: (i * 50).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 50).ms),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final ParentActivity activity;
  final void Function(ActivityChildEligibility child, String response)
      onRespond;
  const _ActivityCard({required this.activity, required this.onRespond});

  @override
  Widget build(BuildContext context) {
    final color = activity.isActive
        ? context.appColors.primaryLight
        : context.appColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
              color: color.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 5))
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
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(Icons.event_rounded, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity.title,
                        style: TextStyle(
                            fontFamily: 'Dubai',
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    if (activity.groupName != null)
                      Text(activity.groupName!,
                          style: TextStyle(
                              fontFamily: 'Dubai',
                              fontSize: FontSize.caption,
                              color: context.appColors.textMuted)),
                  ],
                ),
              ),
              if (activity.feeAmount > 0)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: context.appColors.gold.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('${activity.feeAmount.toInt()}',
                      style: TextStyle(
                          color: context.appColors.goldText,
                          fontSize: FontSize.caption,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Dubai')),
                ),
            ],
          ),
          if (activity.description != null &&
              activity.description!.trim().isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(activity.description!,
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    color: context.appColors.textSecondary),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
          ],
          const SizedBox(height: 12),
          ...activity.children.map((child) => Padding(
                padding: const EdgeInsets.only(top: 6),
                child: _ChildResponseRow(
                  child: child,
                  activityActive: activity.isActive,
                  onRespond: (response) => onRespond(child, response),
                ),
              )),
        ],
      ),
    );
  }
}

class _ChildResponseRow extends StatelessWidget {
  final ActivityChildEligibility child;
  final bool activityActive;
  final void Function(String response) onRespond;
  const _ChildResponseRow(
      {required this.child,
      required this.activityActive,
      required this.onRespond});

  @override
  Widget build(BuildContext context) {
    final registered = child.responseStatus == 'registered';
    final declined = child.responseStatus == 'declined';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(child.studentName,
                style: const TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w600)),
          ),
          if (registered)
            _StatusChip(
                label: context.l10n.registered3,
                color: context.appColors.success)
          else if (declined)
            _StatusChip(
                label: context.l10n.excused2,
                color: context.appColors.textMuted)
          else if (child.canRespond && activityActive) ...[
            _RespondButton(
                label: context.l10n.register,
                color: context.appColors.success,
                onTap: () => onRespond('registered')),
            const SizedBox(width: 8),
          ] else
            _StatusChip(
                label: context.l10n.notAvailable,
                color: context.appColors.textMuted),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20)),
      child: Text(label,
          style: TextStyle(
              color: color,
              fontSize: FontSize.caption,
              fontWeight: FontWeight.w700,
              fontFamily: 'Dubai')),
    );
  }
}

class _RespondButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _RespondButton(
      {required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: FontSize.caption,
                fontWeight: FontWeight.w700,
                fontFamily: 'Dubai')),
      ),
    );
  }
}
