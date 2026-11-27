import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/admin_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/paged_list_controller.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

class AdminAssessmentsScreen extends ConsumerStatefulWidget {
  const AdminAssessmentsScreen({super.key});

  @override
  ConsumerState<AdminAssessmentsScreen> createState() =>
      _AdminAssessmentsScreenState();
}

class _AdminAssessmentsScreenState
    extends ConsumerState<AdminAssessmentsScreen> {
  late final _provider = pagedListProvider<AdminAssessmentItem>(
    () => (page) => ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchAssessments(page: page, perPage: 20))
        .then((r) => PagedResult(
              items: r.items,
              currentPage: page,
              lastPage: r.lastPage,
              total: r.total,
            )),
  );

  PagedListState<AdminAssessmentItem> get _state => ref.watch(_provider);
  PagedListController<AdminAssessmentItem> get _controller =>
      ref.read(_provider.notifier);

  final _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollCtrl.position.pixels >=
            _scrollCtrl.position.maxScrollExtent - 200 &&
        !ref.read(_provider).isLoading &&
        ref.read(_provider).hasMore) {
      _controller.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _controller.reset,
      color: context.appColors.primaryLight,
      child: CustomScrollView(
        controller: _scrollCtrl,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            sliver: SliverToBoxAdapter(
              child: AdminHero(
                icon: Icons.assignment_rounded,
                title: context.l10n.assessments,
                subtitle: context.l10n.assessmentsAndExamsAndTheir,
                metrics: [
                  AdminHeroMetric(
                    icon: Icons.assignment_turned_in_rounded,
                    label: context.l10n.totalAssessments,
                    value: _state.isFirstLoad ? '…' : '${_state.total}',
                  ),
                ],
              ),
            ),
          ),
          ..._buildBody(),
        ],
      ),
    );
  }

  List<Widget> _buildBody() {
    if (_state.isFirstLoad) {
      return [
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        ),
      ];
    }
    if (_state.error != null && _state.items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: AdminErrorState(
            message: errorText(_state.error!),
            onRetry: _controller.reset,
            retryLabel: L10nGateway.current.tryAgain,
          ),
        ),
      ];
    }
    if (_state.items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: AdminEmptyState(
            icon: Icons.assignment_outlined,
            title: L10nGateway.current.noAssessments,
          ),
        ),
      ];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, kAdminBottomInset),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              if (i == _state.items.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _AssessmentCard(assessment: _state.items[i])
                    .animate()
                    .fadeIn(delay: (i * 40).ms, duration: 350.ms)
                    .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
              );
            },
            childCount: _state.items.length + (_state.isLoadingMore ? 1 : 0),
          ),
        ),
      ),
    ];
  }
}

class _AssessmentCard extends StatelessWidget {
  final AdminAssessmentItem assessment;
  const _AssessmentCard({required this.assessment});

  Color _typeColor(BuildContext context) {
    final t = assessment.type.toLowerCase();
    if (t.contains('عبادات') || t.contains('برنامج')) {
      return context.appColors.primaryLight;
    }
    if (t.contains('قرآن')) return context.appColors.gold;
    return context.appColors.info;
  }

  @override
  Widget build(BuildContext context) {
    final color = _typeColor(context);
    final muted = AdminTheme.muted(context);
    final passPercent = assessment.totalMark > 0
        ? (assessment.passMark / assessment.totalMark * 100).round()
        : 0;

    return AdminCard(
      padding: EdgeInsets.zero,
      accent: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Row(
              children: [
                AdminIconBubble(
                  icon: Icons.assignment_rounded,
                  color: color,
                  size: 40,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        assessment.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        assessment.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: FontSize.caption,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AdminBadge(
                  label: assessment.isActive
                      ? context.l10n.active
                      : context.l10n.ended2,
                  color:
                      assessment.isActive ? context.appColors.success : muted,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AdminTheme.border(context)),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _StatBox(
                        label: context.l10n.totalScore,
                        value: '${assessment.totalMark.toInt()}',
                        color: color,
                        icon: Icons.grade_rounded,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatBox(
                        label: context.l10n.passingScore,
                        value: '${assessment.passMark.toInt()} ($passPercent%)',
                        color: context.appColors.success,
                        icon: Icons.check_circle_outline_rounded,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatBox(
                        label: context.l10n.results2,
                        value: '${assessment.resultsCount}',
                        color: context.appColors.gold,
                        icon: Icons.people_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    color: AdminTheme.border(context).withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.groups_rounded, size: 15, color: muted),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          assessment.groupName.isEmpty
                              ? '—'
                              : '${assessment.groupName} · ${assessment.courseName}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(
                              fontSize: FontSize.caption, color: muted),
                        ),
                      ),
                      if (assessment.scheduledAt != null) ...[
                        const SizedBox(width: 8),
                        Icon(Icons.calendar_today_rounded,
                            size: 12, color: muted),
                        const SizedBox(width: 4),
                        Text(
                          assessment.formattedDate,
                          style: appTextStyle(
                              fontSize: FontSize.caption, color: muted),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label, value;
  final Color color;
  final IconData icon;
  const _StatBox(
      {required this.label,
      required this.value,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: appTextStyle(
                fontSize: FontSize.label,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: appTextStyle(
              fontSize: FontSize.caption,
              color: AdminTheme.muted(context),
            ),
          ),
        ],
      ),
    );
  }
}
