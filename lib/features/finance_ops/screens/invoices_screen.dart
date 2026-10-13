import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/activity_invoice_model.dart';
import '../../../data/services/finance_ops_service.dart';
import '../../management/widgets/module_form_fields.dart';
import '../../management/widgets/module_widgets.dart';
import '../../management/widgets/pickers.dart';

/// قائمة الفواتير، ومن شريطها الوصول لكل المدفوعات.
class InvoicesScreen extends StatelessWidget {
  final AuthToken token;

  const InvoicesScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canViewInvoices(token)) {
      return ModuleScaffold(
        title: tr('الفواتير'),
        body: const ModuleAccessDenied(),
      );
    }
    final service = FinanceOpsService();
    return ModuleScaffold(
      title: tr('الفواتير'),
      actions: [
        if (ModuleAccess.canViewPayments(token))
          IconButton(
            tooltip: tr('المدفوعات'),
            icon: const Icon(Icons.payments_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => PaymentsScreen(token: token)),
            ),
          ),
      ],
      body: PagedList<InvoiceSummary>(
        emptyText: tr('لا توجد فواتير'),
        fetch: (page) => service.invoices(page: page),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isPaid ? AppColors.success : AppColors.warning,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => InvoiceDetailScreen(
                token: token,
                invoiceId: item.id,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.invoiceNo,
                      style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Text(
                    formatAmount(item.total),
                    style:
                        appTextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${item.parentName ?? ''}  ·  ${item.issueDate}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                trf('المدفوع: {0}  ·  المتبقي: {1}', [
                  formatAmount(item.paidTotal),
                  formatAmount(item.balance),
                ]),
                style: appTextStyle(fontSize: 11, color: moduleMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// تفاصيل فاتورة: البنود والمدفوعات، مع إضافة بند أو تسجيل دفعة وإلغاء الدفعات.
class InvoiceDetailScreen extends StatefulWidget {
  final AuthToken token;
  final int invoiceId;

  const InvoiceDetailScreen({
    super.key,
    required this.token,
    required this.invoiceId,
  });

  @override
  State<InvoiceDetailScreen> createState() => _InvoiceDetailScreenState();
}

class _InvoiceDetailScreenState extends State<InvoiceDetailScreen> {
  final _service = FinanceOpsService();
  InvoiceDetail? _invoice;
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final invoice = await _service.invoice(widget.invoiceId);
      if (!mounted) return;
      setState(() {
        _invoice = invoice;
        _loading = false;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  void _changed() {
    setState(() => _loading = true);
    _load();
  }

  Future<void> _deleteItem(InvoiceItemRecord item) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف البند'),
      message: tr('سيُحذف هذا البند وتُعاد حساب إجمالي الفاتورة.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _service.deleteInvoiceItem(widget.invoiceId, item.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف البند'));
      _changed();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final invoice = _invoice;
    return ModuleScaffold(
      title: invoice?.invoiceNo ?? tr('الفاتورة'),
      floatingActionButton: invoice == null
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (ModuleAccess.canUpdateInvoices(t))
                  FloatingActionButton.small(
                    heroTag: 'invoice-item-add',
                    tooltip: tr('إضافة بند'),
                    backgroundColor: AppColors.primaryLight,
                    onPressed: () async {
                      final saved = await Navigator.of(context).push<bool>(
                        MaterialPageRoute(
                          builder: (_) => InvoiceItemFormScreen(
                            token: t,
                            invoiceId: invoice.id,
                          ),
                        ),
                      );
                      if (saved == true) _changed();
                    },
                    child: const Icon(Icons.playlist_add_rounded,
                        color: Colors.white),
                  ),
                if (ModuleAccess.canCreatePayments(t)) ...[
                  const SizedBox(height: 10),
                  FloatingActionButton.extended(
                    heroTag: 'invoice-payment-add',
                    backgroundColor: AppColors.primary,
                    onPressed: () async {
                      final saved = await Navigator.of(context).push<bool>(
                        MaterialPageRoute(
                          builder: (_) => InvoicePaymentFormScreen(
                            token: t,
                            invoiceId: invoice.id,
                            balance: invoice.balance,
                          ),
                        ),
                      );
                      if (saved == true) _changed();
                    },
                    icon:
                        const Icon(Icons.payments_rounded, color: Colors.white),
                    label: Text(
                      tr('تسجيل دفعة'),
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
                  color: AppColors.error,
                  onRetry: _changed,
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
                  children: [
                    ModuleCard(
                      accent: invoice.isPaid
                          ? AppColors.success
                          : AppColors.warning,
                      child: Column(
                        children: [
                          InfoRow(
                              label: tr('ولي الأمر'),
                              value: invoice.parentName ?? ''),
                          InfoRow(
                              label: tr('تاريخ الإصدار'),
                              value: invoice.issueDate),
                          InfoRow(
                              label: tr('تاريخ الاستحقاق'),
                              value: invoice.dueDate ?? ''),
                          InfoRow(
                              label: tr('المجموع الفرعي'),
                              value: formatAmount(invoice.subtotal)),
                          InfoRow(
                              label: tr('الخصم'),
                              value: formatAmount(invoice.discount)),
                          InfoRow(
                              label: tr('الإجمالي'),
                              value: formatAmount(invoice.total)),
                          InfoRow(
                              label: tr('المدفوع'),
                              value: formatAmount(invoice.paidTotal)),
                          InfoRow(
                              label: tr('المتبقي'),
                              value: formatAmount(invoice.balance)),
                          InfoRow(
                              label: tr('ملاحظات'), value: invoice.notes ?? ''),
                        ],
                      ),
                    ),
                    _SectionTitle(text: tr('البنود')),
                    if (invoice.items.isEmpty)
                      ModuleMessage(text: tr('لا توجد بنود'))
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
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${formatAmount(item.quantity)} × ${formatAmount(item.unitPrice)}${item.studentName == null ? '' : '  ·  ${item.studentName}'}',
                                      style: appTextStyle(
                                          fontSize: 11,
                                          color: moduleMuted(context)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                formatAmount(item.amount),
                                style: appTextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                    _SectionTitle(text: tr('المدفوعات')),
                    if (invoice.payments.isEmpty)
                      ModuleMessage(text: tr('لا توجد مدفوعات'))
                    else
                      for (final payment in invoice.payments)
                        _PaymentCard(
                          payment: payment,
                          canVoid: ModuleAccess.canVoidPayments(t) &&
                              !payment.isVoided,
                          onVoid: () async {
                            final ok = await confirmAction(
                              context,
                              title: tr('إلغاء الدفعة'),
                              message: tr(
                                  'سيُلغى هذا المبلغ من المدفوعات. لا يمكن التراجع.'),
                              confirmLabel: tr('إلغاء الدفعة'),
                              destructive: true,
                            );
                            if (!ok || !mounted) return;
                            try {
                              await _service.voidInvoicePayment(
                                  invoice.id, payment.id);
                              if (!mounted) return;
                              showModuleSnack(context, tr('تم إلغاء الدفعة'));
                              _changed();
                            } catch (error) {
                              if (!mounted) return;
                              showModuleSnack(context, errorText(error),
                                  error: true);
                            }
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
      accent: payment.isVoided ? AppColors.textMuted : AppColors.success,
      onTap: canVoid ? onVoid : null,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.paidAt,
                  style:
                      appTextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                Text(
                  '${payment.paymentMethodName ?? ''}  ·  ${payment.referenceNo ?? ''}',
                  style:
                      appTextStyle(fontSize: 11, color: moduleMuted(context)),
                ),
              ],
            ),
          ),
          Text(
            formatAmount(payment.amount),
            style: appTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: payment.isVoided ? AppColors.textMuted : AppColors.success,
            ),
          ),
          if (payment.isVoided) ...[
            const SizedBox(width: 8),
            StatusPill(label: tr('ملغاة'), color: AppColors.textMuted),
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
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

/// كل مدفوعات الفواتير مع تصفية بالحالة وإلغاء الدفعة.
class PaymentsScreen extends StatefulWidget {
  final AuthToken token;

  const PaymentsScreen({super.key, required this.token});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final _service = FinanceOpsService();
  String? _state;
  int _reloadToken = 0;

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewPayments(t)) {
      return ModuleScaffold(
        title: tr('المدفوعات'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('المدفوعات'),
      body: PagedList<InvoicePaymentRecord>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد مدفوعات'),
        header: SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
            children: [
              for (final entry in {
                null: tr('الكل'),
                'active': tr('فعّالة'),
                'voided': tr('ملغاة'),
              }.entries)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ChoiceChip(
                    label: Text(entry.value, style: appTextStyle(fontSize: 12)),
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
        fetch: (page) => _service.payments(page: page, state: _state),
        itemBuilder: (context, payment, _) => _PaymentCard(
          payment: payment,
          canVoid: ModuleAccess.canVoidPayments(t) && !payment.isVoided,
          onVoid: () async {
            final ok = await confirmAction(
              context,
              title: tr('إلغاء الدفعة'),
              message: tr('سيُلغى هذا المبلغ من المدفوعات. لا يمكن التراجع.'),
              confirmLabel: tr('إلغاء الدفعة'),
              destructive: true,
            );
            if (!ok || !context.mounted) return;
            try {
              await _service.voidInvoicePayment(payment.invoiceId, payment.id);
              if (!context.mounted) return;
              showModuleSnack(context, tr('تم إلغاء الدفعة'));
              setState(() => _reloadToken++);
            } catch (error) {
              if (!context.mounted) return;
              showModuleSnack(context, errorText(error), error: true);
            }
          },
        ),
      ),
    );
  }
}

/// نموذج بند فاتورة: الوصف والكمية وسعر الوحدة، واختيارياً الطالب.
class InvoiceItemFormScreen extends StatefulWidget {
  final AuthToken token;
  final int invoiceId;

  const InvoiceItemFormScreen({
    super.key,
    required this.token,
    required this.invoiceId,
  });

  @override
  State<InvoiceItemFormScreen> createState() => _InvoiceItemFormScreenState();
}

class _InvoiceItemFormScreenState extends State<InvoiceItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = FinanceOpsService();
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
      showModuleSnack(context, tr('أدخل كمية أكبر من صفر وسعراً صحيحاً'),
          error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _service.addInvoiceItem(
        widget.invoiceId,
        description: _description.text.trim(),
        quantity: quantity,
        unitPrice: unitPrice,
        studentId: _student?.id,
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      title: tr('إضافة بند'),
      body: !ModuleAccess.canUpdateInvoices(widget.token)
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _description,
                  label: tr('الوصف'),
                  required: true,
                ),
                moduleTextField(
                  controller: _quantity,
                  label: tr('الكمية'),
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                moduleTextField(
                  controller: _unitPrice,
                  label: tr('سعر الوحدة'),
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                PickerField(
                  label: tr('الطالب (اختياري)'),
                  value: _student?.label,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: tr('اختر الطالب'),
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
                    saving: _saving, onPressed: _save, label: tr('إضافة')),
              ],
            ),
    );
  }
}

/// نموذج دفعة فاتورة. المبلغ لا يتجاوز المتبقي (يتحقق منه الخادم أيضاً).
class InvoicePaymentFormScreen extends StatefulWidget {
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
  State<InvoicePaymentFormScreen> createState() =>
      _InvoicePaymentFormScreenState();
}

class _InvoicePaymentFormScreenState extends State<InvoicePaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = FinanceOpsService();
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
    setState(() => _error = _method == null ? tr('اختر طريقة الدفع') : null);
    final amount = double.tryParse(_amount.text.trim().replaceAll(',', '.'));
    if (!valid || _method == null) return;
    if (amount == null || amount <= 0) {
      showModuleSnack(context, tr('أدخل مبلغاً صحيحاً أكبر من صفر'),
          error: true);
      return;
    }
    if (amount > widget.balance + 0.005) {
      showModuleSnack(
        context,
        trf('المبلغ يتجاوز المتبقي ({0})', [formatAmount(widget.balance)]),
        error: true,
      );
      return;
    }
    setState(() => _saving = true);
    try {
      await _service.addInvoicePayment(
        widget.invoiceId,
        amount: amount,
        paidAt: _date.text,
        paymentMethodId: _method!.id,
        referenceNo: nullIfBlank(_reference.text),
        notes: nullIfBlank(_notes.text),
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModuleScaffold(
      title: tr('تسجيل دفعة'),
      body: !ModuleAccess.canCreatePayments(widget.token)
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _amount,
                  label: trf(
                      'المبلغ (المتبقي {0})', [formatAmount(widget.balance)]),
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                PickerField(
                  label: tr('طريقة الدفع'),
                  value: _method?.label,
                  error: _error,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: tr('اختر طريقة الدفع'),
                      load: (s) =>
                          referencePickerItems('payment-methods', search: s),
                    );
                    if (picked != null) setState(() => _method = picked);
                  },
                ),
                moduleDateField(
                  context: context,
                  controller: _date,
                  label: tr('تاريخ الدفع'),
                  required: true,
                ),
                moduleTextField(
                    controller: _reference, label: tr('رقم المرجع')),
                moduleTextField(
                    controller: _notes, label: tr('ملاحظات'), maxLines: 2),
                const SizedBox(height: 8),
                ModuleSaveButton(
                    saving: _saving, onPressed: _save, label: tr('حفظ الدفعة')),
              ],
            ),
    );
  }
}
