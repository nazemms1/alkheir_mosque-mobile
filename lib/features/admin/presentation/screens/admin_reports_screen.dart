import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:alkheir_mosque/app/core/session/service_providers.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';

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
  // getter: التنسيق يتبع اللغة الحالية عند كل بناء
  static DateFormat get _displayDate =>
      DateFormat('d MMM yyyy', AppLanguage.intlCode);

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
      locale: AppLanguage.current,
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
                  ? tr('من تاريخ')
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
              label: _dateTo == null
                  ? tr('إلى تاريخ')
                  : _displayDate.format(_dateTo!),
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
              label: tr('مسح'),
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
            label: tr('بدون نشاط'),
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
      return AdminErrorState(
        message: _error!,
        onRetry: _load,
        retryLabel: tr('إعادة المحاولة'),
      );
    }
    final data = _data ?? const {};
    if (data.isEmpty) {
      return AdminEmptyState(
        icon: Icons.bar_chart_rounded,
        title: tr('لا توجد بيانات لهذه الفترة'),
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
          _segment(
              context, 0, Icons.dashboard_customize_rounded, tr('نظرة عامة')),
          _segment(context, 1, Icons.co_present_rounded, tr('ملخص المعلمين')),
        ],
      ),
    );
  }

  Widget _segment(
      BuildContext context, int index, IconData icon, String label) {
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
                  color: selected ? Colors.white : AdminTheme.muted(context)),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  color: selected ? Colors.white : AdminTheme.muted(context),
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
    final color = active ? AppColors.primaryLight : AdminTheme.muted(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: active
              ? AppColors.primaryLight.withValues(alpha: 0.08)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: active
                ? AppColors.primaryLight.withValues(alpha: 0.45)
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
                  fontFamily: 'Dubai',
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
        _SectionCard(
          sectionKey: e.key,
          title: _label(e.key),
          entries: e.value,
        )
            .animate()
            .fadeIn(delay: (100 + 60 * order++).ms, duration: 380.ms)
            .slideY(begin: 0.04, end: 0, delay: (100 + 60 * order).ms),
      for (final e in lists.entries) ...[
        _ListHeader(
          listKey: e.key,
          title: _label(e.key),
          count: e.value.length,
        ).animate().fadeIn(delay: (100 + 60 * order++).ms, duration: 380.ms),
        for (final item in e.value)
          if (item is Map<String, dynamic>)
            _ItemCard(
              listKey: e.key,
              item: item,
            )
                .animate()
                .fadeIn(delay: (120 + 60 * order).ms, duration: 360.ms)
                .slideX(begin: 0.04, end: 0, delay: (120 + 60 * order).ms),
      ],
    ];

    return ListView(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
      children: children,
    );
  }
}

/// ترجمة أسماء الحقول الشائعة القادمة من الـ API إلى تسميات عربية.
String _label(String key) {
  final labels = <String, String>{
    'students': tr('الطلاب'),
    'students_count': tr('عدد الطلاب'),
    'total_students': tr('إجمالي الطلاب'),
    'active_students': tr('الطلاب النشطون'),
    'teachers': tr('المعلمون'),
    'teachers_count': tr('عدد المعلمين'),
    'groups': tr('الحلقات'),
    'groups_count': tr('عدد الحلقات'),
    'active_groups': tr('الحلقات النشطة'),
    'attendance': tr('الحضور'),
    'attendance_rate': tr('نسبة الحضور'),
    'present': tr('حاضر'),
    'absent': tr('غائب'),
    'late': tr('متأخر'),
    'excused': tr('بعذر'),
    'memorization': tr('الحفظ'),
    'memorized_pages': tr('الصفحات المحفوظة'),
    'pages': tr('الصفحات'),
    'points': tr('النقاط'),
    'total_points': tr('إجمالي النقاط'),
    'enrollments': tr('التسجيلات'),
    'invoices': tr('الفواتير'),
    'payments': tr('الدفعات'),
    'paid': tr('مدفوع'),
    'unpaid': tr('غير مدفوع'),
    'amount': tr('المبلغ'),
    'total': tr('الإجمالي'),
    'count': tr('العدد'),
    'rate': tr('النسبة'),
    'date': tr('التاريخ'),
    'name': tr('الاسم'),
    'teacher': tr('المعلم'),
    'teacher_name': tr('اسم المعلم'),
    'group': tr('الحلقة'),
    'group_name': tr('اسم الحلقة'),
    'sessions': tr('الجلسات'),
    'recitations': tr('التسميع'),
    'tests': tr('الاختبارات'),
    'quran_tests': tr('اختبارات القرآن'),
    'notes': tr('الملاحظات'),
    'activities': tr('الأنشطة'),
    'items': tr('العناصر'),
    'summary': tr('الملخص'),
    'overview': tr('نظرة عامة'),
    'assessments': tr('التقييمات'),
    'average': tr('المتوسط'),
    'status': tr('الحالة'),
  };
  return labels[key] ?? key.replaceAll('_', ' ');
}

