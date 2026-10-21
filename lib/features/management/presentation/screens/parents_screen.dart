import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import '../widgets/module_widgets.dart';
import 'parent_form_screen.dart';

/// قائمة الأولياء: بحث، تفاصيل، وإضافة/تعديل/حذف حسب الصلاحيات.
class ParentsScreen extends StatefulWidget {
  final AuthToken token;

  const ParentsScreen({super.key, required this.token});

  @override
  State<ParentsScreen> createState() => _ParentsScreenState();
}

class _ParentsScreenState extends State<ParentsScreen> {
  final _service = ManagementRepositoryImpl();
  String _search = '';
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _create() async {
    final saved = await Navigator.of(context).push<Object?>(
      MaterialPageRoute(builder: (_) => ParentFormScreen(token: widget.token)),
    );
    if (saved != null) _refresh();
  }

  Future<void> _openDetail(ParentItem parent) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: parent.fatherName,
      subtitle: parent.parentNumber,
      rows: [
        MapEntry(tr('الهاتف'), parent.fatherPhone ?? ''),
        MapEntry(tr('العمل'), parent.fatherWork ?? ''),
        MapEntry(tr('اسم الأم'), parent.motherName ?? ''),
        MapEntry(tr('هاتف الأم'), parent.motherPhone ?? ''),
        MapEntry(tr('هاتف المنزل'), parent.homePhone ?? ''),
        MapEntry(tr('العنوان'), parent.address ?? ''),
        MapEntry(tr('عدد الطلاب'), '${parent.studentsCount}'),
        MapEntry(tr('الحالة'), parent.isActive ? tr('نشط') : tr('غير نشط')),
        MapEntry(tr('ملاحظات'), parent.notes ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateParents(t))
          SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteParents(t))
          SheetAction(
            id: 'delete',
            label: tr('حذف'),
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted) return;
    if (choice == 'edit') await _edit(parent);
    if (choice == 'delete') await _delete(parent);
  }

  Future<void> _edit(ParentItem parent) async {
    final saved = await Navigator.of(context).push<Object?>(
      MaterialPageRoute(
        builder: (_) => ParentFormScreen(token: widget.token, parent: parent),
      ),
    );
    if (saved != null) _refresh();
  }

  Future<void> _delete(ParentItem parent) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف ولي الأمر'),
      message: tr('سيتم حذف ملف ولي الأمر وحسابه. لا يمكن التراجع.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _service.deleteParent(parent.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف ولي الأمر'));
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewParents(t)) {
      return ModuleScaffold(
        title: tr('الأولياء'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('الأولياء'),
      floatingActionButton: ModuleAccess.canCreateParents(t)
          ? AdminFab(
              label: tr('ولي أمر جديد'),
              icon: Icons.person_add_alt_1_rounded,
              onPressed: _create,
            )
          : null,
      body: PagedList<ParentItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا يوجد أولياء مطابقون للبحث'),
        header: ModuleSearchBar(
          hint: tr('بحث بالاسم أو رقم الهاتف'),
          onSearch: (value) => setState(() {
            _search = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _service.parents(page: page, search: _search),
        itemBuilder: (context, parent, _) => _ParentCard(
          parent: parent,
          onTap: () => _openDetail(parent),
        ),
      ),
    );
  }
}

class _ParentCard extends StatelessWidget {
  final ParentItem parent;
  final VoidCallback onTap;

  const _ParentCard({required this.parent, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final muted = AdminTheme.muted(context);
    final color = parent.isActive ? AppColors.primaryLight : muted;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AdminCard(
        accent: color,
        onTap: onTap,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            AdminAvatar(
              text: moduleInitials(parent.fatherName),
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
                          parent.fatherName,
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
                        label: parent.isActive ? tr('نشط') : tr('غير نشط'),
                        color: parent.isActive ? AppColors.success : muted,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    parent.parentNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appTextStyle(fontSize: 12, color: muted),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      if ((parent.fatherPhone ?? '').isNotEmpty)
                        AdminBadge(
                          icon: Icons.phone_rounded,
                          label: parent.fatherPhone!,
                          color: AppColors.info,
                        ),
                      AdminBadge(
                        icon: Icons.people_rounded,
                        label: trf('عدد الطلاب: {0}', [parent.studentsCount]),
                        color: AppColors.gold,
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
