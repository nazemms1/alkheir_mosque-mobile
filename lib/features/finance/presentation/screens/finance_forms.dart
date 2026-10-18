import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/finance/data/models/finance_model.dart';
import 'package:alkheir_mosque/features/finance/data/repositories/finance_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';

/// العمليات النقدية التي تُفتح من نظرة عامة المالية.
enum CashAction { adjustment, transfer, exchange }

/// يفتح نموذج العملية المالية ويُعيد `true` عند الحفظ.
Future<bool?> showCashForm(
  BuildContext context, {
  required CashAction action,
  required List<CashBoxBalance> boxes,
}) {
  return showFormSheet(
    context,
    title: switch (action) {
      CashAction.adjustment => tr('تسوية يدوية'),
      CashAction.transfer => tr('تحويل بين الصناديق'),
      CashAction.exchange => tr('صرف عملة'),
    },
    builder: (_) => _CashFormBody(action: action, boxes: boxes),
  );
}

class _CashFormBody extends StatefulWidget {
  final CashAction action;
  final List<CashBoxBalance> boxes;

  const _CashFormBody({required this.action, required this.boxes});

  @override
  State<_CashFormBody> createState() => _CashFormBodyState();
}

class _CashFormBodyState extends State<_CashFormBody> {
  final _formKey = GlobalKey<FormState>();
  final _service = FinanceRepositoryImpl();
  final _amountCtrl = TextEditingController();
  final _toAmountCtrl = TextEditingController();
  final _textCtrl = TextEditingController();
  final _dateCtrl = TextEditingController(text: isoDate(DateTime.now()));

  int? _boxId;
  int? _toBoxId;
  int? _currencyId;
  int? _fromCurrencyId;
  int? _toCurrencyId;
  String _direction = 'in';
  bool _submitting = false;
  String? _error;

  CashBoxBalance? _boxById(int? id) {
    if (id == null) return null;
    for (final box in widget.boxes) {
      if (box.id == id) return box;
    }
    return null;
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _toAmountCtrl.dispose();
    _textCtrl.dispose();
    _dateCtrl.dispose();
    super.dispose();
  }

  double? _parseAmount(String text) =>
      double.tryParse(text.trim().replaceAll(',', '.'));

  String? _validateAmount(String? value) {
    final amount = _parseAmount(value ?? '');
    return (amount == null || amount <= 0)
        ? tr('أدخل مبلغاً صحيحاً أكبر من صفر')
        : null;
  }

