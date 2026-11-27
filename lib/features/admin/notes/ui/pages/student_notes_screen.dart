import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

String noteSourceLabel(String source) => switch (source) {
      'management' => L10nGateway.current.management,
      'teacher' => L10nGateway.current.teacher,
      'parent' => L10nGateway.current.parent,
      'system' => L10nGateway.current.system,
      _ => source,
    };

String noteVisibilityLabel(String visibility) => switch (visibility) {
      'private_teacher' => L10nGateway.current.teacherOnly,
      'private_management' => L10nGateway.current.managementOnly,
      'shared_internal' => L10nGateway.current.sharedInternally,
      'visible_to_parent' => L10nGateway.current.visibleToParent,
      _ => visibility,
    };

/// ملاحظات الطلاب. تُعرض حسب صلاحية المستخدم وحدود الرؤية في الخادم.
class StudentNotesScreen extends ConsumerStatefulWidget {
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
  ConsumerState<StudentNotesScreen> createState() => _StudentNotesScreenState();
}

class _StudentNotesScreenState extends ConsumerState<StudentNotesScreen> {
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({StudentNoteItem? note}) async {
    final saved = await context.push<bool>(AppRoutes.noteFormRoute, extra: (
      token: widget.token,
      note: note,
      studentId: widget.studentId,
      studentName: widget.studentName
    ));
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
        MapEntry(L10nGateway.current.noteText, note.body),
        MapEntry(L10nGateway.current.date, note.notedAt.split('T').first),
        MapEntry(L10nGateway.current.source, noteSourceLabel(note.source)),
        MapEntry(L10nGateway.current.visibility,
            noteVisibilityLabel(note.visibility)),
        MapEntry(L10nGateway.current.group2, note.groupName ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateNotes(t) && isOwn)
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteNotes(t) && isOwn)
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
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
      title: L10nGateway.current.deleteNote,
      message: L10nGateway.current.thisNoteWillBePermanently,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.deleteStudentNote(note.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.noteDeleted);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final title = widget.studentName ?? context.l10n.studentNotes;
    if (!ModuleAccess.canViewNotes(t)) {
      return ModuleScaffold(title: title, body: const ModuleAccessDenied());
    }
    return ModuleScaffold(
      title: title,
      floatingActionButton: ModuleAccess.canCreateNotes(t)
          ? FloatingActionButton.extended(
              onPressed: () => _openForm(),
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.note_add_rounded, color: Colors.white),
              label: Text(
                context.l10n.newNote,
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<StudentNoteItem>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noNotes,
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.studentNotes(
                  page: page,
                  studentId: widget.studentId,
                )),
        itemBuilder: (context, note, _) => ModuleCard(
          accent: context.appColors.gold,
          onTap: () => _openSheet(note),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body,
                style: appTextStyle(
                  fontSize: FontSize.label,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                '${note.student?.name ?? ''}  ·  ${note.notedAt.split('T').first}  ·  ${noteSourceLabel(note.source)}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
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
class NoteFormScreen extends ConsumerStatefulWidget {
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
  ConsumerState<NoteFormScreen> createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends ConsumerState<NoteFormScreen> {
  final _formKey = GlobalKey<FormState>();
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
    setState(() =>
        _error = _student == null ? L10nGateway.current.chooseStudent : null);
    if (!valid || _student == null) return;
    setState(() => _saving = true);
    try {
      if (_isEdit) {
        await ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.updateStudentNote(
                  widget.note!.id,
                  body: _body.text.trim(),
                  notedAt: _date.text,
                  source: _source,
                  visibility: _visibility,
                ));
      } else {
        await ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.createStudentNote(
                  studentId: _student!.id,
                  enrollmentId: _enrollment?.id,
                  body: _body.text.trim(),
                  notedAt: _date.text,
                  source: _source,
                  visibility: _visibility,
                ));
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
      title: _isEdit ? context.l10n.editNote : context.l10n.newNote,
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                if (!_isEdit)
                  PickerField(
                    label: context.l10n.student,
                    value: _student?.label,
                    error: _error,
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
                  controller: _body,
                  label: context.l10n.noteText,
                  required: true,
                  maxLines: 4,
                ),
                moduleDateField(
                  context: context,
                  controller: _date,
                  label: context.l10n.noteDate,
                  required: true,
                ),
                DropdownButtonFormField<String>(
                  initialValue: _isTeacher || _source == 'teacher'
                      ? 'teacher'
                      : 'management',
                  isExpanded: true,
                  decoration: InputDecoration(labelText: context.l10n.source),
                  items: [
                    if (!_isTeacher)
                      DropdownMenuItem(
                          value: 'management',
                          child: Text(context.l10n.management)),
                    DropdownMenuItem(
                        value: 'teacher', child: Text(context.l10n.teacher)),
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
                  decoration:
                      InputDecoration(labelText: context.l10n.visibility),
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
                  label: context.l10n.save,
                ),
              ],
            ),
    );
  }
}
