import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';

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
  void initState() {
    super.initState();
    _bgCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..repeat(reverse: true);
    _cardCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _cardFade = CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOut);
    _cardSlide = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOutCubic));
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
      backgroundColor: AppColors.bgDeep,
      body: Stack(
        children: [
          _AnimatedBg(controller: _bgCtrl),
          SafeArea(
            child: Column(
              children: [
                _TopBar(onClose: () => Navigator.of(context).pop()),
                Expanded(
                  child: SingleChildScrollView(
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
                ),
              ],
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.bgDeep, Color(0xFF061A0A), AppColors.bgDeep],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              top: -60 + t * 30,
              right: -80,
              child: _Orb(size: 280, color: AppColors.primaryLight, opacity: 0.12 + t * 0.06),
            ),
            Positioned(
              bottom: 100 - t * 20,
              left: -60,
              child: _Orb(size: 220, color: AppColors.gold, opacity: 0.08 + t * 0.04),
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
        gradient: RadialGradient(colors: [color.withOpacity(opacity), Colors.transparent]),
      ),
    );
  }
}

// ─── Top Bar ──────────────────────────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  final VoidCallback onClose;
  const _TopBar({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: onClose,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: const Icon(Icons.close_rounded, color: Colors.white, size: 20),
            ),
          ),
          const Expanded(
            child: Text(
              'بطاقة الطالب',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                fontFamily: 'Cairo',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('يمكنك تصوير الشاشة لحفظ البطاقة كـ Pass', style: TextStyle(fontFamily: 'Cairo')),
                  backgroundColor: AppColors.primary,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppColors.gradientGold,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.4), blurRadius: 10)],
              ),
              child: const Icon(Icons.download_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
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
        gradient: const LinearGradient(
          colors: [Color(0xFF0D5016), Color(0xFF1A7A26), Color(0xFF2EA043)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 30, offset: const Offset(0, 10)),
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
                color: Colors.white.withOpacity(0.05),
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
                color: Colors.white.withOpacity(0.05),
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
                    const Icon(Icons.mosque_rounded, color: Colors.white, size: 18),
                    const SizedBox(width: 6),
                    const Text(
                      'مسجد الخير',
                      style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'بطاقة الطالب',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Cairo'),
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
                        gradient: AppColors.gradientGold,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.5), blurRadius: 16)],
                      ),
                      child: Center(
                        child: Text(
                          student.avatarInitials,
                          style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, fontFamily: 'Cairo'),
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
                            style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800, fontFamily: 'Cairo'),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            student.id,
                            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12, fontFamily: 'Cairo'),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.gold.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.gold.withOpacity(0.4)),
                            ),
                            child: Text(
                              student.groupName,
                              style: const TextStyle(color: AppColors.goldLight, fontSize: 11, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Divider
                Container(height: 1, color: Colors.white.withOpacity(0.15)),
                const SizedBox(height: 14),
                // Info row
                Row(
                  children: [
                    _CardInfoItem(label: 'المعلم', value: student.teacherName),
                    _CardInfoItem(label: 'العام الدراسي', value: student.academicYear),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _CardInfoItem(label: 'الدورة', value: student.courseName),
                    _CardInfoItem(
                      label: 'نسبة الحضور',
                      value: '${(data.attendanceRate * 100).toStringAsFixed(0)}%',
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
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10, fontFamily: 'Cairo')),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
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
    final present = data.attendanceRecords.where((r) => r.status == AttendanceStatus.present).length;
    final memorized = data.memorizationProgress.totalPagesMemorized;
    final completedJuz = data.memorizationProgress.sections.where((s) => s.isCompleted).length;
    final passedSabr = data.sabrRecords.where((s) => s.isPassed).length;

    final items = [
      (Icons.check_circle_rounded, '${(data.attendanceRate * 100).toStringAsFixed(0)}%', 'نسبة الحضور', AppColors.success),
      (Icons.calendar_today_rounded, '$present', 'أيام حضور', AppColors.primaryLight),
      (Icons.menu_book_rounded, '$memorized', 'صفحة محفوظة', AppColors.gold),
      (Icons.library_books_rounded, '$completedJuz', 'جزء مكتمل', AppColors.info),
      (Icons.star_rounded, '${data.totalPoints}', 'نقطة', AppColors.gold),
      (Icons.quiz_rounded, '$passedSabr', 'سبر ناجح', AppColors.primaryGlow),
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.1,
      children: items.map((item) => _StatTile(
        icon: item.$1,
        value: item.$2,
        label: item.$3,
        color: item.$4,
      )).toList(),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String value, label;
  final Color color;
  const _StatTile({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'Cairo')),
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 10, fontFamily: 'Cairo'), textAlign: TextAlign.center),
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
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.trending_up_rounded, color: AppColors.goldLight, size: 18),
              const SizedBox(width: 8),
              const Text(
                'تقدم الحفظ',
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
              ),
              const Spacer(),
              Text(
                '${(pct * 100).toStringAsFixed(1)}%',
                style: const TextStyle(color: AppColors.goldLight, fontSize: 14, fontWeight: FontWeight.w800, fontFamily: 'Cairo'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation(AppColors.gold),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${p.totalPagesMemorized} من ${p.totalQuranPages} صفحة • يحفظ حالياً: ${p.currentSurah}',
            style: TextStyle(color: Colors.white.withOpacity(0.55), fontSize: 11, fontFamily: 'Cairo'),
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
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.quiz_rounded, color: AppColors.goldLight, size: 18),
              SizedBox(width: 8),
              Text(
                'آخر نتائج السبر',
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...recent.map((r) {
            final color = r.type == SabrType.trial
                ? AppColors.info
                : r.type == SabrType.final_
                    ? AppColors.primaryLight
                    : AppColors.gold;
            final typeLabel = r.type == SabrType.trial
                ? 'تجريبي'
                : r.type == SabrType.final_
                    ? 'نهائي'
                    : 'أوقاف';
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Text(typeLabel, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo')),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      r.title,
                      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, fontFamily: 'Cairo'),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${r.score.toStringAsFixed(0)}%',
                    style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w800, fontFamily: 'Cairo'),
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
        color: AppColors.gold.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline_rounded, color: AppColors.goldLight, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'يمكنك تصوير الشاشة لحفظ بطاقتك كـ Pass لاستخدامها في الحلقة.',
              style: TextStyle(color: AppColors.goldLight, fontSize: 12, fontFamily: 'Cairo', height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
