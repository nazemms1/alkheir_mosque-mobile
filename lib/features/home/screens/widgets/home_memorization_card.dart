part of '../home_screen.dart';

class _MemorizationCard extends StatelessWidget {
  final ChildData child;
  final VoidCallback onTap;
  const _MemorizationCard({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final p = child.memorizationProgress;
    final pct = p.percentage.clamp(0.0, 1.0);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF071A0A), Color(0xFF0D4515), Color(0xFF1A6622)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 30, spreadRadius: -4, offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10, offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(bottom: -30, left: -30,
                child: _DecorCircle(size: 140, color: AppColors.gold, opacity: 0.07)),
            Positioned(top: -20, right: -20,
                child: _DecorCircle(size: 80, color: AppColors.primaryLight, opacity: 0.06)),
            Column(
              children: [
                _MemCardHeader(p: p, pct: pct),
                if (p.sections.isNotEmpty) _MemCardLastSection(p: p),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MemCardHeader extends StatelessWidget {
  final MemorizationProgress p;
  final double pct;
  const _MemCardHeader({required this.p, required this.pct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.gold.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.gold.withOpacity(0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.auto_awesome_rounded, color: AppColors.gold, size: 12),
                    SizedBox(width: 5),
                    Text('تقدم الحفظ',
                        style: TextStyle(
                          color: AppColors.goldLight, fontSize: 11,
                          fontWeight: FontWeight.w700, fontFamily: 'Cairo',
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(p.currentSurah,
                  style: const TextStyle(
                    color: Colors.white, fontSize: 19,
                    fontWeight: FontWeight.w800, fontFamily: 'Cairo',
                  )),
              const SizedBox(height: 4),
              Text(
                'الجزء ${p.currentJuz}  •  ${p.totalPagesMemorized} من ${p.totalQuranPages} صفحة',
                style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 12, fontFamily: 'Cairo'),
              ),
              const SizedBox(height: 18),
              _GlowProgressBar(pct: pct),
              const SizedBox(height: 8),
              Text('${(pct * 100).toStringAsFixed(1)}% من القرآن الكريم',
                  style: const TextStyle(
                    color: AppColors.goldLight, fontSize: 12,
                    fontWeight: FontWeight.w600, fontFamily: 'Cairo',
                  )),
            ],
          ),
        ),
        const SizedBox(width: 20),
        _MemCircularIndicator(pct: pct),
      ],
    );
  }
}

class _GlowProgressBar extends StatelessWidget {
  final double pct;
  const _GlowProgressBar({required this.pct});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        FractionallySizedBox(
          widthFactor: pct,
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              gradient: AppColors.gradientGold,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.7), blurRadius: 10)],
            ),
          ),
        ),
      ],
    );
  }
}

class _MemCircularIndicator extends StatelessWidget {
  final double pct;
  const _MemCircularIndicator({required this.pct});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 52,
      lineWidth: 8,
      percent: pct,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${(pct * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                color: Colors.white, fontSize: 15,
                fontWeight: FontWeight.w800, fontFamily: 'Cairo',
              )),
          Text('مكتمل',
              style: TextStyle(
                color: Colors.white.withOpacity(0.55),
                fontSize: 9, fontFamily: 'Cairo',
              )),
        ],
      ),
      progressColor: AppColors.gold,
      backgroundColor: Colors.white.withOpacity(0.12),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

class _MemCardLastSection extends StatelessWidget {
  final MemorizationProgress p;
  const _MemCardLastSection({required this.p});

  @override
  Widget build(BuildContext context) {
    // Find the most recent section that has recited pages
    final active = p.sections.lastWhere(
      (s) => s.sessions.isNotEmpty,
      orElse: () => p.sections.last,
    );
    final lastSession = active.sessions.isNotEmpty ? active.sessions.last : null;
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(height: 1, color: Colors.white.withOpacity(0.1)),
        const SizedBox(height: 14),
        Row(
          children: [
            Icon(Icons.history_rounded, color: Colors.white.withOpacity(0.55), size: 14),
            const SizedBox(width: 6),
            Text('آخر تلاوة: ',
                style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 12, fontFamily: 'Cairo')),
            Expanded(
              child: Text(
                lastSession != null
                    ? 'ص ${lastSession.fromPage}–${lastSession.toPage} — ${active.juzName}'
                    : active.juzName,
                style: const TextStyle(
                  color: Colors.white, fontSize: 12,
                  fontWeight: FontWeight.w600, fontFamily: 'Cairo',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
