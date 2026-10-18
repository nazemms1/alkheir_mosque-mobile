import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/operations/data/models/operations_model.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';

/// سجل النقاط للطاقم: تصفية بالحالة، وإضافة نقاط يدوية (موجبة أو سالبة)، وإلغاء قيد.
class PointsLedgerScreen extends StatefulWidget {
  final AuthToken token;

  const PointsLedgerScreen({super.key, required this.token});

  @override
  State<PointsLedgerScreen> createState() => _PointsLedgerScreenState();
}

class _PointsLedgerScreenState extends State<PointsLedgerScreen> {
  final _service = OperationsRepositoryImpl();
  String? _state;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _add() async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
          builder: (_) => ManualPointsScreen(token: widget.token)),
    );
    if (saved == true) _refresh();
  }

  Future<void> _openEntry(PointEntry entry) async {
    final canVoid = ModuleAccess.canVoidPoints(widget.token) && !entry.isVoided;
    final choice = await showRecordSheet(
      context,
      title: entry.student?.name ?? '—',
      subtitle: entry.groupName ?? '',
      rows: [
        MapEntry(tr('النقاط'), '${entry.points}'),
        MapEntry(tr('النوع'), entry.pointTypeName ?? ''),
        MapEntry(tr('تاريخ القيد'), entry.enteredAt),
        MapEntry(tr('المصدر'), entry.sourceType),
        MapEntry(tr('ملاحظات'), entry.notes ?? ''),
        MapEntry(tr('الحالة'), entry.isVoided ? tr('ملغى') : tr('فعّال')),
        MapEntry(tr('سبب الإلغاء'), entry.voidReason ?? ''),
      ],
      actions: [
        if (canVoid)
          SheetAction(
            id: 'void',
            label: tr('إلغاء القيد'),
            icon: Icons.undo_rounded,
            destructive: true,
          ),
      ],
    );
    if (choice != 'void' || !mounted) return;
    final ok = await confirmAction(
      context,
      title: tr('إلغاء القيد'),
      message:
          tr('سيُلغى هذا القيد من رصيد الطالب. لا يمكن التراجع عن الإلغاء.'),
      confirmLabel: tr('إلغاء القيد'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _service.voidPoint(entry.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم إلغاء القيد'));
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewPoints(t)) {
      return ModuleScaffold(
        title: tr('سجل النقاط'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('سجل النقاط'),
      floatingActionButton: ModuleAccess.canAddManualPoints(t)
          ? FloatingActionButton.extended(
              onPressed: _add,
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: Text(
                tr('نقاط يدوية'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<PointEntry>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد قيود نقاط'),
        header: _StateChips(
          selected: _state,
          onSelected: (value) => setState(() {
            _state = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _service.points(page: page, state: _state),
        itemBuilder: (context, entry, _) {
          final color = entry.points >= 0 ? AppColors.success : AppColors.error;
          return ModuleCard(
            accent: entry.isVoided ? AppColors.textMuted : color,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${entry.pointTypeName ?? ''}  ·  ${entry.groupName ?? ''}',
                        style: appTextStyle(
                            fontSize: 11, color: moduleMuted(context)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        entry.enteredAt,
                        style: appTextStyle(
                            fontSize: 11, color: moduleMuted(context)),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: entry.isVoided ? AppColors.textMuted : color,
                      ),
                    ),
                    if (entry.isVoided)
                      StatusPill(label: tr('ملغى'), color: AppColors.textMuted),
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
      null: tr('الكل'),
      'active': tr('فعّال'),
      'voided': tr('ملغى'),
    };
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ChoiceChip(
                label: Text(entry.value, style: appTextStyle(fontSize: 12)),
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
class ManualPointsScreen extends StatefulWidget {
  final AuthToken token;

  const ManualPointsScreen({super.key, required this.token});

  @override
  State<ManualPointsScreen> createState() => _ManualPointsScreenState();
}

class _ManualPointsScreenState extends State<ManualPointsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsRepositoryImpl();
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
          ? tr('اختر التسجيل')
          : _pointType == null
              ? tr('اختر نوع النقاط')
              : null;
    });
    final value = int.tryParse(_points.text.trim());
    if (!valid || _error != null) return;
    if (value == null || value == 0) {
      showModuleSnack(context, tr('أدخل عدداً صحيحاً غير صفري'), error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _operations.addManualPoints(
        _enrollment!.id,
        pointTypeId: _pointType!.id,
        points: value,
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
    if (!ModuleAccess.canAddManualPoints(widget.token)) {
      return ModuleScaffold(
        title: tr('نقاط يدوية'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('نقاط يدوية'),
      body: ModuleFormPage(
        formKey: _formKey,
        children: [
          PickerField(
            label: tr('الطالب'),
            value: _student?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: tr('اختر الطالب'),
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
            label: tr('التسجيل النشط'),
            value: _enrollment?.label,
            error: _error,
            onTap: () async {
              final student = _student;
              if (student == null) {
                showModuleSnack(context, tr('اختر الطالب أولاً'), error: true);
                return;
              }
              final picked = await showItemPicker(
                context,
                title: tr('اختر التسجيل'),
                load: (_) => studentActiveEnrollmentItems(student.id),
              );
              if (picked != null) setState(() => _enrollment = picked);
            },
          ),
          PickerField(
            label: tr('نوع النقاط'),
            value: _pointType?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: tr('اختر نوع النقاط'),
                load: (s) async {
                  final rows = await _operations.manualPointTypes();
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
            label: tr('عدد النقاط'),
            helper: tr('موجب للإضافة وسالب للخصم'),
            keyboard: const TextInputType.numberWithOptions(signed: true),
            required: true,
          ),
          moduleTextField(
            controller: _notes,
            label: tr('ملاحظات'),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          ModuleSaveButton(saving: _saving, onPressed: _save, label: tr('حفظ')),
        ],
      ),
    );
  }
}