String _formatValue(Object value) {
  if (value is bool) return value ? tr('نعم') : tr('لا');
  if (value is num) {
    if (value is double && value != value.roundToDouble()) {
      return value.toStringAsFixed(1);
    }
    return NumberFormat.decimalPattern(AppLanguage.isArabic ? 'ar' : 'en')
        .format(value);
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
    Color(0xFF0D9488),
    Color(0xFF8B5CF6),
    AppColors.warning,
  ];

  @override
  Widget build(BuildContext context) {
    final items = entries.entries.toList();
    if (items.isEmpty) return const SizedBox.shrink();

    // إذا كان العدد فردياً، البطاقة الأولى تتصدر كبطاقة رئيسية مميزة (Hero)
    final hasFeatured = items.length.isOdd;
    final featuredItem = hasFeatured ? items.first : null;
    final gridItems = hasFeatured ? items.sublist(1) : items;

    final pairs = <List<MapEntry<String, Object>>>[];
    for (var i = 0; i < gridItems.length; i += 2) {
      pairs.add([
        gridItems[i],
        if (i + 1 < gridItems.length) gridItems[i + 1],
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (featuredItem != null) ...[
          _FeaturedStatTile(
            label: _label(featuredItem.key),
            value: _formatValue(featuredItem.value),
            icon: _sectionIcon(featuredItem.key),
            color: _metricColor(featuredItem.key, _palette[0]),
          ),
          if (gridItems.isNotEmpty) const SizedBox(height: 10),
        ],
        for (var pairIndex = 0; pairIndex < pairs.length; pairIndex++) ...[
          Row(
            children: [
              Expanded(
                child: _StatTile(
                  label: _label(pairs[pairIndex][0].key),
                  value: _formatValue(pairs[pairIndex][0].value),
                  icon: _sectionIcon(pairs[pairIndex][0].key),
                  color: _metricColor(
                    pairs[pairIndex][0].key,
                    _palette[((hasFeatured ? 1 : 0) + pairIndex * 2) %
                        _palette.length],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              if (pairs[pairIndex].length > 1)
                Expanded(
                  child: _StatTile(
                    label: _label(pairs[pairIndex][1].key),
                    value: _formatValue(pairs[pairIndex][1].value),
                    icon: _sectionIcon(pairs[pairIndex][1].key),
                    color: _metricColor(
                      pairs[pairIndex][1].key,
                      _palette[((hasFeatured ? 1 : 0) + pairIndex * 2 + 1) %
                          _palette.length],
                    ),
                  ),
                )
              else
                const Spacer(),
            ],
          ),
          if (pairIndex < pairs.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _FeaturedStatTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _FeaturedStatTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = Theme.of(context).colorScheme.surface;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: color.withValues(alpha: isDark ? 0.35 : 0.2),
          width: 1.2,
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            color.withValues(alpha: isDark ? 0.2 : 0.08),
            cardBg,
          ],
          stops: const [0.0, 0.65],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: isDark ? 0.12 : 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            left: -12,
            bottom: -18,
            child: Icon(
              icon,
              size: 96,
              color: color.withValues(alpha: isDark ? 0.07 : 0.04),
            ),
          ),
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: isDark ? 0.28 : 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: color.withValues(alpha: isDark ? 0.5 : 0.28),
                    width: 1.2,
                  ),
                ),
                child: Icon(icon, size: 26, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: isDark
                            ? AppColors.textOnDark
                            : AppColors.textPrimary,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textOnDarkSub
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: isDark ? 0.22 : 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: color.withValues(alpha: isDark ? 0.4 : 0.2),
                    width: 0.8,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.trending_up_rounded, size: 14, color: color),
                    const SizedBox(width: 4),
                    Text(
                      tr('مؤشر'),
                      style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = Theme.of(context).colorScheme.surface;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: isDark ? 0.35 : 0.18),
          width: 1.2,
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            color.withValues(alpha: isDark ? 0.16 : 0.07),
            cardBg,
          ],
          stops: const [0.0, 0.7],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: isDark ? 0.08 : 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned(
            left: -12,
            bottom: -14,
            child: Icon(
              icon,
              size: 64,
              color: color.withValues(alpha: isDark ? 0.06 : 0.04),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: isDark ? 0.25 : 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: color.withValues(alpha: isDark ? 0.45 : 0.22),
                        width: 1,
                      ),
                    ),
                    child: Icon(icon, size: 19, color: color),
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.textOnDarkSub
                      : AppColors.textSecondary,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── قسم (كائن متداخل) ────────────────────────────────────────────────────────
IconData _sectionIcon(String key) {
  final k = key.toLowerCase();
  if (k.contains('attend') || k.contains('present')) {
    return Icons.how_to_reg_rounded;
  }
  if (k.contains('memoriz') ||
      k.contains('page') ||
      k.contains('recit') ||
      k.contains('quran')) {
    return Icons.auto_stories_rounded;
  }
  if (k.contains('finance') ||
      k.contains('invoice') ||
      k.contains('payment') ||
      k.contains('amount') ||
      k.contains('fee')) {
    return Icons.account_balance_wallet_rounded;
  }
  if (k.contains('student')) return Icons.school_rounded;
  if (k.contains('teacher')) return Icons.person_pin_rounded;
  if (k.contains('group')) return Icons.groups_rounded;
  if (k.contains('test') || k.contains('exam') || k.contains('assess')) {
    return Icons.assignment_turned_in_rounded;
  }
  if (k.contains('point')) return Icons.stars_rounded;
  if (k.contains('activit')) return Icons.local_activity_rounded;
  if (k.contains('session')) return Icons.calendar_today_rounded;
  return Icons.insights_rounded;
}

Color _sectionColor(String key) {
  final k = key.toLowerCase();
  if (k.contains('attend') || k.contains('present')) {
    return const Color(0xFF0D9488); // Teal
  }
  if (k.contains('memoriz') || k.contains('quran') || k.contains('point')) {
    return AppColors.gold;
  }
  if (k.contains('finance') ||
      k.contains('invoice') ||
      k.contains('payment') ||
      k.contains('amount')) {
    return const Color(0xFF8B5CF6); // Violet
  }
  if (k.contains('student')) return AppColors.primaryLight;
  if (k.contains('teacher')) return AppColors.info;
  if (k.contains('test') || k.contains('exam')) {
    return const Color(0xFFF59E0B); // Amber
  }
  return AppColors.primaryLight;
}

Color _metricColor(String rawKey, Color fallback) {
  final k = rawKey.toLowerCase();
  if (k.contains('absent') ||
      k.contains('fail') ||
      k.contains('unpaid') ||
      k.contains('blocked')) {
    return AppColors.error;
  }
  if (k.contains('late') || k.contains('warning') || k.contains('pending')) {
    return AppColors.warning;
  }
  if (k.contains('present') ||
      k.contains('paid') ||
      k.contains('pass') ||
      k.contains('active') ||
      k.contains('success')) {
    return AppColors.success;
  }
  if (k.contains('excuse') || k.contains('info')) {
    return AppColors.info;
  }
  if (k.contains('memoriz') || k.contains('point') || k.contains('gold')) {
    return AppColors.gold;
  }
  return fallback;
}

double? _extractRate(String rawKey, String label, Object value) {
  if (value is! num) return null;
  final k = rawKey.toLowerCase();
  final l = label.toLowerCase();
  if (k.contains('rate') ||
      k.contains('percent') ||
      k.contains('ratio') ||
      l.contains('نسبة')) {
    final n = value.toDouble();
    if (n <= 1.0 && n > 0.0) return n;
    return (n / 100.0).clamp(0.0, 1.0);
  }
  return null;
}

class _SectionMetricItem {
  final String rawKey;
  final String label;
  final Object value;
  final double? rate;

  const _SectionMetricItem({
    required this.rawKey,
    required this.label,
    required this.value,
    this.rate,
  });
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String? sectionKey;
  final Map<String, dynamic> entries;

  const _SectionCard({
    required this.title,
    this.sectionKey,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    final items = <_SectionMetricItem>[];
    entries.forEach((key, value) {
      if (value == null || value is List) return;
      if (value is Map<String, dynamic>) {
        value.forEach((subKey, subValue) {
          if (subValue is num || subValue is String || subValue is bool) {
            final lbl = '${_label(key)} — ${_label(subKey)}';
            items.add(_SectionMetricItem(
              rawKey: '$key-$subKey',
              label: lbl,
              value: subValue,
              rate: _extractRate('$key-$subKey', lbl, subValue),
            ));
          }
        });
      } else {
        final lbl = _label(key);
        items.add(_SectionMetricItem(
          rawKey: key,
          label: lbl,
          value: value,
          rate: _extractRate(key, lbl, value),
        ));
      }
    });

    if (items.isEmpty) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = Theme.of(context).colorScheme.surface;
    final keyForStyle = sectionKey ?? title;
    final accentColor = _sectionColor(keyForStyle);
    final icon = _sectionIcon(keyForStyle);

    return Container(
      margin: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: accentColor.withValues(alpha: isDark ? 0.35 : 0.18),
          width: 1.2,
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            accentColor.withValues(alpha: isDark ? 0.14 : 0.05),
            cardBg,
          ],
          stops: const [0.0, 0.45],
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: isDark ? 0.08 : 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            Positioned(
              left: -14,
              top: -10,
              child: Icon(
                icon,
                size: 88,
                color: accentColor.withValues(alpha: isDark ? 0.06 : 0.035),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: accentColor.withValues(
                              alpha: isDark ? 0.28 : 0.12),
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: accentColor.withValues(
                                alpha: isDark ? 0.45 : 0.25),
                            width: 1,
                          ),
                        ),
                        child: Icon(icon, size: 20, color: accentColor),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Dubai',
                            fontSize: 15.5,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: accentColor.withValues(
                              alpha: isDark ? 0.22 : 0.09),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: accentColor.withValues(
                                alpha: isDark ? 0.35 : 0.18),
                            width: 0.8,
                          ),
                        ),
                        child: Text(
                          trf('{0} مؤشرات', [items.length]),
                          style: TextStyle(
                            fontFamily: 'Dubai',
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  for (final item in items) ...[
                    _buildMetricRow(context, item, accentColor, isDark),
                    const SizedBox(height: 8),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(
    BuildContext context,
    _SectionMetricItem item,
    Color accentColor,
    bool isDark,
  ) {
    final rowColor = _metricColor(item.rawKey, accentColor);
    final displayValue =
        item.rate != null && !item.value.toString().contains('%')
            ? '${_formatValue(item.value)}%'
            : _formatValue(item.value);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.035)
            : rowColor.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: rowColor.withValues(alpha: isDark ? 0.22 : 0.12),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: rowColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: rowColor.withValues(alpha: 0.4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.78),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: rowColor.withValues(alpha: isDark ? 0.22 : 0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: rowColor.withValues(alpha: isDark ? 0.4 : 0.2),
                    width: 0.8,
                  ),
                ),
                child: Text(
                  displayValue,
                  style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: rowColor,
                  ),
                ),
              ),
            ],
          ),
          if (item.rate != null) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: item.rate!,
                minHeight: 6,
                backgroundColor:
                    rowColor.withValues(alpha: isDark ? 0.15 : 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(rowColor),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── عنوان قائمة ──────────────────────────────────────────────────────────────
class _ListHeader extends StatelessWidget {
  final String title;
  final String? listKey;
  final int count;

  const _ListHeader({
    required this.title,
    this.listKey,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final key = listKey ?? title;
    final color = _sectionColor(key);
    final icon = _sectionIcon(key);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: isDark ? 0.25 : 0.12),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: color.withValues(alpha: isDark ? 0.45 : 0.22),
                width: 1,
              ),
            ),
            child: Icon(icon, size: 17, color: color),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Dubai',
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: color.withValues(alpha: isDark ? 0.22 : 0.09),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color.withValues(alpha: isDark ? 0.35 : 0.18),
                width: 0.8,
              ),
            ),
            child: Text(
              '$count ${tr('عنصر')}',
              style: TextStyle(
                fontFamily: 'Dubai',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 1.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── بطاقة عنصر قائمة (معلم/حلقة...) ─────────────────────────────────────────
class _ItemCard extends StatelessWidget {
  final String? listKey;
  final Map<String, dynamic> item;

  const _ItemCard({
    this.listKey,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    String? title;
    String? statusValue;
    final rows = <MapEntry<String, Object>>[];

    item.forEach((key, value) {
      if (value == null || key == 'id') return;

      final k = key.toLowerCase();
      if ((k == 'status' || k == 'state' || k == 'is_active') &&
          statusValue == null) {
        statusValue = value is bool
            ? (value ? tr('نشط') : tr('غير نشط'))
            : value.toString();
        return;
      }

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

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = Theme.of(context).colorScheme.surface;
    final keyForStyle = listKey ?? 'item';
    final accentColor = _sectionColor(keyForStyle);
    final icon = _sectionIcon(keyForStyle);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accentColor.withValues(alpha: isDark ? 0.3 : 0.15),
          width: 1.1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            accentColor.withValues(alpha: isDark ? 0.12 : 0.04),
            cardBg,
          ],
          stops: const [0.0, 0.45],
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: isDark ? 0.06 : 0.03),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              left: -10,
              top: -8,
              child: Icon(
                icon,
                size: 72,
                color: accentColor.withValues(alpha: isDark ? 0.05 : 0.025),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                accentColor,
                                accentColor.withValues(alpha: 0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: accentColor.withValues(alpha: 0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(icon, size: 20, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            title!,
                            style: TextStyle(
                              fontFamily: 'Dubai',
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                        if (statusValue != null)
                          _buildStatusBadge(statusValue!, isDark),
                      ],
                    ),
                    if (rows.isNotEmpty) const SizedBox(height: 12),
                  ],
                  if (rows.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final row in rows)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.white.withValues(alpha: 0.04)
                                  : accentColor.withValues(alpha: 0.04),
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                color: accentColor.withValues(
                                    alpha: isDark ? 0.2 : 0.12),
                                width: 0.9,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${row.key}: ',
                                  style: TextStyle(
                                    fontFamily: 'Dubai',
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.6),
                                  ),
                                ),
                                Text(
                                  _formatValue(row.value),
                                  style: TextStyle(
                                    fontFamily: 'Dubai',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: _metricColor(row.key, accentColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status, bool isDark) {
    final isPositive = status.contains('نشط') || status.contains('حاضر');
    final color = isPositive ? AppColors.success : AppColors.textMuted;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: isDark ? 0.22 : 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: isDark ? 0.4 : 0.2),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            status,
            style: TextStyle(
              fontFamily: 'Dubai',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
