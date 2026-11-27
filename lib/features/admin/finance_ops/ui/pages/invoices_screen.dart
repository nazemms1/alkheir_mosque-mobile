import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/ui/providers/finance_ops_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/domain/entities/activity_invoice_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// قائمة الفواتير، ومن شريطها الوصول لكل المدفوعات.
class InvoicesScreen extends ConsumerWidget {
  final AuthToken token;

  const InvoicesScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ModuleAccess.canViewInvoices(token)) {
      return ModuleScaffold(
        title: L10nGateway.current.invoices,
        body: const ModuleAccessDenied(),
      );
    }
    final service = ref.read(financeOpsActionsControllerProvider.notifier);
    return ModuleScaffold(
      title: context.l10n.invoices,
      actions: [
        if (ModuleAccess.canViewPayments(token))
          IconButton(
            tooltip: context.l10n.payments2,
            icon: const Icon(Icons.payments_outlined),
            onPressed: () =>
                context.push(AppRoutes.paymentsRoute, extra: token),
          ),
      ],
      body: PagedList<InvoiceSummary>(
        emptyText: context.l10n.noInvoices,
        fetch: (page) => service.query((r) => r.invoices(page: page)),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isPaid
              ? context.appColors.success
              : context.appColors.warning,
          onTap: () => context.push(AppRoutes.adminInvoiceDetailRoute,
              extra: (token: token, invoiceId: item.id)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.invoiceNo,
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Text(
                    formatAmount(item.total),
                    style: appTextStyle(
                        fontSize: FontSize.body, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${item.parentName ?? ''}  ·  ${item.issueDate}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                L10nGateway.current.paidBalance(
                    formatAmount(item.paidTotal), formatAmount(item.balance)),
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// تفاصيل فاتورة: البنود والمدفوعات، مع إضافة بند أو تسجيل دفعة وإلغاء الدفعات.
class InvoiceDetailScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int invoiceId;

  const InvoiceDetailScreen({
    super.key,
    required this.token,
    required this.invoiceId,
  });

  @override
  ConsumerState<InvoiceDetailScreen> createState() =>
      _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends ConsumerState<InvoiceDetailScreen> {
  late final _loadProvider = screenDataProvider(() async {
    final invoice = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .query((r) => r.invoice(widget.invoiceId));
    return invoice;
  });
  InvoiceDetail? get _invoice => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  void _changed() {
    _load();
  }

  Future<void> _deleteItem(InvoiceItemRecord item) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteItem,
      message: L10nGateway.current.thisItemWillBeDeleted,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome2 = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .run((r) => r.deleteInvoiceItem(widget.invoiceId, item.id));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.itemDeleted);
    _changed();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final invoice = _invoice;
    return ModuleScaffold(
      title: invoice?.invoiceNo ?? context.l10n.invoice,
      floatingActionButton: invoice == null
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (ModuleAccess.canUpdateInvoices(t))
                  FloatingActionButton.small(
                    heroTag: 'invoice-item-add',
                    tooltip: context.l10n.addItem,
                    backgroundColor: context.appColors.primaryLight,
                    onPressed: () async {
                      final saved = await context.push<bool>(
                          AppRoutes.invoiceItemFormRoute,
                          extra: (token: t, invoiceId: invoice.id));
                      if (saved == true) _changed();
                    },
                    child: const Icon(Icons.playlist_add_rounded,
                        color: Colors.white),
                  ),
                if (ModuleAccess.canCreatePayments(t)) ...[
                  const SizedBox(height: 10),
                  FloatingActionButton.extended(
                    heroTag: 'invoice-payment-add',
                    backgroundColor: context.appColors.brandPrimary,
                    onPressed: () async {
                      final saved = await context.push<bool>(
                          AppRoutes.invoicePaymentFormRoute,
                          extra: (
                            token: t,
                            invoiceId: invoice.id,
                            balance: invoice.balance
                          ));
                      if (saved == true) _changed();
                    },
                    icon:
                        const Icon(Icons.payments_rounded, color: Colors.white),
                    label: Text(
                      context.l10n.recordPayment,
                      style: appTextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                ],
              ],
            ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null || invoice == null
              ? ModuleMessage(
                  text: errorText(_error ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: context.appColors.error,
                  onRetry: _changed,
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
                  children: [
                    ModuleCard(
                      accent: invoice.isPaid
                          ? context.appColors.success
                          : context.appColors.warning,
                      child: Column(
                        children: [
                          InfoRow(
                              label: context.l10n.parent,
                              value: invoice.parentName ?? ''),
                          InfoRow(
                              label: context.l10n.issueDate,
                              value: invoice.issueDate),
                          InfoRow(
                              label: context.l10n.dueDate,
                              value: invoice.dueDate ?? ''),
                          InfoRow(
                              label: context.l10n.subtotal,
                              value: formatAmount(invoice.subtotal)),
                          InfoRow(
                              label: context.l10n.discount,
                              value: formatAmount(invoice.discount)),
                          InfoRow(
                              label: context.l10n.total,
                              value: formatAmount(invoice.total)),
                          InfoRow(
                              label: context.l10n.paid,
                              value: formatAmount(invoice.paidTotal)),
                          InfoRow(
                              label: context.l10n.remaining,
                              value: formatAmount(invoice.balance)),
                          InfoRow(
                              label: context.l10n.notes,
                              value: invoice.notes ?? ''),
                        ],
                      ),
                    ),
                    _SectionTitle(text: context.l10n.items2),
                    if (invoice.items.isEmpty)
                      ModuleMessage(text: context.l10n.noItems)
                    else
                      for (final item in invoice.items)
                        ModuleCard(
                          onTap: ModuleAccess.canUpdateInvoices(t)
                              ? () => _deleteItem(item)
                              : null,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.description,
                                      style: appTextStyle(
                                          fontSize: FontSize.label,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${formatAmount(item.quantity)} × ${formatAmount(item.unitPrice)}${item.studentName == null ? '' : '  ·  ${item.studentName}'}',
                                      style: appTextStyle(
                                          fontSize: FontSize.caption,
                                          color: moduleMuted(context)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                formatAmount(item.amount),
                                style: appTextStyle(
                                    fontSize: FontSize.body,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                    _SectionTitle(text: context.l10n.payments2),
                    if (invoice.payments.isEmpty)
                      ModuleMessage(text: context.l10n.noPayments)
                    else
                      for (final payment in invoice.payments)
                        _PaymentCard(
                          payment: payment,
                          canVoid: ModuleAccess.canVoidPayments(t) &&
                              !payment.isVoided,
                          onVoid: () async {
                            final ok = await confirmAction(
                              context,
                              title: L10nGateway.current.voidPayment,
                              message:
                                  L10nGateway.current.thisAmountWillBeRemoved2,
                              confirmLabel: L10nGateway.current.voidPayment,
                              destructive: true,
                            );
                            if (!ok || !context.mounted) return;
                            final outcome3 = await ref
                                .read(financeOpsActionsControllerProvider
                                    .notifier)
                                .run((r) => r.voidInvoicePayment(
                                    invoice.id, payment.id));
                            if (!mounted) return;
                            if (outcome3.error case final error?) {
                              if (!context.mounted) return;
                              showModuleSnack(context, errorText(error),
                                  error: true);
                              return;
                            }
                            if (!context.mounted) return;
                            showModuleSnack(
                                context, L10nGateway.current.paymentVoided);
                            _changed();
                          },
                        ),
                  ],
                ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  final InvoicePaymentRecord payment;
  final bool canVoid;
  final VoidCallback onVoid;

  const _PaymentCard({
    required this.payment,
    required this.canVoid,
    required this.onVoid,
  });

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      accent: payment.isVoided
          ? context.appColors.textMuted
          : context.appColors.success,
      onTap: canVoid ? onVoid : null,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.paidAt,
                  style: appTextStyle(
                      fontSize: FontSize.label, fontWeight: FontWeight.w700),
                ),
                Text(
                  '${payment.paymentMethodName ?? ''}  ·  ${payment.referenceNo ?? ''}',
                  style: appTextStyle(
                      fontSize: FontSize.caption, color: moduleMuted(context)),
                ),
              ],
            ),
          ),
          Text(
            formatAmount(payment.amount),
            style: appTextStyle(
              fontSize: FontSize.body,
              fontWeight: FontWeight.w800,
              color: payment.isVoided
                  ? context.appColors.textMuted
                  : context.appColors.success,
            ),
          ),
          if (payment.isVoided) ...[
            const SizedBox(width: 8),
            StatusPill(
                label: context.l10n.voided, color: context.appColors.textMuted),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
      child: Text(
        text,
        style: appTextStyle(
          fontSize: FontSize.body,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

/// كل مدفوعات الفواتير مع تصفية بالحالة وإلغاء الدفعة.
class PaymentsScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const PaymentsScreen({super.key, required this.token});

  @override
  ConsumerState<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends ConsumerState<PaymentsScreen> {
  String? _state;
  int _reloadToken = 0;

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewPayments(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.payments2,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.payments2,
      body: PagedList<InvoicePaymentRecord>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noPayments,
        header: SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
            children: [
              for (final entry in {
                null: L10nGateway.current.all,
                'active': L10nGateway.current.active3,
                'voided': L10nGateway.current.voided,
              }.entries)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: ChoiceChip(
                    label: Text(entry.value,
                        style: appTextStyle(fontSize: FontSize.caption)),
                    selected: entry.key == _state,
                    onSelected: (_) => setState(() {
                      _state = entry.key;
                      _reloadToken++;
                    }),
                  ),
                ),
            ],
          ),
        ),
        fetch: (page) => ref
            .read(financeOpsActionsControllerProvider.notifier)
            .query((r) => r.payments(page: page, state: _state)),
        itemBuilder: (context, payment, _) => _PaymentCard(
          payment: payment,
          canVoid: ModuleAccess.canVoidPayments(t) && !payment.isVoided,
          onVoid: () async {
            final ok = await confirmAction(
              context,
              title: L10nGateway.current.voidPayment,
              message: L10nGateway.current.thisAmountWillBeRemoved2,
              confirmLabel: L10nGateway.current.voidPayment,
              destructive: true,
            );
            if (!ok || !context.mounted) return;
            final outcome4 = await ref
                .read(financeOpsActionsControllerProvider.notifier)
                .run(
                    (r) => r.voidInvoicePayment(payment.invoiceId, payment.id));
            if (!mounted) return;
            if (outcome4.error case final error?) {
              if (!context.mounted) return;
              showModuleSnack(context, errorText(error), error: true);
              return;
            }
            if (!context.mounted) return;
            showModuleSnack(context, L10nGateway.current.paymentVoided);
            setState(() => _reloadToken++);
          },
        ),
      ),
    );
  }
}

/// نموذج بند فاتورة: الوصف والكمية وسعر الوحدة، واختيارياً الطالب.
class InvoiceItemFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int invoiceId;

  const InvoiceItemFormScreen({
    super.key,
    required this.token,
    required this.invoiceId,
  });

  @override
  ConsumerState<InvoiceItemFormScreen> createState() =>
      _InvoiceItemFormScreenState();
}

class _InvoiceItemFormScreenState extends ConsumerState<InvoiceItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _description = TextEditingController();
  final _quantity = TextEditingController(text: '1');
  final _unitPrice = TextEditingController();
  PickerItem? _student;
  bool _saving = false;

  @override
  void dispose() {
    for (final c in [_description, _quantity, _unitPrice]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final quantity =
        double.tryParse(_quantity.text.trim().replaceAll(',', '.'));
    final unitPrice =
        double.tryParse(_unitPrice.text.trim().replaceAll(',', '.'));
    if (quantity == null ||
        quantity <= 0 ||
        unitPrice == null ||
        unitPrice < 0) {
      showModuleSnack(context, L10nGateway.current.enterAQuantityAboveZero,
          error: true);
      return;
    }
    setState(() => _saving = true);
    final outcome5 = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .run((r) => r.addInvoiceItem(
              widget.invoiceId,
              description: _description.text.trim(),
              quantity: quantity,
              unitPrice: unitPrice,
              studentId: _student?.id,
            ));
    if (!mounted) return;
    if (outcome5.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      title: context.l10n.addItem,
      body: !ModuleAccess.canUpdateInvoices(widget.token)
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _description,
                  label: context.l10n.description,
                  required: true,
                ),
                moduleTextField(
                  controller: _quantity,
                  label: context.l10n.quantity,
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                moduleTextField(
                  controller: _unitPrice,
                  label: context.l10n.unitPrice,
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                PickerField(
                  label: context.l10n.studentOptional,
                  value: _student?.label,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: L10nGateway.current.chooseStudent,
                      allowClear: true,
                      load: studentPickerItems,
                    );
                    if (picked == null) return;
                    setState(() => _student =
                        picked.id == PickerItem.clear.id ? null : picked);
                  },
                ),
                const SizedBox(height: 8),
                ModuleSaveButton(
                    saving: _saving, onPressed: _save, label: context.l10n.add),
              ],
            ),
    );
  }
}

/// نموذج دفعة فاتورة. المبلغ لا يتجاوز المتبقي (يتحقق منه الخادم أيضاً).
class InvoicePaymentFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int invoiceId;
  final double balance;

  const InvoicePaymentFormScreen({
    super.key,
    required this.token,
    required this.invoiceId,
    required this.balance,
  });

  @override
  ConsumerState<InvoicePaymentFormScreen> createState() =>
      _InvoicePaymentFormScreenState();
}

class _InvoicePaymentFormScreenState
    extends ConsumerState<InvoicePaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  final _reference = TextEditingController();
  final _notes = TextEditingController();
  PickerItem? _method;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.balance > 0) _amount.text = formatAmount(widget.balance);
  }

  @override
  void dispose() {
    for (final c in [_amount, _date, _reference, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() => _error =
        _method == null ? L10nGateway.current.choosePaymentMethod : null);
    final amount = double.tryParse(_amount.text.trim().replaceAll(',', '.'));
    if (!valid || _method == null) return;
    if (amount == null || amount <= 0) {
      showModuleSnack(context, L10nGateway.current.enterAValidAmountGreater,
          error: true);
      return;
    }
    if (amount > widget.balance + 0.005) {
      showModuleSnack(
        context,
        L10nGateway.current
            .amountExceedsTheBalance(formatAmount(widget.balance)),
        error: true,
      );
      return;
    }
    setState(() => _saving = true);
    final outcome6 = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .run((r) => r.addInvoicePayment(
              widget.invoiceId,
              amount: amount,
              paidAt: _date.text,
              paymentMethodId: _method!.id,
              referenceNo: nullIfBlank(_reference.text),
              notes: nullIfBlank(_notes.text),
            ));
    if (!mounted) return;
    if (outcome6.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      title: context.l10n.recordPayment,
      body: !ModuleAccess.canCreatePayments(widget.token)
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _amount,
                  label:
                      context.l10n.amountBalance(formatAmount(widget.balance)),
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                PickerField(
                  label: context.l10n.paymentMethod,
                  value: _method?.label,
                  error: _error,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: L10nGateway.current.choosePaymentMethod,
                      load: (s) =>
                          referencePickerItems('payment-methods', search: s),
                    );
                    if (picked != null) setState(() => _method = picked);
                  },
                ),
                moduleDateField(
                  context: context,
                  controller: _date,
                  label: context.l10n.paymentDate,
                  required: true,
                ),
                moduleTextField(
                    controller: _reference,
                    label: context.l10n.referenceNumber),
                moduleTextField(
                    controller: _notes, label: context.l10n.notes, maxLines: 2),
                const SizedBox(height: 8),
                ModuleSaveButton(
                    saving: _saving,
                    onPressed: _save,
                    label: context.l10n.savePayment),
              ],
            ),
    );
  }
}
