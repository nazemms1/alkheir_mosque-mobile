import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

/// تسمية حالة الطالب كما يرسلها الخادم (كل نص حرفي ليظهر في فحص الترجمة).
String studentStatusLabel(String status) => switch (status) {
      'active' => L10nGateway.current.active,
      'inactive' => L10nGateway.current.inactive,
      'graduated' => L10nGateway.current.graduated,
      'blocked' => L10nGateway.current.blocked,
      _ => status,
    };

/// دليل الطلاب: بحث، إضافة، وتعديل/حذف، مع الوصول لملف الطالب وتسجيلاته وملاحظاته.
class StudentsDirectoryScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const StudentsDirectoryScreen({super.key, required this.token});

  @override
  ConsumerState<StudentsDirectoryScreen> createState() =>
      _StudentsDirectoryScreenState();
}

class _StudentsDirectoryScreenState
    extends ConsumerState<StudentsDirectoryScreen> {
  String _search = '';
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({int? studentId}) async {
    final saved = await context.push<bool>(AppRoutes.studentFormRoute,
        extra: (token: widget.token, studentId: studentId));
    if (saved == true) _refresh();
  }

  Future<void> _openSheet(StudentListItem student) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: student.fullName,
      subtitle: student.studentNumber ?? '',
      rows: [
        MapEntry(
            L10nGateway.current.status, studentStatusLabel(student.status)),
        MapEntry(L10nGateway.current.parent, student.parentName ?? ''),
        MapEntry(L10nGateway.current.grade, student.gradeLevel ?? ''),
      ],
      actions: [
        SheetAction(
          id: 'progress',
          label: L10nGateway.current.studentFile,
          icon: Icons.folder_shared_rounded,
        ),
        if (ModuleAccess.canViewEnrollments(t))
          SheetAction(
            id: 'enrollments',
            label: L10nGateway.current.registrations,
            icon: Icons.how_to_reg_rounded,
          ),
        if (ModuleAccess.canViewNotes(t))
          SheetAction(
            id: 'notes',
            label: L10nGateway.current.notes2,
            icon: Icons.sticky_note_2_outlined,
          ),
        if (ModuleAccess.canUpdateStudents(t))
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteStudents(t))
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted || choice == null) return;
    switch (choice) {
      case 'progress':
        _push(AppRoutes.studentProgressRoute,
            extra: (token: t, student: student));
      case 'enrollments':
        _push(AppRoutes.enrollmentsRoute, extra: (
          token: t,
          studentId: student.id,
          studentName: student.fullName,
          groupId: null,
          groupName: null
        ));
      case 'notes':
        _push(AppRoutes.studentNotesRoute, extra: (
          token: t,
          studentId: student.id,
          studentName: student.fullName
        ));
      case 'edit':
        await _openForm(studentId: student.id);
      case 'delete':
        await _delete(student);
    }
  }

  void _push(String route, {Object? extra}) {
    context.push(route, extra: extra);
  }

  Future<void> _delete(StudentListItem student) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteStudent,
      message: L10nGateway.current.aStudentWithEnrollmentsCannot,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.deleteStudent(student.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.studentDeleted);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewStudents(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.students,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.students,
      floatingActionButton: ModuleAccess.canCreateStudents(t)
          ? AdminFab(
              label: context.l10n.newStudent,
              icon: Icons.person_add_alt_1_rounded,
              onPressed: () => _openForm(),
            )
          : null,
      body: PagedList<StudentListItem>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noStudentsMatchTheSearch,
        header: ModuleSearchBar(
          hint: context.l10n.searchByNameOrStudent,
          onSearch: (value) => setState(() {
            _search = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => ref
            .read(managementActionsControllerProvider.notifier)
            .query((r) => r.students(page: page, search: _search)),
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
        'active' => context.appColors.primaryLight,
        'graduated' => context.appColors.info,
        'blocked' => context.appColors.error,
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
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        student.studentNumber ?? '—',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                            fontSize: FontSize.caption, color: muted),
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
                      color: context.appColors.info,
                    ),
                  if (parent.isNotEmpty)
                    AdminBadge(
                      icon: Icons.family_restroom_rounded,
                      label: parent,
                      color: context.appColors.gold,
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
