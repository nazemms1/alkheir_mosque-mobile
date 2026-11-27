part of '../pages/home_screen.dart';

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
            gradient: context.appColors.gradientPrimary,
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                  color: context.appColors.brandPrimary.withValues(alpha: 0.4),
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
                color: context.appColors.glassGreen,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color:
                        context.appColors.primaryLight.withValues(alpha: 0.2)),
              ),
              child: Text(context.l10n.viewAll,
                  style: TextStyle(
                    color: context.appColors.primaryGlow,
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Dubai',
                  )),
            ),
          ),
      ],
    );
  }
}
