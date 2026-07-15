import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/student_service.dart';

class MemorizationScreen extends StatefulWidget {
  final MemorizationProgress progress;
  final int? studentId;

  const MemorizationScreen({
    super.key,
    required this.progress,
    this.studentId,
  });

  @override
  State<MemorizationScreen> createState() => _MemorizationScreenState();
}

class _MemorizationScreenState extends State<MemorizationScreen> {
  final _service = StudentService();
  MemorizationProgress? _richProgress;
  // quran-tests مجمّعة per juz number
  Map<int, List<QuranTestEntry>> _testsByJuz = {};
  bool _loadingEntries = false;

  @override
  void initState() {
    super.initState();
    _fetchAll();
  }

  @override
  void didUpdateWidget(MemorizationScreen old) {
    super.didUpdateWidget(old);
    if (old.studentId != widget.studentId) _fetchAll();
  }

  Future<void> _fetchAll() async {
    if (widget.studentId == null) return;
    setState(() => _loadingEntries = true);
    try {
      final results = await Future.wait([
        _service.fetchMemorization(widget.studentId!),
        _service.fetchQuranTests(widget.studentId!),
      ]);
      if (!mounted) return;

      final entries = results[0] as List<MemorizationEntry>;
      final tests   = results[1] as List<QuranTestEntry>;

      final rich = _service.buildProgressFromEntries(
        entries: entries,
        totalMemorizedPages: widget.progress.totalPagesMemorized,
        currentJuz: widget.progress.currentJuz,
        teacherName: '',
      );

      // نجمع الـ tests per juz
      final byJuz = <int, List<QuranTestEntry>>{};
      for (final t in tests) {
        byJuz.putIfAbsent(t.juzNumber, () => []).add(t);
      }

      setState(() {
        _richProgress = rich;
        _testsByJuz = byJuz;
        _loadingEntries = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingEntries = false);
    }
  }

  void _openJuz(JuzSection section) {
    final tests = _testsByJuz[section.juzNumber] ?? [];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _JuzDetailSheet(section: section, tests: tests),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = _richProgress ?? widget.progress;
    final completedCount = p.sections.where((s) => s.isCompleted).length;
    final pct = p.percentage.clamp(0.0, 1.0);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: _Hero(p: p, pct: pct, completedCount: completedCount)
              .animate().fadeIn(duration: 400.ms),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          sliver: SliverToBoxAdapter(
            child: Row(children: [
              Container(width: 4, height: 20,
                decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 10),
              Text('أجزاء القرآن الكريم', style: Theme.of(context).textTheme.headlineSmall),
              const Spacer(),
              if (_loadingEntries)
                const SizedBox(width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryLight))
              else
                _Legend(),
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
          sliver: p.sections.isEmpty
              ? const SliverToBoxAdapter(child: SizedBox())
              : SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.88,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (_, i) {
                      final section = p.sections[i];
                      final hasTests = (_testsByJuz[section.juzNumber] ?? []).isNotEmpty;
                      return _JuzCell(
                        section: section,
                        hasTests: hasTests,
                        onTap: () => _openJuz(section),
                      ).animate()
                          .fadeIn(delay: (i * 25).ms, duration: 300.ms)
                          .scale(begin: const Offset(0.85, 0.85), end: const Offset(1, 1),
                                 delay: (i * 25).ms, duration: 300.ms, curve: Curves.easeOutBack);
                    },
                    childCount: p.sections.length,
                  ),
                ),
        ),
      ],
    );
  }
}

