part of '../pages/attendance_screen.dart';

class _SummaryHero extends StatelessWidget {
  final int present,
      absent,
      late,
      excused,
      excusedEarlyDep,
      excusedAbsence,
      total;
  final double rate;
  const _SummaryHero({
    required this.present,
    required this.absent,
    required this.late,
    required this.excused,
    required this.excusedEarlyDep,
    required this.excusedAbsence,
    required this.total,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (rate * 100).toStringAsFixed(1);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceBlackGreen,
            Color(0xFF0A2C10),
            context.appColors.brandDeep,
            context.appColors.brandGreen
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: GeometricPattern(opacity: 0.05)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: _HeroStats(pct: pct, total: total, rate: rate)),
                    _ArcProgress(rate: rate),
                  ],
                ),
                const SizedBox(height: 22),
                _GlowBar(rate: rate),
                const SizedBox(height: 22),
                // Row 1: حضور / غياب / تأخر
                Row(
                  children: [
                    _StatPill(
                        label: context.l10n.present2,
                        value: present,
                        color: context.appColors.attPresent,
                        icon: Icons.check_circle_rounded),
                    _StatPill(
                        label: context.l10n.absent2,
                        value: absent,
                        color: context.appColors.attAbsent,
                        icon: Icons.cancel_rounded),
                    _StatPill(
                        label: context.l10n.late3,
                        value: late,
                        color: context.appColors.attLate,
                        icon: Icons.access_time_rounded),
                  ],
                ),
                const SizedBox(height: 8),
                // Row 2: بعذر / انصراف مبكر / غياب بعذر
                Row(
                  children: [
                    _StatPill(
                        label: context.l10n.excused,
                        value: excused,
                        color: context.appColors.attExcused,
                        icon: Icons.info_rounded),
                    _StatPill(
                        label: context.l10n.earlyDeparture,
                        value: excusedEarlyDep,
                        color: context.appColors.attExcusedEarlyDep,
                        icon: Icons.directions_run_rounded),
                    _StatPill(
                        label: context.l10n.excusedAbsence,
                        value: excusedAbsence,
                        color: context.appColors.attExcusedAbsence,
                        icon: Icons.event_busy_rounded),
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

class _HeroStats extends StatelessWidget {
  final String pct;
  final int total;
  final double rate;
  const _HeroStats(
      {required this.pct, required this.total, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: Text(context.l10n.attendanceLog,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: FontSize.caption,
                fontFamily: 'Dubai',
                fontWeight: FontWeight.w600,
              )),
        ),
        const SizedBox(height: 10),
        Text(context.l10n.attendanceRate,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.65),
                fontSize: FontSize.label,
                fontFamily: 'Dubai')),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (b) => context.appColors.gradientGold.createShader(b),
          child: Text(
            '$pct%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: FontSize.hero,
              fontWeight: FontWeight.w900,
              fontFamily: 'Dubai',
              height: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(context.l10n.outOfSchoolDays(total),
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: FontSize.caption,
                fontFamily: 'Dubai')),
      ],
    );
  }
}

class _GlowBar extends StatelessWidget {
  final double rate;
  const _GlowBar({required this.rate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        FractionallySizedBox(
          widthFactor: rate.clamp(0.0, 1.0),
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              gradient: context.appColors.gradientGold,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                    color: context.appColors.gold.withValues(alpha: 0.7),
                    blurRadius: 10)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ArcProgress extends StatelessWidget {
  final double rate;
  const _ArcProgress({required this.rate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: CustomPaint(
        painter: _ArcPainter(
          rate: rate.clamp(0.0, 1.0),
          gold: context.appColors.gold,
          goldLight: context.appColors.goldLight,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(rate * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.headlineSmall,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai',
                  )),
              Text(context.l10n.attendance,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: FontSize.caption,
                      fontFamily: 'Dubai')),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double rate;
  final Color gold;
  final Color goldLight;
  const _ArcPainter(
      {required this.rate, required this.gold, required this.goldLight});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 7;
    const startAngle = -3.14159 / 2;
    final sweepAngle = 2 * 3.14159 * rate;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = Colors.white.withValues(alpha: 0.12)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8);
    if (rate > 0) {
      canvas.drawArc(
          rect,
          startAngle,
          sweepAngle,
          false,
          Paint()
            ..shader = LinearGradient(
              colors: [gold, goldLight],
            ).createShader(rect)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 8
            ..strokeCap = StrokeCap.round);
    }
  }

  @override
  bool shouldRepaint(_ArcPainter old) =>
      old.rate != rate || old.gold != gold || old.goldLight != goldLight;
}

class _StatPill extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  final IconData icon;
  const _StatPill(
      {required this.label,
      required this.value,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.35), width: 1.5),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 15),
            const SizedBox(height: 3),
            Text('$value',
                style: TextStyle(
                  color: color,
                  fontSize: FontSize.headlineSmall,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Dubai',
                )),
            Text(label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: FontSize.caption,
                  fontFamily: 'Dubai',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
