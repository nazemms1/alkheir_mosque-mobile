import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import '../widgets/module_widgets.dart';
import 'teacher_form_screen.dart';

/// قائمة المعلمين: بحث، تفاصيل، وإضافة/تعديل/حذف حسب الصلاحيات.
class TeachersScreen extends StatefulWidget {
  final AuthToken token;

  const TeachersScreen({super.key, required this.token});

  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  final _service = ManagementRepositoryImpl();
  String _search = '';
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({TeacherItem? teacher}) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) =>
            TeacherFormScreen(token: widget.token, teacher: teacher),
      ),
    );
    if (saved == true) _refresh();
  }

  Future<void> _openDetail(TeacherItem teacher) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: teacher.fullName,
      subtitle: teacher.jobTitle ?? '',
      rows: [
        MapEntry(tr('الهاتف'), teacher.phone),
        MapEntry(tr('الحالة'), teacher.isActive ? tr('نشط') : tr('غير نشط')),
        MapEntry(tr('الكورس'), teacher.courseName ?? ''),
        MapEntry(tr('معلم مساعد'), teacher.isHelping ? tr('نعم') : tr('لا')),
        MapEntry(tr('تاريخ التعيين'), teacher.hiredAt ?? ''),
        MapEntry(tr('الحلقات الأساسية'), '${teacher.assignedGroupsCount}'),
        MapEntry(tr('الحلقات المساندة'), '${teacher.assistedGroupsCount}'),
        MapEntry(tr('ملاحظات'), teacher.notes ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateTeachers(t))
          SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteTeachers(t))
          SheetAction(
            id: 'delete',
            label: tr('حذف'),
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
      title: tr('حذف المعلم'),
      message: tr('سيتم حذف ملف المعلم وحسابه المرتبط. لا يمكن التراجع.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _service.deleteTeacher(teacher.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف المعلم'));
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewTeachers(t)) {
      return ModuleScaffold(
        title: tr('المعلمون'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('المعلمون'),
      floatingActionButton: ModuleAccess.canCreateTeachers(t)
          ? AdminFab(
              label: tr('معلم جديد'),
              icon: Icons.person_add_alt_1_rounded,
              onPressed: () => _openForm(),
            )
          : null,
      body: PagedList<TeacherItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا يوجد معلمون مطابقون للبحث'),
        header: ModuleSearchBar(
          hint: tr('بحث بالاسم أو رقم الهاتف'),
          onSearch: (value) => setState(() {
            _search = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _service.teachers(page: page, search: _search),
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
    final color = teacher.isActive ? AppColors.primaryLight : muted;
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
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AdminTheme.text(context),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AdminBadge(
                        label: teacher.isActive ? tr('نشط') : tr('غير نشط'),
                        color: teacher.isActive ? AppColors.success : muted,
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
                          color: AppColors.info,
                        ),
                      AdminBadge(
                        icon: Icons.menu_book_rounded,
                        label: teacher.courseName ?? tr('بلا كورس'),
                        color: AppColors.gold,
                      ),
                      if (teacher.isHelping)
                        AdminBadge(
                          icon: Icons.support_agent_rounded,
                          label: tr('معلم مساعد'),
                          color: AppColors.primaryGlow,
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