// ─── Hero ─────────────────────────────────────────────────────────────────────
class _Hero extends StatelessWidget {
  final MemorizationProgress p;
  final double pct;
  final int completedCount;
  const _Hero({required this.p, required this.pct, required this.completedCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              gradient: AppColors.gradientGold,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.4), blurRadius: 12)],
            ),
            child: const Icon(Icons.menu_book_rounded, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('يحفظ حالياً',
                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11, fontFamily: 'Cairo')),
            Text(p.currentSurah,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
          ])),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('${p.totalPagesMemorized}',
                style: const TextStyle(color: AppColors.goldLight, fontSize: 30, fontWeight: FontWeight.w900, fontFamily: 'Cairo')),
            Text('من ${p.totalQuranPages} صفحة',
                style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11, fontFamily: 'Cairo')),
          ]),
        ]),
        const SizedBox(height: 16),
        // Progress bar
        Stack(children: [
          Container(height: 7,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), borderRadius: BorderRadius.circular(4))),
          FractionallySizedBox(
            widthFactor: pct,
            child: Container(
              height: 7,
              decoration: BoxDecoration(
                gradient: AppColors.gradientGold,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.6), blurRadius: 8)],
              ),
            ),
          ),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          _StatChip(label: 'الأجزاء المكتملة', value: '$completedCount / 30'),
          const SizedBox(width: 10),
          _StatChip(label: 'نسبة الحفظ', value: '${(pct * 100).toStringAsFixed(1)}%'),
        ]),
      ]),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label, value;
  const _StatChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 11, fontFamily: 'Cairo')),
        const SizedBox(width: 6),
        Text(value, style: const TextStyle(color: AppColors.goldLight, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
      ]),
    );
  }
}

// ─── Legend ───────────────────────────────────────────────────────────────────
class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      _Dot(color: AppColors.primary,           label: 'مكتمل'),
      const SizedBox(width: 8),
      _Dot(color: const Color(0xFFE67E22),     label: 'سبر'),
      const SizedBox(width: 8),
      _Dot(color: AppColors.gold,              label: 'جارٍ'),
      const SizedBox(width: 8),
      _Dot(color: Colors.grey.withOpacity(0.4), label: 'لم يبدأ'),
    ]);
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  final String label;
  const _Dot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 3),
      Text(label, style: TextStyle(fontSize: 9, fontFamily: 'Cairo',
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
    ]);
  }
}

// ─── Juz Grid Cell ────────────────────────────────────────────────────────────
class _JuzCell extends StatelessWidget {
  final JuzSection section;
  final bool hasTests;
  final VoidCallback onTap;
  const _JuzCell({required this.section, required this.onTap, this.hasTests = false});

  @override
  Widget build(BuildContext context) {
    final state = section.state;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color bgColor;
    Color textColor;
    Color borderColor;
    Gradient? gradient;
    Widget? badge;

    switch (state) {
      case JuzState.done:
        gradient = const LinearGradient(
            colors: [Color(0xFF0D5016), Color(0xFF2EA043)],
            begin: Alignment.topLeft, end: Alignment.bottomRight);
        textColor = Colors.white;
        borderColor = Colors.transparent;
        bgColor = Colors.transparent;
        badge = const Icon(Icons.check_circle_rounded, color: Colors.white, size: 13);
        break;
      case JuzState.practice:
        bgColor = const Color(0xFFE67E22).withOpacity(isDark ? 0.2 : 0.12);
        textColor = const Color(0xFFE67E22);
        borderColor = const Color(0xFFE67E22).withOpacity(0.5);
        badge = Container(width: 8, height: 8,
            decoration: const BoxDecoration(color: Color(0xFFE67E22), shape: BoxShape.circle));
        break;
      case JuzState.inProgress:
        bgColor = AppColors.gold.withOpacity(isDark ? 0.18 : 0.1);
        textColor = isDark ? AppColors.goldLight : const Color(0xFF8B6914);
        borderColor = AppColors.gold.withOpacity(0.45);
        badge = Container(width: 8, height: 8,
            decoration: BoxDecoration(color: AppColors.gold, shape: BoxShape.circle));
        break;
      case JuzState.notStarted:
        bgColor = Theme.of(context).colorScheme.surface;
        textColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.35);
        borderColor = Theme.of(context).dividerColor;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null ? bgColor : null,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: state == JuzState.done
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))]
              : null,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Juz number — big
          Text(
            '${section.juzNumber}',
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 2),
          // "جزء" label
          Text('جزء',
              style: TextStyle(color: textColor.withOpacity(0.7), fontSize: 9, fontFamily: 'Cairo')),
          const SizedBox(height: 5),
          // State badge
          if (badge != null) badge,
          // Progress bar for in-progress
          if (state == JuzState.inProgress) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: LinearProgressIndicator(
                value: section.recitedPercentage,
                backgroundColor: AppColors.gold.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation(AppColors.gold),
                minHeight: 3,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ]),
      ),
    );
  }
}

