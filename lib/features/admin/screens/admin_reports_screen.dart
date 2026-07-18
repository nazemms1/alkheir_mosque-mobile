import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/session/service_providers.dart';
import '../../../core/theme/app_theme.dart';

/// شاشة تقارير الإدارة — تعتمد endpoints بصلاحية `reports.view`:
///   - نظرة عامة (reports/overview) مع فلترة بالفترة الزمنية.
///   - ملخص المعلمين اليومي (reports/teachers/daily-summary) مع اختيار اليوم.
///
/// شكل استجابة الـ API غير موثّق في المواصفة، لذلك تُعرض البيانات عبر
/// عارض مرن (_ReportDataView) يتكيّف مع الحقول كما تصل من الخادم:
/// الأرقام تظهر كبطاقات إحصائية، والكائنات كأقسام، والقوائم كبطاقات عناصر.
class AdminReportsScreen extends ConsumerStatefulWidget {
  const AdminReportsScreen({super.key});

  @override
  ConsumerState<AdminReportsScreen> createState() => _AdminReportsScreenState();
}

class _AdminReportsScreenState extends ConsumerState<AdminReportsScreen> {
  static final _apiDate = DateFormat('yyyy-MM-dd');
  static final _displayDate = DateFormat('d MMM yyyy', 'ar');

  int _view = 0; // 0 = نظرة عامة، 1 = ملخص المعلمين

  // فلاتر النظرة العامة
  DateTime? _dateFrom;
  DateTime? _dateTo;

  // فلاتر ملخص المعلمين
  DateTime _teachersDate = DateTime.now();
  bool _includeEmpty = false;

  Map<String, dynamic>? _data;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final service = ref.read(reportsServiceProvider);
      final data = _view == 0
          ? await service.fetchOverview(
              dateFrom: _dateFrom == null ? null : _apiDate.format(_dateFrom!),
              dateTo: _dateTo == null ? null : _apiDate.format(_dateTo!),
            )
          : await service.fetchTeachersDailySummary(
              date: _apiDate.format(_teachersDate),
              includeEmpty: _includeEmpty,
            );
      if (!mounted) return;
      setState(() {
        _data = data;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  void _switchView(int view) {
    if (_view == view) return;
    setState(() {
      _view = view;
      _data = null;
    });
    _load();
  }

  Future<void> _pickDate({
    required DateTime? initial,
    required ValueChanged<DateTime> onPicked,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
      locale: const Locale('ar'),
    );
    if (picked != null) onPicked(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        _ViewSwitcher(current: _view, onChanged: _switchView),
        const SizedBox(height: 10),
        _view == 0 ? _overviewFilters() : _teachersFilters(),
        const SizedBox(height: 4),
        Expanded(child: _body()),
      ],
    );
  }

  // ─── شريط فلاتر النظرة العامة (من / إلى) ────────────────────────────────────
  Widget _overviewFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _FilterChipButton(
              icon: Icons.calendar_today_rounded,
              label: _dateFrom == null
                  ? 'من تاريخ'
                  : _displayDate.format(_dateFrom!),
              active: _dateFrom != null,
              onTap: () => _pickDate(
                initial: _dateFrom,
                onPicked: (d) {
                  setState(() => _dateFrom = d);
                  _load();
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _FilterChipButton(
              icon: Icons.event_rounded,
              label: _dateTo == null ? 'إلى تاريخ' : _displayDate.format(_dateTo!),
              active: _dateTo != null,
              onTap: () => _pickDate(
                initial: _dateTo,
                onPicked: (d) {
                  setState(() => _dateTo = d);
                  _load();
                },
              ),
            ),
          ),
          if (_dateFrom != null || _dateTo != null) ...[
            const SizedBox(width: 8),
            _FilterChipButton(
              icon: Icons.filter_alt_off_rounded,
              label: 'مسح',
              active: false,
              onTap: () {
                setState(() {
                  _dateFrom = null;
                  _dateTo = null;
                });
                _load();
              },
            ),
          ],
        ],
      ),
    );
  }

  // ─── شريط فلاتر ملخص المعلمين (اليوم + شمول غير النشطين) ───────────────────
  Widget _teachersFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _FilterChipButton(
              icon: Icons.calendar_today_rounded,
              label: _displayDate.format(_teachersDate),
              active: true,
              onTap: () => _pickDate(
                initial: _teachersDate,
                onPicked: (d) {
                  setState(() => _teachersDate = d);
                  _load();
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          _FilterChipButton(
            icon: _includeEmpty
                ? Icons.visibility_rounded
                : Icons.visibility_off_rounded,
            label: 'بدون نشاط',
            active: _includeEmpty,
            onTap: () {
              setState(() => _includeEmpty = !_includeEmpty);
              _load();
            },
          ),
        ],
      ),
    );
  }

  Widget _body() {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded,
                size: 48, color: AppColors.error),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(_error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'Cairo')),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _load,
              child: const Text('إعادة المحاولة',
                  style: TextStyle(fontFamily: 'Cairo')),
            ),
          ],
        ),
      );
    }
    final data = _data ?? const {};
    if (data.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.bar_chart_rounded, size: 56, color: AppColors.textMuted),
            SizedBox(height: 12),
            Text('لا توجد بيانات لهذه الفترة',
                style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
      child: _ReportDataView(data: data),
    );
  }
}

