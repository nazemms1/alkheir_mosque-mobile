import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/shared/students/ui/providers/student_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';

class MemorizationScreen extends ConsumerStatefulWidget {
  final MemorizationProgress progress;
  final int? studentId;

  const MemorizationScreen({
    super.key,
    required this.progress,
    this.studentId,
  });

  @override
  ConsumerState<MemorizationScreen> createState() => _MemorizationScreenState();
}

class _MemorizationScreenState extends ConsumerState<MemorizationScreen> {
  /// التقدّم المفصّل واختبارات كل جزء؛ عند الفشل تبقى البيانات الممرّرة للشاشة.
  late final _detailsProvider = screenDataProvider(_fetchAll);
  MemorizationProgress? get _richProgress =>
      ref.watch(_detailsProvider).valueOrNull?.progress;
  Map<int, List<QuranTestEntry>> get _testsByJuz =>
      ref.watch(_detailsProvider).valueOrNull?.testsByJuz ?? const {};
  bool get _loadingEntries =>
      widget.studentId != null && ref.watch(_detailsProvider).isLoading;

  @override
  void didUpdateWidget(MemorizationScreen old) {
    super.didUpdateWidget(old);
    if (old.studentId != widget.studentId) ref.invalidate(_detailsProvider);
  }

  Future<
      ({
        MemorizationProgress progress,
        Map<int, List<QuranTestEntry>> testsByJuz,
      })?> _fetchAll() async {
    if (widget.studentId == null) return null;
    {
      final results = await Future.wait([
        ref
            .read(studentActionsControllerProvider.notifier)
            .query((r) => r.fetchMemorization(widget.studentId!)),
        ref
            .read(studentActionsControllerProvider.notifier)
            .query((r) => r.fetchQuranTests(widget.studentId!)),
      ]);

      final entries = results[0] as List<MemorizationEntry>;
      final tests = results[1] as List<QuranTestEntry>;

      final rich = ref
          .read(studentActionsControllerProvider.notifier)
          .buildProgressFromEntries(
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

      return (progress: rich, testsByJuz: byJuz);
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
              .animate()
              .fadeIn(duration: 400.ms),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          sliver: SliverToBoxAdapter(
            child: Row(children: [
              Container(
                  width: 4,
                  height: 20,
                  decoration: BoxDecoration(
                      gradient: context.appColors.gradientPrimary,
                      borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 10),
              Text(context.l10n.partsOfTheHolyQuran,
                  style: Theme.of(context).textTheme.headlineSmall),
              const Spacer(),
              if (_loadingEntries)
                SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: context.appColors.primaryLight))
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
                      final hasTests =
                          (_testsByJuz[section.juzNumber] ?? []).isNotEmpty;
                      return _JuzCell(
                        section: section,
                        hasTests: hasTests,
                        onTap: () => _openJuz(section),
                      )
                          .animate()
                          .fadeIn(delay: (i * 25).ms, duration: 300.ms)
                          .scale(
                              begin: const Offset(0.85, 0.85),
                              end: const Offset(1, 1),
                              delay: (i * 25).ms,
                              duration: 300.ms,
                              curve: Curves.easeOutBack);
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
  const _Hero(
      {required this.p, required this.pct, required this.completedCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceDeepGreen,
            context.appColors.brandDeep,
            context.appColors.brandGreen
          ],
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
              gradient: context.appColors.gradientGold,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                    color: context.appColors.gold.withValues(alpha: 0.4),
                    blurRadius: 12)
              ],
            ),
            child: const Icon(Icons.menu_book_rounded,
                color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(context.l10n.currentlyMemorizing,
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: FontSize.caption,
                        fontFamily: 'Dubai')),
                Text(p.currentSurah,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.headlineSmall,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Dubai')),
              ])),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('${p.totalPagesMemorized}',
                style: TextStyle(
                    color: context.appColors.goldLight,
                    fontSize: FontSize.display,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Dubai')),
            Text(context.l10n.ofPages(p.totalQuranPages),
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai')),
          ]),
        ]),
        const SizedBox(height: 16),
        // Progress bar
        Stack(children: [
          Container(
              height: 7,
              decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4))),
          FractionallySizedBox(
            widthFactor: pct,
            child: Container(
              height: 7,
              decoration: BoxDecoration(
                gradient: context.appColors.gradientGold,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                      color: context.appColors.gold.withValues(alpha: 0.6),
                      blurRadius: 8)
                ],
              ),
            ),
          ),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          _StatChip(
              label: context.l10n.completedJuz, value: '$completedCount / 30'),
          const SizedBox(width: 10),
          _StatChip(
              label: context.l10n.memorizationRate,
              value: '${(pct * 100).toStringAsFixed(1)}%'),
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
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(label,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: FontSize.caption,
                fontFamily: 'Dubai')),
        const SizedBox(width: 6),
        Text(value,
            style: TextStyle(
                color: context.appColors.goldLight,
                fontSize: FontSize.caption,
                fontWeight: FontWeight.w700,
                fontFamily: 'Dubai')),
      ]),
    );
  }
}

