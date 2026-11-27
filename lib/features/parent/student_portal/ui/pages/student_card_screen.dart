import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/widgets/geometric_pattern.dart';
import 'package:alkheir_mosque/app/core/utils/reduced_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';

class StudentCardScreen extends StatefulWidget {
  final StudentDashboardData data;
  const StudentCardScreen({super.key, required this.data});

  @override
  State<StudentCardScreen> createState() => _StudentCardScreenState();
}

class _StudentCardScreenState extends State<StudentCardScreen>
    with TickerProviderStateMixin {
  late final AnimationController _bgCtrl;
  late final AnimationController _cardCtrl;
  late final Animation<double> _cardFade;
  late final Animation<Offset> _cardSlide;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bgCtrl.respectReducedMotion(context);
  }

  @override
  void initState() {
    super.initState();
    _bgCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..repeat(reverse: true);
    _cardCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _cardFade = CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOut);
    _cardSlide = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOutCubic));
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) _cardCtrl.forward();
    });
  }

  @override
  void dispose() {
    _bgCtrl.dispose();
    _cardCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.data.student;
    return Scaffold(
      backgroundColor: context.appColors.bgDeep,
      appBar: AdminAppBar(
        title: context.l10n.studentCard,
        subtitle: s.name,
        actions: [
          AdminActionItem(
            icon: Icons.download_rounded,
            tooltip: context.l10n.saveAsPass,
            onTap: () {
              HapticFeedback.lightImpact();
              showAppSnack(
                context,
                L10nGateway.current.youCanTakeAScreenshot,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          _AnimatedBg(controller: _bgCtrl),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: FadeTransition(
              opacity: _cardFade,
              child: SlideTransition(
                position: _cardSlide,
                child: Column(
                  children: [
                    _IDCard(student: s, data: widget.data),
                    const SizedBox(height: 20),
                    _StatsGrid(data: widget.data),
                    const SizedBox(height: 20),
                    _ProgressSection(data: widget.data),
                    const SizedBox(height: 20),
                    _RecentSabr(records: widget.data.sabrRecords),
                    const SizedBox(height: 20),
                    _SavePassHint(),
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

// ─── Animated Background ──────────────────────────────────────────────────────
class _AnimatedBg extends StatelessWidget {
  final AnimationController controller;
  const _AnimatedBg({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final t = controller.value;
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.appColors.bgDeep,
                    Color(0xFF061A0A),
                    context.appColors.bgDeep
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            const Positioned.fill(child: GeometricPattern(opacity: 0.04)),
            Positioned(
              top: -60 + t * 30,
              right: -80,
              child: _Orb(
                  size: 280,
                  color: context.appColors.primaryLight,
                  opacity: 0.12 + t * 0.06),
            ),
          ],
        );
      },
    );
  }
}

class _Orb extends StatelessWidget {
  final double size, opacity;
  final Color color;
  const _Orb({required this.size, required this.color, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
            colors: [color.withValues(alpha: opacity), Colors.transparent]),
      ),
    );
  }
}

// ─── ID Card ─────────────────────────────────────────────────────────────────
class _IDCard extends StatelessWidget {
  final StudentModel student;
  final StudentDashboardData data;
  const _IDCard({required this.student, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.brandDeep,
            context.appColors.brandGreen,
            context.appColors.successGreen
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: context.appColors.brandPrimary.withValues(alpha: 0.5),
              blurRadius: 30,
              offset: const Offset(0, 10)),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -30,
            left: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const Icon(Icons.mosque_rounded,
                        color: Colors.white, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      context.l10n.alKhairMosque,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.label,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Dubai'),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        context.l10n.studentCard,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: FontSize.caption,
                            fontFamily: 'Dubai'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Avatar + Name
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: context.appColors.gradientGold,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color:
                                  context.appColors.gold.withValues(alpha: 0.5),
                              blurRadius: 16)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          student.avatarInitials,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.headlineLarge,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Dubai'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: FontSize.headlineSmall,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Dubai'),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            student.id,
                            style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6),
                                fontSize: FontSize.caption,
                                fontFamily: 'Dubai'),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: context.appColors.gold
                                  .withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: context.appColors.gold
                                      .withValues(alpha: 0.4)),
                            ),
                            child: Text(
                              student.groupName,
                              style: TextStyle(
                                  color: context.appColors.goldLight,
                                  fontSize: FontSize.caption,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Dubai'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Divider
                Container(
                    height: 1, color: Colors.white.withValues(alpha: 0.15)),
                const SizedBox(height: 14),
                // Info row
                Row(
                  children: [
                    _CardInfoItem(
                        label: context.l10n.teacher,
                        value: student.teacherName),
                    _CardInfoItem(
                        label: context.l10n.academicYear2,
                        value: student.academicYear),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _CardInfoItem(
                        label: context.l10n.course3, value: student.courseName),
                    _CardInfoItem(
                      label: context.l10n.attendanceRate,
                      value:
                          '${(data.attendanceRate * 100).toStringAsFixed(0)}%',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardInfoItem extends StatelessWidget {
  final String label, value;
  const _CardInfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: FontSize.caption,
                  fontFamily: 'Dubai')),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Dubai')),
        ],
      ),
    );
  }
}

// ─── Stats Grid ───────────────────────────────────────────────────────────────
class _StatsGrid extends StatelessWidget {
  final StudentDashboardData data;
  const _StatsGrid({required this.data});

  @override
  Widget build(BuildContext context) {
    final present = data.attendanceRecords
        .where((r) => r.status == AttendanceStatus.present)
        .length;
    final memorized = data.memorizationProgress.totalPagesMemorized;
    final completedJuz =
        data.memorizationProgress.sections.where((s) => s.isCompleted).length;
    final passedSabr = data.sabrRecords.where((s) => s.isPassed).length;

    final items = [
      (
        Icons.check_circle_rounded,
        '${(data.attendanceRate * 100).toStringAsFixed(0)}%',
        context.l10n.attendanceRate,
        context.appColors.success
      ),
      (
        Icons.calendar_today_rounded,
        '$present',
        context.l10n.attendanceDays2,
        context.appColors.primaryLight
      ),
      (
        Icons.menu_book_rounded,
        '$memorized',
        context.l10n.savedPage,
        context.appColors.gold
      ),
      (
        Icons.library_books_rounded,
        '$completedJuz',
        context.l10n.juzCompleted,
        context.appColors.info
      ),
      (
        Icons.star_rounded,
        '${data.totalPoints}',
        context.l10n.point,
        context.appColors.gold
      ),
      (
        Icons.quiz_rounded,
        '$passedSabr',
        context.l10n.passedTest,
        context.appColors.primaryGlow
      ),
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.1,
      children: items
          .map((item) => _StatTile(
                icon: item.$1,
                value: item.$2,
                label: item.$3,
                color: item.$4,
              ))
          .toList(),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String value, label;
  final Color color;
  const _StatTile(
      {required this.icon,
      required this.value,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                  color: color,
                  fontSize: FontSize.headlineSmall,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Dubai')),
          Text(label,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.55),
                  fontSize: FontSize.caption,
                  fontFamily: 'Dubai'),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// ─── Progress Section ─────────────────────────────────────────────────────────
class _ProgressSection extends StatelessWidget {
  final StudentDashboardData data;
  const _ProgressSection({required this.data});

  @override
  Widget build(BuildContext context) {
    final p = data.memorizationProgress;
    final pct = p.percentage.clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.trending_up_rounded,
                  color: context.appColors.goldLight, size: 18),
              const SizedBox(width: 8),
              Text(
                context.l10n.memorizationProgress,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dubai'),
              ),
              const Spacer(),
              Text(
                '${(pct * 100).toStringAsFixed(1)}%',
                style: TextStyle(
                    color: context.appColors.goldLight,
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation(context.appColors.gold),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.ofPagesCurrentlyMemorizing(
                p.totalPagesMemorized, p.totalQuranPages, p.currentSurah),
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55),
                fontSize: FontSize.caption,
                fontFamily: 'Dubai'),
          ),
        ],
      ),
    );
  }
}

// ─── Recent Sabr ─────────────────────────────────────────────────────────────
class _RecentSabr extends StatelessWidget {
  final List<SabrRecord> records;
  const _RecentSabr({required this.records});

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) return const SizedBox.shrink();
    final recent = records.take(3).toList();
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.quiz_rounded,
                  color: context.appColors.goldLight, size: 18),
              const SizedBox(width: 8),
              Text(
                context.l10n.recentTestResults,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dubai'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...recent.map((r) {
            final color = r.type == SabrType.trial
                ? context.appColors.info
                : r.type == SabrType.final_
                    ? context.appColors.primaryLight
                    : context.appColors.gold;
            final typeLabel = r.type == SabrType.trial
                ? L10nGateway.current.trial
                : r.type == SabrType.final_
                    ? L10nGateway.current.tFinal
                    : L10nGateway.current.awqaf;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: color.withValues(alpha: 0.3)),
                    ),
                    child: Text(typeLabel,
                        style: TextStyle(
                            color: color,
                            fontSize: FontSize.caption,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Dubai')),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      r.title,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: FontSize.caption,
                          fontFamily: 'Dubai'),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${r.score.toStringAsFixed(0)}%',
                    style: TextStyle(
                        color: color,
                        fontSize: FontSize.label,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Dubai'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ─── Save Pass Hint ───────────────────────────────────────────────────────────
class _SavePassHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.appColors.gold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: context.appColors.gold.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded,
              color: context.appColors.goldLight, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              context.l10n.takeAScreenshotToSave,
              style: TextStyle(
                  color: context.appColors.goldLight,
                  fontSize: FontSize.caption,
                  fontFamily: 'Dubai',
                  height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
