part of '../points_screen.dart';

class _EvaluationsList extends StatelessWidget {
  final List<EvaluationRecord> evaluations;
  const _EvaluationsList({required this.evaluations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      itemCount: evaluations.length,
      itemBuilder: (_, i) => _EvalCard(eval: evaluations[i]),
    );
  }
}

class _EvalCard extends StatelessWidget {
  final EvaluationRecord eval;
  const _EvalCard({required this.eval});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('d MMMM yyyy', 'ar').format(eval.date);
    final color = eval.rating.color;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.07), blurRadius: 14, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EvalHeader(eval: eval, color: color),
          _EvalComment(eval: eval),
          _EvalFooter(dateStr: dateStr),
        ],
      ),
    );
  }
}

class _EvalHeader extends StatelessWidget {
  final EvaluationRecord eval;
  final Color color;
  const _EvalHeader({required this.eval, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        border: Border(bottom: BorderSide(color: color.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.assessment_rounded, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(eval.subject,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          ),
          RatingBadge(rating: eval.rating),
        ],
      ),
    );
  }
}

class _EvalComment extends StatelessWidget {
  final EvaluationRecord eval;
  const _EvalComment({required this.eval});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              gradient: AppColors.gradientPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person_rounded, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ملاحظة المعلم',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted, fontSize: 11)),
                const SizedBox(height: 3),
                Text(eval.teacherComment,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EvalFooter extends StatelessWidget {
  final String dateStr;
  const _EvalFooter({required this.dateStr});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(18)),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today_rounded, size: 12, color: AppColors.textMuted),
          const SizedBox(width: 5),
          Text(dateStr,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }
}
