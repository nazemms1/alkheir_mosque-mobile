import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import '../widgets/module_widgets.dart';
import 'course_form_screen.dart';

/// قائمة الكورسات: تصفية بالحالة، تفاصيل، وإنهاء/إعادة تفعيل/تعديل/حذف.
/// الكورس المنتهي للقراءة فقط في الخادم، لذلك لا يظهر له تعديل.
class CoursesScreen extends StatefulWidget {
  final AuthToken token;

  const CoursesScreen({super.key, required this.token});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final _service = ManagementRepositoryImpl();
  String _search = '';

  /// null = الكل، true = نشط، false = منتهٍ.
  bool? _isActive;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _openForm({CourseItem? course}) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => CourseFormScreen(token: widget.token, course: course),
      ),
    );
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
        MapEntry(tr('تاريخ البداية'), course.startsOn ?? ''),
        MapEntry(tr('تاريخ النهاية'), course.endsOn ?? ''),
        MapEntry(tr('الحالة'), course.isActive ? tr('نشط') : tr('منتهٍ')),
        MapEntry(tr('تاريخ الإنهاء'), course.finishedAt ?? ''),
        MapEntry(tr('يمنح نقاطاً'), course.awardsPoints ? tr('نعم') : tr('لا')),
        MapEntry(
            tr('الكورس الافتراضي'), course.isDefault ? tr('نعم') : tr('لا')),
        MapEntry(tr('عدد الحلقات'), '${course.groupsCount}'),
        MapEntry(tr('عدد التسجيلات'), '${course.enrollmentsCount}'),
        MapEntry(tr('الوصف'), course.description ?? ''),
      ],
      actions: [
        if (canEdit && course.isActive)
          SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
        if (canEdit && course.isActive)
          SheetAction(
            id: 'finish',
            label: tr('إنهاء الكورس'),
            icon: Icons.flag_rounded,
          ),
        if (canEdit && !course.isActive)
          SheetAction(
            id: 'reactivate',
            label: tr('إعادة التفعيل'),
            icon: Icons.restart_alt_rounded,
          ),
        if (ModuleAccess.canDeleteCourses(t))
          SheetAction(
            id: 'delete',
            label: tr('حذف'),
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
          title: tr('إنهاء الكورس'),
          message: tr(
              'سيتم إنهاء الكورس وحلقاته وتسجيلاته وفق دورة الإنهاء في الموقع.'),
          confirm: tr('إنهاء'),
          action: _service.finishCourse,
          done: tr('تم إنهاء الكورس'),
        );
      case 'reactivate':
        await _lifecycle(
          course,
          title: tr('إعادة تفعيل الكورس'),
          message: tr(
              'ستُستعاد الحلقات والتسجيلات والتقييمات والحضور المرتبطة بالكورس.'),
          confirm: tr('إعادة التفعيل'),
          action: _service.reactivateCourse,
          done: tr('تمت إعادة تفعيل الكورس'),
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
      title: tr('حذف الكورس'),
      message: tr('لا يمكن حذف الكورس إذا كانت له سجلات مرتبطة.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _service.deleteCourse(course.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف الكورس'));
      _refresh();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewCourses(t)) {
      return ModuleScaffold(
        title: tr('الكورسات'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('الكورسات'),
      floatingActionButton: ModuleAccess.canCreateCourses(t)
          ? AdminFab(
              label: tr('كورس جديد'),
              icon: Icons.add_rounded,
              onPressed: () => _openForm(),
            )
          : null,
      body: PagedList<CourseItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد كورسات مطابقة'),
        header: Column(
          children: [
            ModuleSearchBar(
              hint: tr('بحث باسم الكورس'),
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
                    ? tr('الكل')
                    : value
                        ? tr('نشط')
                        : tr('منتهٍ'),
                onSelected: (value) => setState(() {
                  _isActive = value;
                  _reloadToken++;
                }),
              ),
            ),
          ],
        ),
        fetch: (page) => _service.courses(
          page: page,
          search: _search,
          isActive: _isActive,
        ),
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
    final color = course.isActive ? AppColors.success : muted;
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
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        course.academicYear ?? '—',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(fontSize: 12, color: muted),
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
                      label: course.isActive ? tr('نشط') : tr('منتهٍ'),
                      color: color,
                    ),
                    if (course.isDefault) ...[
                      const SizedBox(height: 6),
                      AdminBadge(label: tr('افتراضي'), color: AppColors.gold),
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
                    style: appTextStyle(fontSize: 12, color: muted),
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
                  label: trf('الحلقات: {0}', [course.groupsCount]),
                  color: AppColors.primaryLight,
                ),
                AdminBadge(
                  icon: Icons.how_to_reg_rounded,
                  label: trf('التسجيلات: {0}', [course.enrollmentsCount]),
                  color: AppColors.info,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
