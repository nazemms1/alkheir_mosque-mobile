import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

/// شاشة المالية: تبويب الفواتير وتبويب الأنشطة، ويظهر كل تبويب حسب صلاحيته.
/// لا تُطلب بيانات تبويب لا يملك الحساب صلاحيته.
class AdminFinanceScreen extends StatefulWidget {
  final AuthToken token;
  const AdminFinanceScreen({super.key, required this.token});

  @override
  State<AdminFinanceScreen> createState() => _AdminFinanceScreenState();
}

class _AdminFinanceScreenState extends State<AdminFinanceScreen>
    with SingleTickerProviderStateMixin {
  final _service = AdminRepositoryImpl();

  bool get _showInvoices => ModuleAccess.canViewInvoices(widget.token);
  bool get _showActivities => ModuleAccess.canViewActivities(widget.token);

  late final TabController _tabCtrl;

  List<AdminInvoiceItem> _invoices = [];
  List<AdminActivityItem> _activities = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    final tabCount = (_showInvoices ? 1 : 0) + (_showActivities ? 1 : 0);
    _tabCtrl = TabController(length: tabCount < 1 ? 1 : tabCount, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final invoicesFuture = _showInvoices
          ? _service.fetchInvoices(perPage: 50).then((r) => r.items)
          : Future.value(const <AdminInvoiceItem>[]);
      final activitiesFuture = _showActivities
          ? _service.fetchActivities(perPage: 50).then((r) => r.items)
          : Future.value(const <AdminActivityItem>[]);
      final invoices = await invoicesFuture;
      final activities = await activitiesFuture;
      if (!mounted) return;
      setState(() {
        _invoices = invoices;
        _activities = activities;
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

  // ── Summary from invoices ────────────────────────────────────────────────
  double get _totalAmount => _invoices.fold(0.0, (s, i) => s + i.total);
  double get _totalPaid => _invoices.fold(0.0, (s, i) => s + i.paidTotal);
  double get _totalBalance => _invoices.fold(0.0, (s, i) => s + i.balance);

  @override
  Widget build(BuildContext context) {
    if (!_showInvoices && !_showActivities) {
      return AdminEmptyState(
        icon: Icons.lock_outline_rounded,
        title: tr('ليس لديك صلاحية لعرض هذه الشاشة'),
      );
    }
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return AdminErrorState(
        message: _error!,
        onRetry: _load,
        retryLabel: tr('إعادة المحاولة'),
      );
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
              title: tr('المالية'),
              subtitle: tr('الفواتير والأنشطة والتحصيل'),
              metrics: [
                AdminHeroMetric(
                  icon: Icons.receipt_long_rounded,
                  label: tr('إجمالي الفواتير'),
                  value: _fmt(_totalAmount),
                ),
                AdminHeroMetric(
                  icon: Icons.check_circle_rounded,
                  label: tr('المدفوع'),
                  value: _fmt(_totalPaid),
                ),
                AdminHeroMetric(
                  icon: Icons.pending_actions_rounded,
                  label: tr('المتبقي'),
                  value: _fmt(_totalBalance),
                ),
                AdminHeroMetric(
                  icon: Icons.description_rounded,
                  label: tr('عدد الفواتير'),
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
                labelStyle:
                    appTextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                unselectedLabelStyle: appTextStyle(fontSize: 13),
                tabs: [
                  Tab(height: 40, text: tr('الفواتير')),
                  Tab(height: 40, text: tr('الأنشطة')),
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
    if (v >= 1000000) return trf('{0}م', [(v / 1000000).toStringAsFixed(1)]);
    if (v >= 1000) return trf('{0}ك', [(v / 1000).toStringAsFixed(1)]);
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
        title: tr('لا توجد فواتير'),
      );
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
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

  Color get _statusColor {
    if (invoice.isPaid) return AppColors.success;
    if (invoice.isOverdue) return AppColors.error;
    return AppColors.warning;
  }

  String get _statusLabel {
    if (invoice.isPaid) return tr('مدفوعة');
    if (invoice.isOverdue) return tr('متأخرة');
    return tr('صادرة');
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor;
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
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AdminTheme.text(context),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      invoice.parentName ?? tr('— ولي أمر غير محدد'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(fontSize: 12, color: muted),
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
                label: tr('الإجمالي'),
                value: '${invoice.total.toInt()}',
                color: AppColors.info,
              ),
              _AmountChip(
                label: tr('المدفوع'),
                value: '${invoice.paidTotal.toInt()}',
                color: AppColors.success,
              ),
              _AmountChip(
                label: tr('المتبقي'),
                value: '${invoice.balance.toInt()}',
                color: AppColors.error,
              ),
              Text(
                invoice.issueDate,
                style: appTextStyle(fontSize: 11, color: muted),
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
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        Text(
          label,
          style: appTextStyle(
            fontSize: 11,
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
        title: tr('لا توجد أنشطة'),
      );
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
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
    final color =
        activity.isActive ? AppColors.primaryLight : AdminTheme.muted(context);
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
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AdminTheme.text(context),
                      ),
                    ),
                    if (activity.activityDate != null)
                      Text(
                        activity.activityDate!,
                        style: appTextStyle(fontSize: 12, color: muted),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AdminBadge(
                label: activity.isActive ? tr('نشط') : tr('منتهي'),
                color: activity.isActive ? AppColors.success : muted,
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
                    style: appTextStyle(fontSize: 12, color: muted),
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
                  label: tr('الرسوم'),
                  value: '${activity.feeAmount.toInt()}',
                  color: AppColors.info,
                ),
                _AmountChip(
                  label: tr('المتوقع'),
                  value: '${activity.expectedRevenue.toInt()}',
                  color: AppColors.warning,
                ),
                _AmountChip(
                  label: tr('المحصّل'),
                  value: '${activity.collectedRevenue.toInt()}',
                  color: AppColors.success,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
