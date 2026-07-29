import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/student_service.dart';
import 'invoice_detail_screen.dart';

class ParentInvoicesScreen extends StatefulWidget {
  const ParentInvoicesScreen({super.key});

  @override
  State<ParentInvoicesScreen> createState() => _ParentInvoicesScreenState();
}

class _ParentInvoicesScreenState extends State<ParentInvoicesScreen> {
  final _service = StudentService();
  List<InvoiceListItem> _invoices = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final invoices = await _service.fetchInvoices();
      if (!mounted) return;
      setState(() { _invoices = invoices; _loading = false; });
    } catch (e) {
      if (!mounted) return;
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context),
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
            const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Cairo')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _load, child: const Text('إعادة المحاولة', style: TextStyle(fontFamily: 'Cairo'))),
          ],
        ),
      );
    }
    if (_invoices.isEmpty) {
      return const Center(child: Text('لا توجد فواتير', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)));
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientPrimary,
          boxShadow: [BoxShadow(color: Color(0x30000000), blurRadius: 12, offset: Offset(0, 3))],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.glassWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text('الفواتير', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
                ),
              ],
            ),
          ),
        ),
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
    if (invoice.isPaid) return 'مدفوعة';
    if (invoice.isOverdue) return 'متأخرة';
    return 'صادرة';
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor;
    final paidPercent = invoice.total > 0 ? (invoice.paidTotal / invoice.total * 100).clamp(0, 100).round() : 0;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => InvoiceDetailScreen(invoiceId: invoice.id)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2), width: 1.5),
          boxShadow: [BoxShadow(color: color.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 5))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: Icon(Icons.receipt_long_rounded, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(invoice.invoiceNo,
                      style: TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                  child: Text(_statusLabel, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
                ),
                const SizedBox(width: 4),
                Icon(Icons.chevron_left_rounded, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4), size: 20),
              ],
            ),
            const SizedBox(height: 14),
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
            Row(
              children: [
                Text('${invoice.total.toInt()}',
                    style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.info)),
                const SizedBox(width: 6),
                const Text('الإجمالي', style: TextStyle(fontFamily: 'Cairo', fontSize: 9, color: AppColors.textMuted)),
                const Spacer(),
                Text(invoice.issueDate, style: const TextStyle(fontFamily: 'Cairo', fontSize: 10, color: AppColors.textMuted)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
