import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/app/core/utils/reduced_motion.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/app/core/session/auth_session.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/brand_logo.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late AnimationController _progressController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _rotationController.respectReducedMotion(context);
    _pulseController.respectReducedMotion(context);
  }

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..forward();

    Future.delayed(const Duration(milliseconds: 3400), _navigateToLogin);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _navigateToLogin() async {
    if (!mounted) return;
    // استرجاع الجلسة المحفوظة إلى المزوّد المركزي قبل الدخول للتطبيق
    final restored = await ref.read(authSessionProvider.notifier).restore();
    // تحديث الصلاحيات من الخادم قبل فتح التطبيق؛ عند تعذّر الاتصال تبقى الجلسة المحفوظة.
    final token = restored == null
        ? null
        : await ref.read(authSessionProvider.notifier).refreshFromServer();
    if (!mounted) return;
    if (token != null) {
      context.go(AppRoutes.mainShellRoute, extra: token);
    } else {
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.appColors.bgDeep,
      body: Stack(
        children: [
          // ── خلفية متدرجة ──
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.appColors.surfaceBlackGreen,
                    context.appColors.brandDeep,
                    context.appColors.surfaceBlackGreen,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          Center(
            child: AnimatedBuilder(
              animation: _rotationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationController.value * 2 * math.pi,
                  child: child,
                );
              },
              child: SizedBox(
                width: size.width * 0.85,
                height: size.width * 0.85,
                child: CustomPaint(
                  painter: _IslamicRingPainter(context.appColors.successGreen),
                ),
              ),
            ),
          ),

          Center(
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (context, _) {
                final glow = 0.3 + _pulseController.value * 0.4;
                return Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: context.appColors.primaryGlow
                            .withValues(alpha: glow * 0.5),
                        blurRadius: 80,
                        spreadRadius: 20,
                      ),
                      BoxShadow(
                        color: context.appColors.gold
                            .withValues(alpha: glow * 0.25),
                        blurRadius: 50,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ── الشعار / الأيقونة المركزية ──
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // شعار المسجد
                const BrandLogo(size: 136)
                    .animate()
                    .scale(
                      begin: const Offset(0.4, 0.4),
                      end: const Offset(1.0, 1.0),
                      duration: 800.ms,
                      curve: Curves.elasticOut,
                    )
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 28),

                // اسم التطبيق
                Text(
                  context.l10n.alKhairMosque,
                  style: appTextStyle(
                    fontSize: FontSize.displayLarge,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ).animate().fadeIn(delay: 500.ms, duration: 700.ms).slideY(
                      begin: 0.3,
                      end: 0,
                      delay: 500.ms,
                      duration: 700.ms,
                      curve: Curves.easeOut,
                    ),

                const SizedBox(height: 8),

                // الشعار الفرعي
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFD4A843), Color(0xFFFFD97D)],
                  ).createShader(bounds),
                  child: Text(
                    context.l10n.educationalPortal,
                    style: appTextStyle(
                      fontSize: FontSize.bodyLarge,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.8,
                    ),
                  ),
                ).animate().fadeIn(delay: 750.ms, duration: 700.ms).slideY(
                      begin: 0.3,
                      end: 0,
                      delay: 750.ms,
                      duration: 700.ms,
                      curve: Curves.easeOut,
                    ),
              ],
            ),
          ),

          // ── شريط التحميل السفلي ──
          Positioned(
            bottom: 60,
            left: 48,
            right: 48,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, _) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: CurvedAnimation(
                          parent: _progressController,
                          curve: Curves.easeInOut,
                        ).value,
                        backgroundColor: context.appColors.glassBorder
                            .withValues(alpha: 0.15),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          context.appColors.gold,
                        ),
                        minHeight: 3,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  context.l10n.loading,
                  style: appTextStyle(
                    fontSize: FontSize.caption,
                    color: context.appColors.textOnDarkMute,
                    fontWeight: FontWeight.w400,
                  ),
                ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── رسم الحلقات الإسلامية الزخرفية ──
class _IslamicRingPainter extends CustomPainter {
  final Color green;
  const _IslamicRingPainter(this.green);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxR = size.width / 2;

    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // حلقة خارجية ذهبية
    ringPaint.color = const Color(0xFFD4A843).withValues(alpha: 0.18);
    canvas.drawCircle(center, maxR * 0.98, ringPaint);

    // حلقة وسطى خضراء
    ringPaint.color = green.withValues(alpha: 0.22);
    ringPaint.strokeWidth = 0.8;
    canvas.drawCircle(center, maxR * 0.80, ringPaint);

    // نقاط منتشرة على المحيط
    final dotPaint = Paint()..style = PaintingStyle.fill;
    const dotCount = 36;
    for (int i = 0; i < dotCount; i++) {
      final angle = (i / dotCount) * 2 * math.pi;
      final isMain = i % 4 == 0;
      final r = isMain ? maxR * 0.98 : maxR * 0.80;
      final dotSize = isMain ? 2.5 : 1.5;
      final dx = center.dx + r * math.cos(angle);
      final dy = center.dy + r * math.sin(angle);
      dotPaint.color = isMain
          ? const Color(0xFFD4A843).withValues(alpha: 0.55)
          : green.withValues(alpha: 0.40);
      canvas.drawCircle(Offset(dx, dy), dotSize, dotPaint);
    }

    // خطوط هندسية رفيعة
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..color = const Color(0xFF3DD68C).withValues(alpha: 0.10);

    const lineCount = 12;
    for (int i = 0; i < lineCount; i++) {
      final angle = (i / lineCount) * math.pi;
      final x1 = center.dx + maxR * 0.98 * math.cos(angle);
      final y1 = center.dy + maxR * 0.98 * math.sin(angle);
      final x2 = center.dx + maxR * 0.98 * math.cos(angle + math.pi);
      final y2 = center.dy + maxR * 0.98 * math.sin(angle + math.pi);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);
    }
  }

  @override
  bool shouldRepaint(_IslamicRingPainter old) => old.green != green;
}
