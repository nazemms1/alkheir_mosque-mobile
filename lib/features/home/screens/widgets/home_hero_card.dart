part of '../home_screen.dart';

class _HeroCard extends StatelessWidget {
  final ChildData child;
  const _HeroCard({required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 230,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF060E08),
                Color(0xFF0A2C10),
                Color(0xFF0D5016),
                Color(0xFF1A7A26),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -50,
                left: -50,
                child: _DecorCircle(
                    size: 200, color: AppColors.primaryLight, opacity: 0.07),
              ),
              Positioned(
                bottom: -30,
                right: -40,
                child: _DecorCircle(
                    size: 170, color: AppColors.gold, opacity: 0.06),
              ),
              Positioned(
                top: 30,
                right: size.width * 0.3,
                child:
                    _DecorCircle(size: 90, color: Colors.white, opacity: 0.03),
              ),
              Positioned(
                bottom: 20,
                left: size.width * 0.4,
                child: _DecorCircle(
                    size: 60, color: AppColors.goldLight, opacity: 0.05),
              ),
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
        const SizedBox(height: 230),
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
            color: AppColors.gold.withOpacity(0.18),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.gold.withOpacity(0.35)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.waving_hand_rounded, color: AppColors.gold, size: 12),
              SizedBox(width: 5),
              Text('أهلاً بك',
                  style: TextStyle(
                    color: AppColors.goldLight,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cairo',
                  )),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'ولي أمر\n${child.student.name.split(' ').take(2).join(' ')}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            fontFamily: 'Cairo',
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
                icon: Icons.calendar_today_rounded, label: 'السنة ٢٠٢٥-٢٠٢٦'),
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
              color: AppColors.gold.withOpacity(0.5),
              blurRadius: 22,
              spreadRadius: 3),
        ],
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            fontFamily: 'Cairo',
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
                fontSize: 10,
                fontFamily: 'Cairo',
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
            color: const Color(0xFF0D5016).withOpacity(0.15),
            blurRadius: 32,
            spreadRadius: -4,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              label: 'النقاط',
              icon: Icons.star_rounded,
              color: AppColors.gold),
          _Vdivider(),
          _MiniStat(
              value: pct,
              label: 'الحضور',
              icon: Icons.check_circle_rounded,
              color: AppColors.success),
          _Vdivider(),
          _MiniStat(
            value: '${child.memorizationProgress.totalPagesMemorized}',
            label: 'صفحة محفوظة',
            icon: Icons.menu_book_rounded,
            color: AppColors.primaryLight,
          ),
          _Vdivider(),
          _MiniStat(
              value: '${child.absenceCount}',
              label: 'غيابات',
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
                color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(height: 5),
          Text(value,
              style: TextStyle(
                  color: color,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Cairo')),
          Text(label,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 10,
                  fontFamily: 'Cairo')),
        ],
      ),
    );
  }
}

class _Vdivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Builder(builder: (context) => Container(width: 1, height: 44, color: Theme.of(context).dividerColor));
}
