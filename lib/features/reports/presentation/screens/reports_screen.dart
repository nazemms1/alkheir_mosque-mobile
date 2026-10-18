import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';

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
        title: tr('التقارير'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('التقارير'),
      bottom: TabBar(
        controller: _tabs,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        tabs: [
          Tab(text: tr('نظرة عامة')),
          Tab(text: tr('ملخص المعلمين')),
        ],
      ),
      body: TabBarView(
        controller: _tabs,
        children: const [_OverviewReport(), _TeacherDailyReport()],
      ),
    );
  }
}

class _OverviewReport extends StatefulWidget {
  const _OverviewReport();

  @override
  State<_OverviewReport> createState() => _OverviewReportState();
}

class _OverviewReportState extends State<_OverviewReport> {
  final _service = ReportsRepositoryImpl();
  final _from = TextEditingController();
  final _to = TextEditingController();
  PickerItem? _group;
  Map<String, dynamic>? _data;
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _from.dispose();
    _to.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await _service.fetchOverview(
        groupId: _group?.id,
        dateFrom: nullIfBlank(_from.text),
        dateTo: nullIfBlank(_to.text),
      );
      if (!mounted) return;
      setState(() {
        _data = data;
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

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
          label: tr('الحلقة'),
          value: _group?.label,
          onTap: () async {
            final picked = await showItemPicker(
              context,
              title: tr('اختر الحلقة'),
              allowClear: true,
              load: (s) async {
                final page = await ManagementRepositoryImpl().groups();
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
                label: tr('من تاريخ'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: moduleDateField(
                context: context,
                controller: _to,
                label: tr('إلى تاريخ'),
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton.icon(
            onPressed: _load,
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: Text(tr('تطبيق الفلاتر'), style: appTextStyle()),
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
            color: AppColors.error,
            onRetry: _load,
          )
        else ...[
          _MetricGrid(
            items: [
              (tr('الطلاب النشطون'), headline['students_in_scope']),
              (tr('التسجيلات النشطة'), headline['active_enrollments']),
              (tr('الصفحات المحفوظة'), headline['memorized_pages']),
              (tr('مجموع النقاط'), headline['net_points']),
              (tr('المحصّل نقداً'), headline['cash_collected']),
              (tr('إجمالي الفواتير'), headline['invoiced_amount']),
            ],
          ),
          _SectionTitle(text: tr('الحضور')),
          ModuleCard(
            child: Column(
              children: [
                InfoRow(
                  label: tr('أيام مسجّلة'),
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
          _SectionTitle(text: tr('التقييمات')),
          ModuleCard(
            child: Column(
              children: [
                InfoRow(
                  label: tr('النتائج المسجّلة'),
                  value: '${jsonInt(assessments['results_recorded'])}',
                ),
                InfoRow(
                    label: tr('ناجح'),
                    value: '${jsonInt(assessments['passed'])}'),
                InfoRow(
                    label: tr('راسب'),
                    value: '${jsonInt(assessments['failed'])}'),
                InfoRow(
                  label: tr('متوسط الدرجات'),
                  value: formatAmount(jsonDouble(assessments['average_score'])),
                ),
              ],
            ),
          ),
          _SectionTitle(text: tr('المالية')),
          ModuleCard(
            child: Column(
              children: [
                InfoRow(
                    label: tr('محصّل الأنشطة'),
                    value: formatAmount(
                        jsonDouble(finance['activity_collected']))),
                InfoRow(
                    label: tr('مصروفات الأنشطة'),
                    value:
                        formatAmount(jsonDouble(finance['activity_expenses']))),
                InfoRow(
                    label: tr('صافي الأنشطة'),
                    value: formatAmount(jsonDouble(finance['activity_net']))),
                InfoRow(
                    label: tr('محصّل الفواتير'),
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

class _TeacherDailyReport extends StatefulWidget {
  const _TeacherDailyReport();

  @override
  State<_TeacherDailyReport> createState() => _TeacherDailyReportState();
}

class _TeacherDailyReportState extends State<_TeacherDailyReport> {
  final _service = ReportsRepositoryImpl();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  Map<String, dynamic>? _data;
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _date.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await _service.fetchTeachersDailySummary(date: _date.text);
      if (!mounted) return;
      setState(() {
        _data = data;
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

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
          label: tr('التاريخ'),
          required: true,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton.icon(
            onPressed: _load,
            icon: const Icon(Icons.refresh_rounded, size: 18),
            label: Text(tr('عرض'), style: appTextStyle()),
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
            color: AppColors.error,
            onRetry: _load,
          )
        else ...[
          _MetricGrid(
            items: [
              (tr('المعلمون المشمولون'), data?['teachers_in_scope']),
              (tr('جلسات الحفظ'), totals['memorization_sessions_count']),
              (tr('الصفحات المحفوظة'), totals['memorized_pages']),
              (tr('الغياب'), totals['absences_count']),
              (
                tr('اختبارات جزئية راسبة'),
                totals['failed_partial_attempts_count']
              ),
              (
                tr('اختبارات نهائية راسبة'),
                totals['failed_final_attempts_count']
              ),
            ],
          ),
          _SectionTitle(text: tr('تفصيل المعلمين')),
          if (teachers is! List || teachers.isEmpty)
            ModuleMessage(text: tr('لا يوجد نشاط لهذا اليوم'))
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
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 6),
                      InfoRow(
                          label: tr('جلسات الحفظ'),
                          value:
                              '${jsonInt(row['memorization_sessions_count'])}'),
                      InfoRow(
                          label: tr('الصفحات المحفوظة'),
                          value: '${jsonInt(row['memorized_pages'])}'),
                      InfoRow(
                          label: tr('الغياب'),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryLight,
                  ),
                ),
                Text(label,
                    style: appTextStyle(
                        fontSize: 11, color: moduleMuted(context))),
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
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
