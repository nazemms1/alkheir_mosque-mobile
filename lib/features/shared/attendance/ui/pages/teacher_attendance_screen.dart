import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:alkheir_mosque/ui/widgets/auto_save.dart';
import 'package:alkheir_mosque/features/shared/attendance/ui/widgets/att_status_row.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// حضور المعلمين: قائمة الأيام مع تفاصيل كل يوم، وتسجيل حضور يوم لجميع المعلمين النشطين.
class TeacherAttendanceScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const TeacherAttendanceScreen({super.key, required this.token});

  @override
  ConsumerState<TeacherAttendanceScreen> createState() =>
      _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState
    extends ConsumerState<TeacherAttendanceScreen> {
  int _reloadToken = 0;

  Future<void> _record() async {
    // الحفظ تلقائي أثناء التعديل، فنُحدّث القائمة عند كل عودة بغض النظر عن النتيجة.
    await context.push<void>(AppRoutes.teacherAttendanceFormRoute,
        extra: (token: widget.token, initialDay: null));
    if (mounted) setState(() => _reloadToken++);
  }

  Future<void> _editDay(TeacherAttendanceDay day) async {
    final outcome = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.teacherAttendanceDay(day.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    final detail = outcome.value!;
    await context.push<void>(AppRoutes.teacherAttendanceFormRoute,
        extra: (token: widget.token, initialDay: detail));
    if (mounted) setState(() => _reloadToken++);
  }

  Future<void> _openDay(TeacherAttendanceDay day) async {
    final outcome2 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.teacherAttendanceDay(day.id));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    final detail = outcome2.value!;
    final action = await showRecordSheet(
      context,
      title: detail.attendanceDate,
      subtitle: detail.courseName ?? '',
      rows: [
        for (final r in detail.records) MapEntry(r.teacherName, r.statusName),
      ],
      actions: [
        if (ModuleAccess.canTakeTeacherAttendance(widget.token) &&
            detail.status != 'closed') ...[
          SheetAction(
            id: 'edit',
            label: L10nGateway.current.editAttendance,
            icon: Icons.edit_rounded,
          ),
        ],
      ],
    );
    if (!mounted) return;
    if (action == 'edit') {
      _editDay(detail);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewTeacherAttendance(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.teacherAttendance,
        body: const ModuleAccessDenied(),
      );
    }
    final canEdit = ModuleAccess.canTakeTeacherAttendance(t);
    return ModuleScaffold(
      title: context.l10n.teacherAttendance,
      floatingActionButton: canEdit
          ? FloatingActionButton.extended(
              onPressed: _record,
              icon: const Icon(Icons.how_to_reg_rounded),
              label: Text(context.l10n.recordTodaySAttendance,
                  style: appTextStyle()),
            )
          : null,
      body: PagedList<TeacherAttendanceDay>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noTeacherAttendanceDays,
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.teacherAttendanceDays(page: page)),
        itemBuilder: (context, day, _) => ModuleCard(
          accent: day.status == 'open'
              ? context.appColors.success
              : context.appColors.textMuted,
          onTap: () => _openDay(day),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day.attendanceDate,
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '${day.courseName ?? ''}  ·  ${L10nGateway.current.records(day.recordsCount)}',
                      style: appTextStyle(
                          fontSize: FontSize.caption,
                          color: moduleMuted(context)),
                    ),
                  ],
                ),
              ),
              if (canEdit && day.status != 'closed') ...[
                IconButton(
                  tooltip: L10nGateway.current.editAttendance,
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  onPressed: () => _editDay(day),
                ),
              ],
              Icon(moduleChevronForward(context), color: moduleMuted(context)),
            ],
          ),
        ),
      ),
    );
  }
}

/// نموذج تسجيل أو تعديل حضور المعلمين لتاريخ محدد.
class TeacherAttendanceFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final TeacherAttendanceDay? initialDay;

  const TeacherAttendanceFormScreen({
    super.key,
    required this.token,
    this.initialDay,
  });

  @override
  ConsumerState<TeacherAttendanceFormScreen> createState() =>
      _TeacherAttendanceFormScreenState();
}

