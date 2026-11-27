import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/admin_finance_controller.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

/// شاشة المالية: تبويب الفواتير وتبويب الأنشطة، ويظهر كل تبويب حسب صلاحيته.
/// لا تُطلب بيانات تبويب لا يملك الحساب صلاحيته.
class AdminFinanceScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  const AdminFinanceScreen({super.key, required this.token});

  @override
  ConsumerState<AdminFinanceScreen> createState() => _AdminFinanceScreenState();
}

class _AdminFinanceScreenState extends ConsumerState<AdminFinanceScreen>
    with SingleTickerProviderStateMixin {
  bool get _showInvoices => ModuleAccess.canViewInvoices(widget.token);
  bool get _showActivities => ModuleAccess.canViewActivities(widget.token);

  late final TabController _tabCtrl;

  AdminFinanceControllerProvider get _provider =>
      adminFinanceControllerProvider(
          invoices: _showInvoices, activities: _showActivities);
  List<AdminInvoiceItem> get _invoices =>
      ref.watch(_provider).valueOrNull?.invoices ?? const [];
  List<AdminActivityItem> get _activities =>
      ref.watch(_provider).valueOrNull?.activities ?? const [];
  Future<void> _load() => ref.refresh(_provider.future);

  @override
  void initState() {
    super.initState();
    final tabCount = (_showInvoices ? 1 : 0) + (_showActivities ? 1 : 0);
    _tabCtrl = TabController(length: tabCount < 1 ? 1 : tabCount, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  // ── Summary from invoices ────────────────────────────────────────────────
  double get _totalAmount => _invoices.fold(0.0, (s, i) => s + i.total);
  double get _totalPaid => _invoices.fold(0.0, (s, i) => s + i.paidTotal);
  double get _totalBalance => _invoices.fold(0.0, (s, i) => s + i.balance);

  @override
  Widget build(BuildContext context) {
    if (!_showInvoices && !_showActivities) {
      return AdminEmptyState(
        icon: Icons.lock_outline_rounded,
        title: L10nGateway.current.youDonTHavePermission2,
      );
    }
    final state = ref.watch(_provider);
    if (state.hasError) {
      return AdminErrorState(
        message: errorText(state.error!),
        onRetry: _load,
        retryLabel: L10nGateway.current.tryAgain,
      );
    }

    if (!state.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    final accent = AdminTheme.accent(context);
    final bothTabs = _showInvoices && _showActivities;

    final lists = <Widget>[
      if (_showInvoices) _InvoiceList(invoices: _invoices, onRefresh: _load),
      if (_showActivities)
        _ActivityList(activities: _activities, onRefresh: _load),
    ];

    return Column(
      children: [
        if (_showInvoices)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: AdminHero(
              icon: Icons.account_balance_wallet_rounded,
              title: context.l10n.finance,
              subtitle: context.l10n.invoicesActivitiesAndCollection,
              metrics: [
                AdminHeroMetric(
                  icon: Icons.receipt_long_rounded,
                  label: context.l10n.totalInvoices,
                  value: _fmt(_totalAmount),
                ),
                AdminHeroMetric(
                  icon: Icons.check_circle_rounded,
                  label: context.l10n.paid,
                  value: _fmt(_totalPaid),
                ),
                AdminHeroMetric(
                  icon: Icons.pending_actions_rounded,
                  label: context.l10n.remaining,
                  value: _fmt(_totalBalance),
                ),
                AdminHeroMetric(
                  icon: Icons.description_rounded,
                  label: context.l10n.numberOfInvoices,
                  value: '${_invoices.length}',
                ),
              ],
            ),
          ),
        if (bothTabs)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AdminTheme.card(context),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AdminTheme.border(context)),
              ),
              child: TabBar(
                controller: _tabCtrl,
                indicator: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(12),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: AdminTheme.muted(context),
                labelStyle: appTextStyle(
                    fontSize: FontSize.label, fontWeight: FontWeight.w700),
                unselectedLabelStyle: appTextStyle(fontSize: FontSize.label),
                tabs: [
                  Tab(height: 40, text: context.l10n.invoices),
                  Tab(height: 40, text: context.l10n.activities),
                ],
              ),
            ),
          ),
        Expanded(
          child: bothTabs
              ? TabBarView(controller: _tabCtrl, children: lists)
              : lists.first,
        ),
      ],
    );
  }

  String _fmt(double v) {
    if (v >= 1000000) {
      return L10nGateway.current.m((v / 1000000).toStringAsFixed(1));
    }
    if (v >= 1000) return L10nGateway.current.k((v / 1000).toStringAsFixed(1));
    return v.toInt().toString();
  }
}

