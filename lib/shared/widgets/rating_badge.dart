import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/student_model.dart';

extension EvaluationRatingX on EvaluationRating {
  String get label {
    switch (this) {
      case EvaluationRating.excellent:  return 'ممتاز';
      case EvaluationRating.veryGood:   return 'جيد جداً';
      case EvaluationRating.good:       return 'جيد';
      case EvaluationRating.acceptable: return 'مقبول';
      case EvaluationRating.needsWork:  return 'يحتاج تحسين';
    }
  }

  Color get color {
    switch (this) {
      case EvaluationRating.excellent:  return AppColors.success;
      case EvaluationRating.veryGood:   return AppColors.info;
      case EvaluationRating.good:       return AppColors.primaryLight;
      case EvaluationRating.acceptable: return AppColors.warning;
      case EvaluationRating.needsWork:  return AppColors.error;
    }
  }

  IconData get icon {
    switch (this) {
      case EvaluationRating.excellent:  return Icons.star_rounded;
      case EvaluationRating.veryGood:   return Icons.thumb_up_rounded;
      case EvaluationRating.good:       return Icons.check_circle_rounded;
      case EvaluationRating.acceptable: return Icons.radio_button_checked_rounded;
      case EvaluationRating.needsWork:  return Icons.trending_up_rounded;
    }
  }
}

class RatingBadge extends StatelessWidget {
  final EvaluationRating rating;
  final bool small;
  final bool dark;

  const RatingBadge({
    super.key,
    required this.rating,
    this.small = false,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = rating.color;
    final bgColor = dark ? Colors.white.withOpacity(0.15) : color.withOpacity(0.12);
    final borderColor = dark ? Colors.white.withOpacity(0.25) : color.withOpacity(0.3);
    final textColor = dark ? Colors.white : color;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 8 : 10,
        vertical: small ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(rating.icon, color: textColor, size: small ? 12 : 14),
          const SizedBox(width: 4),
          Text(
            rating.label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: small ? 11 : 12,
                ),
          ),
        ],
      ),
    );
  }
}