// ─── Bottom Sheet Detail ──────────────────────────────────────────────────────
class _JuzDetailSheet extends StatelessWidget {
  final JuzSection section;
  final List<QuranTestEntry> tests;
  const _JuzDetailSheet({required this.section, this.tests = const []});

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;
    // نفصل partial عن final
    final partialTests = tests.where((t) => t.isPartial).toList();
    final finalTests   = tests.where((t) => t.isFinal).toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, ctrl) => Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 30, offset: const Offset(0, -4))],
        ),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 4),
            width: 40, height: 4,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(2)),
          ),
          _SheetHeader(section: section),
          const SizedBox(height: 4),
          Expanded(
            child: ListView(
              controller: ctrl,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
              children: [
                _RecitationCard(section: section)
                    .animate().fadeIn(delay: 50.ms, duration: 320.ms).slideY(begin: 0.04, end: 0, delay: 50.ms),
                // السبر التجريبي من الـ API
                if (partialTests.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  _QuranTestsCard(tests: partialTests, kind: 'partial')
                      .animate().fadeIn(delay: 110.ms, duration: 320.ms).slideY(begin: 0.04, end: 0, delay: 110.ms),
                ] else ...[
                  const SizedBox(height: 14),
                  _PracticeCard(stages: section.practiceStages)
                      .animate().fadeIn(delay: 110.ms, duration: 320.ms).slideY(begin: 0.04, end: 0, delay: 110.ms),
                ],
                // السبر النهائي من الـ API
                if (finalTests.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  _QuranTestsCard(tests: finalTests, kind: 'final')
                      .animate().fadeIn(delay: 170.ms, duration: 320.ms).slideY(begin: 0.04, end: 0, delay: 170.ms),
                ] else if (section.finalExam != null) ...[
                  const SizedBox(height: 14),
                  _FinalCard(exam: section.finalExam!)
                      .animate().fadeIn(delay: 170.ms, duration: 320.ms).slideY(begin: 0.04, end: 0, delay: 170.ms),
                ],
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// ─── Quran Tests Card (partial أو final من الـ API) ──────────────────────────
class _QuranTestsCard extends StatelessWidget {
  final List<QuranTestEntry> tests;
  final String kind; // 'partial' | 'final'
  const _QuranTestsCard({required this.tests, required this.kind});

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFE67E22);
    const purple = Color(0xFF7B1FA2);
    final isPartial = kind == 'partial';
    final color = isPartial ? orange : purple;
    final title = isPartial ? 'السبر التجريبي' : 'السبر النهائي';
    final icon  = isPartial ? Icons.fact_check_rounded : Icons.workspace_premium_rounded;

    return _Card(
      headerIcon: icon,
      headerTitle: title,
      headerColor: color,
      child: Column(
        children: tests.map((test) => _TestEntry(test: test, color: color)).toList(),
      ),
    );
  }
}

class _TestEntry extends StatelessWidget {
  final QuranTestEntry test;
  final Color color;
  const _TestEntry({required this.test, required this.color});

  @override
  Widget build(BuildContext context) {
    final isPartial = test.isPartial;
    final dateStr = DateFormat('d MMM yyyy', 'ar').format(test.date);
    final score = test.score;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // رأس الاختبار
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color.withOpacity(0.3)),
                ),
                child: Text(
                  isPartial ? 'تجريبي' : 'نهائي',
                  style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.calendar_today_rounded, size: 12, color: color.withOpacity(0.6)),
              const SizedBox(width: 4),
              Text(dateStr, style: TextStyle(fontSize: 11, fontFamily: 'Cairo', color: color.withOpacity(0.7))),
              const Spacer(),
              // الحالة
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: test.isPassed ? AppColors.success.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  test.isPassed ? 'ناجح' : 'راسب',
                  style: TextStyle(
                    color: test.isPassed ? AppColors.success : Colors.red,
                    fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo',
                  ),
                ),
              ),
              if (score != null) ...[
                const SizedBox(width: 8),
                Container(
                  width: 38, height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2),
                    color: color.withOpacity(0.08),
                  ),
                  child: Center(
                    child: Text(
                      score.toStringAsFixed(0),
                      style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w900, fontFamily: 'Cairo'),
                    ),
                  ),
                ),
              ],
            ]),
          ),
          // أجزاء السبر التجريبي
          if (isPartial && test.parts.isNotEmpty) ...[
            Divider(height: 1, color: color.withOpacity(0.15)),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الأجزاء الفرعية',
                      style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
                  const SizedBox(height: 8),
                  ...test.parts.map((p) => _PartTile(part: p, color: color)),
                ],
              ),
            ),
          ],
          // محاولات السبر النهائي
          if (!isPartial && test.attempts.isNotEmpty) ...[
            Divider(height: 1, color: color.withOpacity(0.15)),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                children: test.attempts.map((a) => _AttemptRow(attempt: a, color: color)).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PartTile extends StatefulWidget {
  final QuranTestPart part;
  final Color color;
  const _PartTile({required this.part, required this.color});

  @override
  State<_PartTile> createState() => _PartTileState();
}

class _PartTileState extends State<_PartTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final part   = widget.part;
    final color  = widget.color;
    final passed = part.status == 'passed';
    final statusColor = passed ? AppColors.success : Colors.red;
    final retakes = part.attempts.length - 1;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: statusColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusColor.withOpacity(0.25)),
        ),
        child: Column(
          children: [
            // ── رأس الجزء الفرعي ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(children: [
                Container(
                  width: 32, height: 32,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '${part.partNumber}',
                      style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w900, fontFamily: 'Cairo'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      'الجزء الفرعي ${part.partNumber}',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                    ),
                    if (retakes > 0)
                      Text(
                        '${part.attempts.length} محاولات • $retakes إعادة',
                        style: TextStyle(fontSize: 10, fontFamily: 'Cairo', color: color.withOpacity(0.7)),
                      )
                    else
                      Text(
                        'محاولة واحدة',
                        style: TextStyle(fontSize: 10, fontFamily: 'Cairo',
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.45)),
                      ),
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    passed ? 'ناجح' : 'راسب',
                    style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  _expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                  size: 18, color: color.withOpacity(0.5),
                ),
              ]),
            ),

            // ── تفاصيل المحاولات (عند التوسع) ──
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              child: _expanded
                  ? Column(
                      children: [
                        Divider(height: 1, color: color.withOpacity(0.15)),
                        ...part.attempts.map((a) => _PartAttemptRow(attempt: a, color: color)),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PartAttemptRow extends StatelessWidget {
  final QuranTestAttempt attempt;
  final Color color;
  const _PartAttemptRow({required this.attempt, required this.color});

  @override
  Widget build(BuildContext context) {
    final passed  = attempt.status == 'passed';
    final dateStr = DateFormat('d MMM yyyy', 'ar').format(attempt.testedOn);
    final statusColor = passed ? AppColors.success : Colors.red;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: color.withOpacity(0.08))),
      ),
      child: Row(children: [
        // رقم المحاولة
        Container(
          width: 24, height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Center(
            child: Text(
              '${attempt.attemptNo}',
              style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w800, fontFamily: 'Cairo'),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // المعلم والتاريخ
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.person_rounded, size: 12, color: color.withOpacity(0.6)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  attempt.teacherName.isNotEmpty ? attempt.teacherName : 'غير محدد',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Cairo'),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
            const SizedBox(height: 2),
            Row(children: [
              Icon(Icons.calendar_today_rounded, size: 11,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4)),
              const SizedBox(width: 4),
              Text(dateStr,
                  style: TextStyle(fontSize: 10, fontFamily: 'Cairo',
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
            ]),
          ]),
        ),
        // الحالة
        Icon(
          passed ? Icons.check_circle_rounded : Icons.cancel_rounded,
          color: statusColor, size: 20,
        ),
      ]),
    );
  }
}