// ─── مبدّل العرض (نظرة عامة / ملخص المعلمين) ─────────────────────────────────
class _ViewSwitcher extends StatelessWidget {
  final int current;
  final ValueChanged<int> onChanged;
  const _ViewSwitcher({required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          _segment(context, 0, Icons.dashboard_customize_rounded, 'نظرة عامة'),
          _segment(context, 1, Icons.co_present_rounded, 'ملخص المعلمين'),
        ],
      ),
    );
  }

  Widget _segment(BuildContext context, int index, IconData icon, String label) {
    final selected = current == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient: selected
                ? const LinearGradient(
                    colors: [Color(0xFF0D5016), Color(0xFF2EA043)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 17,
                  color: selected ? Colors.white : AppColors.textMuted),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected ? Colors.white : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── زر فلتر صغير ─────────────────────────────────────────────────────────────
class _FilterChipButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _FilterChipButton({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.primaryLight : AppColors.textMuted;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: active
              ? AppColors.primaryLight.withOpacity(0.08)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: active
                ? AppColors.primaryLight.withOpacity(0.45)
                : Theme.of(context).dividerColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: color),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── العارض المرن لبيانات التقرير ─────────────────────────────────────────────
// يعرض أي JSON يصل من الخادم: القيم الرقمية/النصية في الجذر تظهر كشبكة
// بطاقات إحصائية، الكائنات المتداخلة كأقسام صفوف، والقوائم كبطاقات عناصر.
class _ReportDataView extends StatelessWidget {
  final Map<String, dynamic> data;
  const _ReportDataView({required this.data});

  @override
  Widget build(BuildContext context) {
    final scalars = <String, Object>{};
    final maps = <String, Map<String, dynamic>>{};
    final lists = <String, List<dynamic>>{};

    data.forEach((key, value) {
      if (value == null) return;
      if (value is Map<String, dynamic>) {
        maps[key] = value;
      } else if (value is List) {
        lists[key] = value;
      } else {
        scalars[key] = value;
      }
    });

    int order = 0;
    final children = <Widget>[
      if (scalars.isNotEmpty)
        _StatTilesGrid(entries: scalars)
            .animate()
            .fadeIn(duration: 400.ms)
            .slideY(begin: 0.04, end: 0),
      for (final e in maps.entries)
        _SectionCard(title: _label(e.key), entries: e.value)
            .animate()
            .fadeIn(delay: (100 + 60 * order++).ms, duration: 380.ms)
            .slideY(begin: 0.04, end: 0, delay: (100 + 60 * order).ms),
      for (final e in lists.entries) ...[
        _ListHeader(title: _label(e.key), count: e.value.length)
            .animate()
            .fadeIn(delay: (100 + 60 * order++).ms, duration: 380.ms),
        for (final item in e.value)
          if (item is Map<String, dynamic>)
            _ItemCard(item: item)
                .animate()
                .fadeIn(delay: (120 + 60 * order).ms, duration: 360.ms)
                .slideX(begin: 0.04, end: 0, delay: (120 + 60 * order).ms),
      ],
    ];

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
      children: children,
    );
  }
}

/// ترجمة أسماء الحقول الشائعة القادمة من الـ API إلى تسميات عربية.
String _label(String key) {
  const labels = <String, String>{
    'students': 'الطلاب',
    'students_count': 'عدد الطلاب',
    'total_students': 'إجمالي الطلاب',
    'active_students': 'الطلاب النشطون',
    'teachers': 'المعلمون',
    'teachers_count': 'عدد المعلمين',
    'groups': 'الحلقات',
    'groups_count': 'عدد الحلقات',
    'active_groups': 'الحلقات النشطة',
    'attendance': 'الحضور',
    'attendance_rate': 'نسبة الحضور',
    'present': 'حاضر',
    'absent': 'غائب',
    'late': 'متأخر',
    'excused': 'بعذر',
    'memorization': 'الحفظ',
    'memorized_pages': 'الصفحات المحفوظة',
    'pages': 'الصفحات',
    'points': 'النقاط',
    'total_points': 'إجمالي النقاط',
    'enrollments': 'التسجيلات',
    'invoices': 'الفواتير',
    'payments': 'الدفعات',
    'paid': 'مدفوع',
    'unpaid': 'غير مدفوع',
    'amount': 'المبلغ',
    'total': 'الإجمالي',
    'count': 'العدد',
    'rate': 'النسبة',
    'date': 'التاريخ',
    'name': 'الاسم',
    'teacher': 'المعلم',
    'teacher_name': 'اسم المعلم',
    'group': 'الحلقة',
    'group_name': 'اسم الحلقة',
    'sessions': 'الجلسات',
    'recitations': 'التسميع',
    'tests': 'الاختبارات',
    'quran_tests': 'اختبارات القرآن',
    'notes': 'الملاحظات',
    'activities': 'الأنشطة',
    'items': 'العناصر',
    'summary': 'الملخص',
    'overview': 'نظرة عامة',
    'assessments': 'التقييمات',
    'average': 'المتوسط',
    'status': 'الحالة',
  };
  return labels[key] ?? key.replaceAll('_', ' ');
}

String _formatValue(Object value) {
  if (value is bool) return value ? 'نعم' : 'لا';
  if (value is num) {
    if (value is double && value != value.roundToDouble()) {
      return value.toStringAsFixed(1);
    }
    return NumberFormat.decimalPattern('ar').format(value);
  }
  return value.toString();
}

// ─── شبكة البطاقات الإحصائية ──────────────────────────────────────────────────
class _StatTilesGrid extends StatelessWidget {
  final Map<String, Object> entries;
  const _StatTilesGrid({required this.entries});

  static const _palette = [
    AppColors.primaryLight,
    AppColors.gold,
    AppColors.info,
    AppColors.success,
    AppColors.warning,
  ];

  @override
  Widget build(BuildContext context) {
    final items = entries.entries.toList();
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (var i = 0; i < items.length; i++)
          _StatTile(
            label: _label(items[i].key),
            value: _formatValue(items[i].value),
            color: _palette[i % _palette.length],
          ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatTile(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 42) / 2;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: color)),
          const SizedBox(height: 2),
          Text(label,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 11,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.55))),
        ],
      ),
    );
  }
}

