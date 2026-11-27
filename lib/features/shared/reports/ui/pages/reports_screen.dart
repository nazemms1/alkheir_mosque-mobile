import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/reports/ui/providers/reports_actions_controller.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// التقارير: نظرة عامة بفلاتر (السنة، الحلقة، الفترة) وملخص المعلمين اليومي.
class ReportsScreen extends StatefulWidget {
  final AuthToken token;

  const ReportsScreen({super.key, required this.token});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canViewReports(widget.token)) {
      return ModuleScaffold(
        title: L10nGateway.current.reports,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.reports,
      bottom: TabBar(
        controller: _tabs,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        tabs: [
          Tab(text: context.l10n.overview),
          Tab(text: context.l10n.teachersSummary),
        ],
      ),
      body: TabBarView(
        controller: _tabs,
        children: const [_OverviewReport(), _TeacherDailyReport()],
      ),
    );
  }
}

class _OverviewReport extends ConsumerStatefulWidget {
  const _OverviewReport();

  @override
  ConsumerState<_OverviewReport> createState() => _OverviewReportState();
}

class _OverviewReportState extends ConsumerState<_OverviewReport> {
  final _from = TextEditingController();
  final _to = TextEditingController();
  PickerItem? _group;
  late final _loadProvider = screenDataProvider(() async {
    final data = await ref
        .read(reportsActionsControllerProvider.notifier)
        .query((r) => r.fetchOverview(
              groupId: _group?.id,
              dateFrom: nullIfBlank(_from.text),
              dateTo: nullIfBlank(_to.text),
            ));
    return data;
  });
  Map<String, dynamic>? get _data => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;