// ─── Legend ───────────────────────────────────────────────────────────────────
class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      _Dot(
          color: context.appColors.brandPrimary, label: context.l10n.completed),
      const SizedBox(width: 8),
      _Dot(color: context.appColors.accentOrange, label: context.l10n.test),
      const SizedBox(width: 8),
      _Dot(color: context.appColors.gold, label: context.l10n.inProgress2),
      const SizedBox(width: 8),
      _Dot(
          color: Colors.grey.withValues(alpha: 0.4),
          label: context.l10n.notStarted),
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
      Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 3),
      Text(label,
          style: TextStyle(
              fontSize: FontSize.caption,
              fontFamily: 'Dubai',
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.6))),
    ]);
  }
}

// ─── Juz Grid Cell ────────────────────────────────────────────────────────────
class _JuzCell extends StatelessWidget {
  final JuzSection section;
  final bool hasTests;
  final VoidCallback onTap;
  const _JuzCell(
      {required this.section, required this.onTap, this.hasTests = false});

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
        gradient = LinearGradient(colors: [
          context.appColors.brandDeep,
          context.appColors.successGreen
        ], begin: Alignment.topLeft, end: Alignment.bottomRight);
        textColor = Colors.white;
        borderColor = Colors.transparent;
        bgColor = Colors.transparent;
        badge = const Icon(Icons.check_circle_rounded,
            color: Colors.white, size: 13);
        break;
      case JuzState.practice:
        bgColor = context.appColors.accentOrange
            .withValues(alpha: isDark ? 0.2 : 0.12);
        textColor = context.appColors.accentOrange;
        borderColor = context.appColors.accentOrange.withValues(alpha: 0.5);
        badge = Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: context.appColors.accentOrange, shape: BoxShape.circle));
        break;
      case JuzState.inProgress:
        bgColor = context.appColors.gold.withValues(alpha: isDark ? 0.18 : 0.1);
        textColor =
            isDark ? context.appColors.goldLight : const Color(0xFF8B6914);
        borderColor = context.appColors.gold.withValues(alpha: 0.45);
        badge = Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: context.appColors.gold, shape: BoxShape.circle));
        break;
      case JuzState.notStarted:
        bgColor = Theme.of(context).colorScheme.surface;
        textColor =
            Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.35);
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
              ? [
                  BoxShadow(
                      color:
                          context.appColors.brandPrimary.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4))
                ]
              : null,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Juz number — big
          Text(
            '${section.juzNumber}',
            style: TextStyle(
              color: textColor,
              fontSize: FontSize.headlineLarge,
              fontWeight: FontWeight.w900,
              fontFamily: 'Dubai',
            ),
          ),
          const SizedBox(height: 2),
          // "جزء" label
          Text(context.l10n.juz4,
              style: TextStyle(
                  color: textColor.withValues(alpha: 0.7),
                  fontSize: FontSize.caption,
                  fontFamily: 'Dubai')),
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
                backgroundColor: context.appColors.gold.withValues(alpha: 0.2),
                valueColor: AlwaysStoppedAnimation(context.appColors.gold),
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
    final finalTests = tests.where((t) => t.isFinal).toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.82,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, ctrl) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final borderColor = context.appColors.border;
        final handleColor = context.appColors.border;

        return Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            border: Border(top: BorderSide(color: borderColor, width: 1.5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.16),
                blurRadius: 36,
                offset: const Offset(0, -8),
              ),
              BoxShadow(
                color: context.appColors.brandDeep
                    .withValues(alpha: isDark ? 0.25 : 0.08),
                blurRadius: 18,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 6),
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: handleColor,
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
              _SheetHeader(section: section),
              Divider(
                height: 1,
                thickness: 1,
                color: borderColor.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: ListView(
                  controller: ctrl,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
                  children: [
                    _RecitationCard(section: section)
                        .animate()
                        .fadeIn(delay: 50.ms, duration: 320.ms)
                        .slideY(begin: 0.04, end: 0, delay: 50.ms),
                    // السبر التجريبي من الـ API
                    if (partialTests.isNotEmpty) ...[
                      const SizedBox(height: 14),
                      _QuranTestsCard(tests: partialTests, kind: 'partial')
                          .animate()
                          .fadeIn(delay: 110.ms, duration: 320.ms)
                          .slideY(begin: 0.04, end: 0, delay: 110.ms),
                    ] else ...[
                      const SizedBox(height: 14),
                      _PracticeCard(stages: section.practiceStages)
                          .animate()
                          .fadeIn(delay: 110.ms, duration: 320.ms)
                          .slideY(begin: 0.04, end: 0, delay: 110.ms),
                    ],
                    // السبر النهائي من الـ API
                    if (finalTests.isNotEmpty) ...[
                      const SizedBox(height: 14),
                      _QuranTestsCard(tests: finalTests, kind: 'final')
                          .animate()
                          .fadeIn(delay: 170.ms, duration: 320.ms)
                          .slideY(begin: 0.04, end: 0, delay: 170.ms),
                    ] else if (section.finalExam != null) ...[
                      const SizedBox(height: 14),
                      _FinalCard(exam: section.finalExam!)
                          .animate()
                          .fadeIn(delay: 170.ms, duration: 320.ms)
                          .slideY(begin: 0.04, end: 0, delay: 170.ms),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
    final orange = context.appColors.accentOrange;
    const purple = Color(0xFF7B1FA2);
    final isPartial = kind == 'partial';
    final color = isPartial ? orange : purple;
    final title = isPartial ? context.l10n.trialTest : context.l10n.finalTest2;
    final icon =
        isPartial ? Icons.fact_check_rounded : Icons.workspace_premium_rounded;

    return _Card(
      headerIcon: icon,
      headerTitle: title,
      headerColor: color,
      child: Column(
        children:
            tests.map((test) => _TestEntry(test: test, color: color)).toList(),
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
    final dateStr =
        DateFormat('d MMM yyyy', AppLanguage.intlCode).format(test.date);
    final score = test.score;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // رأس الاختبار
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                ),
                child: Text(
                  isPartial ? context.l10n.trial : context.l10n.tFinal,
                  style: TextStyle(
                      color: color,
                      fontSize: FontSize.caption,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Dubai'),
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.calendar_today_rounded,
                  size: 12, color: color.withValues(alpha: 0.6)),
              const SizedBox(width: 4),
              Text(dateStr,
                  style: TextStyle(
                      fontSize: FontSize.caption,
                      fontFamily: 'Dubai',
                      color: color.withValues(alpha: 0.7))),
              const Spacer(),
              // الحالة
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: test.isPassed
                      ? context.appColors.success.withValues(alpha: 0.1)
                      : Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  test.isPassed ? context.l10n.passed : context.l10n.failed,
                  style: TextStyle(
                    color:
                        test.isPassed ? context.appColors.success : Colors.red,
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dubai',
                  ),
                ),
              ),
              if (score != null) ...[
                const SizedBox(width: 8),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2),
                    color: color.withValues(alpha: 0.08),
                  ),
                  child: Center(
                    child: Text(
                      score.toStringAsFixed(0),
                      style: TextStyle(
                          color: color,
                          fontSize: FontSize.caption,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Dubai'),
                    ),
                  ),
                ),
              ],
            ]),
          ),
          // أجزاء السبر التجريبي
          if (isPartial && test.parts.isNotEmpty) ...[
            Divider(height: 1, color: color.withValues(alpha: 0.15)),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.subParts,
                      style: TextStyle(
                          color: color,
                          fontSize: FontSize.caption,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Dubai')),
                  const SizedBox(height: 8),
                  ...test.parts.map((p) => _PartTile(part: p, color: color)),
                ],
              ),
            ),
          ],
          // محاولات السبر النهائي
          if (!isPartial && test.attempts.isNotEmpty) ...[
            Divider(height: 1, color: color.withValues(alpha: 0.15)),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                children: test.attempts
                    .map((a) => _AttemptRow(attempt: a, color: color))
                    .toList(),
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
    final part = widget.part;
    final color = widget.color;
    final passed = part.status == 'passed';
    final statusColor = passed ? context.appColors.success : Colors.red;
    final retakes = part.attempts.length - 1;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: statusColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusColor.withValues(alpha: 0.25)),
        ),
        child: Column(
          children: [
            // ── رأس الجزء الفرعي ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '${part.partNumber}',
                      style: TextStyle(
                          color: color,
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Dubai'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.subPart(part.partNumber),
                          style: const TextStyle(
                              fontSize: FontSize.label,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Dubai'),
                        ),
                        if (retakes > 0)
                          Text(
                            context.l10n
                                .attemptsRetakeS(part.attempts.length, retakes),
                            style: TextStyle(
                                fontSize: FontSize.caption,
                                fontFamily: 'Dubai',
                                color: color.withValues(alpha: 0.7)),
                          )
                        else
                          Text(
                            context.l10n.singleAttempt,
                            style: TextStyle(
                                fontSize: FontSize.caption,
                                fontFamily: 'Dubai',
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.45)),
                          ),
                      ]),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    passed ? context.l10n.passed : context.l10n.failed,
                    style: TextStyle(
                        color: statusColor,
                        fontSize: FontSize.caption,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Dubai'),
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: color.withValues(alpha: 0.5),
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
                        Divider(
                            height: 1, color: color.withValues(alpha: 0.15)),
                        ...part.attempts.map(
                            (a) => _PartAttemptRow(attempt: a, color: color)),
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
    final passed = attempt.status == 'passed';
    final dateStr =
        DateFormat('d MMM yyyy', AppLanguage.intlCode).format(attempt.testedOn);
    final statusColor = passed ? context.appColors.success : Colors.red;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: color.withValues(alpha: 0.08))),
      ),
      child: Row(children: [
        // رقم المحاولة
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.1),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Center(
            child: Text(
              '${attempt.attemptNo}',
              style: TextStyle(
                  color: color,
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Dubai'),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // المعلم والتاريخ
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.person_rounded,
                  size: 12, color: color.withValues(alpha: 0.6)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  attempt.teacherName.isNotEmpty
                      ? attempt.teacherName
                      : context.l10n.notSpecified,
                  style: const TextStyle(
                      fontSize: FontSize.caption,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Dubai'),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
            const SizedBox(height: 2),
            Row(children: [
              Icon(Icons.calendar_today_rounded,
                  size: 11,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.4)),
              const SizedBox(width: 4),
              Text(dateStr,
                  style: TextStyle(
                      fontSize: FontSize.caption,
                      fontFamily: 'Dubai',
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.5))),
            ]),
          ]),
        ),
        // الحالة
        Icon(
          passed ? Icons.check_circle_rounded : Icons.cancel_rounded,
          color: statusColor,
          size: 20,
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
    final dateStr =
        DateFormat('d MMM yyyy', AppLanguage.intlCode).format(attempt.testedOn);
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Row(children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text('${attempt.attemptNo}',
                style: TextStyle(
                    color: color,
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai')),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(attempt.teacherName,
                style: const TextStyle(
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Dubai'),
                overflow: TextOverflow.ellipsis),
            Text(dateStr,
                style: TextStyle(
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai',
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5))),
          ]),
        ),
        if (attempt.score != null)
          Text('${attempt.score!.toStringAsFixed(0)}%',
              style: TextStyle(
                  color: color,
                  fontSize: FontSize.body,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Dubai')),
        const SizedBox(width: 8),
        Icon(
          passed ? Icons.check_circle_rounded : Icons.cancel_rounded,
          color: passed ? context.appColors.success : Colors.red,
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
      case JuzState.done:
        stateColor = context.appColors.brandPrimary;
        stateLabel = L10nGateway.current.completed;
        break;
      case JuzState.practice:
        stateColor = context.appColors.accentOrange;
        stateLabel = L10nGateway.current.inTrialTest;
        break;
      case JuzState.inProgress:
        stateColor = context.appColors.gold;
        stateLabel = L10nGateway.current.saving;
        break;
      case JuzState.notStarted:
        stateColor = Colors.grey;
        stateLabel = L10nGateway.current.notStarted;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            gradient:
                section.isCompleted ? context.appColors.gradientPrimary : null,
            color:
                section.isCompleted ? null : stateColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color:
                    stateColor.withValues(alpha: section.isCompleted ? 0 : 0.3),
                width: 1.5),
          ),
          child: Center(
            child: Text('${section.juzNumber}',
                style: TextStyle(
                    color: section.isCompleted ? Colors.white : stateColor,
                    fontSize: FontSize.headlineLarge,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Dubai')),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(section.juzName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Row(children: [
            Text(context.l10n.p(section.firstPage, section.lastPage),
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai')),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: BoxDecoration(
                  color: stateColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: stateColor.withValues(alpha: 0.3))),
              child: Text(stateLabel,
                  style: TextStyle(
                      color: stateColor,
                      fontSize: FontSize.caption,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Dubai')),
            ),
          ]),
        ])),
        const SizedBox(width: 8),
        AdminSheetCloseButton(onTap: () => Navigator.pop(context)),
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
      headerTitle: context.l10n.recitation,
      headerColor: context.appColors.brandPrimary,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Progress summary row
        Row(children: [
          Expanded(
              child: _MiniStat(
            label: context.l10n.heard,
            value: context.l10n.pages2(recitedPagesCount),
            color: context.appColors.brandPrimary,
          )),
          if (pendingCount > 0) ...[
            const SizedBox(width: 10),
            Expanded(
                child: _MiniStat(
              label: context.l10n.notHeardYet,
              value: context.l10n.pages2(pendingCount),
              color: context.appColors.dangerRed,
            )),
          ],
        ]),
        const SizedBox(height: 12),

        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: totalPages == 0 ? 0 : recitedPagesCount / totalPages,
            backgroundColor:
                context.appColors.dangerRed.withValues(alpha: 0.15),
            valueColor: AlwaysStoppedAnimation(context.appColors.primaryLight),
            minHeight: 6,
          ),
        ),
        const SizedBox(height: 16),

        // Pending pages chips (if any)
        if (pendingCount > 0) ...[
          _SubLabel(
            label: context.l10n.pagesNotYetHeard,
            color: context.appColors.dangerRed,
            count: pendingCount,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: section.pendingPages
                .map((p) => _PageChip(
                    label: L10nGateway.current.p2(p),
                    color: context.appColors.dangerRed))
                .toList(),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),
        ],

        // Recitation sessions
        if (section.sessions.isEmpty)
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(context.l10n.noRecitationSessionsYet,
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                    fontSize: FontSize.label,
                    fontFamily: 'Dubai')),
          ))
        else ...[
          _SubLabel(
              label: context.l10n.heardRecitationSessions,
              color: context.appColors.brandPrimary,
              count: section.sessions.length),
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
    final dateStr =
        DateFormat('d MMM yyyy', AppLanguage.intlCode).format(session.date);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: context.appColors.brandPrimary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: context.appColors.brandPrimary.withValues(alpha: 0.15)),
      ),
      child: Row(children: [
        // Page range badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            gradient: context.appColors.gradientPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(context.l10n.p(session.fromPage, session.toPage),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Dubai')),
        ),
        const SizedBox(width: 10),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(session.teacherName,
              style: const TextStyle(
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Dubai'),
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 2),
          Text(dateStr,
              style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.5),
                  fontSize: FontSize.caption,
                  fontFamily: 'Dubai')),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
              color: context.appColors.brandPrimary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8)),
          child: Text(context.l10n.p3(session.pageCount),
              style: TextStyle(
                  color: context.appColors.brandPrimary,
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Dubai')),
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
    final orange = context.appColors.accentOrange;
    return _Card(
      headerIcon: Icons.fact_check_rounded,
      headerTitle: context.l10n.trialTest,
      headerColor: orange,
      child: stages.isEmpty
          ? Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(context.l10n.trialTestNotStartedYet,
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.4),
                          fontSize: FontSize.label,
                          fontFamily: 'Dubai'))))
          : Column(children: stages.map((s) => _StageRow(stage: s)).toList()),
    );
  }
}

