import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/ui/widgets/geometric_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/shared/attendance/ui/providers/student_attendance_records_controller.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

part '../widgets/att_summary_hero.dart';
part '../widgets/att_filter_strip.dart';
part '../widgets/att_tile.dart';
part '../widgets/att_shared.dart';

class AttendanceScreen extends ConsumerStatefulWidget {
  final List<AttendanceRecord> records;
  final int? studentId;
  final bool shrinkWrap;
  const AttendanceScreen({
    super.key,
    required this.records,
    this.studentId,
    this.shrinkWrap = false,
  });

  @override
  ConsumerState<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends ConsumerState<AttendanceScreen>
    with SingleTickerProviderStateMixin {
  AttendanceStatus? _filter;
  StudentAttendanceRecordsControllerProvider get _provider =>
      studentAttendanceRecordsControllerProvider(widget.studentId);
  List<AttendanceRecord> get _apiRecords =>
      ref.watch(_provider).valueOrNull ?? const [];
  bool get _loadingApi => ref.watch(_provider).isLoading;
  late final AnimationController _ctrl;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
  }

  List<AttendanceRecord> get _records =>
      _apiRecords.isNotEmpty ? _apiRecords : widget.records;

  int _count(AttendanceStatus s) => _records.where((r) => r.status == s).length;

  List<AttendanceRecord> get _filtered => _filter == null
      ? _records
      : _records.where((r) => r.status == _filter).toList();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final present = _count(AttendanceStatus.present);
    final absent = _count(AttendanceStatus.absent);
    final late = _count(AttendanceStatus.late);
    final excused = _count(AttendanceStatus.excused);
    final excusedEarlyDep = _count(AttendanceStatus.excusedEarlyDeparture);
    final excusedAbsence = _count(AttendanceStatus.excusedAbsence);
    final total = _records.length;
    final rate = total == 0 ? 0.0 : present / total;

    return FadeTransition(
      opacity: _fade,
      child: CustomScrollView(
        shrinkWrap: widget.shrinkWrap,
        physics: widget.shrinkWrap
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: _SummaryHero(
              present: present,
              absent: absent,
              late: late,
              excused: excused,
              excusedEarlyDep: excusedEarlyDep,
              excusedAbsence: excusedAbsence,
              total: total,
              rate: rate,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            sliver: SliverToBoxAdapter(
              child: _FilterStrip(
                selected: _filter,
                onSelect: (s) => setState(() => _filter = s),
              )
                  .animate()
                  .fadeIn(delay: 200.ms)
                  .slideY(begin: 0.05, end: 0, delay: 200.ms),
            ),
          ),
          if (_loadingApi)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_filtered.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: _EmptyState(
                  icon: Icons.event_available_rounded,
                  text: context.l10n.noRecordsMatchThisFilter,
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, i) => _AttendanceTile(record: _filtered[i])
                      .animate()
                      .fadeIn(delay: (250 + i * 40).ms, duration: 350.ms)
                      .slideX(
                          begin: 0.04,
                          end: 0,
                          delay: (250 + i * 40).ms,
                          duration: 350.ms),
                  childCount: _filtered.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
