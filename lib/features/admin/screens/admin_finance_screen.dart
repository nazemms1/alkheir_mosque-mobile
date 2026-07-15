import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/admin_dashboard_model.dart';
import '../../../data/services/admin_service.dart';

class AdminFinanceScreen extends StatefulWidget {
  const AdminFinanceScreen({super.key});

  @override
  State<AdminFinanceScreen> createState() => _AdminFinanceScreenState();
}

class _AdminFinanceScreenState extends State<AdminFinanceScreen>
    with SingleTickerProviderStateMixin {
  final _service = AdminService();
  late final TabController _tabCtrl;

  List<AdminInvoiceItem> _invoices = [];
  List<AdminActivityItem> _activities = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final results = await Future.wait([
        _service.fetchInvoices(perPage: 50),
        _service.fetchActivities(perPage: 50),
      ]);
      if (!mounted) return;
      setState(() {
        _invoices   = (results[0] as ({List<AdminInvoiceItem> items, int total, int lastPage})).items;
        _activities = (results[1] as ({List<AdminActivityItem> items, int total})).items;
        _loading    = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  // ── Summary from invoices ────────────────────────────────────────────────
  double get _totalAmount  => _invoices.fold(0.0, (s, i) => s + i.total);
  double get _totalPaid    => _invoices.fold(0.0, (s, i) => s + i.paidTotal);
  double get _totalBalance => _invoices.fold(0.0, (s, i) => s + i.balance);

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) return _ErrorView(message: _error!, onRetry: _load);

    return Column(
      children: [
        // ── Finance summary cards ──────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Row(
                children: [
                  _FinancePill(label: 'إجمالي الفواتير', value: _fmt(_totalAmount), color: AppColors.info, icon: Icons.receipt_long_rounded),
                  const SizedBox(width: 8),
                  _FinancePill(label: 'المدفوع', value: _fmt(_totalPaid), color: AppColors.success, icon: Icons.check_circle_rounded),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _FinancePill(label: 'المتبقي', value: _fmt(_totalBalance), color: AppColors.error, icon: Icons.pending_actions_rounded),
                  const SizedBox(width: 8),
                  _FinancePill(label: 'عدد الفواتير', value: '${_invoices.length}', color: AppColors.warning, icon: Icons.description_rounded),
                ],
              ),
            ],
          ),
        ),
        // ── Tabs ────────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: TabBar(
              controller: _tabCtrl,
              indicator: BoxDecoration(
                gradient: AppColors.gradientPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              labelStyle: const TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700, fontSize: 13),
              unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'الفواتير'),
                Tab(text: 'الأنشطة'),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabCtrl,
            children: [
              _InvoiceList(invoices: _invoices, onRefresh: _load),
              _ActivityList(activities: _activities, onRefresh: _load),
            ],
          ),
        ),
      ],
    );
  }

  String _fmt(double v) {
    if (v >= 1000000) return '${(v / 1000000).toStringAsFixed(1)}م';
    if (v >= 1000) return '${(v / 1000).toStringAsFixed(1)}ك';
    return v.toInt().toString();
  }
}

// ─── Finance pill ─────────────────────────────────────────────────────────────
class _FinancePill extends StatelessWidget {
  final String label, value;
  final Color color;
  final IconData icon;
  const _FinancePill({required this.label, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.07),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
                  Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 10, fontFamily: 'Cairo')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
      return const Center(child: Text('لا توجد فواتير', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)));
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 120),
        itemCount: invoices.length,
        itemBuilder: (_, i) => _InvoiceCard(invoice: invoices[i])
            .animate()
            .fadeIn(delay: (i * 40).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
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
    if (invoice.isPaid) return 'مدفوعة';
    if (invoice.isOverdue) return 'متأخرة';
    return 'صادرة';
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor;
    final paidPercent = invoice.total > 0
        ? (invoice.paidTotal / invoice.total * 100).clamp(0, 100).round()
        : 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 5)),
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
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.receipt_long_rounded, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      invoice.invoiceNo,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      invoice.parentName ?? '— ولي أمر غير محدد',
                      style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _statusLabel,
                  style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: paidPercent / 100,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 10),
          // Amounts row
          Row(
            children: [
              _AmountChip(label: 'الإجمالي', value: '${invoice.total.toInt()}', color: AppColors.info),
              const SizedBox(width: 6),
              _AmountChip(label: 'المدفوع', value: '${invoice.paidTotal.toInt()}', color: AppColors.success),
              const SizedBox(width: 6),
              _AmountChip(label: 'المتبقي', value: '${invoice.balance.toInt()}', color: AppColors.error),
              const Spacer(),
              Text(
                invoice.issueDate,
                style: const TextStyle(fontFamily: 'Cairo', fontSize: 10, color: AppColors.textMuted),
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
  const _AmountChip({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
        Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 9, fontFamily: 'Cairo')),
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
      return const Center(child: Text('لا توجد أنشطة', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)));
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 120),
        itemCount: activities.length,
        itemBuilder: (_, i) => _ActivityCard(activity: activities[i])
            .animate()
            .fadeIn(delay: (i * 40).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final AdminActivityItem activity;
  const _ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    final color = activity.isActive ? AppColors.primaryLight : AppColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.07), blurRadius: 14, offset: const Offset(0, 4)),
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
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.event_rounded, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (activity.activityDate != null)
                      Text(
                        activity.activityDate!,
                        style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted),
                      ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (activity.isActive ? AppColors.success : AppColors.textMuted).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  activity.isActive ? 'نشط' : 'منتهي',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: activity.isActive ? AppColors.success : AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
          if (activity.groupName != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.groups_rounded, size: 13, color: AppColors.textMuted),
                const SizedBox(width: 4),
                Text(activity.groupName!, style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
              ],
            ),
          ],
          if (activity.feeAmount > 0 || activity.expectedRevenue > 0) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                _AmountChip(label: 'الرسوم', value: '${activity.feeAmount.toInt()}', color: AppColors.info),
                const SizedBox(width: 12),
                _AmountChip(label: 'المتوقع', value: '${activity.expectedRevenue.toInt()}', color: AppColors.warning),
                const SizedBox(width: 12),
                _AmountChip(label: 'المحصّل', value: '${activity.collectedRevenue.toInt()}', color: AppColors.success),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Cairo')),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('إعادة المحاولة', style: TextStyle(fontFamily: 'Cairo'))),
        ],
      ),
    );
  }
}
