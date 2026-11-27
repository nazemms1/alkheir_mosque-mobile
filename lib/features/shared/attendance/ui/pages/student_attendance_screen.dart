import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
// import 'take_attendance_screen.dart';

/// قائمة أيام حضور الطلاب مع تصفية بالحالة، والوصول لتفاصيل اليوم أو أخذ الحضور.
class StudentAttendanceScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const StudentAttendanceScreen({super.key, required this.token});

  @override
  ConsumerState<StudentAttendanceScreen> createState() =>
      _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState
    extends ConsumerState<StudentAttendanceScreen> {
  String? _status;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  // Future<void> _takeAttendance() async {
  //   final saved = await Navigator.of(context).push<bool>(
  //     MaterialPageRoute(
  //       builder: (_) => TakeAttendanceScreen(token: widget.token),
  //     ),
  //   );
  //   if (saved == true) _refresh();
  // }

  Future<void> _openDay(AttendanceDaySummary day) async {
    await context.push<void>(AppRoutes.attendanceDayRoute,
        extra: (token: widget.token, dayId: day.id));
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewStudentAttendance(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.studentAttendance,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.studentAttendance,
      // floatingActionButton: ModuleAccess.canTakeStudentAttendance(t)
      //     ? FloatingActionButton.extended(
      //         onPressed: _takeAttendance,
      //         icon: const Icon(Icons.how_to_reg_rounded),
      //         label: Text(context.l10n.takeAttendance, style: appTextStyle()),
      //       )
      //     : null,
      body: PagedList<AttendanceDaySummary>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noAttendanceDaysRecorded,
        header: _DayStatusFilter(
          selected: _status,
          onSelected: (value) => setState(() {
            _status = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.studentAttendanceDays(page: page, status: _status)),
        itemBuilder: (context, day, _) => ModuleCard(
          accent: day.status == 'open'
              ? context.appColors.success
              : context.appColors.textMuted,
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
                        fontSize: FontSize.bodyLarge,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  StatusPill(
                    label: day.status == 'open'
                        ? L10nGateway.current.open
                        : L10nGateway.current.closed,
                    color: day.status == 'open'
                        ? context.appColors.success
                        : context.appColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${day.courseName ?? ''}  ·  ${L10nGateway.current.groups3(day.groupsCount)}  ·  ${L10nGateway.current.records(day.recordsCount)}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
              if (day.courseFinished)
                Text(
                  L10nGateway.current.courseFinishedReadOnlyRecord,
                  style: appTextStyle(
                      fontSize: FontSize.caption,
                      color: context.appColors.warningText),
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
      null: L10nGateway.current.all,
      'open': L10nGateway.current.open,
      'closed': L10nGateway.current.closed,
    };
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: ChoiceChip(
                label: Text(entry.value,
                    style: appTextStyle(fontSize: FontSize.caption)),
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
class AttendanceDayScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int dayId;

  const AttendanceDayScreen({
    super.key,
    required this.token,
    required this.dayId,
  });

  @override
  ConsumerState<AttendanceDayScreen> createState() =>
      _AttendanceDayScreenState();
}

class _AttendanceDayScreenState extends ConsumerState<AttendanceDayScreen> {
  late final _loadProvider = screenDataProvider(() async {
    final day = await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.studentAttendanceDay(widget.dayId));
    return day;
  });
  AttendanceDayDetail? get _day => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;
  bool _busy = false;

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  Future<void> _toggle(AttendanceDayDetail day) async {
    final next = day.status == 'open' ? 'closed' : 'open';
    final ok = await confirmAction(
      context,
      title: next == 'closed'
          ? L10nGateway.current.closeDay
          : L10nGateway.current.openDay,
      message: next == 'closed'
          ? L10nGateway.current.afterClosingThisDayS
          : L10nGateway.current.attendanceForThisDayCan,
      confirmLabel: next == 'closed'
          ? L10nGateway.current.close
          : L10nGateway.current.open2,
    );
    if (!ok || !mounted) return;
    setState(() => _busy = true);
    try {
      await ref
          .read(operationsActionsControllerProvider.notifier)
          .query((r) => r.setStudentAttendanceDayStatus(day.id, next));
      if (!mounted) return;
      setState(() => _busy = false);
      _load();
      showModuleSnack(context, L10nGateway.current.dayStatusUpdated);
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
      title: day?.attendanceDate ?? context.l10n.attendanceDay,
      actions: [
        if (day != null && canToggle)
          IconButton(
            tooltip: day.status == 'open'
                ? context.l10n.closeDay
                : context.l10n.openDay,
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
                  color: context.appColors.error,
                  onRetry: () {
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
                              label: context.l10n.course,
                              value: day.courseName ?? ''),
                          InfoRow(
                            label: context.l10n.status,
                            value: day.status == 'open'
                                ? context.l10n.open
                                : context.l10n.closed,
                          ),
                          InfoRow(
                              label: context.l10n.notes,
                              value: day.notes ?? ''),
                        ],
                      ),
                    ),
                    if (day.groups.isEmpty)
                      ModuleMessage(text: context.l10n.noGroupsOnThisDay)
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
              fontSize: FontSize.body,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          if (group.records.isEmpty)
            Text(context.l10n.noRecords,
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)))
          else
            for (final record in group.records)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        record.studentName,
                        style: appTextStyle(fontSize: FontSize.label),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    StatusPill(
                      label: record.statusName,
                      color: _statusColor(context, record.statusCode),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

Color _statusColor(BuildContext context, String code) => switch (code) {
      'present' => context.appColors.attPresent,
      'absent' => context.appColors.attAbsent,
      'late' => context.appColors.attLate,
      'excused' => context.appColors.attExcused,
      _ => context.appColors.textMuted,
    };
