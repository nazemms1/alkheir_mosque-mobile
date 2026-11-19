part of '../screens/home_screen.dart';

class _HeroCard extends StatelessWidget {
  final ChildData child;
  const _HeroCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 230),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.surfaceBlackGreen,
                Color(0xFF0A2C10),
                AppColors.brandDeep,
                AppColors.brandGreen,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Stack(
            children: [
              const Positioned.fill(child: GeometricPattern(opacity: 0.05)),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 70),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _HeroContent(child: child)),
                    _HeroAvatar(initials: child.student.avatarInitials),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -48,
          left: 16,
          right: 16,
          child: _FloatingStatsRow(child: child),
        ),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  final ChildData child;
  const _HeroContent({required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.waving_hand_rounded,
                  color: Colors.white, size: 14),
              const SizedBox(width: 5),
              Text(tr('أهلاً بك'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dubai',
                  )),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          trf('ولي أمر\n{0}',
              [child.student.name.split(' ').take(2).join(' ')]),
          style: const TextStyle(
            color: Colors.white,
            fontSize: FontSize.headlineLarge,
            fontWeight: FontWeight.w800,
            fontFamily: 'Dubai',
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _HeroBadge(
                icon: Icons.groups_rounded, label: child.student.groupName),
            const SizedBox(width: 8),
            _HeroBadge(
                icon: Icons.calendar_today_rounded,
                label: child.student.academicYear.isNotEmpty
                    ? child.student.academicYear
                    : tr('السنة ٢٠٢٥-٢٠٢٦')),
          ],
        ),
      ],
    );
  }
}

class _HeroAvatar extends StatelessWidget {
  final String initials;
  const _HeroAvatar({required this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.gradientGold,
        boxShadow: [
          BoxShadow(
              color: AppColors.gold.withValues(alpha: 0.5),
              blurRadius: 22,
              spreadRadius: 3),
        ],
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            color: Colors.white,
            fontSize: FontSize.headline,
            fontWeight: FontWeight.w800,
            fontFamily: 'Dubai',
          ),
        ),
      ),
    );
  }
}

class _HeroBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  const _HeroBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: FontSize.caption,
                fontFamily: 'Dubai',
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class _FloatingStatsRow extends StatelessWidget {
  final ChildData child;
  const _FloatingStatsRow({required this.child});

  @override
  Widget build(BuildContext context) {
    final pct = '${(child.attendanceRate * 100).toStringAsFixed(0)}%';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.brandDeep.withValues(alpha: 0.15),
            blurRadius: 32,
            spreadRadius: -4,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.5),
      ),
      child: Row(
        children: [
          _MiniStat(
              value: '${child.totalPoints}',
              label: tr('النقاط'),
              icon: Icons.star_rounded,
              color: AppColors.gold),
          _Vdivider(),
          _MiniStat(
              value: pct,
              label: tr('الحضور'),
              icon: Icons.check_circle_rounded,
              color: AppColors.success),
          _Vdivider(),
          _MiniStat(
            value: '${child.memorizationProgress.totalPagesMemorized}',
            label: tr('صفحة محفوظة'),
            icon: Icons.menu_book_rounded,
            color: AppColors.primaryLight,
          ),
          _Vdivider(),
          _MiniStat(
              value: '${child.absenceCount}',
              label: tr('غيابات'),
              icon: Icons.event_busy_rounded,
              color: AppColors.error),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String value, label;
  final IconData icon;
  final Color color;
  const _MiniStat(
      {required this.value,
      required this.label,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(height: 5),
          Text(value,
              style: TextStyle(
                  color: color,
                  fontSize: FontSize.bodyLarge,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Dubai')),
          Text(label,
              style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.5),
                  fontSize: FontSize.caption,
                  fontFamily: 'Dubai')),
        ],
      ),
    );
  }
}

class _Vdivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Builder(
      builder: (context) => Container(
          width: 1, height: 44, color: Theme.of(context).dividerColor));
}
