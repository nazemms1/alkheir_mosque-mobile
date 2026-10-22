import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/theme/app_theme.dart';

/// شعار المسجد: الشعار مرسوم على خلفية بيضاء، لذلك يوضع على قرص أبيض
/// بحلقة ذهبية في الوضع الداكن وخضراء في الوضع الفاتح، مع توهّج خفيف.
class BrandLogo extends StatelessWidget {
  final double size;
  final bool glow;

  const BrandLogo({super.key, this.size = 96, this.glow = true});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ring = isDark ? AppColors.gold : AppColors.primary;
    final glowColor = isDark ? AppColors.primaryGlow : AppColors.primary;

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: ring.withValues(alpha: isDark ? 0.75 : 0.45),
          width: size * 0.025,
        ),
        boxShadow: [
          if (glow)
            BoxShadow(
              color: glowColor.withValues(alpha: isDark ? 0.45 : 0.20),
              blurRadius: size * 0.35,
              spreadRadius: size * 0.04,
            ),
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.14),
            blurRadius: size * 0.18,
            offset: Offset(0, size * 0.06),
          ),
        ],
      ),
      child: Image.asset('assets/logo/لوغو.png', fit: BoxFit.contain),
    );
  }
}
