part of '../home_screen.dart';

class _NotifTile extends StatelessWidget {
  final AppNotification n;
  const _NotifTile({required this.n});

  static const _colors = {
    NotificationType.attendance:   AppColors.success,
    NotificationType.memorization: AppColors.primaryLight,
    NotificationType.points:       AppColors.gold,
    NotificationType.evaluation:   AppColors.info,
    NotificationType.general:      AppColors.textSecondary,
  };
  static const _icons = {
    NotificationType.attendance:   Icons.calendar_today_rounded,
    NotificationType.memorization: Icons.menu_book_rounded,
    NotificationType.points:       Icons.star_rounded,
    NotificationType.evaluation:   Icons.assessment_rounded,
    NotificationType.general:      Icons.info_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final color = _colors[n.type] ?? AppColors.textSecondary;
    final icon  = _icons[n.type]  ?? Icons.info_rounded;
    final diff  = DateTime.now().difference(n.dateTime);
    final ago   = diff.inHours < 1
        ? 'منذ ${diff.inMinutes} دق'
        : diff.inHours < 24
            ? 'منذ ${diff.inHours} س'
            : 'منذ ${diff.inDays} ي';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: n.isRead ? Theme.of(context).colorScheme.surface : color.withOpacity(0.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: n.isRead ? Theme.of(context).dividerColor : color.withOpacity(0.3),
          width: n.isRead ? 1 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: (n.isRead ? Colors.black : color).withOpacity(0.05),
            blurRadius: 14, spreadRadius: -2, offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4, height: 72,
            decoration: BoxDecoration(
              color: n.isRead ? Theme.of(context).dividerColor : color,
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(18)),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(n.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: n.isRead ? FontWeight.w500 : FontWeight.w700)),
                      ),
                      if (!n.isRead)
                        Container(
                          width: 9, height: 9,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 6)],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(n.body,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(ago,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4), fontSize: 11)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}

class _EvalTile extends StatelessWidget {
  final EvaluationRecord eval;
  const _EvalTile({required this.eval});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.06),
            blurRadius: 16, spreadRadius: -2, offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46, height: 46,
            decoration: BoxDecoration(
              gradient: AppColors.gradientPrimary,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: AppColors.primary.withOpacity(0.35), blurRadius: 10, offset: const Offset(0, 3)),
              ],
            ),
            child: const Icon(Icons.assessment_rounded, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(eval.subject,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 3),
                Text(eval.teacherComment,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const SizedBox(width: 10),
          RatingBadge(rating: eval.rating, small: true),
        ],
      ),
    );
  }
}
