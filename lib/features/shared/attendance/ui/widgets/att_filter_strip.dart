part of '../pages/attendance_screen.dart';

class _FilterStrip extends StatelessWidget {
  final AttendanceStatus? selected;
  final void Function(AttendanceStatus?) onSelect;
  const _FilterStrip({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final filters = <(String, AttendanceStatus?, Color)>[
      (context.l10n.all, null, context.appColors.primaryLight),
      (
        context.l10n.present2,
        AttendanceStatus.present,
        context.appColors.attPresent
      ),
      (
        context.l10n.absent2,
        AttendanceStatus.absent,
        context.appColors.attAbsent
      ),
      (context.l10n.late3, AttendanceStatus.late, context.appColors.attLate),
      (
        context.l10n.excused,
        AttendanceStatus.excused,
        context.appColors.attExcused
      ),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          final isActive = selected == f.$2;
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: GestureDetector(
              onTap: () => onSelect(f.$2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  gradient: isActive
                      ? LinearGradient(
                          colors: [f.$3, f.$3.withValues(alpha: 0.75)])
                      : null,
                  color:
                      isActive ? null : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: isActive ? f.$3 : Theme.of(context).dividerColor,
                    width: isActive ? 1.5 : 1,
                  ),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                              color: f.$3.withValues(alpha: 0.35),
                              blurRadius: 14,
                              offset: const Offset(0, 4))
                        ]
                      : [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2))
                        ],
                ),
                child: Text(
                  f.$1,
                  style: TextStyle(
                    color: isActive
                        ? Colors.white
                        : context.appColors.textSecondary,
                    fontSize: FontSize.label,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    fontFamily: 'Dubai',
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
