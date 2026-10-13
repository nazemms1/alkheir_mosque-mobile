import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/operations_model.dart';
import '../../../data/services/operations_service.dart';
import '../../management/widgets/module_widgets.dart';
import 'take_attendance_screen.dart';

/// قائمة أيام حضور الطلاب مع تصفية بالحالة، والوصول لتفاصيل اليوم أو أخذ الحضور.
class StudentAttendanceScreen extends StatefulWidget {
  final AuthToken token;

  const StudentAttendanceScreen({super.key, required this.token});

  @override
  State<StudentAttendanceScreen> createState() =>
      _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  final _service = OperationsService();
  String? _status;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  Future<void> _takeAttendance() async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => TakeAttendanceScreen(token: widget.token),
      ),
    );
    if (saved == true) _refresh();
  }

  Future<void> _openDay(AttendanceDaySummary day) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => AttendanceDayScreen(token: widget.token, dayId: day.id),
      ),
    );
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewStudentAttendance(t)) {
      return ModuleScaffold(
        title: tr('حضور الطلاب'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('حضور الطلاب'),
      floatingActionButton: ModuleAccess.canTakeStudentAttendance(t)
          ? FloatingActionButton.extended(
              onPressed: _takeAttendance,
              icon: const Icon(Icons.how_to_reg_rounded),
              label: Text(tr('أخذ الحضور'), style: appTextStyle()),
            )
          : null,
      body: PagedList<AttendanceDaySummary>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد أيام حضور مسجّلة'),
        header: _DayStatusFilter(
          selected: _status,
          onSelected: (value) => setState(() {
            _status = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) =>
            _service.studentAttendanceDays(page: page, status: _status),
        itemBuilder: (context, day, _) => ModuleCard(
          accent:
              day.status == 'open' ? AppColors.success : AppColors.textMuted,
          onTap: () => _openDay(day),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      day.attendanceDate,
                      style: appTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  StatusPill(
                    label: day.status == 'open' ? tr('مفتوح') : tr('مغلق'),
                    color: day.status == 'open'
                        ? AppColors.success
                        : AppColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${day.courseName ?? ''}  ·  ${trf('الحلقات: {0}', [
                      day.groupsCount
                    ])}  ·  ${trf('السجلات: {0}', [day.recordsCount])}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
              if (day.courseFinished)
                Text(
                  tr('الكورس منتهٍ — السجل للقراءة فقط'),
                  style: appTextStyle(fontSize: 11, color: AppColors.warning),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DayStatusFilter extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _DayStatusFilter({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final options = <String?, String>{
      null: tr('الكل'),
      'open': tr('مفتوح'),
      'closed': tr('مغلق'),
    };
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ChoiceChip(
                label: Text(entry.value, style: appTextStyle(fontSize: 12)),
                selected: entry.key == selected,
                onSelected: (_) => onSelected(entry.key),
              ),
            ),
        ],
      ),
    );
  }
}

/// تفاصيل يوم حضور: الحلقات وسجلات الطلاب، وفتح اليوم أو إغلاقه.
class AttendanceDayScreen extends StatefulWidget {
  final AuthToken token;
  final int dayId;

  const AttendanceDayScreen({
    super.key,
    required this.token,
    required this.dayId,
  });

  @override
  State<AttendanceDayScreen> createState() => _AttendanceDayScreenState();
}

class _AttendanceDayScreenState extends State<AttendanceDayScreen> {
  final _service = OperationsService();
  AttendanceDayDetail? _day;
  bool _loading = true;
  bool _busy = false;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final day = await _service.studentAttendanceDay(widget.dayId);
      if (!mounted) return;
      setState(() {
        _day = day;
        _loading = false;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  Future<void> _toggle(AttendanceDayDetail day) async {
    final next = day.status == 'open' ? 'closed' : 'open';
    final ok = await confirmAction(
      context,
      title: next == 'closed' ? tr('إغلاق اليوم') : tr('فتح اليوم'),
      message: next == 'closed'
          ? tr('بعد الإغلاق لن يُعدَّل حضور هذا اليوم حتى يُفتح من جديد.')
          : tr('سيُسمح بتعديل حضور هذا اليوم مرة أخرى.'),
      confirmLabel: next == 'closed' ? tr('إغلاق') : tr('فتح'),
    );
    if (!ok || !mounted) return;
    setState(() => _busy = true);
    try {
      final updated =
          await _service.setStudentAttendanceDayStatus(day.id, next);
      if (!mounted) return;
      setState(() {
        _day = updated;
        _busy = false;
      });
      showModuleSnack(context, tr('تم تحديث حالة اليوم'));
    } catch (error) {
      if (!mounted) return;
      setState(() => _busy = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final day = _day;
    final canToggle = ModuleAccess.canToggleAttendanceDay(widget.token) &&
        day != null &&
        !day.courseFinished;
    return ModuleScaffold(
      title: day?.attendanceDate ?? tr('يوم الحضور'),
      actions: [
        if (day != null && canToggle)
          IconButton(
            tooltip: day.status == 'open' ? tr('إغلاق اليوم') : tr('فتح اليوم'),
            onPressed: _busy ? null : () => _toggle(day),
            icon: Icon(
              day.status == 'open'
                  ? Icons.lock_outline_rounded
                  : Icons.lock_open_rounded,
            ),
          ),
      ],
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null || day == null
              ? ModuleMessage(
                  text: errorText(_error ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: AppColors.error,
                  onRetry: () {
                    setState(() => _loading = true);
                    _load();
                  },
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    ModuleCard(
                      child: Column(
                        children: [
                          InfoRow(
                              label: tr('الكورس'), value: day.courseName ?? ''),
                          InfoRow(
                            label: tr('الحالة'),
                            value:
                                day.status == 'open' ? tr('مفتوح') : tr('مغلق'),
                          ),
                          InfoRow(label: tr('ملاحظات'), value: day.notes ?? ''),
                        ],
                      ),
                    ),
                    if (day.groups.isEmpty)
                      ModuleMessage(text: tr('لا توجد حلقات في هذا اليوم'))
                    else
                      for (final group in day.groups)
                        _GroupDayCard(group: group),
                  ],
                ),
    );
  }
}

class _GroupDayCard extends StatelessWidget {
  final AttendanceGroupDay group;

  const _GroupDayCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.groupName,
            style: appTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          if (group.records.isEmpty)
            Text(tr('لا توجد سجلات'),
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)))
          else
            for (final record in group.records)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        record.studentName,
                        style: appTextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    StatusPill(
                      label: record.statusName,
                      color: _statusColor(record.statusCode),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

Color _statusColor(String code) => switch (code) {
      'present' => AppColors.attPresent,
      'absent' => AppColors.attAbsent,
      'late' => AppColors.attLate,
      'excused' => AppColors.attExcused,
      _ => AppColors.textMuted,
    };
