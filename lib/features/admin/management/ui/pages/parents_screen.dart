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

/// قائمة الأولياء: بحث، تفاصيل، وإضافة/تعديل/حذف حسب الصلاحيات.
class ParentsScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const ParentsScreen({super.key, required this.token});

  @override
  ConsumerState<ParentsScreen> createState() => _ParentsScreenState();
}

class _ParentsScreenState extends ConsumerState<ParentsScreen> {
  String _search = '';
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _create() async {
    final saved = await context.push<Object?>(AppRoutes.parentFormRoute,
        extra: (token: widget.token, parent: null, initialFatherName: null));
    if (saved != null) _refresh();
  }

  Future<void> _openDetail(ParentItem parent) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: parent.fatherName,
      subtitle: parent.parentNumber,
      rows: [
        MapEntry(L10nGateway.current.phone, parent.fatherPhone ?? ''),
        MapEntry(L10nGateway.current.work, parent.fatherWork ?? ''),
        MapEntry(L10nGateway.current.motherName, parent.motherName ?? ''),
        MapEntry(L10nGateway.current.motherSPhone, parent.motherPhone ?? ''),
        MapEntry(L10nGateway.current.homePhone, parent.homePhone ?? ''),
        MapEntry(L10nGateway.current.address, parent.address ?? ''),
        MapEntry(
            L10nGateway.current.numberOfStudents, '${parent.studentsCount}'),
        MapEntry(
            L10nGateway.current.status,
            parent.isActive
                ? L10nGateway.current.active
                : L10nGateway.current.inactive),
        MapEntry(L10nGateway.current.notes, parent.notes ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateParents(t))
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteParents(t))
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
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
    final saved = await context.push<Object?>(AppRoutes.parentFormRoute,
        extra: (token: widget.token, parent: parent, initialFatherName: null));
    if (saved != null) _refresh();
  }

  Future<void> _delete(ParentItem parent) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteParent,
      message: L10nGateway.current.theParentSFileAnd,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.deleteParent(parent.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.parentDeleted);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewParents(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.parents,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.parents,
      floatingActionButton: ModuleAccess.canCreateParents(t)
          ? AdminFab(
              label: context.l10n.newParent,
              icon: Icons.person_add_alt_1_rounded,
              onPressed: _create,
            )
          : null,
      body: PagedList<ParentItem>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noParentsMatchTheSearch,
        header: ModuleSearchBar(
          hint: context.l10n.searchByNameOrPhone,
          onSearch: (value) => setState(() {
            _search = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => ref
            .read(managementActionsControllerProvider.notifier)
            .query((r) => r.parents(page: page, search: _search)),
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
    final color = parent.isActive ? context.appColors.primaryLight : muted;
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
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w800,
                            color: AdminTheme.text(context),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AdminBadge(
                        label: parent.isActive
                            ? context.l10n.active
                            : context.l10n.inactive,
                        color:
                            parent.isActive ? context.appColors.success : muted,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    parent.parentNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        appTextStyle(fontSize: FontSize.caption, color: muted),
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
                          color: context.appColors.info,
                        ),
                      AdminBadge(
                        icon: Icons.people_rounded,
                        label: context.l10n.students2(parent.studentsCount),
                        color: context.appColors.gold,
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
