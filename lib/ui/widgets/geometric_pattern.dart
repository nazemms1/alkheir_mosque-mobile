import 'dart:math' as math;

import 'package:flutter/material.dart';

/// النقش الهندسي الإسلامي (نجمة ثمانية — خاتم سليمان) — العنصر المميّز للهوية.
/// يُستخدم بدل الدوائر الزخرفية في الواجهات الرئيسية فقط، وبشفافية خفيفة.
class GeometricPattern extends StatelessWidget {
  final Color color;
  final double opacity;
  final double tile;

  const GeometricPattern({
    super.key,
    this.color = Colors.white,
    this.opacity = 0.06,
    this.tile = 56,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ExcludeSemantics(
        child: ClipRect(
            child: RepaintBoundary(
          child: CustomPaint(
            size: Size.infinite,
            painter: _KhatamPainter(color.withValues(alpha: opacity), tile),
          ),
        )),
      ),
    );
  }
}

class _KhatamPainter extends CustomPainter {
  final Color color;
  final double tile;
  _KhatamPainter(this.color, this.tile);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    // Points touch the neighbours' points, forming the interlocking lattice.
    final r = tile * 0.5;
    final star = Path();
    // Two squares rotated 45° apart form the 8-point star.
    for (final rot in [0.0, math.pi / 4]) {
      for (var i = 0; i < 4; i++) {
        final a = rot + i * math.pi / 2 + math.pi / 4;
        final p = Offset(r * math.cos(a), r * math.sin(a));
        i == 0 ? star.moveTo(p.dx, p.dy) : star.lineTo(p.dx, p.dy);
      }
      star.close();
    }
    for (var y = 0.0; y < size.height + tile; y += tile) {
      for (var x = 0.0; x < size.width + tile; x += tile) {
        canvas.save();
        canvas.translate(x, y);
        canvas.drawPath(star, paint);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(_KhatamPainter old) =>
      old.color != color || old.tile != tile;
}
