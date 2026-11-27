import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// سجل النقاط للطاقم: تصفية بالحالة، وإضافة نقاط يدوية (موجبة أو سالبة)، وإلغاء قيد.
class PointsLedgerScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const PointsLedgerScreen({super.key, required this.token});

  @override
  ConsumerState<PointsLedgerScreen> createState() => _PointsLedgerScreenState();
}

class _PointsLedgerScreenState extends ConsumerState<PointsLedgerScreen> {
  String? _state;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _add() async {
    final saved = await context.push<bool>(AppRoutes.manualPointsRoute,
        extra: widget.token);
    if (saved == true) _refresh();
  }

  Future<void> _openEntry(PointEntry entry) async {
    final canVoid = ModuleAccess.canVoidPoints(widget.token) && !entry.isVoided;
    final choice = await showRecordSheet(
      context,
      title: entry.student?.name ?? '—',
      subtitle: entry.groupName ?? '',
      rows: [
        MapEntry(L10nGateway.current.points, '${entry.points}'),
        MapEntry(L10nGateway.current.type, entry.pointTypeName ?? ''),
        MapEntry(L10nGateway.current.enteredOn, entry.enteredAt),
        MapEntry(L10nGateway.current.source, entry.sourceType),
        MapEntry(L10nGateway.current.notes, entry.notes ?? ''),
        MapEntry(
            L10nGateway.current.status,
            entry.isVoided
                ? L10nGateway.current.cancelled
                : L10nGateway.current.active4),
        MapEntry(L10nGateway.current.voidReason, entry.voidReason ?? ''),
      ],
      actions: [
        if (canVoid)
          SheetAction(
            id: 'void',
            label: L10nGateway.current.voidEntry,
            icon: Icons.undo_rounded,
            destructive: true,
          ),
      ],
    );
    if (choice != 'void' || !mounted) return;
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.voidEntry,
      message: L10nGateway.current.thisEntryWillBeRemoved,
      confirmLabel: L10nGateway.current.voidEntry,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.voidPoint(entry.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.entryVoided);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewPoints(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.pointsLog,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.pointsLog,
      floatingActionButton: ModuleAccess.canAddManualPoints(t)
          ? FloatingActionButton.extended(
              onPressed: _add,
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: Text(
                context.l10n.manualPoints,
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<PointEntry>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noPointEntries,
        header: _StateChips(
          selected: _state,
          onSelected: (value) => setState(() {
            _state = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.points(page: page, state: _state)),
        itemBuilder: (context, entry, _) {
          final color = entry.points >= 0
              ? context.appColors.success
              : context.appColors.error;
          return ModuleCard(
            accent: entry.isVoided ? context.appColors.textMuted : color,
            onTap: () => _openEntry(entry),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.student?.name ?? '—',
                        style: appTextStyle(
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${entry.pointTypeName ?? ''}  ·  ${entry.groupName ?? ''}',
                        style: appTextStyle(
                            fontSize: FontSize.caption,
                            color: moduleMuted(context)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        entry.enteredAt,
                        style: appTextStyle(
                            fontSize: FontSize.caption,
                            color: moduleMuted(context)),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      entry.points > 0 ? '+${entry.points}' : '${entry.points}',
                      style: appTextStyle(
                        fontSize: FontSize.title,
                        fontWeight: FontWeight.w800,
                        color: entry.isVoided
                            ? context.appColors.textMuted
                            : color,
                      ),
                    ),
                    if (entry.isVoided)
                      StatusPill(
                          label: L10nGateway.current.cancelled,
                          color: context.appColors.textMuted),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StateChips extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _StateChips({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final options = <String?, String>{
      null: L10nGateway.current.all,
      'active': L10nGateway.current.active4,
      'voided': L10nGateway.current.cancelled,
    };
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: ChoiceChip(
                label: Text(entry.value,
                    style: appTextStyle(fontSize: FontSize.caption)),
                selected: entry.key == selected,
                onSelected: (_) => onSelected(entry.key),
              ),
            ),
        ],
      ),
    );
  }
}

/// نموذج نقاط يدوية: الطالب ← التسجيل ← نوع النقاط ← القيمة (موجبة أو سالبة).
class ManualPointsScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const ManualPointsScreen({super.key, required this.token});

  @override
  ConsumerState<ManualPointsScreen> createState() => _ManualPointsScreenState();
}

class _ManualPointsScreenState extends ConsumerState<ManualPointsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _points = TextEditingController();
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _enrollment;
  PickerItem? _pointType;
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _points.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() {
      _error = _enrollment == null
          ? L10nGateway.current.chooseEnrollment
          : _pointType == null
              ? L10nGateway.current.choosePointType
              : null;
    });
    final value = int.tryParse(_points.text.trim());
    if (!valid || _error != null) return;
    if (value == null || value == 0) {
      showModuleSnack(context, L10nGateway.current.enterAWholeNumberOther,
          error: true);
      return;
    }
    setState(() => _saving = true);
    final outcome2 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.addManualPoints(
              _enrollment!.id,
              pointTypeId: _pointType!.id,
              points: value,
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
    if (!ModuleAccess.canAddManualPoints(widget.token)) {
      return ModuleScaffold(
        title: L10nGateway.current.manualPoints,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.manualPoints,
      body: ModuleFormPage(
        formKey: _formKey,
        children: [
          PickerField(
            label: context.l10n.student,
            value: _student?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: L10nGateway.current.chooseStudent,
                load: studentPickerItems,
              );
              if (picked == null) return;
              setState(() {
                _student = picked;
                _enrollment = null;
              });
            },
          ),
          PickerField(
            label: context.l10n.activeEnrollment,
            value: _enrollment?.label,
            error: _error,
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
                load: (_) => studentActiveEnrollmentItems(student.id),
              );
              if (picked != null) setState(() => _enrollment = picked);
            },
          ),
          PickerField(
            label: context.l10n.pointType,
            value: _pointType?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: L10nGateway.current.choosePointType,
                load: (s) async {
                  final rows = await ref
                      .read(operationsActionsControllerProvider.notifier)
                      .query((r) => r.manualPointTypes());
                  final needle = s.toLowerCase();
                  return [
                    for (final r in rows)
                      if (needle.isEmpty ||
                          r.name.toLowerCase().contains(needle))
                        PickerItem(id: r.id, label: r.name, subtitle: r.code),
                  ];
                },
              );
              if (picked != null) setState(() => _pointType = picked);
            },
          ),
          moduleTextField(
            controller: _points,
            label: context.l10n.points2,
            helper: context.l10n.positiveToAddNegativeTo,
            keyboard: const TextInputType.numberWithOptions(signed: true),
            required: true,
          ),
          moduleTextField(
            controller: _notes,
            label: context.l10n.notes,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          ModuleSaveButton(
              saving: _saving, onPressed: _save, label: context.l10n.save),
        ],
      ),
    );
  }
}
