import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/management_model.dart';
import '../../../data/services/management_service.dart';
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
  final _service = ManagementService();
  final _searchCtrl = TextEditingController();
  String _search = '';

  /// null = الكل، true = نشط، false = منتهٍ.
  bool? _isActive;
  int _reloadToken = 0;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

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
          ? FloatingActionButton.extended(
              onPressed: () => _openForm(),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: Text(
                tr('كورس جديد'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<CourseItem>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد كورسات مطابقة'),
        header: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: TextField(
                controller: _searchCtrl,
                textInputAction: TextInputAction.search,
                style: appTextStyle(),
                decoration: InputDecoration(
                  hintText: tr('بحث باسم الكورس'),
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
                onSubmitted: (value) => setState(() {
                  _search = value.trim();
                  _reloadToken++;
                }),
              ),
            ),
            SizedBox(
              height: 52,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                children: [
                  _filterChip(tr('الكل'), null),
                  _filterChip(tr('نشط'), true),
                  _filterChip(tr('منتهٍ'), false),
                ],
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

  Widget _filterChip(String label, bool? value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ChoiceChip(
        label: Text(label, style: appTextStyle(fontSize: 12)),
        selected: _isActive == value,
        onSelected: (_) => setState(() {
          _isActive = value;
          _reloadToken++;
        }),
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
    final color = course.isActive ? AppColors.success : AppColors.textMuted;
    return ModuleCard(
      accent: color,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  course.name,
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (course.isDefault) ...[
                StatusPill(label: tr('افتراضي'), color: AppColors.gold),
                const SizedBox(width: 6),
              ],
              StatusPill(
                label: course.isActive ? tr('نشط') : tr('منتهٍ'),
                color: color,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${course.academicYear ?? '—'}  ·  ${course.startsOn ?? ''} - ${course.endsOn ?? ''}',
            style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            trf('الحلقات: {0}  ·  التسجيلات: {1}', [
              course.groupsCount,
              course.enrollmentsCount,
            ]),
            style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
          ),
        ],
      ),
    );
  }
}
