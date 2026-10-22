import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/operations/data/models/operations_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';


/// حضور المعلمين: قائمة الأيام مع تفاصيل كل يوم، وتسجيل حضور يوم لجميع المعلمين النشطين.
class TeacherAttendanceScreen extends StatefulWidget {
  final AuthToken token;

  const TeacherAttendanceScreen({super.key, required this.token});

  @override
  State<TeacherAttendanceScreen> createState() =>
      _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {
  final _service = OperationsRepositoryImpl();
  int _reloadToken = 0;

  Future<void> _record() async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => TeacherAttendanceFormScreen(token: widget.token),
      ),
    );
    if (saved == true) setState(() => _reloadToken++);
  }

  Future<void> _editDay(TeacherAttendanceDay day) async {
    try {
      final detail = await _service.teacherAttendanceDay(day.id);
      if (!mounted) return;
      final saved = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (_) => TeacherAttendanceFormScreen(
            token: widget.token,
            initialDay: detail,
          ),
        ),
      );
      if (saved == true && mounted) {
        setState(() => _reloadToken++);
      }
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  Future<void> _openDay(TeacherAttendanceDay day) async {
    try {
      final detail = await _service.teacherAttendanceDay(day.id);
      if (!mounted) return;
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
              label: tr('تعديل الحضور'),
              icon: Icons.edit_rounded,
            ),
          ],
        ],
      );
      if (!mounted) return;
      if (action == 'edit') {
        _editDay(detail);
      }
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewTeacherAttendance(t)) {
      return ModuleScaffold(
        title: tr('حضور المعلمين'),
        body: const ModuleAccessDenied(),
      );
    }
    final canEdit = ModuleAccess.canTakeTeacherAttendance(t);
    return ModuleScaffold(
      title: tr('حضور المعلمين'),
      floatingActionButton: canEdit
          ? FloatingActionButton.extended(
              onPressed: _record,
              icon: const Icon(Icons.how_to_reg_rounded),
              label: Text(tr('تسجيل حضور اليوم'), style: appTextStyle()),
            )
          : null,
      body: PagedList<TeacherAttendanceDay>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد أيام حضور للمعلمين'),
        fetch: (page) => _service.teacherAttendanceDays(page: page),
        itemBuilder: (context, day, _) => ModuleCard(
          accent:
              day.status == 'open' ? AppColors.success : AppColors.textMuted,
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
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      '${day.courseName ?? ''}  ·  ${trf('السجلات: {0}', [
                            day.recordsCount
                          ])}',
                      style: appTextStyle(
                          fontSize: 12, color: moduleMuted(context)),
                    ),
                  ],
                ),
              ),
              if (canEdit && day.status != 'closed') ...[
                IconButton(
                  tooltip: tr('تعديل الحضور'),
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
class TeacherAttendanceFormScreen extends StatefulWidget {
  final AuthToken token;
  final TeacherAttendanceDay? initialDay;

  const TeacherAttendanceFormScreen({
    super.key,
    required this.token,
    this.initialDay,
  });

  @override
  State<TeacherAttendanceFormScreen> createState() =>
      _TeacherAttendanceFormScreenState();
}

class _TeacherAttendanceFormScreenState
    extends State<TeacherAttendanceFormScreen> {
  final _operations = OperationsRepositoryImpl();
  late final TextEditingController _notes;
  late final TextEditingController _date;
  PickerItem? _course;
  List<TeacherItem> _teachers = const [];
  List<RefItem> _statuses = const [];
  final Map<int, int> _chosen = {};
  bool _loading = true;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _notes = TextEditingController(text: widget.initialDay?.notes ?? '');
    _date = TextEditingController(
      text: widget.initialDay?.attendanceDate ?? isoDate(DateTime.now()),
    );
    _load();
  }

  @override
  void dispose() {
    _notes.dispose();
    _date.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final teachersPageFuture = ManagementRepositoryImpl().teachers(
        status: 'active',
        perPage: 100,
      );
      final statusesFuture = _operations.attendanceStatuses('teacher');
      final coursesFuture = ManagementRepositoryImpl().courses(
        isActive: true,
        perPage: 50,
      );
      final results = await Future.wait([
        teachersPageFuture,
        statusesFuture,
        coursesFuture,
      ]);
      if (!mounted) return;
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

      setState(() {
        _teachers = teachersPage.items;
        _statuses = statuses;
        _course = initialCourse;
        for (final t in teachersPage.items) {
          if (widget.initialDay != null) {
            final existing = existingByTeacherId[t.id] ??
                existingByTeacherName[t.fullName.trim().toLowerCase()];
            _chosen[t.id] = existing ?? defaultStatus?.id ?? 0;
          } else {
            if (defaultStatus != null) {
              _chosen[t.id] = defaultStatus.id;
            }
          }
        }
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = errorText(error);
      });
    }
  }

  Future<void> _save() async {
    if (_teachers.isEmpty) return;
    if (_course == null) {
      showModuleSnack(context, tr('اختر الدورة'), error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      await _operations.recordTeacherAttendance(
        attendanceDate: _date.text,
        courseId: _course!.id,
        notes: nullIfBlank(_notes.text),
        records: [
          for (final t in _teachers)
            {
              'teacher_id': t.id,
              'attendance_status_id': _chosen[t.id],
            },
        ],
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialDay != null;
    final screenTitle =
        isEdit ? tr('تعديل حضور المعلمين') : tr('تسجيل حضور المعلمين');
    if (!ModuleAccess.canTakeTeacherAttendance(widget.token)) {
      return ModuleScaffold(
        title: screenTitle,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: screenTitle,
      actions: [
        if (!_loading && _error == null) ...[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: _saving
                ? const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                  )
                : IconButton(
                    tooltip: isEdit ? tr('حفظ التعديلات') : tr('حفظ الحضور'),
                    icon: const Icon(Icons.check_circle_rounded,
                        color: Colors.white, size: 26),
                    onPressed: _save,
                  ),
          ),
        ],
      ],
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? ModuleMessage(
                  text: _error!,
                  icon: Icons.error_outline_rounded,
                  color: AppColors.error,
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    PickerField(
                      label: tr('الدورة'),
                      value: _course?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: tr('اختر الدورة'),
                          load: activeCoursePickerItems,
                        );
                        if (picked != null) {
                          setState(() => _course = picked);
                        }
                      },
                      onClear: () => setState(() => _course = null),
                    ),
                    moduleDateField(
                      context: context,
                      controller: _date,
                      label: tr('تاريخ الحضور'),
                      required: true,
                    ),
                    moduleTextField(
                      controller: _notes,
                      label: tr('ملاحظات عامة'),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    // زر الحفظ بالأعلى لسهولة الوصول المباشر دون الحاجة لعمل سكرول
                    ModuleSaveButton(
                      saving: _saving,
                      onPressed: _save,
                      label: isEdit ? tr('حفظ التعديلات') : tr('حفظ الحضور'),
                    ),
                    const SizedBox(height: 14),
                    if (_teachers.isEmpty)
                      ModuleMessage(text: tr('لا يوجد معلمون نشطون'))
                    else
                      for (final t in _teachers)
                        ModuleCard(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  t.fullName,
                                  style: appTextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: DropdownButtonFormField<int>(
                                  initialValue: _statuses
                                          .any((s) => s.id == _chosen[t.id])
                                      ? _chosen[t.id]
                                      : null,
                                  isExpanded: true,
                                  decoration:
                                      const InputDecoration(isDense: true),
                                  items: [
                                    for (final s in _statuses)
                                      DropdownMenuItem(
                                        value: s.id,
                                        child: Text(s.name,
                                            style: appTextStyle(fontSize: 12)),
                                      ),
                                  ],
                                  onChanged: (id) {
                                    if (id != null) {
                                      setState(() => _chosen[t.id] = id);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                    const SizedBox(height: 12),
                    ModuleSaveButton(
                      saving: _saving,
                      onPressed: _save,
                      label: isEdit ? tr('حفظ التعديلات') : tr('حفظ الحضور'),
                    ),
                  ],
                ),
    );
  }
}