class _AttemptRow extends StatelessWidget {
  final QuranTestAttempt attempt;
  final Color color;
  const _AttemptRow({required this.attempt, required this.color});

  @override
  Widget build(BuildContext context) {
    final passed = attempt.status == 'passed';
    final dateStr = DateFormat('d MMM yyyy', 'ar').format(attempt.testedOn);
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Row(children: [
        Container(
          width: 26, height: 26,
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text('${attempt.attemptNo}',
                style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(attempt.teacherName,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Cairo'),
                overflow: TextOverflow.ellipsis),
            Text(dateStr,
                style: TextStyle(fontSize: 10, fontFamily: 'Cairo',
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
          ]),
        ),
        if (attempt.score != null)
          Text('${attempt.score!.toStringAsFixed(0)}%',
              style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w900, fontFamily: 'Cairo')),
        const SizedBox(width: 8),
        Icon(
          passed ? Icons.check_circle_rounded : Icons.cancel_rounded,
          color: passed ? AppColors.success : Colors.red,
          size: 18,
        ),
      ]),
    );
  }
}

class _SheetHeader extends StatelessWidget {
  final JuzSection section;
  const _SheetHeader({required this.section});

  @override
  Widget build(BuildContext context) {
    Color stateColor;
    String stateLabel;
    switch (section.state) {
      case JuzState.done:      stateColor = AppColors.primary;          stateLabel = 'مكتمل'; break;
      case JuzState.practice:  stateColor = const Color(0xFFE67E22);    stateLabel = 'في السبر التجريبي'; break;
      case JuzState.inProgress:stateColor = AppColors.gold;             stateLabel = 'جارٍ الحفظ'; break;
      case JuzState.notStarted:stateColor = Colors.grey;                stateLabel = 'لم يبدأ'; break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(children: [
        Container(
          width: 52, height: 52,
          decoration: BoxDecoration(
            gradient: section.isCompleted ? AppColors.gradientPrimary : null,
            color: section.isCompleted ? null : stateColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: stateColor.withOpacity(section.isCompleted ? 0 : 0.3), width: 1.5),
          ),
          child: Center(
            child: Text('${section.juzNumber}',
                style: TextStyle(
                  color: section.isCompleted ? Colors.white : stateColor,
                  fontSize: 22, fontWeight: FontWeight.w900, fontFamily: 'Cairo')),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(section.juzName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Row(children: [
            Text('ص ${section.firstPage} – ${section.lastPage}',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    fontSize: 12, fontFamily: 'Cairo')),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: BoxDecoration(
                  color: stateColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: stateColor.withOpacity(0.3))),
              child: Text(stateLabel,
                  style: TextStyle(color: stateColor, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
            ),
          ]),
        ])),
      ]),
    );
  }
}

