part of '../screens/home_screen.dart';

class _DecorCircle extends StatelessWidget {
  final double size, opacity;
  final Color color;
  const _DecorCircle(
      {required this.size, required this.color, required this.opacity});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: color.withValues(alpha: opacity)),
      );
}

class _SectionLabel extends StatelessWidget {
  final String title;
  final VoidCallback? onMore;
  const _SectionLabel({required this.title, this.onMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 24,
          decoration: BoxDecoration(
            gradient: AppColors.gradientPrimary,
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 6,
                  offset: const Offset(0, 2)),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const Spacer(),
        if (onMore != null)
          GestureDetector(
            onTap: onMore,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.glassGreen,
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: AppColors.primaryLight.withValues(alpha: 0.2)),
              ),
              child: Text(tr('عرض الكل'),
                  style: const TextStyle(
                    color: AppColors.primaryGlow,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dubai',
                  )),
            ),
          ),
      ],
    );
  }
}
