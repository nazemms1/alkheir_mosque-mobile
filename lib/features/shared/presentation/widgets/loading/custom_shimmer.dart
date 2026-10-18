import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../ui/themes/theme_extension.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const CustomShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  /// Shimmer placeholder rectangle with rounded corners
  factory CustomShimmer.rectangle({
    Key? key,
    required double width,
    required double height,
    double? radius,
    Color? baseColor,
    Color? highlightColor,
  }) {
    return CustomShimmer(
      key: key,
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 8.0),
        ),
      ),
    );
  }

  /// Shimmer placeholder circle
  factory CustomShimmer.circle({
    Key? key,
    required double size,
    Color? baseColor,
    Color? highlightColor,
  }) {
    return CustomShimmer(
      key: key,
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkTheme;

    final defaultBaseColor = isDark
        ? const Color(0xFF1E293B)
        : const Color(0xFFE2E8F0);

    final defaultHighlightColor = isDark
        ? const Color(0xFF334155)
        : const Color(0xFFF8FAFC);

    return Shimmer.fromColors(
      baseColor: baseColor ?? defaultBaseColor,
      highlightColor: highlightColor ?? defaultHighlightColor,
      child: child,
    );
  }
}