// ─── Card 1: Recitation sessions ─────────────────────────────────────────────
class _RecitationCard extends StatelessWidget {
  final JuzSection section;
  const _RecitationCard({required this.section});

  @override
  Widget build(BuildContext context) {
    final recitedPagesCount = section.recitedPageCount;
    final pendingCount = section.pendingPages.length;
    final totalPages = section.totalPages;

    return _Card(
      headerIcon: Icons.record_voice_over_rounded,
      headerTitle: 'التلاوة',
      headerColor: AppColors.primary,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

        // Progress summary row
        Row(children: [
          Expanded(child: _MiniStat(
            label: 'تمّ سماعه',
            value: '$recitedPagesCount صفحة',
            color: AppColors.primary,
          )),
          if (pendingCount > 0) ...[
            const SizedBox(width: 10),
            Expanded(child: _MiniStat(
              label: 'لم يُسمَع بعد',
              value: '$pendingCount صفحة',
              color: const Color(0xFFE53935),
            )),
          ],
        ]),
        const SizedBox(height: 12),

        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: totalPages == 0 ? 0 : recitedPagesCount / totalPages,
            backgroundColor: const Color(0xFFE53935).withOpacity(0.15),
            valueColor: const AlwaysStoppedAnimation(AppColors.primaryLight),
            minHeight: 6,
          ),
        ),
        const SizedBox(height: 16),

