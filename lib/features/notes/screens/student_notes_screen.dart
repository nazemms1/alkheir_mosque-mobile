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

String noteSourceLabel(String source) => switch (source) {
      'management' => tr('الإدارة'),
      'teacher' => tr('المعلم'),
      'parent' => tr('ولي الأمر'),
      'system' => tr('النظام'),
      _ => source,
    };

String noteVisibilityLabel(String visibility) => switch (visibility) {
      'private_teacher' => tr('خاصة بالمعلم'),
      'private_management' => tr('خاصة بالإدارة'),
      'shared_internal' => tr('مشتركة داخلياً'),
      'visible_to_parent' => tr('مرئية لولي الأمر'),
      _ => visibility,
    };

/// ملاحظات الطلاب. تُعرض حسب صلاحية المستخدم وحدود الرؤية في الخادم.
class StudentNotesScreen extends StatefulWidget {
  final AuthToken token;
  final int? studentId;
  final String? studentName;

  const StudentNotesScreen({
    super.key,
    required this.token,
    this.studentId,
    this.studentName,
  });

  @override
  State<StudentNotesScreen> createState() => _StudentNotesScreenState();
}

class _StudentNotesScreenState extends State<StudentNotesScreen> {
  final _service = OperationsService();
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({StudentNoteItem? note}) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => NoteFormScreen(
          token: widget.token,
          note: note,
          studentId: widget.studentId,
          studentName: widget.studentName,
        ),
      ),
    );
    if (saved == true) _refresh();
  }

  Future<void> _openSheet(StudentNoteItem note) async {
    final t = widget.token;
    final isOwn = note.author?.id == t.user?.id;
    final choice = await showRecordSheet(
      context,
      title: note.student?.name ?? '—',
      subtitle: note.author?.name ?? '',
      rows: [
        MapEntry(tr('نص الملاحظة'), note.body),
        MapEntry(tr('التاريخ'), note.notedAt.split('T').first),
        MapEntry(tr('المصدر'), noteSourceLabel(note.source)),
        MapEntry(tr('الرؤية'), noteVisibilityLabel(note.visibility)),
        MapEntry(tr('المجموعة'), note.groupName ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateNotes(t) && isOwn)
          SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteNotes(t) && isOwn)
          SheetAction(
            id: 'delete',
            label: tr('حذف'),
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted) return;
    if (choice == 'edit') await _openForm(note: note);
    if (choice == 'delete') await _delete(note);
  }

  Future<void> _delete(StudentNoteItem note) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف الملاحظة'),
      message: tr('سيتم حذف هذه الملاحظة نهائياً.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _service.deleteStudentNote(note.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف الملاحظة'));
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final title = widget.studentName ?? tr('ملاحظات الطلاب');
    if (!ModuleAccess.canViewNotes(t)) {
      return ModuleScaffold(title: title, body: const ModuleAccessDenied());
    }
    return ModuleScaffold(
      title: title,
      floatingActionButton: ModuleAccess.canCreateNotes(t)
          ? FloatingActionButton.extended(
              onPressed: () => _openForm(),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.note_add_rounded, color: Colors.white),
              label: Text(
                tr('ملاحظة جديدة'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<StudentNoteItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد ملاحظات'),
        fetch: (page) => _service.studentNotes(
          page: page,
          studentId: widget.studentId,
        ),
        itemBuilder: (context, note, _) => ModuleCard(
          accent: AppColors.gold,
          onTap: () => _openSheet(note),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body,
                style: appTextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                '${note.student?.name ?? ''}  ·  ${note.notedAt.split('T').first}  ·  ${noteSourceLabel(note.source)}',
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

/// نموذج ملاحظة. المعلم يسجّل بمصدر "المعلم" ولا يرى الخاصة بالإدارة.
/// عند التعديل لا يُغيَّر الطالب ولا التسجيل.
class NoteFormScreen extends StatefulWidget {
  final AuthToken token;
  final StudentNoteItem? note;
  final int? studentId;
  final String? studentName;

  const NoteFormScreen({
    super.key,
    required this.token,
    this.note,
    this.studentId,
    this.studentName,
  });

  @override
  State<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsService();
  final _body = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  PickerItem? _student;
  PickerItem? _enrollment;
  String _source = 'management';
  String _visibility = 'shared_internal';
  bool _saving = false;
  String? _error;

  bool get _isEdit => widget.note != null;
  bool get _isTeacher => widget.token.teacherId != null;

  List<String> get _visibilities => [
        'shared_internal',
        'visible_to_parent',
        'private_teacher',
        if (!_isTeacher) 'private_management',
      ];

  @override
  void initState() {
    super.initState();
    final n = widget.note;
    if (n != null) {
      _body.text = n.body;
      _date.text = n.notedAt.split('T').first;
      _source = n.source;
      _visibility = n.visibility;
      if (n.student != null) {
        _student = PickerItem(id: n.student!.id, label: n.student!.name);
      }
      if (n.enrollmentId != null) {
        _enrollment = PickerItem(
          id: n.enrollmentId!,
          label: n.groupName ?? '#${n.enrollmentId}',
        );
      }
    } else {
      if (widget.studentId != null) {
        _student = PickerItem(
          id: widget.studentId!,
          label: widget.studentName ?? '',
        );
      }
      if (_isTeacher) _source = 'teacher';
    }
  }

  @override
  void dispose() {
    _body.dispose();
    _date.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() => _error = _student == null ? tr('اختر الطالب') : null);
    if (!valid || _student == null) return;
    setState(() => _saving = true);
    try {
      if (_isEdit) {
        await _operations.updateStudentNote(
          widget.note!.id,
          body: _body.text.trim(),
          notedAt: _date.text,
          source: _source,
          visibility: _visibility,
        );
      } else {
        await _operations.createStudentNote(
          studentId: _student!.id,
          enrollmentId: _enrollment?.id,
          body: _body.text.trim(),
          notedAt: _date.text,
          source: _source,
          visibility: _visibility,
        );
      }
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
    final t = widget.token;
    final allowed = _isEdit
        ? ModuleAccess.canUpdateNotes(t)
        : ModuleAccess.canCreateNotes(t);
    return ModuleScaffold(
      title: _isEdit ? tr('تعديل الملاحظة') : tr('ملاحظة جديدة'),
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                if (!_isEdit)
                  PickerField(
                    label: tr('الطالب'),
                    value: _student?.label,
                    error: _error,
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
                  controller: _body,
                  label: tr('نص الملاحظة'),
                  required: true,
                  maxLines: 4,
                ),
                moduleDateField(
                  context: context,
                  controller: _date,
                  label: tr('تاريخ الملاحظة'),
                  required: true,
                ),
                DropdownButtonFormField<String>(
                  initialValue: _isTeacher || _source == 'teacher'
                      ? 'teacher'
                      : 'management',
                  isExpanded: true,
                  decoration: InputDecoration(labelText: tr('المصدر')),
                  items: [
                    if (!_isTeacher)
                      DropdownMenuItem(
                          value: 'management', child: Text(tr('الإدارة'))),
                    DropdownMenuItem(
                        value: 'teacher', child: Text(tr('المعلم'))),
                  ],
                  onChanged: _isTeacher
                      ? null
                      : (v) => setState(() => _source = v ?? _source),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _visibilities.contains(_visibility)
                      ? _visibility
                      : _visibilities.first,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: tr('الرؤية')),
                  items: [
                    for (final v in _visibilities)
                      DropdownMenuItem(
                          value: v, child: Text(noteVisibilityLabel(v))),
                  ],
                  onChanged: (v) =>
                      setState(() => _visibility = v ?? _visibility),
                ),
                const SizedBox(height: 12),
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
