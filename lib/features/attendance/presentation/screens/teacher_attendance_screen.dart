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

  Future<void> _openDay(TeacherAttendanceDay day) async {
    try {
      final detail = await _service.teacherAttendanceDay(day.id);
      if (!mounted) return;
      await showRecordSheet(
        context,
        title: detail.attendanceDate,
        subtitle: detail.courseName ?? '',
        rows: [
          for (final r in detail.records) MapEntry(r.teacherName, r.statusName),
        ],
      );
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
    return ModuleScaffold(
      title: tr('حضور المعلمين'),
      floatingActionButton: ModuleAccess.canTakeTeacherAttendance(t)
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
              Icon(Icons.chevron_left_rounded, color: moduleMuted(context)),
            ],
          ),
        ),
      ),
    );
  }
}

/// نموذج تسجيل حضور المعلمين لتاريخ محدد.
class TeacherAttendanceFormScreen extends StatefulWidget {
  final AuthToken token;

  const TeacherAttendanceFormScreen({super.key, required this.token});

  @override
  State<TeacherAttendanceFormScreen> createState() =>
      _TeacherAttendanceFormScreenState();
}

class _TeacherAttendanceFormScreenState
    extends State<TeacherAttendanceFormScreen> {
  final _operations = OperationsRepositoryImpl();
  final _notes = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  List<TeacherItem> _teachers = const [];
  List<RefItem> _statuses = const [];
  final Map<int, int> _chosen = {};
  bool _loading = true;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
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
      final teachersPage = await ManagementRepositoryImpl().teachers(
        status: 'active',
        perPage: 100,
      );
      final statuses = await _operations.attendanceStatuses('teacher');
      if (!mounted) return;
      RefItem? fallback;
      for (final s in statuses) {
        if (s.code == 'present') fallback = s;
      }
      fallback ??= statuses.isEmpty ? null : statuses.first;
      setState(() {
        _teachers = teachersPage.items;
        _statuses = statuses;
        if (fallback != null) {
          for (final t in teachersPage.items) {
            _chosen[t.id] = fallback.id;
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
    setState(() => _saving = true);
    try {
      await _operations.recordTeacherAttendance(
        attendanceDate: _date.text,
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
    if (!ModuleAccess.canTakeTeacherAttendance(widget.token)) {
      return ModuleScaffold(
        title: tr('تسجيل حضور المعلمين'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('تسجيل حضور المعلمين'),
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
                      label: tr('حفظ الحضور'),
                    ),
                  ],
                ),
    );
  }
}
