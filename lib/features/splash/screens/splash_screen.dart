import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/services/auth_service.dart';
import '../../auth/screens/login_screen.dart';
import '../../home/screens/main_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late AnimationController _progressController;

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
    final token = await AuthService().getSavedToken();
    if (!mounted) return;
    final Widget destination = token != null
        ? MainShell(token: token)
        : const LoginScreen();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => destination,
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bgDeep,
      body: Stack(
        children: [
          // ── خلفية متدرجة ──
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF060E08),
                    Color(0xFF0D5016),
                    Color(0xFF060E08),
                  ],
                  stops: [0.0, 0.5, 1.0],
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
                  painter: _IslamicRingPainter(),
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
                        color: AppColors.primaryGlow.withOpacity(glow * 0.5),
                        blurRadius: 80,
                        spreadRadius: 20,
                      ),
                      BoxShadow(
                        color: AppColors.gold.withOpacity(glow * 0.25),
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
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.gold.withOpacity(0.6),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo/لوغو.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
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
                  'مسجد الخير',
                  style: GoogleFonts.cairo(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 500.ms, duration: 700.ms)
                    .slideY(
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
                    'البوابة التعليمية',
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.8,
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 750.ms, duration: 700.ms)
                    .slideY(
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
                        backgroundColor:
                            AppColors.glassBorder.withOpacity(0.15),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.gold,
                        ),
                        minHeight: 3,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'جارٍ التحميل...',
                  style: GoogleFonts.cairo(
                    fontSize: 12,
                    color: AppColors.textOnDarkMute,
                    fontWeight: FontWeight.w400,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 500.ms),
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
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxR = size.width / 2;

    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // حلقة خارجية ذهبية
    ringPaint.color = const Color(0xFFD4A843).withOpacity(0.18);
    canvas.drawCircle(center, maxR * 0.98, ringPaint);

    // حلقة وسطى خضراء
    ringPaint.color = const Color(0xFF2EA043).withOpacity(0.22);
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
          ? const Color(0xFFD4A843).withOpacity(0.55)
          : const Color(0xFF2EA043).withOpacity(0.40);
      canvas.drawCircle(Offset(dx, dy), dotSize, dotPaint);
    }

    // خطوط هندسية رفيعة
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..color = const Color(0xFF3DD68C).withOpacity(0.10);

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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── أيقونة قبة المسجد ──
class _MosqueDomeIcon extends StatelessWidget {
  const _MosqueDomeIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MosquePainter(),
    );
  }
}

class _MosquePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFD4A843).withOpacity(0.92);

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = const Color(0xFFFFD97D).withOpacity(0.7);

    // القبة الرئيسية
    final domePath = Path();
    domePath.moveTo(w * 0.15, h * 0.60);
    domePath.quadraticBezierTo(w * 0.15, h * 0.28, w * 0.50, h * 0.18);
    domePath.quadraticBezierTo(w * 0.85, h * 0.28, w * 0.85, h * 0.60);
    domePath.close();
    canvas.drawPath(domePath, paint);
    canvas.drawPath(domePath, strokePaint);

    // الهلال
    final moonPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFFFD97D);

    canvas.drawCircle(Offset(w * 0.50, h * 0.11), w * 0.07, moonPaint);
    canvas.drawCircle(
      Offset(w * 0.55, h * 0.10),
      w * 0.055,
      Paint()
        ..style = PaintingStyle.fill
        ..color = const Color(0xFF0D5016),
    );

    // النجمة
    final starPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFFFD97D);

    _drawStar(canvas, Offset(w * 0.63, h * 0.08), w * 0.022, starPaint);

    // الجدار الرئيسي
    final wallPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFD4A843).withOpacity(0.85);

    final wallRect =
        RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.20, h * 0.60, w * 0.60, h * 0.22),
      const Radius.circular(2),
    );
    canvas.drawRRect(wallRect, wallPaint);

    // الباب
    final doorPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF0D5016);

    final doorPath = Path();
    doorPath.moveTo(w * 0.42, h * 0.82);
    doorPath.lineTo(w * 0.42, h * 0.67);
    doorPath.quadraticBezierTo(w * 0.42, h * 0.61, w * 0.50, h * 0.61);
    doorPath.quadraticBezierTo(w * 0.58, h * 0.61, w * 0.58, h * 0.67);
    doorPath.lineTo(w * 0.58, h * 0.82);
    doorPath.close();
    canvas.drawPath(doorPath, doorPaint);

    // المآذن الجانبية
    _drawMinaret(canvas, Offset(w * 0.10, h * 0.60), w * 0.10, h * 0.30);
    _drawMinaret(canvas, Offset(w * 0.80, h * 0.60), w * 0.10, h * 0.30);
  }

  void _drawMinaret(
      Canvas canvas, Offset base, double width, double height) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFD4A843).withOpacity(0.75);

    final rect = Rect.fromLTWH(
        base.dx, base.dy - height, width, height);
    canvas.drawRect(rect, paint);

    // رأس المئذنة
    final tipPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFFFD97D);

    final tipPath = Path();
    tipPath.moveTo(base.dx, base.dy - height);
    tipPath.lineTo(base.dx + width / 2, base.dy - height - width * 0.7);
    tipPath.lineTo(base.dx + width, base.dy - height);
    tipPath.close();
    canvas.drawPath(tipPath, tipPaint);
  }

  void _drawStar(Canvas canvas, Offset center, double r, Paint paint) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final angle = (i * 4 * math.pi / 5) - math.pi / 2;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
