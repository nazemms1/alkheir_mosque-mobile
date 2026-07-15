part of '../attendance_screen.dart';

class _SummaryHero extends StatelessWidget {
  final int present, absent, late, excused, excusedEarlyDep, excusedAbsence, total;
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF060E08), Color(0xFF0A2C10), Color(0xFF0D5016), Color(0xFF1A7A26)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: -40, left: -40,
              child: _Orb(size: 180, color: AppColors.primaryLight, opacity: 0.07)),
          Positioned(bottom: -20, right: -30,
              child: _Orb(size: 160, color: AppColors.gold, opacity: 0.06)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _HeroStats(pct: pct, total: total, rate: rate)),
                    _ArcProgress(rate: rate),
                  ],
                ),
                const SizedBox(height: 22),
                _GlowBar(rate: rate),
                const SizedBox(height: 22),
                // Row 1: حضور / غياب / تأخر
                Row(
                  children: [
                    _StatPill(label: 'حضور', value: present, color: AppColors.attPresent,  icon: Icons.check_circle_rounded),
                    _StatPill(label: 'غياب', value: absent,  color: AppColors.attAbsent,   icon: Icons.cancel_rounded),
                    _StatPill(label: 'تأخر', value: late,    color: AppColors.attLate,      icon: Icons.access_time_rounded),
                  ],
                ),
                const SizedBox(height: 8),
                // Row 2: بعذر / انصراف مبكر / غياب بعذر
                Row(
                  children: [
                    _StatPill(label: 'بعذر',         value: excused,        color: AppColors.attExcused,         icon: Icons.info_rounded),
                    _StatPill(label: 'انصراف مبكر',  value: excusedEarlyDep, color: AppColors.attExcusedEarlyDep, icon: Icons.directions_run_rounded),
                    _StatPill(label: 'غياب بعذر',    value: excusedAbsence,  color: AppColors.attExcusedAbsence,  icon: Icons.event_busy_rounded),
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
  const _HeroStats({required this.pct, required this.total, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Text('سجل الحضور',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 11, fontFamily: 'Cairo', fontWeight: FontWeight.w600,
              )),
        ),
        const SizedBox(height: 10),
        Text('نسبة الحضور',
            style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 13, fontFamily: 'Cairo')),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (b) => AppColors.gradientGold.createShader(b),
          child: Text(
            '$pct%',
            style: const TextStyle(
              color: Colors.white, fontSize: 52,
              fontWeight: FontWeight.w900, fontFamily: 'Cairo', height: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text('من إجمالي $total يوم دراسي',
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12, fontFamily: 'Cairo')),
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
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        FractionallySizedBox(
          widthFactor: rate.clamp(0.0, 1.0),
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              gradient: AppColors.gradientGold,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.7), blurRadius: 10)],
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
        painter: _ArcPainter(rate: rate.clamp(0.0, 1.0)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(rate * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    color: Colors.white, fontSize: 18,
                    fontWeight: FontWeight.w800, fontFamily: 'Cairo',
                  )),
              Text('الحضور',
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10, fontFamily: 'Cairo')),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double rate;
  const _ArcPainter({required this.rate});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 7;
    const startAngle = -3.14159 / 2;
    final sweepAngle = 2 * 3.14159 * rate;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(center, radius,
        Paint()
          ..color = Colors.white.withOpacity(0.12)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8);
    if (rate > 0) {
      canvas.drawArc(rect, startAngle, sweepAngle, false,
          Paint()
            ..shader = const LinearGradient(
              colors: [AppColors.gold, AppColors.goldLight],
            ).createShader(rect)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 8
            ..strokeCap = StrokeCap.round);
    }
  }

  @override
  bool shouldRepaint(_ArcPainter old) => old.rate != rate;
}

class _StatPill extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  final IconData icon;
  const _StatPill({required this.label, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.35), width: 1.5),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 15),
            const SizedBox(height: 3),
            Text('$value',
                style: TextStyle(
                  color: color, fontSize: 18,
                  fontWeight: FontWeight.w900, fontFamily: 'Cairo',
                )),
            Text(label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 10, fontFamily: 'Cairo',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
