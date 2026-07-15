part of '../points_screen.dart';

// ─── قائمة من PointRecord (قديمة / fallback) ─────────────────────────────────
class _PointsList extends StatelessWidget {
  final List<PointRecord> records;
  const _PointsList({required this.records});

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      return const Center(
        child: _EmptyPoints(),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      itemCount: records.length,
      itemBuilder: (_, i) => _PointTile(record: records[i]),
    );
  }
}

// ─── قائمة من PointEntry (من الـ API) ────────────────────────────────────────
class _PointEntriesList extends StatelessWidget {
  final List<PointEntry> entries;
  const _PointEntriesList({required this.entries});

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Center(child: _EmptyPoints());
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      itemCount: entries.length,
      itemBuilder: (_, i) => _PointEntryTile(entry: entries[i])
          .animate()
          .fadeIn(delay: (i * 40).ms, duration: 350.ms)
          .slideX(begin: 0.04, end: 0, delay: (i * 40).ms),
    );
  }
}

class _EmptyPoints extends StatelessWidget {
  const _EmptyPoints();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_border_rounded, size: 48,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
        const SizedBox(height: 12),
        Text('لا توجد نقاط بعد',
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4))),
      ],
    );
  }
}

class _PointTile extends StatelessWidget {
  final PointRecord record;
  const _PointTile({required this.record});

  @override
  Widget build(BuildContext context) {
    final color = record.isBonus ? AppColors.gold : AppColors.primaryLight;
    final dateStr = DateFormat('d MMM yyyy', 'ar').format(record.date);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 5, height: 70,
            decoration: BoxDecoration(
              gradient: record.isBonus ? AppColors.gradientGold : AppColors.gradientPrimary,
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(16)),
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              record.isBonus ? Icons.card_giftcard_rounded : Icons.star_rounded,
              color: color, size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(record.reason,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(dateStr, style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        record.isBonus ? 'مكافأة' : 'حفظ',
                        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ShaderMask(
              shaderCallback: (b) =>
                  (record.isBonus ? AppColors.gradientGold : AppColors.gradientPrimary).createShader(b),
              child: Text(
                '+${record.points}',
                style: const TextStyle(
                  color: Colors.white, fontSize: 20,
                  fontWeight: FontWeight.w900, fontFamily: 'Cairo',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── PointEntry Tile (بيانات حقيقية من الـ API) ───────────────────────────────
class _PointEntryTile extends StatelessWidget {
  final PointEntry entry;
  const _PointEntryTile({required this.entry});

  static const _categoryColors = {
    'memorization': AppColors.primaryLight,
    'assessment':   AppColors.info,
    'system':       AppColors.success,
    'manual':       AppColors.gold,
  };

  static const _categoryLabels = {
    'memorization': 'حفظ',
    'assessment':   'تقييم',
    'system':       'نظام',
    'manual':       'يدوي',
  };

  static const _categoryIcons = {
    'memorization': Icons.menu_book_rounded,
    'assessment':   Icons.quiz_rounded,
    'system':       Icons.check_circle_rounded,
    'manual':       Icons.card_giftcard_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final color = _categoryColors[entry.pointTypeCategory] ?? AppColors.gold;
    final label = _categoryLabels[entry.pointTypeCategory] ?? entry.pointTypeName;
    final icon  = _categoryIcons[entry.pointTypeCategory]  ?? Icons.star_rounded;
    final gradient = entry.isBonus ? AppColors.gradientGold : AppColors.gradientPrimary;
    final dateStr = DateFormat('d MMM yyyy', 'ar').format(entry.enteredAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // شريط اللون الجانبي
          Container(
            width: 5, height: 72,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(16)),
            ),
          ),
          const SizedBox(width: 14),
          // أيقونة التصنيف
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          // المحتوى
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.notes ?? entry.pointTypeName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(dateStr, style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, fontFamily: 'Cairo'),
                        ),
                      ),
                      if (entry.policyName != null) ...[
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            entry.policyName!,
                            style: TextStyle(
                                fontSize: 10, fontFamily: 'Cairo',
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          // عدد النقاط
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ShaderMask(
              shaderCallback: (b) => gradient.createShader(b),
              child: Text(
                '+${entry.points}',
                style: const TextStyle(
                  color: Colors.white, fontSize: 20,
                  fontWeight: FontWeight.w900, fontFamily: 'Cairo',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