  @override
  void dispose() {
    _from.dispose();
    _to.dispose();
    super.dispose();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  @override
  Widget build(BuildContext context) {
    final data = _data;
    final headline = jsonMap(data?['headline']) ?? const <String, dynamic>{};
    final attendance =
        jsonMap(data?['attendance']) ?? const <String, dynamic>{};
    final assessments =
        jsonMap(data?['assessments']) ?? const <String, dynamic>{};
    final finance = jsonMap(data?['finance']) ?? const <String, dynamic>{};
    final breakdown = attendance['breakdown'];
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        PickerField(
          label: context.l10n.group,
          value: _group?.label,
          onTap: () async {
            final picked = await showItemPicker(
              context,
              title: L10nGateway.current.chooseGroup,
              allowClear: true,
              load: (s) async {
                final page = await ref
                    .read(managementActionsControllerProvider.notifier)
                    .query((r) => r.groups());
                final needle = s.toLowerCase();
                return [
                  for (final g in page.items)
                    if (needle.isEmpty || g.name.toLowerCase().contains(needle))
                      PickerItem(
                          id: g.id, label: g.name, subtitle: g.courseName),
                ];
              },
            );
            if (picked == null) return;
            setState(() =>
                _group = picked.id == PickerItem.clear.id ? null : picked);
            _load();
          },
        ),
        Row(
          children: [
            Expanded(
              child: moduleDateField(
                context: context,
                controller: _from,
                label: context.l10n.fromDate,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: moduleDateField(
                context: context,
                controller: _to,
                label: context.l10n.toDate,
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton.icon(
            onPressed: _load,
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: Text(context.l10n.applyFilters, style: appTextStyle()),
          ),
        ),
        if (_loading)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (_error != null)
          ModuleMessage(
            text: errorText(_error!),
            icon: Icons.error_outline_rounded,
            color: context.appColors.error,
            onRetry: _load,
          )
        else ...[
          _MetricGrid(
            items: [
              (context.l10n.activeStudents, headline['students_in_scope']),
              (context.l10n.activeEnrollments, headline['active_enrollments']),
              (context.l10n.savedPages, headline['memorized_pages']),
              (context.l10n.totalPoints2, headline['net_points']),
              (context.l10n.cashCollected, headline['cash_collected']),
              (context.l10n.totalInvoices, headline['invoiced_amount']),
            ],
          ),
          _SectionTitle(text: context.l10n.attendance),
          ModuleCard(
            child: Column(
              children: [
                InfoRow(
                  label: context.l10n.daysRecorded,
                  value: '${jsonInt(attendance['days_recorded'])}',
                ),
                if (breakdown is List)
                  for (final row in breakdown)
                    if (row is Map)
                      InfoRow(
                        label: jsonString(row['name']),
                        value: '${jsonInt(row['count'])}',
                      ),
              ],
            ),
          ),
          _SectionTitle(text: context.l10n.assessments),
          ModuleCard(
            child: Column(
              children: [
                InfoRow(
                  label: context.l10n.recordedResults,
                  value: '${jsonInt(assessments['results_recorded'])}',
                ),
                InfoRow(
                    label: context.l10n.passed,
                    value: '${jsonInt(assessments['passed'])}'),
                InfoRow(
                    label: context.l10n.failed,
                    value: '${jsonInt(assessments['failed'])}'),
                InfoRow(
                  label: context.l10n.averageScore,
                  value: formatAmount(jsonDouble(assessments['average_score'])),
                ),
              ],
            ),
          ),
          _SectionTitle(text: context.l10n.finance),
          ModuleCard(
            child: Column(
              children: [
                InfoRow(
                    label: context.l10n.activitiesCollected,
                    value: formatAmount(
                        jsonDouble(finance['activity_collected']))),
                InfoRow(
                    label: context.l10n.activitiesExpenses,
                    value:
                        formatAmount(jsonDouble(finance['activity_expenses']))),
                InfoRow(
                    label: context.l10n.activitiesNet,
                    value: formatAmount(jsonDouble(finance['activity_net']))),
                InfoRow(
                    label: context.l10n.invoicesCollected,
                    value:
                        formatAmount(jsonDouble(finance['invoice_collected']))),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _TeacherDailyReport extends ConsumerStatefulWidget {
  const _TeacherDailyReport();

  @override
  ConsumerState<_TeacherDailyReport> createState() =>
      _TeacherDailyReportState();
}

class _TeacherDailyReportState extends ConsumerState<_TeacherDailyReport> {
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  late final _loadProvider = screenDataProvider(() async {
    final data = await ref
        .read(reportsActionsControllerProvider.notifier)
        .query((r) => r.fetchTeachersDailySummary(date: _date.text));
    return data;
  });
  Map<String, dynamic>? get _data => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;

  @override
  void dispose() {
    _date.dispose();
    super.dispose();
  }

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  @override
  Widget build(BuildContext context) {
    final data = _data;
    final totals = jsonMap(data?['totals']) ?? const <String, dynamic>{};
    final teachers = data?['teachers'];
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      children: [
        moduleDateField(
          context: context,
          controller: _date,
          label: context.l10n.date,
          required: true,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton.icon(
            onPressed: _load,
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: Text(context.l10n.view, style: appTextStyle()),
          ),
        ),
        if (_loading)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (_error != null)
          ModuleMessage(
            text: errorText(_error!),
            icon: Icons.error_outline_rounded,
            color: context.appColors.error,
            onRetry: _load,
          )
        else ...[
          _MetricGrid(
            items: [
              (context.l10n.teachersInScope, data?['teachers_in_scope']),
              (
                context.l10n.memorizationSessions,
                totals['memorization_sessions_count']
              ),
              (context.l10n.savedPages, totals['memorized_pages']),
              (context.l10n.absences, totals['absences_count']),
              (
                context.l10n.failedPartialTests,
                totals['failed_partial_attempts_count']
              ),
              (
                context.l10n.failedFinalTests,
                totals['failed_final_attempts_count']
              ),
            ],
          ),
          _SectionTitle(text: context.l10n.teacherBreakdown),
          if (teachers is! List || teachers.isEmpty)
            ModuleMessage(text: context.l10n.noActivityOnThisDay)
          else
            for (final row in teachers)
              if (row is Map)
                ModuleCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jsonString(jsonMap(row['teacher'])?['name']),
                        style: appTextStyle(
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 6),
                      InfoRow(
                          label: context.l10n.memorizationSessions,
                          value:
                              '${jsonInt(row['memorization_sessions_count'])}'),
                      InfoRow(
                          label: context.l10n.savedPages,
                          value: '${jsonInt(row['memorized_pages'])}'),
                      InfoRow(
                          label: context.l10n.absences,
                          value: '${jsonInt(row['absences_count'])}'),
                    ],
                  ),
                ),
        ],
      ],
    );
  }
}

class _MetricGrid extends StatelessWidget {
  final List<(String, Object?)> items;

  const _MetricGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.sizeOf(context).width - 42) / 2;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final (label, value) in items)
          Container(
            width: width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value is num
                      ? formatAmount(value.toDouble())
                      : '${value ?? 0}',
                  style: appTextStyle(
                    fontSize: FontSize.title,
                    fontWeight: FontWeight.w800,
                    color: context.appColors.primaryLight,
                  ),
                ),
                Text(label,
                    style: appTextStyle(
                        fontSize: FontSize.caption,
                        color: moduleMuted(context))),
              ],
            ),
          ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
      child: Text(
        text,
        style: appTextStyle(
          fontSize: FontSize.body,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
