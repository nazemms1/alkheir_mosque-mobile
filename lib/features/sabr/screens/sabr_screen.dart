import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/student_service.dart';
import '../../../shared/widgets/rating_badge.dart';

class SabrScreen extends StatefulWidget {
  final List<SabrRecord> records;
  final int? studentId;
  const SabrScreen({super.key, required this.records, this.studentId});

  @override
  State<SabrScreen> createState() => _SabrScreenState();
}

class _SabrScreenState extends State<SabrScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  final _service = StudentService();
  List<QuranTestEntry> _apiEntries = [];
  bool _loadingApi = false;
  SabrType? _filter;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
    _fetchTests();
  }

  @override
  void didUpdateWidget(SabrScreen old) {
    super.didUpdateWidget(old);
    if (old.studentId != widget.studentId) _fetchTests();
  }

  Future<void> _fetchTests() async {
    if (widget.studentId == null) return;
    setState(() => _loadingApi = true);
    try {
      final entries = await _service.fetchQuranTests(widget.studentId!);
      if (!mounted) return;
      setState(() { _apiEntries = entries; _loadingApi = false; });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingApi = false);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  List<SabrRecord> get _records => _apiEntries.isNotEmpty
      ? _apiEntries.map((e) => e.toSabrRecord()).toList()
      : widget.records;

  List<SabrRecord> get _filtered {
    if (_filter == null) return _records;
    return _records.where((r) => r.type == _filter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final records = _filtered;
    final allRecords = _records;
    final passed = allRecords.where((r) => r.isPassed).length;
    final avgScore = allRecords.isEmpty
        ? 0.0
        : allRecords.map((r) => r.score).reduce((a, b) => a + b) /
            allRecords.length;

    return FadeTransition(
      opacity: _fade,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: _SabrHero(total: widget.records.length, passed: passed, avgScore: avgScore)
                .animate()
                .fadeIn(duration: 500.ms)
                .slideY(begin: -0.03, end: 0, duration: 500.ms, curve: Curves.easeOut),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            sliver: SliverToBoxAdapter(
              child: _FilterStrip(current: _filter, onSelect: (t) => setState(() => _filter = t))
                  .animate()
                  .fadeIn(delay: 150.ms, duration: 400.ms)
                  .slideY(begin: 0.05, end: 0, delay: 150.ms),
            ),
          ),
          if (_loadingApi)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (records.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: Text('لا توجد سجلات سبر', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) => _SabrCard(record: records[i])
                      .animate()
                      .fadeIn(delay: (200 + i * 60).ms, duration: 380.ms)
                      .slideX(begin: 0.04, end: 0, delay: (200 + i * 60).ms, duration: 380.ms),
                  childCount: records.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Hero ─────────────────────────────────────────────────────────────────────
class _SabrHero extends StatelessWidget {
  final int total, passed;
  final double avgScore;
  const _SabrHero({required this.total, required this.passed, required this.avgScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.bgDeep, Color(0xFF1A3A2A), Color(0xFF0D4515)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  gradient: AppColors.gradientGold,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.4), blurRadius: 16)],
                ),
                child: const Icon(Icons.quiz_rounded, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'سجل السبر',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Text(
                      'السبر التجريبي • النهائي • الأوقاف',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _HeroStat(value: '$total', label: 'إجمالي السبر', icon: Icons.list_alt_rounded),
              _VertDivider(),
              _HeroStat(value: '$passed', label: 'ناجح', icon: Icons.check_circle_rounded, valueColor: AppColors.primaryGlow),
              _VertDivider(),
              _HeroStat(value: '${avgScore.toStringAsFixed(0)}%', label: 'متوسط الدرجات', icon: Icons.bar_chart_rounded, valueColor: AppColors.goldLight),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value, label;
  final IconData icon;
  final Color? valueColor;
  const _HeroStat({required this.value, required this.label, required this.icon, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: valueColor ?? Colors.white.withOpacity(0.7), size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontFamily: 'Cairo',
            ),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 11, fontFamily: 'Cairo'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _VertDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 48, color: Colors.white.withOpacity(0.15));
  }
}

// ─── Filter Strip ─────────────────────────────────────────────────────────────
class _FilterStrip extends StatelessWidget {
  final SabrType? current;
  final void Function(SabrType?) onSelect;
  const _FilterStrip({required this.current, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final items = <(SabrType?, String, Color)>[
      (null, 'الكل', AppColors.primary),
      (SabrType.trial, 'سبر تجريبي', AppColors.info),
      (SabrType.final_, 'سبر نهائي', AppColors.primaryLight),
      (SabrType.awqaf, 'سبر الأوقاف', AppColors.gold),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          final isActive = current == item.$1;
          return GestureDetector(
            onTap: () => onSelect(item.$1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? item.$3 : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isActive ? item.$3 : Theme.of(context).dividerColor),
                boxShadow: isActive
                    ? [BoxShadow(color: item.$3.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 3))]
                    : null,
              ),
              child: Text(
                item.$2,
                style: TextStyle(
                  color: isActive ? Colors.white : AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─── Sabr Card ────────────────────────────────────────────────────────────────
class _SabrCard extends StatefulWidget {
  final SabrRecord record;
  const _SabrCard({required this.record});

  @override
  State<_SabrCard> createState() => _SabrCardState();
}

class _SabrCardState extends State<_SabrCard> {
  bool _expanded = false;

  Color get _typeColor {
    switch (widget.record.type) {
      case SabrType.trial: return AppColors.info;
      case SabrType.final_: return AppColors.primaryLight;
      case SabrType.awqaf: return AppColors.gold;
    }
  }

  String get _typeLabel {
    switch (widget.record.type) {
      case SabrType.trial: return 'تجريبي';
      case SabrType.final_: return 'نهائي';
      case SabrType.awqaf: return 'أوقاف';
    }
  }

  IconData get _typeIcon {
    switch (widget.record.type) {
      case SabrType.trial: return Icons.science_rounded;
      case SabrType.final_: return Icons.verified_rounded;
      case SabrType.awqaf: return Icons.account_balance_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.record;
    final dateStr = DateFormat('d MMMM yyyy', 'ar').format(r.date);
    final sortedPages = List<int>.from(r.pageNumbers)..sort();

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _typeColor.withOpacity(0.25)),
          boxShadow: [
            BoxShadow(color: _typeColor.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            // Main row
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: _typeColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: _typeColor.withOpacity(0.25)),
                    ),
                    child: Icon(_typeIcon, color: _typeColor, size: 26),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _TypeBadge(label: _typeLabel, color: _typeColor),
                            const SizedBox(width: 6),
                            if (r.isPassed)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.success.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'ناجح',
                                  style: TextStyle(color: AppColors.success, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          r.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${r.surahFrom}  ←  ${r.surahTo}',
                          style: TextStyle(color: AppColors.textSecondary, fontSize: 11, fontFamily: 'Cairo'),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _ScoreCircle(score: r.score, color: _typeColor),
                      const SizedBox(height: 4),
                      Icon(
                        _expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textMuted,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Expanded details
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              child: _expanded
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(height: 1, color: Theme.of(context).dividerColor),
                          const SizedBox(height: 14),
                          // Stats row
                          Row(
                            children: [
                              _DetailStat(label: 'المختبِر', value: r.examinerName, icon: Icons.person_rounded),
                              const SizedBox(width: 12),
                              _DetailStat(label: 'التاريخ', value: dateStr, icon: Icons.calendar_today_rounded),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              _DetailStat(label: 'الصفحات', value: '${r.pageNumbers.length} صفحة', icon: Icons.menu_book_rounded),
                              const SizedBox(width: 12),
                              Expanded(child: RatingBadge(rating: r.rating, small: false)),
                            ],
                          ),
                          // Pages detail
                          if (sortedPages.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Text(
                              'الصفحات التي تم سبرها:',
                              style: TextStyle(color: AppColors.textSecondary, fontSize: 11, fontFamily: 'Cairo', fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 6),
                            sortedPages.length <= 20
                                ? Wrap(
                                    spacing: 5,
                                    runSpacing: 5,
                                    children: sortedPages.map((p) => _PagePill(page: p, color: _typeColor)).toList(),
                                  )
                                : Text(
                                    'صفحات ${sortedPages.first} – ${sortedPages.last} (${sortedPages.length} صفحة)',
                                    style: TextStyle(color: _typeColor, fontSize: 12, fontFamily: 'Cairo', fontWeight: FontWeight.w700),
                                  ),
                          ],
                          // Notes
                          if (r.notes.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: _typeColor.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: _typeColor.withOpacity(0.15)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.format_quote_rounded, color: _typeColor, size: 16),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      r.notes,
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12,
                                        fontFamily: 'Cairo',
                                        fontStyle: FontStyle.italic,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _TypeBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        'سبر $label',
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
      ),
    );
  }
}

class _ScoreCircle extends StatelessWidget {
  final double score;
  final Color color;
  const _ScoreCircle({required this.score, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2.5),
        color: color.withOpacity(0.08),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${score.toStringAsFixed(0)}',
              style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w900, fontFamily: 'Cairo'),
            ),
            Text('%', style: TextStyle(color: color.withOpacity(0.7), fontSize: 9, fontFamily: 'Cairo')),
          ],
        ),
      ),
    );
  }
}

class _DetailStat extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const _DetailStat({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: AppColors.textMuted),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 10, fontFamily: 'Cairo')),
                  Text(
                    value,
                    style: const TextStyle(color: AppColors.textPrimary, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PagePill extends StatelessWidget {
  final int page;
  final Color color;
  const _PagePill({required this.page, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Text(
        '$page',
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
      ),
    );
  }
}
