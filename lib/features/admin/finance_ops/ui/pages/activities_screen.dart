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

String registrationStatusLabel(String status) => switch (status) {
      'registered' => L10nGateway.current.registered,
      'declined' => L10nGateway.current.declined2,
      'cancelled' => L10nGateway.current.cancelled,
      'attended' => L10nGateway.current.attended,
      _ => status,
    };

/// قائمة الأنشطة. كل نشاط يفتح بتبويبات: المعلومات والتسجيلات والمدفوعات والمصروفات.
class ActivitiesScreen extends ConsumerWidget {
  final AuthToken token;

  const ActivitiesScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ModuleAccess.canViewActivities(token)) {
      return ModuleScaffold(
        title: L10nGateway.current.activities,
        body: const ModuleAccessDenied(),
      );
    }
    final service = ref.read(financeOpsActionsControllerProvider.notifier);
    return ModuleScaffold(
      title: context.l10n.activities,
      body: PagedList<ActivitySummary>(
        emptyText: context.l10n.noActivities,
        fetch: (page) => service.query((r) => r.activities(page: page)),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isActive
              ? context.appColors.primaryLight
              : context.appColors.textMuted,
          onTap: () => context.push(AppRoutes.activityDetailRoute,
              extra: (token: token, activityId: item.id, title: item.title)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: item.isActive
                        ? L10nGateway.current.active
                        : L10nGateway.current.finished,
                    color: item.isActive
                        ? context.appColors.success
                        : context.appColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${item.activityDate ?? ''}  ·  ${item.groupName ?? ''}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
              Text(
                L10nGateway.current.collectedExpenses(
                    formatAmount(item.collectedRevenue),
                    formatAmount(item.expenseTotal)),
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

/// تفاصيل نشاط بأربعة تبويبات: المعلومات، التسجيلات، المدفوعات، المصروفات.
class ActivityDetailScreen extends ConsumerStatefulWidget {
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
  ConsumerState<ActivityDetailScreen> createState() =>
      _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends ConsumerState<ActivityDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  late final _loadProvider = screenDataProvider(() async {
    final detail = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .query((r) => r.activity(widget.activityId));
    return detail;
  });
  ActivityDetail? get _detail => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;
  int _reloadToken = 0;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  void _changed() {
    setState(() => _reloadToken++);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final showFinance = ModuleAccess.canViewActivityFinance(t);
    final tabs = [
      Tab(text: context.l10n.info),
      Tab(text: context.l10n.registrations),
      Tab(text: context.l10n.payments2),
      Tab(text: context.l10n.expenses),
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
                  color: context.appColors.error,
                  onRetry: () {
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
                            service: ref.read(
                                financeOpsActionsControllerProvider.notifier),
                          )
                        : const ModuleAccessDenied(),
                    showFinance
                        ? _PaymentsTab(
                            token: t,
                            activityId: widget.activityId,
                            reloadToken: _reloadToken,
                            onChanged: _changed,
                            service: ref.read(
                                financeOpsActionsControllerProvider.notifier),
                          )
                        : const ModuleAccessDenied(),
                    showFinance
                        ? _ExpensesTab(
                            token: t,
                            activityId: widget.activityId,
                            reloadToken: _reloadToken,
                            onChanged: _changed,
                            service: ref.read(
                                financeOpsActionsControllerProvider.notifier),
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
              InfoRow(label: context.l10n.date, value: s.activityDate ?? ''),
              InfoRow(label: context.l10n.group, value: s.groupName ?? ''),
              InfoRow(
                  label: context.l10n.fees, value: formatAmount(s.feeAmount)),
              InfoRow(
                  label: context.l10n.expected,
                  value: formatAmount(s.expectedRevenue)),
              InfoRow(
                  label: context.l10n.collected,
                  value: formatAmount(s.collectedRevenue)),
              InfoRow(
                  label: context.l10n.expenses,
                  value: formatAmount(s.expenseTotal)),
              InfoRow(
                  label: context.l10n.net, value: formatAmount(s.netRevenue)),
              InfoRow(
                  label: context.l10n.description, value: s.description ?? ''),
            ],
          ),
        ),
        ModuleCard(
          child: Column(
            children: [
              InfoRow(
                  label: context.l10n.enrollmentsCount,
                  value: '${detail.registrationsCount}'),
              InfoRow(
                  label: context.l10n.paymentsCount,
                  value: '${detail.paymentsCount}'),
              InfoRow(
                  label: context.l10n.expensesCount,
                  value: '${detail.expensesCount}'),
              InfoRow(
                label: context.l10n.targetGroups,
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
  final FinanceOpsActionsController service;

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
    final saved = await context.push<bool>(AppRoutes.registrationFormRoute,
        extra: (
          token: token,
          activityId: activityId,
          defaultFee: fee,
          registration: item
        ));
    if (saved == true) onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PagedList<ActivityRegistration>(
          reloadToken: reloadToken,
          emptyText: context.l10n.noRegistrationsForThisActivity,
          fetch: (page) =>
              service.query((r) => r.registrations(activityId, page: page)),
          itemBuilder: (context, item, _) => ModuleCard(
            accent: item.balance > 0
                ? context.appColors.warning
                : context.appColors.success,
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
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    StatusPill(
                      label: registrationStatusLabel(item.status),
                      color: context.appColors.info,
                    ),
                  ],
                ),
                Text(
                  L10nGateway.current.feePaidBalance(
                      formatAmount(item.feeAmount),
                      formatAmount(item.paidTotal),
                      formatAmount(item.balance)),
                  style: appTextStyle(
                      fontSize: FontSize.caption, color: moduleMuted(context)),
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
              backgroundColor: context.appColors.brandPrimary,
              icon:
                  const Icon(Icons.person_add_alt_rounded, color: Colors.white),
              label: Text(
                context.l10n.enrollParticipant,
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
  final FinanceOpsActionsController service;

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
      title: L10nGateway.current.voidPayment,
      message: L10nGateway.current.thisAmountWillBeRemoved,
      confirmLabel: L10nGateway.current.voidPayment,
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    try {
      await service.query((r) => r.voidActivityPayment(activityId, payment.id));
      if (!context.mounted) return;
      showModuleSnack(context, L10nGateway.current.paymentVoided);
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
          emptyText: context.l10n.noPayments,
          fetch: (page) =>
              service.query((r) => r.activityPayments(activityId, page: page)),
          itemBuilder: (context, item, _) => ModuleCard(
            accent: item.isVoided
                ? context.appColors.textMuted
                : context.appColors.success,
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
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '${item.paidAt}  ·  ${item.paymentMethodName ?? ''}  ·  ${item.referenceNo ?? ''}',
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
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w800,
                    color: item.isVoided
                        ? context.appColors.textMuted
                        : context.appColors.success,
                  ),
                ),
                if (item.isVoided) ...[
                  const SizedBox(width: 8),
                  StatusPill(
                      label: L10nGateway.current.voided,
                      color: context.appColors.textMuted),
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
                final saved = await context.push<bool>(
                    AppRoutes.activityPaymentFormRoute,
                    extra: (token: token, activityId: activityId));
                if (saved == true) onChanged();
              },
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.payments_rounded, color: Colors.white),
              label: Text(
                context.l10n.recordPayment,
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
  final FinanceOpsActionsController service;

  const _ExpensesTab({
    required this.token,
    required this.activityId,
    required this.reloadToken,
    required this.onChanged,
    required this.service,
  });

  Future<void> _openForm(BuildContext context, {ActivityExpense? item}) async {
    final saved = await context.push<bool>(AppRoutes.activityExpenseFormRoute,
        extra: (token: token, activityId: activityId, expense: item));
    if (saved == true) onChanged();
  }

  Future<void> _delete(BuildContext context, ActivityExpense item) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteExpense,
      message: L10nGateway.current.thisExpenseWillBeRemoved,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    try {
      await service.query((r) => r.deleteActivityExpense(activityId, item.id));
      if (!context.mounted) return;
      showModuleSnack(context, L10nGateway.current.expenseDeleted);
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
          emptyText: context.l10n.noExpenses,
          fetch: (page) =>
              service.query((r) => r.activityExpenses(activityId, page: page)),
          itemBuilder: (context, item, _) => ModuleCard(
            accent: context.appColors.error,
            onTap: canManage
                ? () async {
                    final choice = await showRecordSheet(
                      context,
                      title: item.description,
                      subtitle: item.categoryName ?? '',
                      rows: [
                        MapEntry(L10nGateway.current.amount,
                            formatAmount(item.amount)),
                        MapEntry(L10nGateway.current.date, item.spentOn),
                      ],
                      actions: [
                        SheetAction(
                            id: 'edit',
                            label: L10nGateway.current.edit,
                            icon: Icons.edit_rounded),
                        SheetAction(
                          id: 'delete',
                          label: L10nGateway.current.delete,
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
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '${item.categoryName ?? ''}  ·  ${item.spentOn}',
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
                    fontSize: FontSize.bodyLarge,
                    fontWeight: FontWeight.w800,
                    color: context.appColors.errorText,
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
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.receipt_long_rounded, color: Colors.white),
              label: Text(
                context.l10n.addExpense,
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
class RegistrationFormScreen extends ConsumerStatefulWidget {
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
  ConsumerState<RegistrationFormScreen> createState() =>
      _RegistrationFormScreenState();
}

class _RegistrationFormScreenState
    extends ConsumerState<RegistrationFormScreen> {
  final _formKey = GlobalKey<FormState>();
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
    setState(() =>
        _error = _student == null ? L10nGateway.current.chooseStudent : null);
    final fee = double.tryParse(_fee.text.trim().replaceAll(',', '.'));
    if (!valid || _student == null) return;
    if (fee == null || fee < 0) {
      showModuleSnack(context, L10nGateway.current.enterAValidFee, error: true);
      return;
    }
    setState(() => _saving = true);
    final outcome2 = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .run((r) => r.saveRegistration(
              widget.activityId,
              id: widget.registration?.id,
              studentId: _student!.id,
              enrollmentId: _enrollment?.id,
              feeAmount: fee,
              status: _status,
              notes: nullIfBlank(_notes.text),
            ));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final allowed = ModuleAccess.canManageRegistrations(widget.token);
    return ModuleScaffold(
      title: _isEdit
          ? context.l10n.editEnrollment
          : context.l10n.enrollParticipant,
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                PickerField(
                  label: context.l10n.student,
                  value: _student?.label,
                  error: _error,
                  onTap: _isEdit
                      ? () {}
                      : () async {
                          final picked = await showItemPicker(
                            context,
                            title: L10nGateway.current.chooseStudent,
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
                    label: context.l10n.enrollmentOptional,
                    value: _enrollment?.label,
                    onTap: () async {
                      final student = _student;
                      if (student == null) {
                        showModuleSnack(
                            context, L10nGateway.current.chooseAStudentFirst,
                            error: true);
                        return;
                      }
                      final picked = await showItemPicker(
                        context,
                        title: L10nGateway.current.chooseEnrollment,
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
                  label: context.l10n.fees,
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                DropdownButtonFormField<String>(
                  initialValue: _status,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: context.l10n.status),
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
                    controller: _notes, label: context.l10n.notes, maxLines: 2),
                const SizedBox(height: 8),
                ModuleSaveButton(
                    saving: _saving,
                    onPressed: _save,
                    label: context.l10n.save),
              ],
            ),
    );
  }
}

/// نموذج دفعة نشاط: التسجيل المدفوع عنه، والمبلغ، وطريقة الدفع.
class ActivityPaymentFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int activityId;

  const ActivityPaymentFormScreen({
    super.key,
    required this.token,
    required this.activityId,
  });

  @override
  ConsumerState<ActivityPaymentFormScreen> createState() =>
      _ActivityPaymentFormScreenState();
}

class _ActivityPaymentFormScreenState
    extends ConsumerState<ActivityPaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
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
    final page = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .query((r) => r.registrations(widget.activityId, page: 1));
    final needle = search.toLowerCase();
    return [
      for (final r in page.items)
        if (r.balance > 0 &&
            (needle.isEmpty || r.studentName.toLowerCase().contains(needle)))
          PickerItem(
            id: r.id,
            label: r.studentName,
            subtitle: L10nGateway.current.balance(formatAmount(r.balance)),
          ),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() => _error = _registration == null
        ? L10nGateway.current.chooseEnrollment
        : _method == null
            ? L10nGateway.current.choosePaymentMethod
            : null);
    final amount = double.tryParse(_amount.text.trim().replaceAll(',', '.'));
    if (!valid || _error != null) return;
    if (amount == null || amount <= 0) {
      showModuleSnack(context, L10nGateway.current.enterAValidAmountGreater,
          error: true);
      return;
    }
    setState(() => _saving = true);
    final outcome3 = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .run((r) => r.addActivityPayment(
              widget.activityId,
              registrationId: _registration!.id,
              amount: amount,
              paidAt: _date.text,
              paymentMethodId: _method!.id,
              referenceNo: nullIfBlank(_reference.text),
              notes: nullIfBlank(_notes.text),
            ));
    if (!mounted) return;
    if (outcome3.error case final error?) {
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
      body: !ModuleAccess.canManageActivityPayments(widget.token)
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                PickerField(
                  label: context.l10n.enrollment,
                  value: _registration?.label,
                  error: _error,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: L10nGateway.current.chooseEnrollment,
                      load: _registrations,
                    );
                    if (picked != null) setState(() => _registration = picked);
                  },
                ),
                moduleTextField(
                  controller: _amount,
                  label: context.l10n.amount,
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                PickerField(
                  label: context.l10n.paymentMethod,
                  value: _method?.label,
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

/// نموذج مصروف نشاط (إضافة أو تعديل).
class ActivityExpenseFormScreen extends ConsumerStatefulWidget {
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
  ConsumerState<ActivityExpenseFormScreen> createState() =>
      _ActivityExpenseFormScreenState();
}

class _ActivityExpenseFormScreenState
    extends ConsumerState<ActivityExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
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
    setState(() => _error =
        _category == null ? L10nGateway.current.chooseAnExpenseCategory : null);
    final amount = double.tryParse(_amount.text.trim().replaceAll(',', '.'));
    if (!valid || _category == null) return;
    if (amount == null || amount <= 0) {
      showModuleSnack(context, L10nGateway.current.enterAValidAmountGreater,
          error: true);
      return;
    }
    setState(() => _saving = true);
    final outcome4 = await ref
        .read(financeOpsActionsControllerProvider.notifier)
        .run((r) => r.saveActivityExpense(
              widget.activityId,
              id: widget.expense?.id,
              amount: amount,
              description: _description.text.trim(),
              expenseCategoryId: _category!.id,
              spentOn: _date.text,
            ));
    if (!mounted) return;
    if (outcome4.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final allowed = ModuleAccess.canManageActivityExpenses(widget.token);
    return ModuleScaffold(
      title: _isEdit ? context.l10n.editExpense : context.l10n.addExpense,
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                moduleTextField(
                  controller: _amount,
                  label: context.l10n.amount,
                  keyboard:
                      const TextInputType.numberWithOptions(decimal: true),
                  required: true,
                ),
                moduleTextField(
                  controller: _description,
                  label: context.l10n.description,
                  required: true,
                ),
                PickerField(
                  label: context.l10n.category,
                  value: _category?.label,
                  error: _error,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: L10nGateway.current.chooseCategory,
                      load: (s) =>
                          referencePickerItems('expense-categories', search: s),
                    );
                    if (picked != null) setState(() => _category = picked);
                  },
                ),
                moduleDateField(
                  context: context,
                  controller: _date,
                  label: context.l10n.exchangeDate,
                  required: true,
                ),
                const SizedBox(height: 8),
                ModuleSaveButton(
                    saving: _saving,
                    onPressed: _save,
                    label: context.l10n.save),
              ],
            ),
    );
  }
}