        // Pending pages chips (if any)
        if (pendingCount > 0) ...[
          _SubLabel(
            label: 'الصفحات التي لم تُسمَع',
            color: const Color(0xFFE53935),
            count: pendingCount,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6, runSpacing: 6,
            children: section.pendingPages
                .map((p) => _PageChip(label: 'ص $p', color: const Color(0xFFE53935)))
                .toList(),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),
        ],

        // Recitation sessions
        if (section.sessions.isEmpty)
          Center(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text('لا توجد جلسات تلاوة بعد',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                    fontSize: 13, fontFamily: 'Cairo')),
          ))
        else ...[
          _SubLabel(label: 'جلسات التلاوة المسموعة', color: AppColors.primary, count: section.sessions.length),
          const SizedBox(height: 10),
          ...section.sessions.map((s) => _SessionTile(session: s)),
        ],
      ]),
    );
  }
}

class _SessionTile extends StatelessWidget {
  final RecitationSession session;
  const _SessionTile({required this.session});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('d MMM yyyy', 'ar').format(session.date);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.15)),
      ),
      child: Row(children: [
        // Page range badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            gradient: AppColors.gradientPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text('ص ${session.fromPage} – ${session.toPage}',
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
        ),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(session.teacherName,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Cairo'),
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 2),
          Text(dateStr,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 11, fontFamily: 'Cairo')),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8)),
          child: Text('${session.pageCount} ص',
              style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
        ),
      ]),
    );
  }
}

// ─── Card 2: Practice exam ────────────────────────────────────────────────────
class _PracticeCard extends StatelessWidget {
  final List<PracticeExamStage> stages;
  const _PracticeCard({required this.stages});

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFE67E22);
    return _Card(
      headerIcon: Icons.fact_check_rounded,
      headerTitle: 'السبر التجريبي',
      headerColor: orange,
      child: stages.isEmpty
          ? Center(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('لم يبدأ السبر التجريبي بعد',
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                      fontSize: 13, fontFamily: 'Cairo'))))
          : Column(children: stages.map((s) => _StageRow(stage: s)).toList()),
    );
  }
}

class _StageRow extends StatelessWidget {
  final PracticeExamStage stage;
  const _StageRow({required this.stage});

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFE67E22);
    final dateStr = DateFormat('d MMM yyyy', 'ar').format(stage.date);
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: orange.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: orange.withOpacity(0.2)),
      ),
      child: Row(children: [
        Container(
          width: 34, height: 34,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFE67E22), Color(0xFFD35400)]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text('${stage.stageNumber}',
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800, fontFamily: 'Cairo'))),
        ),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('المرحلة ${stage.stageNumber}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
          const SizedBox(height: 2),
          Row(children: [
            Icon(Icons.calendar_today_rounded, size: 11,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4)),
            const SizedBox(width: 4),
            Text(dateStr,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    fontSize: 11, fontFamily: 'Cairo')),
            const SizedBox(width: 10),
            Icon(Icons.error_outline_rounded, size: 11, color: orange.withOpacity(0.7)),
            const SizedBox(width: 3),
            Text('${stage.errorCount} أخطاء',
                style: TextStyle(color: orange, fontSize: 11, fontWeight: FontWeight.w600, fontFamily: 'Cairo')),
          ]),
        ])),
        if (stage.wasRetaken)
          _StatusBadge(label: 'أُعيد', color: const Color(0xFFE53935))
        else
          _StatusBadge(label: 'مقبول', color: AppColors.primary),
      ]),
    );
  }
}

