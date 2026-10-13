import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/operations_model.dart';
import '../../../data/services/operations_service.dart';
import '../../management/widgets/module_form_fields.dart';
import '../../management/widgets/module_widgets.dart';
import '../../management/widgets/pickers.dart';

String awqafStatusLabel(String status) => switch (status) {
      'passed' => tr('ناجح'),
      'failed' => tr('راسب'),
      'cancelled' => tr('ملغى'),
      _ => status,
    };

Color _awqafStatusColor(String status) => switch (status) {
      'passed' => AppColors.success,
      'failed' => AppColors.error,
      _ => AppColors.textMuted,
    };

/// اختبارات الأوقاف: قائمة مع تصفية بالحالة، وتسجيل اختبار لطالب عبر تسجيله النشط.
class AwqafTestsScreen extends StatefulWidget {
  final AuthToken token;

  const AwqafTestsScreen({super.key, required this.token});

  @override
  State<AwqafTestsScreen> createState() => _AwqafTestsScreenState();
}

class _AwqafTestsScreenState extends State<AwqafTestsScreen> {
  final _service = OperationsService();
  String? _status;
  int _reloadToken = 0;

  Future<void> _record() async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (_) => RecordAwqafScreen(token: widget.token)),
    );
    if (saved == true) setState(() => _reloadToken++);
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewAwqafTests(t)) {
      return ModuleScaffold(
        title: tr('اختبارات الأوقاف'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('اختبارات الأوقاف'),
      floatingActionButton: ModuleAccess.canRecordAwqafTests(t)
          ? FloatingActionButton.extended(
              onPressed: _record,
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.fact_check_rounded, color: Colors.white),
              label: Text(
                tr('تسجيل اختبار'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<AwqafTest>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد اختبارات أوقاف'),
        header: _StatusChips(
          selected: _status,
          onSelected: (value) => setState(() {
            _status = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _service.awqafTests(page: page, status: _status),
        itemBuilder: (context, test, _) => ModuleCard(
          accent: _awqafStatusColor(test.status),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      test.student?.name ?? '—',
                      style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: awqafStatusLabel(test.status),
                    color: _awqafStatusColor(test.status),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${test.juz?.name ?? ''}  ·  ${test.typeName ?? ''}  ·  ${test.testedOn}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
              Text(
                '${test.groupName ?? ''}${test.score == null ? '' : '  ·  ${formatAmount(test.score!)}'}',
                style: appTextStyle(fontSize: 11, color: moduleMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChips extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _StatusChips({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final options = <String?, String>{
      null: tr('الكل'),
      'passed': tr('ناجح'),
      'failed': tr('راسب'),
      'cancelled': tr('ملغى'),
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

/// نموذج تسجيل اختبار أوقاف. نوع الاختبار يُختار من الكتالوج، والخادم يقبل نوع الأوقاف فقط.
class RecordAwqafScreen extends StatefulWidget {
  final AuthToken token;

  const RecordAwqafScreen({super.key, required this.token});

  @override
  State<RecordAwqafScreen> createState() => _RecordAwqafScreenState();
}

class _RecordAwqafScreenState extends State<RecordAwqafScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsService();
  final _score = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _enrollment;
  PickerItem? _juz;
  PickerItem? _testType;
  PickerItem? _teacher;
  String _status = 'passed';
  bool _saving = false;
  String? _error;

  bool get _teacherIsSelf => widget.token.teacherId != null;

  @override
  void dispose() {
    for (final c in [_score, _date, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickTestType() async {
    final picked = await showItemPicker(
      context,
      title: tr('نوع الاختبار'),
      load: (s) => referencePickerItems('quran-test-types', search: s),
    );
    if (picked != null) setState(() => _testType = picked);
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    final teacherId = _teacherIsSelf ? widget.token.teacherId : _teacher?.id;
    setState(() {
      _error = _enrollment == null
          ? tr('اختر التسجيل')
          : _juz == null
              ? tr('اختر الجزء')
              : _testType == null
                  ? tr('اختر نوع الاختبار')
                  : teacherId == null
                      ? tr('اختر المعلم')
                      : null;
    });
    if (!valid || _error != null) return;
    final score = _score.text.trim().isEmpty
        ? null
        : double.tryParse(_score.text.trim().replaceAll(',', '.'));
    if (score != null && (score < 0 || score > 100)) {
      setState(() => _error = tr('أدخل درجة بين 0 و 100'));
      return;
    }
    setState(() => _saving = true);
    try {
      await _operations.recordAwqafTest(
        _enrollment!.id,
        juzId: _juz!.id,
        quranTestTypeId: _testType!.id,
        testedOn: _date.text,
        status: _status,
        score: score,
        teacherId: teacherId,
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
    if (!ModuleAccess.canRecordAwqafTests(widget.token)) {
      return ModuleScaffold(
        title: tr('تسجيل اختبار'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('تسجيل اختبار أوقاف'),
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
            label: tr('الجزء'),
            value: _juz?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: tr('اختر الجزء'),
                load: (s) => referencePickerItems('quran-juz', search: s),
              );
              if (picked != null) setState(() => _juz = picked);
            },
          ),
          PickerField(
            label: tr('نوع الاختبار'),
            value: _testType?.label,
            onTap: _pickTestType,
          ),
          DropdownButtonFormField<String>(
            initialValue: _status,
            isExpanded: true,
            decoration: InputDecoration(labelText: tr('النتيجة')),
            items: [
              DropdownMenuItem(value: 'passed', child: Text(tr('ناجح'))),
              DropdownMenuItem(value: 'failed', child: Text(tr('راسب'))),
              DropdownMenuItem(value: 'cancelled', child: Text(tr('ملغى'))),
            ],
            onChanged: (v) => setState(() => _status = v ?? _status),
          ),
          const SizedBox(height: 12),
          moduleTextField(
            controller: _score,
            label: tr('الدرجة (اختياري)'),
            keyboard: const TextInputType.numberWithOptions(decimal: true),
          ),
          moduleDateField(
            context: context,
            controller: _date,
            label: tr('تاريخ الاختبار'),
            required: true,
          ),
          if (_teacherIsSelf)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                tr('يُسجَّل الاختبار باسم معلمك المرتبط بالحساب'),
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
            )
          else
            PickerField(
              label: tr('المعلم'),
              value: _teacher?.label,
              onTap: () async {
                final picked = await showItemPicker(
                  context,
                  title: tr('اختر المعلم'),
                  load: activeTeacherItems,
                );
                if (picked != null) setState(() => _teacher = picked);
              },
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