// ─── Invoice list ─────────────────────────────────────────────────────────────
class _InvoiceList extends StatelessWidget {
  final List<AdminInvoiceItem> invoices;
  final Future<void> Function() onRefresh;
  const _InvoiceList({required this.invoices, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    if (invoices.isEmpty) {
      return AdminEmptyState(
        icon: Icons.receipt_long_outlined,
        title: L10nGateway.current.noInvoices,
      );
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: context.appColors.primaryLight,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, kAdminBottomInset),
        itemCount: invoices.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _InvoiceCard(invoice: invoices[i])
              .animate()
              .fadeIn(delay: (i * 40).ms, duration: 350.ms)
              .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
        ),
      ),
    );
  }
}

class _InvoiceCard extends StatelessWidget {
  final AdminInvoiceItem invoice;
  const _InvoiceCard({required this.invoice});

  Color _statusColor(BuildContext context) {
    if (invoice.isPaid) return context.appColors.success;
    if (invoice.isOverdue) return context.appColors.error;
    return context.appColors.warning;
  }

  String get _statusLabel {
    if (invoice.isPaid) return L10nGateway.current.paid2;
    if (invoice.isOverdue) return L10nGateway.current.late;
    return L10nGateway.current.issued;
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(context);
    final muted = AdminTheme.muted(context);
    final paidPercent = invoice.total > 0
        ? (invoice.paidTotal / invoice.total * 100).clamp(0, 100).round()
        : 0;

    return AdminCard(
      accent: color,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AdminIconBubble(
                icon: Icons.receipt_long_rounded,
                color: color,
                size: 40,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      invoice.invoiceNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: AdminTheme.text(context),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      invoice.parentName ?? context.l10n.unspecifiedParent,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                          fontSize: FontSize.caption, color: muted),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AdminBadge(label: _statusLabel, color: color),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: paidPercent / 100,
              backgroundColor: color.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 18,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _AmountChip(
                label: context.l10n.total,
                value: '${invoice.total.toInt()}',
                color: context.appColors.info,
              ),
              _AmountChip(
                label: context.l10n.paid,
                value: '${invoice.paidTotal.toInt()}',
                color: context.appColors.success,
              ),
              _AmountChip(
                label: context.l10n.remaining,
                value: '${invoice.balance.toInt()}',
                color: context.appColors.error,
              ),
              Text(
                invoice.issueDate,
                style: appTextStyle(fontSize: FontSize.caption, color: muted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AmountChip extends StatelessWidget {
  final String label, value;
  final Color color;
  const _AmountChip(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: appTextStyle(
            fontSize: FontSize.body,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        Text(
          label,
          style: appTextStyle(
            fontSize: FontSize.caption,
            color: AdminTheme.muted(context),
          ),
        ),
      ],
    );
  }
}

// ─── Activity list ────────────────────────────────────────────────────────────
class _ActivityList extends StatelessWidget {
  final List<AdminActivityItem> activities;
  final Future<void> Function() onRefresh;
  const _ActivityList({required this.activities, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return AdminEmptyState(
        icon: Icons.event_busy_rounded,
        title: L10nGateway.current.noActivities,
      );
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: context.appColors.primaryLight,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, kAdminBottomInset),
        itemCount: activities.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _ActivityCard(activity: activities[i])
              .animate()
              .fadeIn(delay: (i * 40).ms, duration: 350.ms)
              .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final AdminActivityItem activity;
  const _ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    final color = activity.isActive
        ? context.appColors.primaryLight
        : AdminTheme.muted(context);
    final muted = AdminTheme.muted(context);
    return AdminCard(
      accent: color,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AdminIconBubble(
                icon: Icons.event_rounded,
                color: color,
                size: 40,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: AdminTheme.text(context),
                      ),
                    ),
                    if (activity.activityDate != null)
                      Text(
                        activity.activityDate!,
                        style: appTextStyle(
                            fontSize: FontSize.caption, color: muted),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AdminBadge(
                label: activity.isActive
                    ? context.l10n.active
                    : context.l10n.ended2,
                color: activity.isActive ? context.appColors.success : muted,
              ),
            ],
          ),
          if (activity.groupName != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.groups_rounded, size: 15, color: muted),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    activity.groupName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        appTextStyle(fontSize: FontSize.caption, color: muted),
                  ),
                ),
              ],
            ),
          ],
          if (activity.feeAmount > 0 || activity.expectedRevenue > 0) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 18,
              runSpacing: 8,
              children: [
                _AmountChip(
                  label: context.l10n.fees,
                  value: '${activity.feeAmount.toInt()}',
                  color: context.appColors.info,
                ),
                _AmountChip(
                  label: context.l10n.expected,
                  value: '${activity.expectedRevenue.toInt()}',
                  color: context.appColors.warning,
                ),
                _AmountChip(
                  label: context.l10n.collected,
                  value: '${activity.collectedRevenue.toInt()}',
                  color: context.appColors.success,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
