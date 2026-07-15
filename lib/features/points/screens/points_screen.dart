import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/student_service.dart';
import '../../../shared/widgets/rating_badge.dart';

part 'widgets/pts_hero.dart';
part 'widgets/pts_points_list.dart';
part 'widgets/pts_evaluations_list.dart';

class PointsScreen extends StatefulWidget {
  final List<PointRecord> pointRecords;
  final List<EvaluationRecord> evaluations;
  final int totalPoints;
  final int? studentId;
  final bool shrinkWrap;

  const PointsScreen({
    super.key,
    required this.pointRecords,
    required this.evaluations,
    required this.totalPoints,
    this.studentId,
    this.shrinkWrap = false,
  });

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen>
    with SingleTickerProviderStateMixin {
  final _service = StudentService();
  late final TabController _tab;
  List<PointEntry> _apiEntries = [];
  bool _loadingApi = false;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
    _fetchPoints();
  }

  @override
  void didUpdateWidget(PointsScreen old) {
    super.didUpdateWidget(old);
    if (old.studentId != widget.studentId) _fetchPoints();
  }

  Future<void> _fetchPoints() async {
    if (widget.studentId == null) return;
    setState(() => _loadingApi = true);
    try {
      final entries = await _service.fetchPoints(widget.studentId!);
      if (!mounted) return;
      setState(() { _apiEntries = entries; _loadingApi = false; });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingApi = false);
    }
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  /// النقاط الفعلية: من الـ API إن وُجدت، وإلا الـ fallback
  List<PointRecord> get _records => _apiEntries.isNotEmpty
      ? _apiEntries.map((e) => e.toPointRecord()).toList()
      : widget.pointRecords;

  int get _total => _apiEntries.isNotEmpty
      ? _apiEntries.fold(0, (s, e) => s + e.points)
      : widget.totalPoints;

  @override
  Widget build(BuildContext context) {
    if (widget.shrinkWrap) {
      return CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: _PointsHero(total: _total, records: _records),
          ),
          const SliverToBoxAdapter(
            child: _SectionHeader(label: 'سجل النقاط', icon: Icons.star_rounded, color: AppColors.gold),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => _apiEntries.isNotEmpty
                    ? _PointEntryTile(entry: _apiEntries[i])
                    : _PointTile(record: _records[i]),
                childCount: _apiEntries.isNotEmpty ? _apiEntries.length : _records.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: _SectionHeader(label: 'التقييمات', icon: Icons.assessment_rounded, color: AppColors.primaryLight),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => _EvalCard(eval: widget.evaluations[i]),
                childCount: widget.evaluations.length,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        _PointsHero(total: _total, records: _records)
            .animate()
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.03, end: 0, duration: 500.ms, curve: Curves.easeOut),
        Builder(
          builder: (context) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3)),
              ],
            ),
            child: TabBar(
              controller: _tab,
              indicatorWeight: 3,
              indicatorColor: AppColors.primary,
              tabs: const [
                Tab(text: 'سجل النقاط'),
                Tab(text: 'التقييمات'),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
        ),
        Expanded(
          child: _loadingApi
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                  controller: _tab,
                  children: [
                    _apiEntries.isNotEmpty
                        ? _PointEntriesList(entries: _apiEntries)
                        : _PointsList(records: _records),
                    _EvaluationsList(evaluations: widget.evaluations),
                  ],
                ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const _SectionHeader(
      {required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(label,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              )),
        ],
      ),
    );
  }
}
