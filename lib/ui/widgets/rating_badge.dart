import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

extension EvaluationRatingX on EvaluationRating {
  String get label {
    switch (this) {
      case EvaluationRating.excellent:
        return L10nGateway.current.excellent;
      case EvaluationRating.veryGood:
        return L10nGateway.current.veryGood;
      case EvaluationRating.good:
        return L10nGateway.current.good;
      case EvaluationRating.acceptable:
        return L10nGateway.current.accepted;
      case EvaluationRating.needsWork:
        return L10nGateway.current.needsImprovement;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case EvaluationRating.excellent:
        return context.appColors.success;
      case EvaluationRating.veryGood:
        return context.appColors.info;
      case EvaluationRating.good:
        return context.appColors.primaryLight;
      case EvaluationRating.acceptable:
        return context.appColors.warning;
      case EvaluationRating.needsWork:
        return context.appColors.error;
    }
  }

  IconData get icon {
    switch (this) {
      case EvaluationRating.excellent:
        return Icons.star_rounded;
      case EvaluationRating.veryGood:
        return Icons.thumb_up_rounded;
      case EvaluationRating.good:
        return Icons.check_circle_rounded;
      case EvaluationRating.acceptable:
        return Icons.radio_button_checked_rounded;
      case EvaluationRating.needsWork:
        return Icons.trending_up_rounded;
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
    final color = rating.color(context);
    final bgColor = dark
        ? Colors.white.withValues(alpha: 0.15)
        : color.withValues(alpha: 0.12);
    final borderColor = dark
        ? Colors.white.withValues(alpha: 0.25)
        : color.withValues(alpha: 0.3);
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
                  fontSize: FontSize.caption,
                ),
          ),
        ],
      ),
    );
  }
}
