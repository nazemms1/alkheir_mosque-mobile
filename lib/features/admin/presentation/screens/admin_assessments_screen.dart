import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

class AdminAssessmentsScreen extends StatefulWidget {
  const AdminAssessmentsScreen({super.key});

  @override
  State<AdminAssessmentsScreen> createState() => _AdminAssessmentsScreenState();
}

class _AdminAssessmentsScreenState extends State<AdminAssessmentsScreen> {
  final _service = AdminRepositoryImpl();

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
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final r = await _service.fetchAssessments(page: 1, perPage: 20);
      if (!mounted) return;
      setState(() {
        _items = r.items;
        _total = r.total;
        _lastPage = r.lastPage;
        _page = 1;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
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
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
      child: CustomScrollView(
        controller: _scrollCtrl,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            sliver: SliverToBoxAdapter(
              child: AdminHero(
                icon: Icons.assignment_rounded,
                title: tr('التقييمات'),
                subtitle: tr('التقييمات والاختبارات ونتائجها'),
                metrics: [
                  AdminHeroMetric(
                    icon: Icons.assignment_turned_in_rounded,
                    label: tr('إجمالي التقييمات'),
                    value: _loading ? '…' : '$_total',
                  ),
                ],
              ),
            ),
          ),
          ..._buildBody(),
        ],
      ),
    );
  }

  List<Widget> _buildBody() {
    if (_loading) {
      return [
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        ),
      ];
    }
    if (_error != null) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: AdminErrorState(
            message: _error!,
            onRetry: _load,
            retryLabel: tr('إعادة المحاولة'),
          ),
        ),
      ];
    }
    if (_items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: AdminEmptyState(
            icon: Icons.assignment_outlined,
            title: tr('لا توجد تقييمات'),
          ),
        ),
      ];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, kAdminBottomInset),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              if (i == _items.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _AssessmentCard(assessment: _items[i])
                    .animate()
                    .fadeIn(delay: (i * 40).ms, duration: 350.ms)
                    .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
              );
            },
            childCount: _items.length + (_loadingMore ? 1 : 0),
          ),
        ),
      ),
    ];
  }
}

class _AssessmentCard extends StatelessWidget {
  final AdminAssessmentItem assessment;
  const _AssessmentCard({required this.assessment});

  Color get _typeColor {
    final t = assessment.type.toLowerCase();
    if (t.contains('عبادات') || t.contains('برنامج')) {
      return AppColors.primaryLight;
    }
    if (t.contains('قرآن')) return AppColors.gold;
    return AppColors.info;
  }

  @override
  Widget build(BuildContext context) {
    final color = _typeColor;
    final muted = AdminTheme.muted(context);
    final passPercent = assessment.totalMark > 0
        ? (assessment.passMark / assessment.totalMark * 100).round()
        : 0;

    return AdminCard(
      padding: EdgeInsets.zero,
      accent: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Row(
              children: [
                AdminIconBubble(
                  icon: Icons.assignment_rounded,
                  color: color,
                  size: 40,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        assessment.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        assessment.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AdminBadge(
                  label: assessment.isActive ? tr('نشط') : tr('منتهي'),
                  color: assessment.isActive ? AppColors.success : muted,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AdminTheme.border(context)),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _StatBox(
                        label: tr('الدرجة الكلية'),
                        value: '${assessment.totalMark.toInt()}',
                        color: color,
                        icon: Icons.grade_rounded,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatBox(
                        label: tr('درجة النجاح'),
                        value: '${assessment.passMark.toInt()} ($passPercent%)',
                        color: AppColors.success,
                        icon: Icons.check_circle_outline_rounded,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _StatBox(
                        label: tr('النتائج'),
                        value: '${assessment.resultsCount}',
                        color: AppColors.gold,
                        icon: Icons.people_rounded,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    color: AdminTheme.border(context).withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.groups_rounded, size: 15, color: muted),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          assessment.groupName.isEmpty
                              ? '—'
                              : '${assessment.groupName} · ${assessment.courseName}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(fontSize: 12, color: muted),
                        ),
                      ),
                      if (assessment.scheduledAt != null) ...[
                        const SizedBox(width: 8),
                        Icon(Icons.calendar_today_rounded,
                            size: 12, color: muted),
                        const SizedBox(width: 4),
                        Text(
                          assessment.formattedDate,
                          style: appTextStyle(fontSize: 12, color: muted),
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
  const _StatBox(
      {required this.label,
      required this.value,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: appTextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: appTextStyle(
              fontSize: 10,
              color: AdminTheme.muted(context),
            ),
          ),
        ],
      ),
    );
  }
}
