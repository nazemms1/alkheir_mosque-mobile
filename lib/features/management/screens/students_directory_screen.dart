import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/group_student_model.dart';
import '../../../data/services/management_service.dart';
import '../../../data/services/operations_service.dart';
import '../../notes/screens/student_notes_screen.dart';
import '../../students/screens/student_progress_screen.dart';
import '../widgets/module_widgets.dart';
import 'enrollments_screen.dart';
import 'student_form_screen.dart';

/// دليل الطلاب: بحث، إضافة، وتعديل/حذف، مع الوصول لملف الطالب وتسجيلاته وملاحظاته.
class StudentsDirectoryScreen extends StatefulWidget {
  final AuthToken token;

  const StudentsDirectoryScreen({super.key, required this.token});

  @override
  State<StudentsDirectoryScreen> createState() =>
      _StudentsDirectoryScreenState();
}

class _StudentsDirectoryScreenState extends State<StudentsDirectoryScreen> {
  final _service = ManagementService();
  final _operations = OperationsService();
  final _searchCtrl = TextEditingController();
  String _search = '';
  int _reloadToken = 0;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({int? studentId}) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => StudentFormScreen(
          token: widget.token,
          studentId: studentId,
        ),
      ),
    );
    if (saved == true) _refresh();
  }

  Future<void> _openSheet(StudentListItem student) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: student.fullName,
      subtitle: student.studentNumber ?? '',
      rows: [
        MapEntry(tr('الحالة'), student.status),
        MapEntry(tr('ولي الأمر'), student.parentName ?? ''),
        MapEntry(tr('الصف'), student.gradeLevel ?? ''),
      ],
      actions: [
        SheetAction(
          id: 'progress',
          label: tr('ملف الطالب'),
          icon: Icons.folder_shared_rounded,
        ),
        if (ModuleAccess.canViewEnrollments(t))
          SheetAction(
            id: 'enrollments',
            label: tr('التسجيلات'),
            icon: Icons.how_to_reg_rounded,
          ),
        if (ModuleAccess.canViewNotes(t))
          SheetAction(
            id: 'notes',
            label: tr('الملاحظات'),
            icon: Icons.sticky_note_2_outlined,
          ),
        if (ModuleAccess.canUpdateStudents(t))
          SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteStudents(t))
          SheetAction(
            id: 'delete',
            label: tr('حذف'),
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted || choice == null) return;
    switch (choice) {
      case 'progress':
        _push(StudentProgressScreen(token: t, student: student));
      case 'enrollments':
        _push(EnrollmentsScreen(
          token: t,
          studentId: student.id,
          studentName: student.fullName,
        ));
      case 'notes':
        _push(StudentNotesScreen(
          token: t,
          studentId: student.id,
          studentName: student.fullName,
        ));
      case 'edit':
        await _openForm(studentId: student.id);
      case 'delete':
        await _delete(student);
    }
  }

  void _push(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  Future<void> _delete(StudentListItem student) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف الطالب'),
      message: tr(
          'لا يمكن حذف الطالب إذا كان لديه تسجيلات. سيتم حذف ملفه الأكاديمي.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _operations.deleteStudent(student.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف الطالب'));
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewStudents(t)) {
      return ModuleScaffold(
        title: tr('الطلاب'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('الطلاب'),
      floatingActionButton: ModuleAccess.canCreateStudents(t)
          ? FloatingActionButton.extended(
              onPressed: () => _openForm(),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.person_add_alt_1_rounded,
                  color: Colors.white),
              label: Text(
                tr('طالب جديد'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<StudentListItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا يوجد طلاب مطابقون للبحث'),
        header: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _searchCtrl,
            textInputAction: TextInputAction.search,
            style: appTextStyle(),
            decoration: InputDecoration(
              hintText: tr('بحث بالاسم أو رقم الطالب'),
              prefixIcon: const Icon(Icons.search_rounded),
            ),
            onSubmitted: (value) => setState(() {
              _search = value.trim();
              _reloadToken++;
            }),
          ),
        ),
        fetch: (page) => _service.students(page: page, search: _search),
        itemBuilder: (context, student, _) => ModuleCard(
          accent: student.status == 'active'
              ? AppColors.primaryLight
              : AppColors.textMuted,
          onTap: () => _openSheet(student),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      student.fullName,
                      style: appTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: student.status,
                    color: student.status == 'active'
                        ? AppColors.success
                        : AppColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${student.studentNumber ?? ''}  ·  ${student.gradeLevel ?? ''}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
