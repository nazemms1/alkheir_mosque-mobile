import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/operations_model.dart';
import '../../../data/services/api_service.dart';
import '../../../data/services/management_service.dart';
import '../../../data/services/operations_service.dart';
import '../../management/widgets/module_form_fields.dart';
import '../../management/widgets/module_widgets.dart';
import '../../management/widgets/pickers.dart';

String memorizationTypeLabel(String type) => switch (type) {
      'new' => tr('حفظ جديد'),
      'review' => tr('مراجعة'),
      'correction' => tr('تصحيح'),
      _ => type,
    };

/// سجل الحفظ للطاقم: تصفية بالنوع، وتسجيل حفظ جديد أو مراجعة لطالب.
class StaffMemorizationScreen extends StatefulWidget {
  final AuthToken token;

  const StaffMemorizationScreen({super.key, required this.token});

  @override
  State<StaffMemorizationScreen> createState() =>
      _StaffMemorizationScreenState();
}

class _StaffMemorizationScreenState extends State<StaffMemorizationScreen> {
  final _service = OperationsService();
  String? _type;
  int _reloadToken = 0;

  Future<void> _record() async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => RecordMemorizationScreen(token: widget.token),
      ),
    );
    if (saved == true) setState(() => _reloadToken++);
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewMemorization(t)) {
      return ModuleScaffold(
        title: tr('الحفظ'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('الحفظ'),
      floatingActionButton: ModuleAccess.canRecordMemorization(t)
          ? FloatingActionButton.extended(
              onPressed: _record,
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.edit_note_rounded, color: Colors.white),
              label: Text(
                tr('تسجيل حفظ'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<MemorizationEntry>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد سجلات حفظ'),
        header: _TypeFilter(
          selected: _type,
          onSelected: (value) => setState(() {
            _type = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _service.memorization(page: page, entryType: _type),
        itemBuilder: (context, entry, _) => ModuleCard(
          accent: entry.entryType == 'review'
              ? AppColors.info
              : AppColors.primaryLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.student?.name ?? '—',
                      style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: memorizationTypeLabel(entry.entryType),
                    color: entry.entryType == 'review'
                        ? AppColors.info
                        : AppColors.primaryLight,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                trf('من الصفحة {0} إلى {1}  ·  {2} صفحة', [
                  entry.fromPage,
                  entry.toPage,
                  entry.pagesCount,
                ]),
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
              Text(
                '${entry.groupName ?? ''}  ·  ${entry.recordedOn}  ·  ${entry.teacher?.name ?? ''}',
                style: appTextStyle(fontSize: 11, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeFilter extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _TypeFilter({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final options = <String?, String>{
      null: tr('الكل'),
      'new': tr('حفظ جديد'),
      'review': tr('مراجعة'),
      'correction': tr('تصحيح'),
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

/// نموذج تسجيل حفظ: الطالب ← التسجيل النشط ← الصفحات والنوع والتاريخ والمعلم.
class RecordMemorizationScreen extends StatefulWidget {
  final AuthToken token;

  const RecordMemorizationScreen({super.key, required this.token});

  @override
  State<RecordMemorizationScreen> createState() =>
      _RecordMemorizationScreenState();
}

class _RecordMemorizationScreenState extends State<RecordMemorizationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsService();
  final _from = TextEditingController();
  final _to = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _enrollment;
  PickerItem? _teacher;
  String _entryType = 'new';
  bool _saving = false;
  String? _error;

  bool get _teacherIsSelf => widget.token.teacherId != null;

  @override
  void dispose() {
    for (final c in [_from, _to, _date, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<List<PickerItem>> _loadStudents(String search) async {
    final page = await ManagementService().students(search: search);
    return [
      for (final s in page.items)
        PickerItem(id: s.id, label: s.fullName, subtitle: s.studentNumber),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    final teacherId = _teacherIsSelf ? widget.token.teacherId : _teacher?.id;
    setState(() {
      _error = _enrollment == null
          ? tr('اختر التسجيل')
          : teacherId == null
              ? tr('اختر المعلم')
              : null;
    });
    if (!valid || _error != null) return;
    final from = int.tryParse(_from.text.trim());
    final to = int.tryParse(_to.text.trim());
    if (from == null || to == null || from < 1 || to > 604 || to < from) {
      setState(
          () => _error = tr('الصفحات بين 1 و 604، والنهاية لا تسبق البداية'));
      return;
    }
    setState(() => _saving = true);
    try {
      await _operations.recordMemorization(
        _enrollment!.id,
        entryType: _entryType,
        fromPage: from,
        toPage: to,
        recordedOn: _date.text,
        teacherId: teacherId,
        notes: nullIfBlank(_notes.text),
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      if (error is ApiException && error.hasDuplicatePages) {
        showModuleSnack(
          context,
          trf('صفحات محفوظة مسبقاً: {0}', [error.duplicatePages!.join('، ')]),
          error: true,
        );
      } else {
        showModuleSnack(context, errorText(error), error: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final allowed = ModuleAccess.canRecordMemorization(widget.token);
    return ModuleScaffold(
      title: tr('تسجيل حفظ'),
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                PickerField(
                  label: tr('الطالب'),
                  value: _student?.label,
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: tr('اختر الطالب'),
                      load: _loadStudents,
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
                      showModuleSnack(context, tr('اختر الطالب أولاً'),
                          error: true);
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
                DropdownButtonFormField<String>(
                  initialValue: _entryType,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: tr('نوع السجل')),
                  items: [
                    DropdownMenuItem(value: 'new', child: Text(tr('حفظ جديد'))),
                    DropdownMenuItem(
                        value: 'review', child: Text(tr('مراجعة'))),
                  ],
                  onChanged: (v) =>
                      setState(() => _entryType = v ?? _entryType),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: moduleTextField(
                        controller: _from,
                        label: tr('من صفحة'),
                        keyboard: TextInputType.number,
                        required: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: moduleTextField(
                        controller: _to,
                        label: tr('إلى صفحة'),
                        keyboard: TextInputType.number,
                        required: true,
                      ),
                    ),
                  ],
                ),
                moduleDateField(
                  context: context,
                  controller: _date,
                  label: tr('تاريخ التسجيل'),
                  required: true,
                ),
                if (_teacherIsSelf)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      tr('يُسجَّل الحفظ باسم معلمك المرتبط بالحساب'),
                      style: appTextStyle(
                          fontSize: 12, color: moduleMuted(context)),
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
                ModuleSaveButton(
                  saving: _saving,
                  onPressed: _save,
                  label: tr('حفظ'),
                ),
              ],
            ),
    );
  }
}
