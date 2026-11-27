part of '../pages/attendance_screen.dart';

class _AttendanceTile extends StatelessWidget {
  final AttendanceRecord record;
  const _AttendanceTile({required this.record});

  static Map<AttendanceStatus, ({String label, Color color, IconData icon})>
      _cfg(BuildContext context) => {
            AttendanceStatus.present: (
              label: L10nGateway.current.present2,
              color: context.appColors.attPresent,
              icon: Icons.check_circle_rounded,
            ),
            AttendanceStatus.absent: (
              label: L10nGateway.current.absent2,
              color: context.appColors.attAbsent,
              icon: Icons.cancel_rounded,
            ),
            AttendanceStatus.late: (
              label: L10nGateway.current.late3,
              color: context.appColors.attLate,
              icon: Icons.access_time_rounded,
            ),
            AttendanceStatus.excused: (
              label: L10nGateway.current.excused,
              color: context.appColors.attExcused,
              icon: Icons.info_rounded,
            ),
          };

  @override
  Widget build(BuildContext context) {
    final cfg = _cfg(context)[record.status]!;
    final dateStr =
        DateFormat('EEEE، d MMMM', AppLanguage.intlCode).format(record.date);
    final yearStr =
        DateFormat('yyyy', AppLanguage.intlCode).format(record.date);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border:
            Border.all(color: cfg.color.withValues(alpha: 0.15), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: cfg.color.withValues(alpha: 0.08),
            blurRadius: 16,
            spreadRadius: -2,
            offset: const Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 72,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [cfg.color, cfg.color.withValues(alpha: 0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                    color: cfg.color.withValues(alpha: 0.4), blurRadius: 6)
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: cfg.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: cfg.color.withValues(alpha: 0.25)),
            ),
            child: Icon(cfg.icon, color: cfg.color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateStr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 3),
                Text(record.note ?? yearStr,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: context.appColors.textSecondary)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    cfg.color.withValues(alpha: 0.15),
                    cfg.color.withValues(alpha: 0.08)
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: cfg.color.withValues(alpha: 0.3)),
              ),
              child: Text(
                cfg.label,
                style: TextStyle(
                  color: cfg.color,
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Dubai',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