  Future<void> _pickDate() async {
    final picked = await pickIsoDate(context, current: _dateCtrl.text);
    if (picked != null) setState(() => _dateCtrl.text = picked);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await _send();
      if (mounted) Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _submitting = false;
        _error = errorText(error);
      });
    }
  }

  Future<void> _send() {
    final amount = _parseAmount(_amountCtrl.text) ?? 0;
    final date = _dateCtrl.text;
    switch (widget.action) {
      case CashAction.adjustment:
        return _service.postAdjustment(
          cashBoxId: _boxId!,
          currencyId: _currencyId!,
          direction: _direction,
          amount: amount,
          description: _textCtrl.text.trim(),
          transactionDate: date,
        );
      case CashAction.transfer:
        return _service.postTransfer(
          fromCashBoxId: _boxId!,
          toCashBoxId: _toBoxId!,
          currencyId: _currencyId!,
          amount: amount,
          transferDate: date,
          notes: _textCtrl.text.trim(),
        );
      case CashAction.exchange:
        final toAmount = _parseAmount(_toAmountCtrl.text);
        return _service.postExchange(
          fromCashBoxId: _boxId!,
          toCashBoxId: _toBoxId!,
          fromCurrencyId: _fromCurrencyId!,
          toCurrencyId: _toCurrencyId!,
          fromAmount: amount,
          exchangeDate: date,
          toAmount: toAmount,
          notes: _textCtrl.text.trim(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ..._buildFields(),
          if (_error != null) ...[
            const SizedBox(height: 10),
            Text(
              _error!,
              style: appTextStyle(fontSize: 13, color: AppColors.error),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _submitting ? null : _submit,
            child: _submitting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(tr('حفظ'), style: appTextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFields() {
    switch (widget.action) {
      case CashAction.adjustment:
        return _adjustmentFields();
      case CashAction.transfer:
        return _transferFields();
      case CashAction.exchange:
        return _exchangeFields();
    }
  }

  List<Widget> _adjustmentFields() {
    final box = _boxById(_boxId);
    return [
      _boxDropdown(
        label: tr('الصندوق'),
        value: _boxId,
        onChanged: (id) => setState(() {
          _boxId = id;
          _currencyId = null;
        }),
      ),
      const SizedBox(height: 12),
      _currencyDropdown(
        key: ValueKey('adj-$_boxId'),
        label: tr('العملة'),
        options: box?.currencyOptions ?? const [],
        value: _currencyId,
        onChanged: (id) => setState(() => _currencyId = id),
      ),
      const SizedBox(height: 12),
      SegmentedButton<String>(
        segments: [
          ButtonSegment(
              value: 'in', label: Text(tr('وارد'), style: appTextStyle())),
          ButtonSegment(
              value: 'out', label: Text(tr('صادر'), style: appTextStyle())),
        ],
        selected: {_direction},
        onSelectionChanged: (set) => setState(() => _direction = set.first),
      ),
      const SizedBox(height: 12),
      _amountField(),
      const SizedBox(height: 12),
      TextFormField(
        controller: _textCtrl,
        maxLength: 500,
        style: appTextStyle(),
        decoration: InputDecoration(labelText: tr('الوصف')),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? tr('أدخل وصفاً للعملية') : null,
      ),
      _dateField(tr('التاريخ')),
    ];
  }

  List<Widget> _transferFields() {
    final from = _boxById(_boxId);
    final to = _boxById(_toBoxId);
    final common = from == null || to == null
        ? const <FinanceCurrency>[]
        : from.currencyOptions
            .where((c) => to.currencyOptions.any((d) => d.id == c.id))
            .toList();
    return [
      _boxDropdown(
        label: tr('من صندوق'),
        value: _boxId,
        onChanged: (id) => setState(() {
          _boxId = id;
          _currencyId = null;
        }),
      ),
      const SizedBox(height: 12),
      _boxDropdown(
        label: tr('إلى صندوق'),
        value: _toBoxId,
        onChanged: (id) => setState(() {
          _toBoxId = id;
          _currencyId = null;
        }),
      ),
      const SizedBox(height: 12),
      _currencyDropdown(
        key: ValueKey('tr-$_boxId-$_toBoxId'),
        label: tr('العملة المشتركة'),
        options: common,
        value: _currencyId,
        onChanged: (id) => setState(() => _currencyId = id),
      ),
      const SizedBox(height: 12),
      _amountField(),
      const SizedBox(height: 12),
      TextFormField(
        controller: _textCtrl,
        maxLength: 500,
        style: appTextStyle(),
        decoration: InputDecoration(labelText: tr('ملاحظات')),
      ),
      _dateField(tr('تاريخ التحويل')),
    ];
  }

  List<Widget> _exchangeFields() {
    final from = _boxById(_boxId);
    final to = _boxById(_toBoxId);
    return [
      _boxDropdown(
        label: tr('من صندوق'),
        value: _boxId,
        onChanged: (id) => setState(() {
          _boxId = id;
          _fromCurrencyId = null;
        }),
      ),
      const SizedBox(height: 12),
      _currencyDropdown(
        key: ValueKey('ex-from-$_boxId'),
        label: tr('من عملة'),
        options: from?.currencyOptions ?? const [],
        value: _fromCurrencyId,
        onChanged: (id) => setState(() => _fromCurrencyId = id),
      ),
      const SizedBox(height: 12),
      _amountField(label: tr('المبلغ المرسل')),
      const SizedBox(height: 12),
      _boxDropdown(
        label: tr('إلى صندوق'),
        value: _toBoxId,
        onChanged: (id) => setState(() {
          _toBoxId = id;
          _toCurrencyId = null;
        }),
      ),
      const SizedBox(height: 12),
      _currencyDropdown(
        key: ValueKey('ex-to-$_toBoxId'),
        label: tr('إلى عملة'),
        options: to?.currencyOptions ?? const [],
        value: _toCurrencyId,
        onChanged: (id) => setState(() => _toCurrencyId = id),
      ),
      const SizedBox(height: 12),
      TextFormField(
        controller: _toAmountCtrl,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: appTextStyle(),
        decoration: InputDecoration(
          labelText: tr('المبلغ المستلم (اختياري)'),
          helperText: tr('إن تُرك فارغاً يحسبه النظام من أسعار الصرف'),
        ),
        validator: (v) {
          if (v == null || v.trim().isEmpty) return null;
          return _validateAmount(v);
        },
      ),
      const SizedBox(height: 12),
      TextFormField(
        controller: _textCtrl,
        maxLength: 500,
        style: appTextStyle(),
        decoration: InputDecoration(labelText: tr('ملاحظات')),
      ),
      _dateField(tr('تاريخ الصرف')),
    ];
  }

  Widget _boxDropdown({
    required String label,
    required int? value,
    required ValueChanged<int?> onChanged,
  }) {
    return DropdownButtonFormField<int>(
      initialValue: value,
      isExpanded: true,
      style: appTextStyle(),
      decoration: InputDecoration(labelText: label),
      items: [
        for (final box in widget.boxes)
          DropdownMenuItem(
            value: box.id,
            child: Text('${box.name} (${box.code})', style: appTextStyle()),
          ),
      ],
      onChanged: onChanged,
      validator: (v) => v == null ? tr('اختر الصندوق') : null,
    );
  }

  Widget _currencyDropdown({
    required Key key,
    required String label,
    required List<FinanceCurrency> options,
    required int? value,
    required ValueChanged<int?> onChanged,
  }) {
    return DropdownButtonFormField<int>(
      key: key,
      initialValue: options.any((c) => c.id == value) ? value : null,
      isExpanded: true,
      style: appTextStyle(),
      decoration: InputDecoration(
        labelText: label,
        helperText: options.isEmpty ? tr('اختر الصندوق أولاً') : null,
      ),
      items: [
        for (final currency in options)
          DropdownMenuItem(
            value: currency.id,
            child: Text(
              '${currency.name} (${currency.label})',
              style: appTextStyle(),
            ),
          ),
      ],
      onChanged: onChanged,
      validator: (v) => v == null ? tr('اختر العملة') : null,
    );
  }

  Widget _amountField({String? label}) {
    return TextFormField(
      controller: _amountCtrl,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: appTextStyle(),
      decoration: InputDecoration(labelText: label ?? tr('المبلغ')),
      validator: _validateAmount,
    );
  }

  Widget _dateField(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        controller: _dateCtrl,
        readOnly: true,
        style: appTextStyle(),
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_today_rounded, size: 18),
        ),
        onTap: _pickDate,
        validator: (v) => (v == null || v.isEmpty) ? tr('اختر التاريخ') : null,
      ),
    );
  }
}
