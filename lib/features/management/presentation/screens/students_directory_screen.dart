import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/notes/presentation/screens/student_notes_screen.dart';
import 'package:alkheir_mosque/features/students/presentation/screens/student_progress_screen.dart';
import '../widgets/module_widgets.dart';
import 'enrollments_screen.dart';
import 'student_form_screen.dart';

/// تسمية حالة الطالب كما يرسلها الخادم (كل نص حرفي ليظهر في فحص الترجمة).
String studentStatusLabel(String status) => switch (status) {
      'active' => tr('نشط'),
      'inactive' => tr('غير نشط'),
      'graduated' => tr('متخرّج'),
      'blocked' => tr('موقوف'),
      _ => status,
    };

/// دليل الطلاب: بحث، إضافة، وتعديل/حذف، مع الوصول لملف الطالب وتسجيلاته وملاحظاته.
class StudentsDirectoryScreen extends StatefulWidget {
  final AuthToken token;

  const StudentsDirectoryScreen({super.key, required this.token});

  @override
  State<StudentsDirectoryScreen> createState() =>
      _StudentsDirectoryScreenState();
}

class _StudentsDirectoryScreenState extends State<StudentsDirectoryScreen> {
  final _service = ManagementRepositoryImpl();
  final _operations = OperationsRepositoryImpl();
  String _search = '';
  int _reloadToken = 0;

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
        MapEntry(tr('الحالة'), studentStatusLabel(student.status)),
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
          ? AdminFab(
              label: tr('طالب جديد'),
              icon: Icons.person_add_alt_1_rounded,
              onPressed: () => _openForm(),
            )
          : null,
      body: PagedList<StudentListItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا يوجد طلاب مطابقون للبحث'),
        header: ModuleSearchBar(
          hint: tr('بحث بالاسم أو رقم الطالب'),
          onSearch: (value) => setState(() {
            _search = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _service.students(page: page, search: _search),
        itemBuilder: (context, student, _) => _StudentCard(
          student: student,
          onTap: () => _openSheet(student),
        ),
      ),
    );
  }
}

class _StudentCard extends StatelessWidget {
  final StudentListItem student;
  final VoidCallback onTap;

  const _StudentCard({required this.student, required this.onTap});

  Color _colorFor(BuildContext context) => switch (student.status) {
        'active' => AppColors.primaryLight,
        'graduated' => AppColors.info,
        'blocked' => AppColors.error,
        _ => AdminTheme.muted(context),
      };

  @override
  Widget build(BuildContext context) {
    final muted = AdminTheme.muted(context);
    final color = _colorFor(context);
    final grade = student.gradeLevel ?? '';
    final parent = student.parentName ?? '';
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AdminCard(
        accent: color,
        onTap: onTap,
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AdminAvatar(
                  text: moduleInitials(student.fullName),
                  color: color,
                  size: 46,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.fullName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        student.studentNumber ?? '—',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(fontSize: 12, color: muted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AdminBadge(
                  label: studentStatusLabel(student.status),
                  color: color,
                ),
              ],
            ),
            if (grade.isNotEmpty || parent.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  if (grade.isNotEmpty)
                    AdminBadge(
                      icon: Icons.school_outlined,
                      label: grade,
                      color: AppColors.info,
                    ),
                  if (parent.isNotEmpty)
                    AdminBadge(
                      icon: Icons.family_restroom_rounded,
                      label: parent,
                      color: AppColors.gold,
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