class _StageRow extends StatelessWidget {
  final PracticeExamStage stage;
  const _StageRow({required this.stage});

  @override
  Widget build(BuildContext context) {
    final orange = context.appColors.accentOrange;
    final dateStr =
        DateFormat('d MMM yyyy', AppLanguage.intlCode).format(stage.date);
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: orange.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: orange.withValues(alpha: 0.2)),
      ),
      child: Row(children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [context.appColors.accentOrange, Color(0xFFD35400)]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text('${stage.stageNumber}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.body,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Dubai'))),
        ),
        const SizedBox(width: 10),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(context.l10n.stage2(stage.stageNumber),
              style: const TextStyle(
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Dubai')),
          const SizedBox(height: 2),
          Row(children: [
            Icon(Icons.calendar_today_rounded,
                size: 11,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.4)),
            const SizedBox(width: 4),
            Text(dateStr,
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai')),
            const SizedBox(width: 10),
            Icon(Icons.error_outline_rounded,
                size: 11, color: orange.withValues(alpha: 0.7)),
            const SizedBox(width: 3),
            Text(context.l10n.errors(stage.errorCount),
                style: TextStyle(
                    color: orange,
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Dubai')),
          ]),
        ])),
        if (stage.wasRetaken)
          _StatusBadge(
              label: context.l10n.returned, color: context.appColors.dangerRed)
        else
          _StatusBadge(
              label: context.l10n.accepted,
              color: context.appColors.brandPrimary),
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
    final grade = exam.score >= 90
        ? context.l10n.excellent
        : exam.score >= 80
            ? context.l10n.veryGood
            : exam.score >= 70
                ? context.l10n.good
                : context.l10n.accepted;
    final gradeColor = exam.score >= 90
        ? context.appColors.brandPrimary
        : exam.score >= 80
            ? context.appColors.gold
            : context.appColors.accentOrange;
    final dateStr =
        DateFormat('d MMMM yyyy', AppLanguage.intlCode).format(exam.date);

    return _Card(
      headerIcon: Icons.workspace_premium_rounded,
      headerTitle: context.l10n.finalTest2,
      headerColor: purple,
      child: Row(children: [
        // Score circle
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [gradeColor.withValues(alpha: 0.8), gradeColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: gradeColor.withValues(alpha: 0.35), blurRadius: 14)
            ],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(exam.score.toStringAsFixed(0),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.headlineLarge,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Dubai')),
            Text('/ 100',
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.75),
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai')),
          ]),
        ),
        const SizedBox(width: 16),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: gradeColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: gradeColor.withValues(alpha: 0.3))),
            child: Text(grade,
                style: TextStyle(
                    color: gradeColor,
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai')),
          ),
          const SizedBox(height: 8),
          Row(children: [
            Icon(Icons.calendar_today_rounded,
                size: 13,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.4)),
            const SizedBox(width: 6),
            Text(dateStr,
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6),
                    fontSize: FontSize.caption,
                    fontFamily: 'Dubai')),
          ]),
          const SizedBox(height: 6),
          Row(children: [
            Icon(Icons.check_circle_rounded,
                size: 14, color: context.appColors.primaryLight),
            const SizedBox(width: 6),
            Text(context.l10n.passedTheTest,
                style: TextStyle(
                    color: context.appColors.primaryLight,
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Dubai')),
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
  const _Card(
      {required this.headerIcon,
      required this.headerTitle,
      required this.headerColor,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: headerColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(headerIcon, color: headerColor, size: 17),
          ),
          const SizedBox(width: 10),
          Text(headerTitle,
              style: TextStyle(
                  color: headerColor,
                  fontSize: FontSize.bodyLarge,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Dubai')),
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
  const _MiniStat(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.2))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(value,
            style: TextStyle(
                color: color,
                fontSize: FontSize.title,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dubai')),
        Text(label,
            style: TextStyle(
                color: color.withValues(alpha: 0.7),
                fontSize: FontSize.caption,
                fontFamily: 'Dubai')),
      ]),
    );
  }
}

class _SubLabel extends StatelessWidget {
  final String label;
  final Color color;
  final int count;
  const _SubLabel(
      {required this.label, required this.color, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(2))),
      const SizedBox(width: 7),
      Text(label,
          style: TextStyle(
              color: color,
              fontSize: FontSize.caption,
              fontWeight: FontWeight.w700,
              fontFamily: 'Dubai')),
      const SizedBox(width: 6),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Text('$count',
            style: TextStyle(
                color: color,
                fontSize: FontSize.caption,
                fontWeight: FontWeight.w700,
                fontFamily: 'Dubai')),
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
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.3))),
      child: Text(label,
          style: TextStyle(
              color: color,
              fontSize: FontSize.caption,
              fontWeight: FontWeight.w700,
              fontFamily: 'Dubai')),
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
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.35))),
      child: Text(label,
          style: TextStyle(
              color: color,
              fontSize: FontSize.caption,
              fontWeight: FontWeight.w700,
              fontFamily: 'Dubai')),
    );
  }
}
