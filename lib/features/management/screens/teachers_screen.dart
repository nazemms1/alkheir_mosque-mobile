import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/management_model.dart';
import '../../../data/services/management_service.dart';
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
  final _service = ManagementService();
  final _searchCtrl = TextEditingController();
  String _search = '';
  int _reloadToken = 0;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

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
          ? FloatingActionButton.extended(
              onPressed: () => _openForm(),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.person_add_alt_1_rounded,
                  color: Colors.white),
              label: Text(
                tr('معلم جديد'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<TeacherItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا يوجد معلمون مطابقون للبحث'),
        header: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _searchCtrl,
            textInputAction: TextInputAction.search,
            style: appTextStyle(),
            decoration: InputDecoration(
              hintText: tr('بحث بالاسم أو رقم الهاتف'),
              prefixIcon: const Icon(Icons.search_rounded),
            ),
            onSubmitted: (value) => setState(() {
              _search = value.trim();
              _reloadToken++;
            }),
          ),
        ),
        fetch: (page) => _service.teachers(page: page, search: _search),
        itemBuilder: (context, teacher, _) => ModuleCard(
          accent:
              teacher.isActive ? AppColors.primaryLight : AppColors.textMuted,
          onTap: () => _openDetail(teacher),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      teacher.fullName,
                      style: appTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: teacher.isActive ? tr('نشط') : tr('غير نشط'),
                    color: teacher.isActive
                        ? AppColors.success
                        : AppColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${teacher.phone}  ·  ${teacher.courseName ?? tr('بلا كورس')}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
              if (teacher.isHelping) ...[
                const SizedBox(height: 6),
                StatusPill(label: tr('معلم مساعد'), color: AppColors.info),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