// ─── Card 3: Final exam ───────────────────────────────────────────────────────
class _FinalCard extends StatelessWidget {
  final FinalExam exam;
  const _FinalCard({required this.exam});

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF7B1FA2);
    final grade = exam.score >= 90 ? 'ممتاز'
        : exam.score >= 80 ? 'جيد جداً'
        : exam.score >= 70 ? 'جيد'
        : 'مقبول';
    final gradeColor = exam.score >= 90 ? AppColors.primary
        : exam.score >= 80 ? AppColors.gold
        : const Color(0xFFE67E22);
    final dateStr = DateFormat('d MMMM yyyy', 'ar').format(exam.date);

    return _Card(
      headerIcon: Icons.workspace_premium_rounded,
      headerTitle: 'السبر النهائي',
      headerColor: purple,
      child: Row(children: [
        // Score circle
        Container(
          width: 72, height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [gradeColor.withOpacity(0.8), gradeColor],
              begin: Alignment.topLeft, end: Alignment.bottomRight,
            ),
            boxShadow: [BoxShadow(color: gradeColor.withOpacity(0.35), blurRadius: 14)],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('${exam.score.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, fontFamily: 'Cairo')),
            Text('/ 100', style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 10, fontFamily: 'Cairo')),
          ]),
        ),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: gradeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: gradeColor.withOpacity(0.3))),
            child: Text(grade,
                style: TextStyle(color: gradeColor, fontSize: 14, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
          ),
          const SizedBox(height: 8),
          Row(children: [
            Icon(Icons.calendar_today_rounded, size: 13,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4)),
            const SizedBox(width: 6),
            Text(dateStr,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    fontSize: 12, fontFamily: 'Cairo')),
          ]),
          const SizedBox(height: 6),
          Row(children: [
            const Icon(Icons.check_circle_rounded, size: 14, color: AppColors.primaryLight),
            const SizedBox(width: 6),
            const Text('اجتاز السبر بنجاح',
                style: TextStyle(color: AppColors.primaryLight, fontSize: 12,
                    fontWeight: FontWeight.w600, fontFamily: 'Cairo')),
          ]),
        ])),
      ]),
    );
  }
}

// ─── Shared ───────────────────────────────────────────────────────────────────
class _Card extends StatelessWidget {
  final IconData headerIcon;
  final String headerTitle;
  final Color headerColor;
  final Widget child;
  const _Card({required this.headerIcon, required this.headerTitle,
               required this.headerColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 3))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: headerColor.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
            child: Icon(headerIcon, color: headerColor, size: 17),
          ),
          const SizedBox(width: 10),
          Text(headerTitle,
              style: TextStyle(color: headerColor, fontSize: 15, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
        ]),
        const SizedBox(height: 14),
        child,
      ]),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label, value;
  final Color color;
  const _MiniStat({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: color.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.2))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(value, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Cairo')),
        Text(label, style: TextStyle(color: color.withOpacity(0.7), fontSize: 10, fontFamily: 'Cairo')),
      ]),
    );
  }
}

class _SubLabel extends StatelessWidget {
  final String label;
  final Color color;
  final int count;
  const _SubLabel({required this.label, required this.color, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(width: 3, height: 14, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
      const SizedBox(width: 7),
      Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
      const SizedBox(width: 6),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Text('$count', style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
      ),
    ]);
  }
}

class _PageChip extends StatelessWidget {
  final String label;
  final Color color;
  const _PageChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3))),
      child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.35))),
      child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
    );
  }
}
