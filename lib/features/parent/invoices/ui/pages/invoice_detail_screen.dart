import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/parent/invoices/ui/providers/invoice_detail_controller.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

class InvoiceDetailScreen extends ConsumerStatefulWidget {
  final int invoiceId;
  const InvoiceDetailScreen({super.key, required this.invoiceId});

  @override
  ConsumerState<InvoiceDetailScreen> createState() =>
      _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends ConsumerState<InvoiceDetailScreen> {
  InvoiceDetailControllerProvider get _provider =>
      invoiceDetailControllerProvider(widget.invoiceId);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);
    final invoice = state.valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AdminAppBar(
        title: invoice?.invoiceNo ?? context.l10n.invoiceDetails,
        subtitle: invoice != null ? context.l10n.invoiceDetails : null,
      ),
      body: switch (state) {
        AsyncData(:final value) => _buildDetail(value),
        AsyncError(:final error) => _buildError(errorText(error)),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
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
              onPressed: () => ref.invalidate(_provider),
              child: Text(L10nGateway.current.tryAgain,
                  style: const TextStyle(fontFamily: 'Dubai'))),
        ],
      ),
    );
  }

  Widget _buildDetail(InvoiceDetail invoice) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      children: [
        _SummaryCard(invoice: invoice)
            .animate()
            .fadeIn(duration: 350.ms)
            .slideY(begin: 0.05, end: 0),
        const SizedBox(height: 20),
        _SectionTitle(title: L10nGateway.current.items2),
        const SizedBox(height: 8),
        if (invoice.items.isEmpty)
          Text(L10nGateway.current.noItems,
              style: TextStyle(
                  fontFamily: 'Dubai', color: context.appColors.textMuted))
        else
          ...invoice.items.map((item) => _ItemRow(item: item)),
        const SizedBox(height: 20),
        _SectionTitle(title: L10nGateway.current.payments),
        const SizedBox(height: 8),
        if (invoice.payments.isEmpty)
          Text(L10nGateway.current.noPaymentsRecorded,
              style: TextStyle(
                  fontFamily: 'Dubai', color: context.appColors.textMuted))
        else
          ...invoice.payments.map((p) => _PaymentRow(payment: p)),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final InvoiceDetail invoice;
  const _SummaryCard({required this.invoice});

  @override
  Widget build(BuildContext context) {
    final color =
        invoice.isPaid ? context.appColors.success : context.appColors.warning;
    final paidPercent = invoice.total > 0
        ? (invoice.paidTotal / invoice.total * 100).clamp(0, 100).round()
        : 0;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
              color: color.withValues(alpha: 0.08),
              blurRadius: 18,
              offset: const Offset(0, 6))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(invoice.invoiceNo,
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.bodyLarge,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                    invoice.isPaid
                        ? context.l10n.paid2
                        : context.l10n.incomplete,
                    style: TextStyle(
                        color: color,
                        fontSize: FontSize.caption,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Dubai')),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(context.l10n.issueDate2(invoice.issueDate),
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  color: context.appColors.textMuted)),
          if (invoice.dueDate != null)
            Text(context.l10n.dueDate2((invoice.dueDate ?? '')),
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    color: context.appColors.textMuted)),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: paidPercent / 100,
              backgroundColor: color.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 7,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _AmountBox(
                  label: context.l10n.total,
                  value: invoice.total,
                  color: context.appColors.info),
              const SizedBox(width: 8),
              _AmountBox(
                  label: context.l10n.paid,
                  value: invoice.paidTotal,
                  color: context.appColors.success),
              const SizedBox(width: 8),
              _AmountBox(
                  label: context.l10n.remaining,
                  value: invoice.balance,
                  color: context.appColors.error),
            ],
          ),
          if (invoice.discount > 0) ...[
            const SizedBox(height: 10),
            Text(context.l10n.discount2(invoice.discount.toInt()),
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    color: context.appColors.textMuted)),
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
  const _AmountBox(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: color.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.18))),
        child: Column(
          children: [
            Text('${value.toInt()}',
                style: TextStyle(
                    color: color,
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai')),
            Text(label,
                style: TextStyle(
                    color: context.appColors.textMuted,
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai')),
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
        Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
                gradient: context.appColors.gradientPrimary,
                borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: FontSize.body,
                color: Theme.of(context).colorScheme.onSurface)),
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
            child: Text(item.description,
                style: const TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w600)),
          ),
          Text(
              '${item.quantity.toStringAsFixed(item.quantity.truncateToDouble() == item.quantity ? 0 : 1)} × ${item.unitPrice.toInt()}',
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  color: context.appColors.textMuted)),
          const SizedBox(width: 10),
          Text('${item.lineTotal.toInt()}',
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w800,
                  color: context.appColors.infoText)),
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
    final color = payment.isVoided
        ? context.appColors.textMuted
        : context.appColors.success;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(
              payment.isVoided
                  ? Icons.cancel_rounded
                  : Icons.check_circle_rounded,
              color: color,
              size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(payment.paidAt,
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.caption,
                        color: context.appColors.textMuted)),
                if (payment.methodName != null)
                  Text(payment.methodName!,
                      style: const TextStyle(
                          fontFamily: 'Dubai',
                          fontSize: FontSize.caption,
                          fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Text('${payment.amount.toInt()}',
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w800,
                  color: color,
                  decoration:
                      payment.isVoided ? TextDecoration.lineThrough : null)),
        ],
      ),
    );
  }
}
