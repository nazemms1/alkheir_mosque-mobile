import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

/// قائمة المعلمين: بحث، تفاصيل، وإضافة/تعديل/حذف حسب الصلاحيات.
class TeachersScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const TeachersScreen({super.key, required this.token});

  @override
  ConsumerState<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends ConsumerState<TeachersScreen> {
  String _search = '';
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({TeacherItem? teacher}) async {
    final saved = await context.push<bool>(AppRoutes.teacherFormRoute,
        extra: (token: widget.token, teacher: teacher));
    if (saved == true) _refresh();
  }

  Future<void> _openDetail(TeacherItem teacher) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: teacher.fullName,
      subtitle: teacher.jobTitle ?? '',
      rows: [
        MapEntry(L10nGateway.current.phone, teacher.phone),
        MapEntry(
            L10nGateway.current.status,
            teacher.isActive
                ? L10nGateway.current.active
                : L10nGateway.current.inactive),
        MapEntry(L10nGateway.current.course, teacher.courseName ?? ''),
        MapEntry(
            L10nGateway.current.assistingTeacher,
            teacher.isHelping
                ? L10nGateway.current.yes
                : L10nGateway.current.no),
        MapEntry(L10nGateway.current.hireDate, teacher.hiredAt ?? ''),
        MapEntry(
            L10nGateway.current.mainGroups, '${teacher.assignedGroupsCount}'),
        MapEntry(L10nGateway.current.assistingGroups,
            '${teacher.assistedGroupsCount}'),
        MapEntry(L10nGateway.current.notes, teacher.notes ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateTeachers(t))
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteTeachers(t))
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted) return;
    if (choice == 'edit') await _openForm(teacher: teacher);
    if (choice == 'delete') await _delete(teacher);
  }

  Future<void> _delete(TeacherItem teacher) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteTeacher,
      message: L10nGateway.current.theTeacherSFileAnd,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.deleteTeacher(teacher.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.teacherDeleted);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewTeachers(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.teachers,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.teachers,
      floatingActionButton: ModuleAccess.canCreateTeachers(t)
          ? AdminFab(
              label: context.l10n.newTeacher,
              icon: Icons.person_add_alt_1_rounded,
              onPressed: () => _openForm(),
            )
          : null,
      body: PagedList<TeacherItem>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noTeachersMatchTheSearch,
        header: ModuleSearchBar(
          hint: context.l10n.searchByNameOrPhone,
          onSearch: (value) => setState(() {
            _search = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => ref
            .read(managementActionsControllerProvider.notifier)
            .query((r) => r.teachers(page: page, search: _search)),
        itemBuilder: (context, teacher, _) => _TeacherCard(
          teacher: teacher,
          onTap: () => _openDetail(teacher),
        ),
      ),
    );
  }
}

class _TeacherCard extends StatelessWidget {
  final TeacherItem teacher;
  final VoidCallback onTap;

  const _TeacherCard({required this.teacher, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final muted = AdminTheme.muted(context);
    final color = teacher.isActive ? context.appColors.primaryLight : muted;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AdminCard(
        accent: color,
        onTap: onTap,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            AdminAvatar(
              text: moduleInitials(teacher.fullName),
              color: color,
              size: 46,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          teacher.fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w800,
                            color: AdminTheme.text(context),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AdminBadge(
                        label: teacher.isActive
                            ? context.l10n.active
                            : context.l10n.inactive,
                        color: teacher.isActive
                            ? context.appColors.success
                            : muted,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      if (teacher.phone.isNotEmpty)
                        AdminBadge(
                          icon: Icons.phone_rounded,
                          label: teacher.phone,
                          color: context.appColors.info,
                        ),
                      AdminBadge(
                        icon: Icons.menu_book_rounded,
                        label: teacher.courseName ?? context.l10n.noCourse,
                        color: context.appColors.gold,
                      ),
                      if (teacher.isHelping)
                        AdminBadge(
                          icon: Icons.support_agent_rounded,
                          label: context.l10n.assistingTeacher,
                          color: context.appColors.primaryGlow,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(AdminTheme.chevron(context), color: muted),
          ],
        ),
      ),
    );
  }
}
