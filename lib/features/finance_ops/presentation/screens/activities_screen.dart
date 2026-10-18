import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/finance_ops/data/models/activity_invoice_model.dart';
import 'package:alkheir_mosque/features/finance_ops/data/repositories/finance_ops_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';

String registrationStatusLabel(String status) => switch (status) {
      'registered' => tr('مسجّل'),
      'declined' => tr('اعتذر'),
      'cancelled' => tr('ملغى'),
      'attended' => tr('حضر'),
      _ => status,
    };

/// قائمة الأنشطة. كل نشاط يفتح بتبويبات: المعلومات والتسجيلات والمدفوعات والمصروفات.
class ActivitiesScreen extends StatelessWidget {
  final AuthToken token;

  const ActivitiesScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canViewActivities(token)) {
      return ModuleScaffold(
        title: tr('الأنشطة'),
        body: const ModuleAccessDenied(),
      );
    }
    final service = FinanceOpsRepositoryImpl();
    return ModuleScaffold(
      title: tr('الأنشطة'),
      body: PagedList<ActivitySummary>(
        emptyText: tr('لا توجد أنشطة'),
        fetch: (page) => service.activities(page: page),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isActive ? AppColors.primaryLight : AppColors.textMuted,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ActivityDetailScreen(
                token: token,
                activityId: item.id,
                title: item.title,
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
                      item.title,
                      style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: item.isActive ? tr('نشط') : tr('منتهٍ'),
                    color:
                        item.isActive ? AppColors.success : AppColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${item.activityDate ?? ''}  ·  ${item.groupName ?? ''}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
              Text(
                trf('المحصّل: {0}  ·  المصروفات: {1}', [
                  formatAmount(item.collectedRevenue),
                  formatAmount(item.expenseTotal),
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

/// تفاصيل نشاط بأربعة تبويبات: المعلومات، التسجيلات، المدفوعات، المصروفات.
class ActivityDetailScreen extends StatefulWidget {
  final AuthToken token;
  final int activityId;
  final String title;

  const ActivityDetailScreen({
    super.key,
    required this.token,
    required this.activityId,
    required this.title,
  });

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen>
    with SingleTickerProviderStateMixin {
  final _service = FinanceOpsRepositoryImpl();
  late final TabController _tabs;
  ActivityDetail? _detail;
  bool _loading = true;
  Object? _error;
  int _reloadToken = 0;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
    _load();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final detail = await _service.activity(widget.activityId);
      if (!mounted) return;
      setState(() {
        _detail = detail;
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
    setState(() => _reloadToken++);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final showFinance = ModuleAccess.canViewActivityFinance(t);
    final tabs = [
      Tab(text: tr('المعلومات')),
      Tab(text: tr('التسجيلات')),
      Tab(text: tr('المدفوعات')),
      Tab(text: tr('المصروفات')),
    ];
    final detail = _detail;
    return ModuleScaffold(
      title: widget.title,
      bottom: TabBar(
        controller: _tabs,
        isScrollable: true,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        tabs: tabs,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null || detail == null
              ? ModuleMessage(
                  text: errorText(_error ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: AppColors.error,
                  onRetry: () {
                    setState(() => _loading = true);
                    _load();
                  },
                )
              : TabBarView(
                  controller: _tabs,
                  children: [
                    _InfoTab(detail: detail),
                    showFinance && ModuleAccess.canViewActivityFinance(t)
                        ? _RegistrationsTab(
                            token: t,
                            activityId: widget.activityId,
                            fee: detail.summary.feeAmount,
                            reloadToken: _reloadToken,
                            onChanged: _changed,
                            service: _service,
                          )
                        : const ModuleAccessDenied(),
                    showFinance
                        ? _PaymentsTab(
                            token: t,
                            activityId: widget.activityId,
                            reloadToken: _reloadToken,
                            onChanged: _changed,
                            service: _service,
                          )
                        : const ModuleAccessDenied(),
                    showFinance
                        ? _ExpensesTab(
                            token: t,
                            activityId: widget.activityId,
                            reloadToken: _reloadToken,
                            onChanged: _changed,
                            service: _service,
                          )
                        : const ModuleAccessDenied(),
                  ],
                ),
    );
  }
}

class _InfoTab extends StatelessWidget {
  final ActivityDetail detail;

  const _InfoTab({required this.detail});

  @override
  Widget build(BuildContext context) {
    final s = detail.summary;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        ModuleCard(
          child: Column(
            children: [
              InfoRow(label: tr('التاريخ'), value: s.activityDate ?? ''),
              InfoRow(label: tr('الحلقة'), value: s.groupName ?? ''),
              InfoRow(label: tr('الرسوم'), value: formatAmount(s.feeAmount)),
              InfoRow(
                  label: tr('المتوقع'), value: formatAmount(s.expectedRevenue)),
              InfoRow(
                  label: tr('المحصّل'),
                  value: formatAmount(s.collectedRevenue)),
              InfoRow(
                  label: tr('المصروفات'), value: formatAmount(s.expenseTotal)),
              InfoRow(label: tr('الصافي'), value: formatAmount(s.netRevenue)),
              InfoRow(label: tr('الوصف'), value: s.description ?? ''),
            ],
          ),
        ),
        ModuleCard(
          child: Column(
            children: [
              InfoRow(
                  label: tr('عدد التسجيلات'),
                  value: '${detail.registrationsCount}'),
              InfoRow(
                  label: tr('عدد المدفوعات'), value: '${detail.paymentsCount}'),
              InfoRow(
                  label: tr('عدد المصروفات'), value: '${detail.expensesCount}'),
              InfoRow(
                label: tr('المجموعات المستهدفة'),
                value: detail.targetGroups.map((g) => g.name).join('، '),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RegistrationsTab extends StatelessWidget {
  final AuthToken token;
  final int activityId;
  final double fee;
  final int reloadToken;
  final VoidCallback onChanged;
  final FinanceOpsRepositoryImpl service;

  const _RegistrationsTab({
    required this.token,
    required this.activityId,
    required this.fee,
    required this.reloadToken,
    required this.onChanged,
    required this.service,
  });

  Future<void> _openForm(BuildContext context,
      {ActivityRegistration? item}) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => RegistrationFormScreen(
          token: token,
          activityId: activityId,
          defaultFee: fee,
          registration: item,
        ),
      ),
    );
    if (saved == true) onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PagedList<ActivityRegistration>(
          reloadToken: reloadToken,
          emptyText: tr('لا توجد تسجيلات لهذا النشاط'),
          fetch: (page) => service.registrations(activityId, page: page),
          itemBuilder: (context, item, _) => ModuleCard(
            accent: item.balance > 0 ? AppColors.warning : AppColors.success,
            onTap: ModuleAccess.canManageRegistrations(token)
                ? () => _openForm(context, item: item)
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.studentName,
                        style: appTextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ),
                    StatusPill(
                      label: registrationStatusLabel(item.status),
                      color: AppColors.info,
                    ),
                  ],
                ),
                Text(
                  trf('الرسوم: {0}  ·  المدفوع: {1}  ·  المتبقي: {2}', [
                    formatAmount(item.feeAmount),
                    formatAmount(item.paidTotal),
                    formatAmount(item.balance),
                  ]),
                  style:
                      appTextStyle(fontSize: 11, color: moduleMuted(context)),
                ),
              ],
            ),
          ),
        ),
        if (ModuleAccess.canManageRegistrations(token))
          Positioned(
            left: 16,
            bottom: 16,
            child: FloatingActionButton.extended(
              heroTag: 'registration-add',
              onPressed: () => _openForm(context),
              backgroundColor: AppColors.primary,
              icon:
                  const Icon(Icons.person_add_alt_rounded, color: Colors.white),
              label: Text(
                tr('تسجيل مشارك'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

class _PaymentsTab extends StatelessWidget {
  final AuthToken token;
  final int activityId;
  final int reloadToken;
  final VoidCallback onChanged;
  final FinanceOpsRepositoryImpl service;

  const _PaymentsTab({
    required this.token,
    required this.activityId,
    required this.reloadToken,
    required this.onChanged,
    required this.service,
  });

  Future<void> _void(BuildContext context, ActivityPayment payment) async {
    final ok = await confirmAction(
      context,
      title: tr('إلغاء الدفعة'),
      message: tr('سيُلغى هذا المبلغ من إجمالي المحصّل. لا يمكن التراجع.'),
      confirmLabel: tr('إلغاء الدفعة'),
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    try {
      await service.voidActivityPayment(activityId, payment.id);
      if (!context.mounted) return;
      showModuleSnack(context, tr('تم إلغاء الدفعة'));
      onChanged();
    } catch (error) {
      if (!context.mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canManage = ModuleAccess.canManageActivityPayments(token);
    return Stack(
      children: [
        PagedList<ActivityPayment>(
          reloadToken: reloadToken,
          emptyText: tr('لا توجد مدفوعات'),
          fetch: (page) => service.activityPayments(activityId, page: page),
          itemBuilder: (context, item, _) => ModuleCard(
            accent: item.isVoided ? AppColors.textMuted : AppColors.success,
            onTap:
                canManage && !item.isVoided ? () => _void(context, item) : null,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.studentName,
                        style: appTextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '${item.paidAt}  ·  ${item.paymentMethodName ?? ''}  ·  ${item.referenceNo ?? ''}',
                        style: appTextStyle(
                            fontSize: 11, color: moduleMuted(context)),
                      ),
                    ],
                  ),
                ),
                Text(
                  formatAmount(item.amount),
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color:
                        item.isVoided ? AppColors.textMuted : AppColors.success,
                  ),
                ),
                if (item.isVoided) ...[
                  const SizedBox(width: 8),
                  StatusPill(label: tr('ملغاة'), color: AppColors.textMuted),
                ],
              ],
            ),
          ),
        ),
        if (canManage)
          Positioned(
            left: 16,
            bottom: 16,
            child: FloatingActionButton.extended(
              heroTag: 'activity-payment-add',
              onPressed: () async {
                final saved = await Navigator.of(context).push<bool>(
                  MaterialPageRoute(
                    builder: (_) => ActivityPaymentFormScreen(
                      token: token,
                      activityId: activityId,
                    ),
                  ),
                );
                if (saved == true) onChanged();
              },
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.payments_rounded, color: Colors.white),
              label: Text(
                tr('تسجيل دفعة'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

class _ExpensesTab extends StatelessWidget {
  final AuthToken token;
  final int activityId;
  final int reloadToken;
  final VoidCallback onChanged;
  final FinanceOpsRepositoryImpl service;

  const _ExpensesTab({
    required this.token,
    required this.activityId,
    required this.reloadToken,
    required this.onChanged,
    required this.service,
  });

  Future<void> _openForm(BuildContext context, {ActivityExpense? item}) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => ActivityExpenseFormScreen(
          token: token,
          activityId: activityId,
          expense: item,
        ),
      ),
    );
    if (saved == true) onChanged();
  }

  Future<void> _delete(BuildContext context, ActivityExpense item) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف المصروف'),
      message: tr('سيتم حذف هذا المصروف من إجمالي النشاط.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    try {
      await service.deleteActivityExpense(activityId, item.id);
      if (!context.mounted) return;
      showModuleSnack(context, tr('تم حذف المصروف'));
      onChanged();
    } catch (error) {
      if (!context.mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canManage = ModuleAccess.canManageActivityExpenses(token);
    return Stack(
      children: [
        PagedList<ActivityExpense>(
          reloadToken: reloadToken,
          emptyText: tr('لا توجد مصروفات'),
          fetch: (page) => service.activityExpenses(activityId, page: page),
          itemBuilder: (context, item, _) => ModuleCard(
            accent: AppColors.error,
            onTap: canManage
                ? () async {
                    final choice = await showRecordSheet(
                      context,
                      title: item.description,
                      subtitle: item.categoryName ?? '',
                      rows: [
                        MapEntry(tr('المبلغ'), formatAmount(item.amount)),
                        MapEntry(tr('التاريخ'), item.spentOn),
                      ],
                      actions: [
                        SheetAction(
                            id: 'edit',
                            label: tr('تعديل'),
                            icon: Icons.edit_rounded),
                        SheetAction(
                          id: 'delete',
                          label: tr('حذف'),
                          icon: Icons.delete_outline_rounded,
                          destructive: true,
                        ),
                      ],
                    );
                    if (!context.mounted) return;
                    if (choice == 'edit') {
                      await _openForm(context, item: item);
                    } else if (choice == 'delete') {
                      await _delete(context, item);
                    }
                  }
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
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '${item.categoryName ?? ''}  ·  ${item.spentOn}',
                        style: appTextStyle(
                            fontSize: 11, color: moduleMuted(context)),
                      ),
                    ],
                  ),
                ),
                Text(
                  formatAmount(item.amount),
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (canManage)
          Positioned(
            left: 16,
            bottom: 16,
            child: FloatingActionButton.extended(
              heroTag: 'activity-expense-add',
              onPressed: () => _openForm(context),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.receipt_long_rounded, color: Colors.white),
              label: Text(
                tr('إضافة مصروف'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}

/// نموذج تسجيل مشارك في النشاط (أو تعديل تسجيله).
class RegistrationFormScreen extends StatefulWidget {
  final AuthToken token;
  final int activityId;
  final double defaultFee;
  final ActivityRegistration? registration;

  const RegistrationFormScreen({
    super.key,
    required this.token,
    required this.activityId,
    required this.defaultFee,
    this.registration,
  });

  @override
  State<RegistrationFormScreen> createState() => _RegistrationFormScreenState();
}

class _RegistrationFormScreenState extends State<RegistrationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = FinanceOpsRepositoryImpl();
  final _fee = TextEditingController();
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _enrollment;
  String _status = 'registered';
  bool _saving = false;
  String? _error;

  bool get _isEdit => widget.registration != null;

  @override
  void initState() {
    super.initState();
    final r = widget.registration;
    if (r != null) {
      _student = PickerItem(id: r.studentId ?? 0, label: r.studentName);
      _fee.text = formatAmount(r.feeAmount);
      _notes.text = r.notes ?? '';
      _status = r.status;
    } else {
      _fee.text = formatAmount(widget.defaultFee);
    }
  }

  @override
  void dispose() {
    _fee.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() => _error = _student == null ? tr('اختر الطالب') : null);
    final fee = double.tryParse(_fee.text.trim().replaceAll(',', '.'));
    if (!valid || _student == null) return;
    if (fee == null || fee < 0) {
      showModuleSnack(context, tr('أدخل رسوماً صحيحة'), error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _service.saveRegistration(
        widget.activityId,
        id: widget.registration?.id,
        studentId: _student!.id,
        enrollmentId: _enrollment?.id,
        feeAmount: fee,
        status: _status,
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
    final allowed = ModuleAccess.canManageRegistrations(widget.token);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل التسجيل') : tr('تسجيل مشارك'),
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                PickerField(
                  label: tr('الطالب'),
                  value: _student?.label,
                  error: _error,
                  onTap: _isEdit
                      ? () {}
                      : () async {
                          final picked = await showItemPicker(
                            context,
                            title: tr('اختر الطالب'),
                            load: studentPickerItems,
                          );
                          if (picked != null) {
                            setState(() {
                              _student = picked;
                              _enrollment = null;
                            });
                          }
                        },
                ),
                if (!_isEdit)
                  PickerField(
                    label: tr('التسجيل (اختياري)'),
                    value: _enrollment?.label,
                    onTap: () async {
                      final student = _student;
                      if (student == null) {
                        showModuleSnack(context, tr('اختر الطالب أولاً'),
                            error: true);
                        return;
                      }
                      final picked = await showItemPicker(
                        context,
                        title: tr('اختر التسجيل'),
                        allowClear: true,
                        load: (_) => studentActiveEnrollmentItems(student.id),
                      );
                      if (picked == null) return;
                      setState(() => _enrollment =
                          picked.id == PickerItem.clear.id ? null : picked);
                    },
                  ),
                moduleTextField(
                  controller: _fee,
                  label: tr('الرسوم'),
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                DropdownButtonFormField<String>(
                  initialValue: _status,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: tr('الحالة')),
                  items: [
                    for (final code in const [
                      'registered',
                      'declined',
                      'cancelled',
                      'attended'
                    ])
                      DropdownMenuItem(
                          value: code,
                          child: Text(registrationStatusLabel(code))),
                  ],
                  onChanged: (v) => setState(() => _status = v ?? _status),
                ),
                const SizedBox(height: 12),
                moduleTextField(
                    controller: _notes, label: tr('ملاحظات'), maxLines: 2),
                const SizedBox(height: 8),
                ModuleSaveButton(
                    saving: _saving, onPressed: _save, label: tr('حفظ')),
              ],
            ),
    );
  }
}

/// نموذج دفعة نشاط: التسجيل المدفوع عنه، والمبلغ، وطريقة الدفع.
class ActivityPaymentFormScreen extends StatefulWidget {
  final AuthToken token;
  final int activityId;

  const ActivityPaymentFormScreen({
    super.key,
    required this.token,
    required this.activityId,
  });

  @override
  State<ActivityPaymentFormScreen> createState() =>
      _ActivityPaymentFormScreenState();
}

class _ActivityPaymentFormScreenState extends State<ActivityPaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = FinanceOpsRepositoryImpl();
  final _amount = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  final _reference = TextEditingController();
  final _notes = TextEditingController();
  PickerItem? _registration;
  PickerItem? _method;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    for (final c in [_amount, _date, _reference, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<List<PickerItem>> _registrations(String search) async {
    final page = await _service.registrations(widget.activityId, page: 1);
    final needle = search.toLowerCase();
    return [
      for (final r in page.items)
        if (r.balance > 0 &&
            (needle.isEmpty || r.studentName.toLowerCase().contains(needle)))
          PickerItem(
            id: r.id,
            label: r.studentName,
            subtitle: trf('المتبقي: {0}', [formatAmount(r.balance)]),
          ),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() => _error = _registration == null
        ? tr('اختر التسجيل')
        : _method == null
            ? tr('اختر طريقة الدفع')
            : null);
    final amount = double.tryParse(_amount.text.trim().replaceAll(',', '.'));
    if (!valid || _error != null) return;
    if (amount == null || amount <= 0) {
      showModuleSnack(context, tr('أدخل مبلغاً صحيحاً أكبر من صفر'),
          error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _service.addActivityPayment(
        widget.activityId,
        registrationId: _registration!.id,
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
      body: !ModuleAccess.canManageActivityPayments(widget.token)
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                PickerField(
                  label: tr('التسجيل'),
                  value: _registration?.label,
                  error: _error,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: tr('اختر التسجيل'),
                      load: _registrations,
                    );
                    if (picked != null) setState(() => _registration = picked);
                  },
                ),
                moduleTextField(
                  controller: _amount,
                  label: tr('المبلغ'),
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                PickerField(
                  label: tr('طريقة الدفع'),
                  value: _method?.label,
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

/// نموذج مصروف نشاط (إضافة أو تعديل).
class ActivityExpenseFormScreen extends StatefulWidget {
  final AuthToken token;
  final int activityId;
  final ActivityExpense? expense;

  const ActivityExpenseFormScreen({
    super.key,
    required this.token,
    required this.activityId,
    this.expense,
  });

  @override
  State<ActivityExpenseFormScreen> createState() =>
      _ActivityExpenseFormScreenState();
}

class _ActivityExpenseFormScreenState extends State<ActivityExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _service = FinanceOpsRepositoryImpl();
  final _amount = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  PickerItem? _category;
  bool _saving = false;
  String? _error;

  bool get _isEdit => widget.expense != null;

  @override
  void initState() {
    super.initState();
    final e = widget.expense;
    if (e != null) {
      _amount.text = formatAmount(e.amount);
      _description.text = e.description;
      _date.text = e.spentOn;
      _category = e.categoryId == null
          ? null
          : PickerItem(id: e.categoryId!, label: e.categoryName ?? '');
    }
  }

  @override
  void dispose() {
    for (final c in [_amount, _description, _date]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(
        () => _error = _category == null ? tr('اختر تصنيف المصروف') : null);
    final amount = double.tryParse(_amount.text.trim().replaceAll(',', '.'));
    if (!valid || _category == null) return;
    if (amount == null || amount <= 0) {
      showModuleSnack(context, tr('أدخل مبلغاً صحيحاً أكبر من صفر'),
          error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _service.saveActivityExpense(
        widget.activityId,
        id: widget.expense?.id,
        amount: amount,
        description: _description.text.trim(),
        expenseCategoryId: _category!.id,
        spentOn: _date.text,
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
    final allowed = ModuleAccess.canManageActivityExpenses(widget.token);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل المصروف') : tr('إضافة مصروف'),
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _amount,
                  label: tr('المبلغ'),
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                moduleTextField(
                  controller: _description,
                  label: tr('الوصف'),
                  required: true,
                ),
                PickerField(
                  label: tr('التصنيف'),
                  value: _category?.label,
                  error: _error,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: tr('اختر التصنيف'),
                      load: (s) =>
                          referencePickerItems('expense-categories', search: s),
                    );
                    if (picked != null) setState(() => _category = picked);
                  },
                ),
                moduleDateField(
                  context: context,
                  controller: _date,
                  label: tr('تاريخ الصرف'),
                  required: true,
                ),
                const SizedBox(height: 8),
                ModuleSaveButton(
                    saving: _saving, onPressed: _save, label: tr('حفظ')),
              ],
            ),
    );
  }
}
