import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/student_service.dart';

class InvoiceDetailScreen extends StatefulWidget {
  final int invoiceId;
  const InvoiceDetailScreen({super.key, required this.invoiceId});

  @override
  State<InvoiceDetailScreen> createState() => _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends State<InvoiceDetailScreen> {
  final _service = StudentService();
  InvoiceDetail? _invoice;
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
      final invoice = await _service.fetchInvoiceDetail(widget.invoiceId);
      if (!mounted) return;
      setState(() { _invoice = invoice; _loading = false; });
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
    final invoice = _invoice!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      children: [
        _SummaryCard(invoice: invoice).animate().fadeIn(duration: 350.ms).slideY(begin: 0.05, end: 0),
        const SizedBox(height: 20),
        const _SectionTitle(title: 'البنود'),
        const SizedBox(height: 8),
        if (invoice.items.isEmpty)
          const Text('لا توجد بنود', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted))
        else
          ...invoice.items.map((item) => _ItemRow(item: item)),
        const SizedBox(height: 20),
        const _SectionTitle(title: 'الدفعات'),
        const SizedBox(height: 8),
        if (invoice.payments.isEmpty)
          const Text('لا توجد دفعات مسجّلة', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted))
        else
          ...invoice.payments.map((p) => _PaymentRow(payment: p)),
      ],
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
                Expanded(
                  child: Text(_invoice?.invoiceNo ?? 'تفاصيل الفاتورة',
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final InvoiceDetail invoice;
  const _SummaryCard({required this.invoice});

  @override
  Widget build(BuildContext context) {
    final color = invoice.isPaid ? AppColors.success : AppColors.warning;
    final paidPercent = invoice.total > 0 ? (invoice.paidTotal / invoice.total * 100).clamp(0, 100).round() : 0;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [BoxShadow(color: color.withOpacity(0.08), blurRadius: 18, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(invoice.invoiceNo,
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 15, fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.onSurface)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                child: Text(invoice.isPaid ? 'مدفوعة' : 'غير مكتملة',
                    style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text('تاريخ الإصدار: ${invoice.issueDate}', style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
          if (invoice.dueDate != null)
            Text('تاريخ الاستحقاق: ${invoice.dueDate}', style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: paidPercent / 100,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 7,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _AmountBox(label: 'الإجمالي', value: invoice.total, color: AppColors.info),
              const SizedBox(width: 8),
              _AmountBox(label: 'المدفوع', value: invoice.paidTotal, color: AppColors.success),
              const SizedBox(width: 8),
              _AmountBox(label: 'المتبقي', value: invoice.balance, color: AppColors.error),
            ],
          ),
          if (invoice.discount > 0) ...[
            const SizedBox(height: 10),
            Text('الخصم: ${invoice.discount.toInt()}', style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
          ],
        ],
      ),
    );
  }
}

class _AmountBox extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  const _AmountBox({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: color.withOpacity(0.07), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.18))),
        child: Column(
          children: [
            Text('${value.toInt()}', style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
            Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 9, fontFamily: 'Cairo')),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 16, decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14, color: Theme.of(context).colorScheme.onSurface)),
      ],
    );
  }
}

class _ItemRow extends StatelessWidget {
  final InvoiceLineItem item;
  const _ItemRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(item.description, style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, fontWeight: FontWeight.w600)),
          ),
          Text('${item.quantity.toStringAsFixed(item.quantity.truncateToDouble() == item.quantity ? 0 : 1)} × ${item.unitPrice.toInt()}',
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
          const SizedBox(width: 10),
          Text('${item.lineTotal.toInt()}', style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.info)),
        ],
      ),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  final InvoicePaymentEntry payment;
  const _PaymentRow({required this.payment});

  @override
  Widget build(BuildContext context) {
    final color = payment.isVoided ? AppColors.textMuted : AppColors.success;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(payment.isVoided ? Icons.cancel_rounded : Icons.check_circle_rounded, color: color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(payment.paidAt, style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
                if (payment.methodName != null)
                  Text(payment.methodName!, style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Text('${payment.amount.toInt()}',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w800, color: color, decoration: payment.isVoided ? TextDecoration.lineThrough : null)),
        ],
      ),
    );
  }
}
