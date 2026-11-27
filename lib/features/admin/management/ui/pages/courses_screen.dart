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

/// قائمة الكورسات: تصفية بالحالة، تفاصيل، وإنهاء/إعادة تفعيل/تعديل/حذف.
/// الكورس المنتهي للقراءة فقط في الخادم، لذلك لا يظهر له تعديل.
class CoursesScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const CoursesScreen({super.key, required this.token});

  @override
  ConsumerState<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends ConsumerState<CoursesScreen> {
  late final _service = ref.read(managementActionsControllerProvider.notifier);
  String _search = '';

  /// null = الكل، true = نشط، false = منتهٍ.
  bool? _isActive;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({CourseItem? course}) async {
    final saved = await context.push<bool>(AppRoutes.courseFormRoute,
        extra: (token: widget.token, course: course));
    if (saved == true) _refresh();
  }

  Future<void> _openDetail(CourseItem course) async {
    final t = widget.token;
    final canEdit = ModuleAccess.canUpdateCourses(t);
    final choice = await showRecordSheet(
      context,
      title: course.name,
      subtitle: course.academicYear ?? '',
      rows: [
        MapEntry(L10nGateway.current.startDate, course.startsOn ?? ''),
        MapEntry(L10nGateway.current.endDate, course.endsOn ?? ''),
        MapEntry(
            L10nGateway.current.status,
            course.isActive
                ? L10nGateway.current.active
                : L10nGateway.current.finished),
        MapEntry(L10nGateway.current.finishedOn, course.finishedAt ?? ''),
        MapEntry(
            L10nGateway.current.awardsPoints,
            course.awardsPoints
                ? L10nGateway.current.yes
                : L10nGateway.current.no),
        MapEntry(
            L10nGateway.current.defaultCourse,
            course.isDefault
                ? L10nGateway.current.yes
                : L10nGateway.current.no),
        MapEntry(L10nGateway.current.numberOfGroups, '${course.groupsCount}'),
        MapEntry(
            L10nGateway.current.enrollmentsCount, '${course.enrollmentsCount}'),
        MapEntry(L10nGateway.current.description, course.description ?? ''),
      ],
      actions: [
        if (canEdit && course.isActive)
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (canEdit && course.isActive)
          SheetAction(
            id: 'finish',
            label: L10nGateway.current.finishCourse,
            icon: Icons.flag_rounded,
          ),
        if (canEdit && !course.isActive)
          SheetAction(
            id: 'reactivate',
            label: L10nGateway.current.reactivate,
            icon: Icons.restart_alt_rounded,
          ),
        if (ModuleAccess.canDeleteCourses(t))
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted) return;
    switch (choice) {
      case 'edit':
        await _openForm(course: course);
      case 'finish':
        await _lifecycle(
          course,
          title: L10nGateway.current.finishCourse,
          message: L10nGateway.current.theCourseItsGroupsAnd,
          confirm: L10nGateway.current.finish,
          action: (id) => _service.query((r) => r.finishCourse(id)),
          done: L10nGateway.current.courseFinished,
        );
      case 'reactivate':
        await _lifecycle(
          course,
          title: L10nGateway.current.reactivateCourse,
          message:
              L10nGateway.current.groupsEnrollmentsAssessmentsAndAttendance,
          confirm: L10nGateway.current.reactivate,
          action: (id) => _service.query((r) => r.reactivateCourse(id)),
          done: L10nGateway.current.courseReactivated,
        );
      case 'delete':
        await _delete(course);
    }
  }

  Future<void> _lifecycle(
    CourseItem course, {
    required String title,
    required String message,
    required String confirm,
    required Future<CourseItem> Function(int id) action,
    required String done,
  }) async {
    final ok = await confirmAction(
      context,
      title: title,
      message: message,
      confirmLabel: confirm,
    );
    if (!ok || !mounted) return;
    try {
      await action(course.id);
      if (!mounted) return;
      showModuleSnack(context, done);
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  Future<void> _delete(CourseItem course) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteCourse,
      message: L10nGateway.current.aCourseWithLinkedRecords,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.deleteCourse(course.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.courseDeleted);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewCourses(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.courses,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.courses,
      floatingActionButton: ModuleAccess.canCreateCourses(t)
          ? AdminFab(
              label: context.l10n.newCourse,
              icon: Icons.add_rounded,
              onPressed: () => _openForm(),
            )
          : null,
      body: PagedList<CourseItem>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noMatchingCourses,
        header: Column(
          children: [
            ModuleSearchBar(
              hint: context.l10n.searchByCourseName,
              onSearch: (value) => setState(() {
                _search = value;
                _reloadToken++;
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AdminChoiceBar<bool?>(
                options: const <bool?>[null, true, false],
                selected: _isActive,
                labelOf: (value) => value == null
                    ? L10nGateway.current.all
                    : value
                        ? L10nGateway.current.active
                        : L10nGateway.current.finished,
                onSelected: (value) => setState(() {
                  _isActive = value;
                  _reloadToken++;
                }),
              ),
            ),
          ],
        ),
        fetch: (page) => ref
            .read(managementActionsControllerProvider.notifier)
            .query((r) => r.courses(
                  page: page,
                  search: _search,
                  isActive: _isActive,
                )),
        itemBuilder: (context, course, _) => _CourseCard(
          course: course,
          onTap: () => _openDetail(course),
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final CourseItem course;
  final VoidCallback onTap;

  const _CourseCard({required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final muted = AdminTheme.muted(context);
    final color = course.isActive ? context.appColors.success : muted;
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
                AdminIconBubble(
                  icon: Icons.menu_book_rounded,
                  color: color,
                  size: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: FontSize.bodyLarge,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        course.academicYear ?? '—',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                            fontSize: FontSize.caption, color: muted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AdminBadge(
                      label: course.isActive
                          ? context.l10n.active
                          : context.l10n.finished,
                      color: color,
                    ),
                    if (course.isDefault) ...[
                      const SizedBox(height: 6),
                      AdminBadge(
                          label: context.l10n.tDefault,
                          color: context.appColors.gold),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.date_range_rounded, size: 15, color: muted),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${course.startsOn ?? ''} - ${course.endsOn ?? ''}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        appTextStyle(fontSize: FontSize.caption, color: muted),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                AdminBadge(
                  icon: Icons.groups_rounded,
                  label: context.l10n.groups3(course.groupsCount),
                  color: context.appColors.primaryLight,
                ),
                AdminBadge(
                  icon: Icons.how_to_reg_rounded,
                  label: context.l10n.enrollments(course.enrollmentsCount),
                  color: context.appColors.info,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
