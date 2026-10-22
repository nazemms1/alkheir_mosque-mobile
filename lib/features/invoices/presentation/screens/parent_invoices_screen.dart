import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/students/data/models/student_model.dart';
import 'package:alkheir_mosque/features/students/data/repositories/student_repository_impl.dart';
import 'invoice_detail_screen.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

class ParentInvoicesScreen extends StatefulWidget {
  const ParentInvoicesScreen({super.key});

  @override
  State<ParentInvoicesScreen> createState() => _ParentInvoicesScreenState();
}

class _ParentInvoicesScreenState extends State<ParentInvoicesScreen> {
  final _service = StudentRepositoryImpl();
  List<InvoiceListItem> _invoices = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final invoices = await _service.fetchInvoices();
      if (!mounted) return;
      setState(() {
        _invoices = invoices;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AdminAppBar(
        title: tr('الفواتير'),
        subtitle: tr('سجل الفواتير والدفعات'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded,
                size: 48, color: AppColors.error),
            const SizedBox(height: 12),
            Text(_error!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Dubai')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: _load,
                child: Text(tr('إعادة المحاولة'),
                    style: const TextStyle(fontFamily: 'Dubai'))),
          ],
        ),
      );
    }
    if (_invoices.isEmpty) {
      return Center(
          child: Text(tr('لا توجد فواتير'),
              style:
                  const TextStyle(fontFamily: 'Dubai', color: AppColors.textMuted)));
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        itemCount: _invoices.length,
        itemBuilder: (_, i) => _InvoiceTile(invoice: _invoices[i])
            .animate()
            .fadeIn(delay: (i * 50).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 50).ms),
      ),
    );
  }
}

class _InvoiceTile extends StatelessWidget {
  final InvoiceListItem invoice;
  const _InvoiceTile({required this.invoice});

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
    final paidPercent = invoice.total > 0
        ? (invoice.paidTotal / invoice.total * 100).clamp(0, 100).round()
        : 0;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => InvoiceDetailScreen(invoiceId: invoice.id)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
                  child:
                      Icon(Icons.receipt_long_rounded, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(invoice.invoiceNo,
                      style: TextStyle(
                          fontFamily: 'Dubai',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface)),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(_statusLabel,
                      style: TextStyle(
                          color: color,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Dubai')),
                ),
                const SizedBox(width: 4),
                Icon(AppIcons.chevronForward(context),
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                    size: 20),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: paidPercent / 100,
                backgroundColor: color.withValues(alpha: 0.15),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('${invoice.total.toInt()}',
                    style: const TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: AppColors.info)),
                const SizedBox(width: 6),
                Text(tr('الإجمالي'),
                    style: const TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 9,
                        color: AppColors.textMuted)),
                const Spacer(),
                Text(invoice.issueDate,
                    style: const TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 10,
                        color: AppColors.textMuted)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