class _TeacherAttendanceFormScreenState
    extends ConsumerState<TeacherAttendanceFormScreen> {
  late final AutoSaveController _autosave = AutoSaveController(_persist);
  Timer? _notesDebounce;
  late final TextEditingController _notes;
  late final TextEditingController _date;
  PickerItem? _course;
  final Map<int, int> _chosen = {};
  late final _formProvider = screenDataProvider(_loadForm);
  List<TeacherItem> get _teachers =>
      ref.watch(_formProvider).valueOrNull?.teachers ?? const [];
  List<RefItem> get _statuses =>
      ref.watch(_formProvider).valueOrNull?.statuses ?? const [];
  bool get _loading => ref.watch(_formProvider).isLoading;
  String? get _error {
    final e = ref.watch(_formProvider).error;
    return e == null ? null : errorText(e);
  }

  @override
  void initState() {
    super.initState();
    _notes = TextEditingController(text: widget.initialDay?.notes ?? '');
    _date = TextEditingController(
      text: widget.initialDay?.attendanceDate ?? isoDate(DateTime.now()),
    );
    _date.addListener(_onDateChanged);
    _notes.addListener(_onNotesChanged);
    // يملأ الاختيارات القابلة للتعديل مرة عند وصول البيانات.
    ref.listenManual(_formProvider, (_, next) {
      if (next case AsyncData(:final value)) {
        setState(() {
          _course = value.course;
          _chosen
            ..clear()
            ..addAll(value.chosen);
        });
      }
    }, fireImmediately: true);
  }

  @override
  void dispose() {
    _notesDebounce?.cancel();
    _autosave.dispose();
    _date.removeListener(_onDateChanged);
    _notes.removeListener(_onNotesChanged);
    _notes.dispose();
    _date.dispose();
    super.dispose();
  }

  Future<
      ({
        List<TeacherItem> teachers,
        List<RefItem> statuses,
        PickerItem? course,
        Map<int, int> chosen,
      })> _loadForm() async {
    {
      final teachersPageFuture = ref
          .read(managementActionsControllerProvider.notifier)
          .query((r) => r.teachers(
                status: 'active',
                perPage: 100,
              ));
      final statusesFuture = ref
          .read(operationsActionsControllerProvider.notifier)
          .query((r) => r.attendanceStatuses('teacher'));
      final coursesFuture = ref
          .read(managementActionsControllerProvider.notifier)
          .query((r) => r.courses(
                isActive: true,
                perPage: 50,
              ));
      final results = await Future.wait([
        teachersPageFuture,
        statusesFuture,
        coursesFuture,
      ]);
      final teachersPage = results[0] as PagedResult<TeacherItem>;
      final statuses = results[1] as List<RefItem>;
      final coursesPage = results[2] as PagedResult<CourseItem>;

      PickerItem? initialCourse;
      if (widget.initialDay != null) {
        final initCId = widget.initialDay!.courseId;
        final initCName = widget.initialDay!.courseName;
        if (initCId != null) {
          for (final c in coursesPage.items) {
            if (c.id == initCId) {
              initialCourse = PickerItem(id: c.id, label: c.name);
              break;
            }
          }
          initialCourse ??= PickerItem(id: initCId, label: initCName ?? '');
        } else if (initCName != null && initCName.isNotEmpty) {
          for (final c in coursesPage.items) {
            if (c.name.trim() == initCName.trim()) {
              initialCourse = PickerItem(id: c.id, label: c.name);
              break;
            }
          }
        }
      }

      if (initialCourse == null) {
        for (final c in coursesPage.items) {
          if (c.isDefault) {
            initialCourse = PickerItem(id: c.id, label: c.name);
            break;
          }
        }
        initialCourse ??= coursesPage.items.isNotEmpty
            ? PickerItem(
                id: coursesPage.items.first.id,
                label: coursesPage.items.first.name,
              )
            : null;
      }
      RefItem? defaultStatus;
      for (final s in statuses) {
        final c = (s.code ?? '').toLowerCase();
        final n = s.name.toLowerCase();
        if (c == 'absent' || n.contains('غياب') || n.contains('غائب')) {
          defaultStatus = s;
          break;
        }
      }
      defaultStatus ??= statuses.firstWhere(
        (s) => s.code == 'present',
        orElse: () => statuses.isNotEmpty
            ? statuses.first
            : const RefItem(
                id: 0, name: '', code: null, isActive: true, isCurrent: false),
      );

      final existingByTeacherId = <int, int>{};
      final existingByTeacherName = <String, int>{};
      if (widget.initialDay != null) {
        for (final r in widget.initialDay!.records) {
          int? statusId = r.statusId;
          if (statusId == null) {
            for (final s in statuses) {
              if (s.code == r.statusCode || s.name == r.statusName) {
                statusId = s.id;
                break;
              }
            }
            statusId ??= defaultStatus.id;
          }
          if (r.teacherId != null) {
            existingByTeacherId[r.teacherId!] = statusId;
          }
          existingByTeacherName[r.teacherName.trim().toLowerCase()] = statusId;
        }
      }

      final chosen = <int, int>{};
      for (final t in teachersPage.items) {
        if (widget.initialDay != null) {
          final existing = existingByTeacherId[t.id] ??
              existingByTeacherName[t.fullName.trim().toLowerCase()];
          chosen[t.id] = existing ?? defaultStatus.id;
        } else {
          chosen[t.id] = defaultStatus.id;
        }
      }
      return (
        teachers: teachersPage.items,
        statuses: statuses,
        course: initialCourse,
        chosen: chosen,
      );
    }
  }

  /// يحفظ اليوم كاملاً (نفس دلالة الحفظ السابقة). يُستدعى عند كل تغيير.
  Future<void> _persist() async {
    final course = _course;
    if (_loading || _teachers.isEmpty || course == null) return;
    await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.recordTeacherAttendance(
              attendanceDate: _date.text,
              courseId: course.id,
              notes: nullIfBlank(_notes.text),
              records: [
                for (final t in _teachers)
                  {
                    'teacher_id': t.id,
                    'attendance_status_id': _chosen[t.id],
                  },
              ],
            ));
  }

  /// لا نحفظ قبل اختيار الدورة، حتى لا يظهر "تم الحفظ" دون حفظ فعلي.
  void _saveIfReady() {
    if (_loading || _course == null) return;
    _autosave.request();
  }

  void _setStatus(int teacherId, int statusId) {
    if (_loading) return;
    setState(() => _chosen[teacherId] = statusId);
    _saveIfReady();
  }

  void _setCourse(PickerItem? course) {
    setState(() => _course = course);
    _saveIfReady();
  }

  void _onDateChanged() => _saveIfReady();

  void _onNotesChanged() {
    _notesDebounce?.cancel();
    _notesDebounce = Timer(const Duration(milliseconds: 800), _saveIfReady);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialDay != null;
    final screenTitle = isEdit
        ? context.l10n.editTeacherAttendance
        : context.l10n.recordTeacherAttendance;
    if (!ModuleAccess.canTakeTeacherAttendance(widget.token)) {
      return ModuleScaffold(
        title: screenTitle,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: screenTitle,
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? ModuleMessage(
                  text: _error!,
                  icon: Icons.error_outline_rounded,
                  color: context.appColors.error,
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    PickerField(
                      label: context.l10n.course3,
                      value: _course?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: L10nGateway.current.chooseCourse2,
                          load: activeCoursePickerItems,
                        );
                        if (picked != null) _setCourse(picked);
                      },
                      onClear: () => _setCourse(null),
                    ),
                    moduleDateField(
                      context: context,
                      controller: _date,
                      label: context.l10n.attendanceDate,
                      required: true,
                    ),
                    moduleTextField(
                      controller: _notes,
                      label: context.l10n.generalNotes,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    AutoSaveIndicator(
                      controller: _autosave,
                      onRetry: _autosave.request,
                    ),
                    if (_course == null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ModuleMessage(
                          text: context.l10n.chooseCourseToAutoSave,
                          icon: Icons.info_outline_rounded,
                        ),
                      ),
                    const SizedBox(height: 14),
                    if (_teachers.isEmpty)
                      ModuleMessage(text: context.l10n.noActiveTeachers)
                    else
                      for (final t in _teachers)
                        AttendanceStatusRow(
                          key: ValueKey('tch-row-${t.id}'),
                          name: t.fullName,
                          statuses: _statuses,
                          value: _chosen[t.id],
                          enabled: !_loading,
                          onChanged: (id) => _setStatus(t.id, id),
                        ),
                    const SizedBox(height: 12),
                  ],
                ),
    );
  }
}
