import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/admin_dashboard_model.dart';
import '../../../data/services/admin_service.dart';

class AdminAssessmentsScreen extends StatefulWidget {
  const AdminAssessmentsScreen({super.key});

  @override
  State<AdminAssessmentsScreen> createState() => _AdminAssessmentsScreenState();
}

class _AdminAssessmentsScreenState extends State<AdminAssessmentsScreen> {
  final _service = AdminService();

  List<AdminAssessmentItem> _items = [];
  int _total = 0;
  int _page = 1;
  int _lastPage = 1;
  bool _loading = true;
  bool _loadingMore = false;
  String? _error;

  final _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _load();
    _scrollCtrl.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollCtrl.position.pixels >=
            _scrollCtrl.position.maxScrollExtent - 200 &&
        !_loadingMore &&
        _page < _lastPage) {
      _loadMore();
    }
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final r = await _service.fetchAssessments(page: 1, perPage: 20);
      if (!mounted) return;
      setState(() {
        _items    = r.items;
        _total    = r.total;
        _lastPage = r.lastPage;
        _page     = 1;
        _loading  = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  Future<void> _loadMore() async {
    setState(() => _loadingMore = true);
    try {
      final r = await _service.fetchAssessments(page: _page + 1, perPage: 20);
      if (!mounted) return;
      setState(() {
        _items.addAll(r.items);
        _page++;
        _loadingMore = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Header ────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientPrimary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.assignment_rounded, color: Colors.white, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      '$_total تقييم',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ── List ──────────────────────────────────────────────────────
        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? _ErrorRetry(message: _error!, onRetry: _load)
                  : _items.isEmpty
                      ? const Center(child: Text('لا توجد تقييمات', style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)))
                      : RefreshIndicator(
                          onRefresh: _load,
                          color: AppColors.primaryLight,
                          child: ListView.builder(
                            controller: _scrollCtrl,
                            padding: const EdgeInsets.fromLTRB(16, 14, 16, 120),
                            itemCount: _items.length + (_loadingMore ? 1 : 0),
                            itemBuilder: (_, i) {
                              if (i == _items.length) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Center(child: CircularProgressIndicator()),
                                );
                              }
                              return _AssessmentCard(assessment: _items[i])
                                  .animate()
                                  .fadeIn(delay: (i * 40).ms, duration: 350.ms)
                                  .slideY(begin: 0.05, end: 0, delay: (i * 40).ms);
                            },
                          ),
                        ),
        ),
      ],
    );
  }
}

class _AssessmentCard extends StatelessWidget {
  final AdminAssessmentItem assessment;
  const _AssessmentCard({required this.assessment});

  Color get _typeColor {
    final t = assessment.type.toLowerCase();
    if (t.contains('عبادات') || t.contains('برنامج')) return AppColors.primaryLight;
    if (t.contains('قرآن')) return AppColors.gold;
    return AppColors.info;
  }

  @override
  Widget build(BuildContext context) {
    final color = _typeColor;
    final passPercent = assessment.totalMark > 0
        ? (assessment.passMark / assessment.totalMark * 100).round()
        : 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header strip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              border: Border(bottom: BorderSide(color: color.withOpacity(0.15))),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.assignment_rounded, color: color, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        assessment.title,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        assessment.type,
                        style: TextStyle(color: color, fontSize: 11, fontFamily: 'Cairo', fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: assessment.isActive
                        ? AppColors.success.withOpacity(0.12)
                        : AppColors.textMuted.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    assessment.isActive ? 'نشط' : 'منتهي',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: assessment.isActive ? AppColors.success : AppColors.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Body
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _StatBox(
                        label: 'الدرجة الكلية',
                        value: '${assessment.totalMark.toInt()}',
                        color: color,
                        icon: Icons.grade_rounded,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatBox(
                        label: 'درجة النجاح',
                        value: '${assessment.passMark.toInt()} ($passPercent%)',
                        color: AppColors.success,
                        icon: Icons.check_circle_outline_rounded,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatBox(
                        label: 'النتائج',
                        value: '${assessment.resultsCount}',
                        color: AppColors.gold,
                        icon: Icons.people_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Group + date
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.groups_rounded, size: 14, color: AppColors.textMuted),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          assessment.groupName.isEmpty ? '—' : '${assessment.groupName} · ${assessment.courseName}',
                          style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (assessment.scheduledAt != null) ...[
                        const Icon(Icons.calendar_today_rounded, size: 12, color: AppColors.textMuted),
                        const SizedBox(width: 4),
                        Text(
                          assessment.formattedDate,
                          style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label, value;
  final Color color;
  final IconData icon;
  const _StatBox({required this.label, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.18)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w800, fontFamily: 'Cairo'), textAlign: TextAlign.center),
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 9, fontFamily: 'Cairo'), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorRetry({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.error),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Cairo')),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: onRetry, child: const Text('إعادة المحاولة', style: TextStyle(fontFamily: 'Cairo'))),
        ],
      ),
    );
  }
}
