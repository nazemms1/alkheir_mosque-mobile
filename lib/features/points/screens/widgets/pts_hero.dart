part of '../points_screen.dart';

class _PointsHero extends StatelessWidget {
  final int total;
  final List<PointRecord> records;
  const _PointsHero({required this.total, required this.records});

  @override
  Widget build(BuildContext context) {
    final bonus  = records.where((r) => r.isBonus).fold<int>(0, (s, r) => s + r.points);
    final earned = records.where((r) => !r.isBonus).fold<int>(0, (s, r) => s + r.points);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.bgDeep, Color(0xFF1A3D0A), Color(0xFF0D4515)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
      child: Column(
        children: [
          _ScoreRow(total: total),
          const SizedBox(height: 20),
          Row(
            children: [
              _MiniStatCard(icon: Icons.menu_book_rounded,     label: 'نقاط الحفظ',    value: '$earned', color: AppColors.primaryGlow),
              const SizedBox(width: 10),
              _MiniStatCard(icon: Icons.card_giftcard_rounded, label: 'نقاط المكافآت', value: '$bonus',  color: AppColors.gold),
              const SizedBox(width: 10),
              _MiniStatCard(icon: Icons.receipt_long_rounded,  label: 'عدد الإدخالات', value: '${records.length}', color: AppColors.info),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScoreRow extends StatelessWidget {
  final int total;
  const _ScoreRow({required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [AppColors.gold.withOpacity(0.3), Colors.transparent],
                ),
              ),
            ),
            Container(
              width: 60, height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.gradientGold,
                boxShadow: [
                  BoxShadow(color: AppColors.gold.withOpacity(0.5), blurRadius: 20, spreadRadius: 2),
                ],
              ),
              child: const Icon(Icons.star_rounded, color: Colors.white, size: 32),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (b) => AppColors.gradientGold.createShader(b),
              child: Text(
                '$total',
                style: const TextStyle(
                  color: Colors.white, fontSize: 52,
                  fontWeight: FontWeight.w900, fontFamily: 'Cairo', height: 1,
                ),
              ),
            ),
            Text(
              'إجمالي النقاط',
              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14, fontFamily: 'Cairo'),
            ),
          ],
        ),
      ],
    );
  }
}

class _MiniStatCard extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final Color color;
  const _MiniStatCard({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 5),
            Text(value,
                style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'Cairo')),
            Text(label,
                style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10, fontFamily: 'Cairo'),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