// ─── قسم (كائن متداخل) ────────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final String title;
  final Map<String, dynamic> entries;
  const _SectionCard({required this.title, required this.entries});

  @override
  Widget build(BuildContext context) {
    final rows = <MapEntry<String, Object>>[];
    entries.forEach((key, value) {
      if (value == null || value is List) return;
      if (value is Map<String, dynamic>) {
        value.forEach((subKey, subValue) {
          if (subValue is num || subValue is String || subValue is bool) {
            rows.add(MapEntry('${_label(key)} — ${_label(subKey)}', subValue));
          }
        });
      } else {
        rows.add(MapEntry(_label(key), value));
      }
    });
    if (rows.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.insights_rounded,
                    size: 18, color: AppColors.primaryLight),
              ),
              const SizedBox(width: 10),
              Text(title,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
          const SizedBox(height: 10),
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(row.key,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6))),
                  ),
                  Text(_formatValue(row.value),
                      style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryLight)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ─── عنوان قائمة ──────────────────────────────────────────────────────────────
class _ListHeader extends StatelessWidget {
  final String title;
  final int count;
  const _ListHeader({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.list_alt_rounded,
              size: 18, color: AppColors.gold),
          const SizedBox(width: 8),
          Text(title,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('$count',
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gold)),
          ),
        ],
      ),
    );
  }
}

// ─── بطاقة عنصر قائمة (معلم/حلقة...) ─────────────────────────────────────────
class _ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    // أول قيمة نصية تُعتبر عنواناً للبطاقة (عادة الاسم)
    String? title;
    final rows = <MapEntry<String, Object>>[];
    item.forEach((key, value) {
      if (value == null || key == 'id') return;
      if (value is String && title == null && value.trim().isNotEmpty) {
        title = value;
        return;
      }
      if (value is Map<String, dynamic>) {
        value.forEach((subKey, subValue) {
          if (subValue is num || subValue is String || subValue is bool) {
            rows.add(MapEntry(_label(subKey), subValue));
          }
        });
      } else if (value is num || value is String || value is bool) {
        rows.add(MapEntry(_label(key), value));
      }
    });

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF0D5016), Color(0xFF2EA043)]),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Icon(Icons.person_rounded,
                        size: 19, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(title!,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface)),
                  ),
                ],
              ),
            ),
          Wrap(
            spacing: 14,
            runSpacing: 6,
            children: [
              for (final row in rows)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${row.key}: ',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 11,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.55))),
                    Text(_formatValue(row.value),
                        style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryLight)),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
