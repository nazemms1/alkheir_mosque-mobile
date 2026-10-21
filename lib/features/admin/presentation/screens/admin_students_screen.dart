import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/app/core/session/auth_session.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/students/presentation/screens/student_progress_screen.dart';

class AdminStudentsScreen extends ConsumerStatefulWidget {
  /// عند التمرير، تُقيَّد القائمة بطلاب هذه الحلقة فقط.
  final int? groupId;
  final String? groupName;
  final AuthToken? token;

  const AdminStudentsScreen({
    super.key,
    this.groupId,
    this.groupName,
    this.token,
  });

  @override
  ConsumerState<AdminStudentsScreen> createState() =>
      _AdminStudentsScreenState();
}

class _AdminStudentsScreenState extends ConsumerState<AdminStudentsScreen> {
  final _service = AdminRepositoryImpl();
  final _searchCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();

  List<AdminStudentItem> _items = [];
  int _total = 0;
  int _page = 1;
  int _lastPage = 1;
  bool _loading = true;
  bool _loadingMore = false;
  String? _error;
  String _search = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _load();
    _scrollCtrl.addListener(_onScroll);
    _searchCtrl.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  /// ينتظر توقّف الكتابة قبل الطلب من الخادم (بدل طلب لكل حرف).
  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted) return;
      final val = _searchCtrl.text.trim();
      if (val == _search) return;
      _search = val;
      _page = 1;
      _items = [];
      _load();
    });
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
      final r = await _service.fetchStudents(
          page: 1,
          perPage: 20,
          search: _search,
          groupId: widget.groupId,
          status: 'active');
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
      final r = await _service.fetchStudents(
          page: _page + 1,
          perPage: 20,
          search: _search,
          groupId: widget.groupId,
          status: 'active');
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

  AuthToken? get _token => widget.token ?? ref.read(authSessionProvider);

  void _openStudentProfile(AdminStudentItem item) async {
    final token = _token;
    if (token == null) return;
    final parts = item.fullName.trim().split(RegExp(r'\s+'));
    final first = parts.isNotEmpty ? parts.first : item.fullName;
    final last = parts.length > 1 ? parts.sublist(1).join(' ') : '';
    final studentListItem = StudentListItem(
      id: item.id,
      firstName: first,
      lastName: last,
      studentNumber: item.studentNumber.isNotEmpty ? item.studentNumber : null,
      status: item.status,
      parentName: item.parent.isNotEmpty ? item.parent : null,
      gradeLevel: item.gradeLevel.isNotEmpty ? item.gradeLevel : null,
    );
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => StudentProgressScreen(
          token: token,
          student: studentListItem,
        ),
      ),
    );
    if (mounted) _load();
  }

  @override
  Widget build(BuildContext context) {
    final hasGroupFilter = widget.groupId != null;
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
                icon: Icons.school_rounded,
                title: hasGroupFilter
                    ? (widget.groupName ?? tr('طلاب الحلقة'))
                    : tr('الطلاب'),
                subtitle: tr('الطلاب النشطون وبحث سريع بالاسم أو الرقم'),
                metrics: [
                  AdminHeroMetric(
                    icon: Icons.people_rounded,
                    label: tr('إجمالي الطلاب'),
                    value: _loading ? '…' : '$_total',
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AdminSearchField(
                    controller: _searchCtrl,
                    hint: tr('بحث باسم الطالب أو الرقم...'),
                  ),
                  if (hasGroupFilter) ...[
                    const SizedBox(height: 10),
                    _GroupFilterChip(
                      label: widget.groupName ?? tr('حلقة محددة'),
                      onClear: () => Navigator.pop(context),
                    ),
                  ],
                ],
              ),
            ),
          ),
          ..._buildBody(context),
        ],
      ),
    );
  }

  List<Widget> _buildBody(BuildContext context) {
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
            icon: Icons.person_search_rounded,
            title: tr('لا يوجد طلاب'),
            subtitle: _search.isEmpty ? null : tr('جرّب كلمة بحث مختلفة'),
          ),
        ),
      ];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, kAdminBottomInset),
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
                padding: const EdgeInsets.only(bottom: 10),
                child: _StudentCard(
                  student: _items[i],
                  onTap: () => _openStudentProfile(_items[i]),
                )
                    .animate()
                    .fadeIn(delay: (i * 30).ms, duration: 300.ms)
                    .slideX(begin: 0.04, end: 0, delay: (i * 30).ms),
              );
            },
            childCount: _items.length + (_loadingMore ? 1 : 0),
          ),
        ),
      ),
    ];
  }
}

// ─── Group filter chip ────────────────────────────────────────────────────────
class _GroupFilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onClear;
  const _GroupFilterChip({required this.label, required this.onClear});

  @override
  Widget build(BuildContext context) {
    const color = AppColors.gold;
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 12, end: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.groups_rounded, color: color, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: appTextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
            IconButton(
              tooltip: tr('إلغاء التصفية'),
              onPressed: onClear,
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close_rounded, size: 16, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Student card ─────────────────────────────────────────────────────────────
class _StudentCard extends StatelessWidget {
  final AdminStudentItem student;
  final VoidCallback? onTap;

  const _StudentCard({
    required this.student,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = student.isActive ? AppColors.success : AppColors.error;
    return AdminCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          AdminAvatar(text: student.initials, color: AppColors.gold, size: 48),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        student.fullName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AdminBadge(
                      label: student.isActive ? tr('نشط') : tr('غير نشط'),
                      color: statusColor,
                    ),
                  ],
                ),
                if (student.studentNumber.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    student.studentNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appTextStyle(
                      fontSize: 12,
                      color: AdminTheme.muted(context),
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    if (student.gradeLevel.isNotEmpty)
                      AdminBadge(
                        icon: Icons.school_outlined,
                        label: student.gradeLevel,
                        color: AppColors.info,
                      ),
                    AdminBadge(
                      icon: Icons.menu_book_outlined,
                      label: trf('ج {0}', [student.currentJuz]),
                      color: AppColors.primaryLight,
                    ),
                    if (student.parent.isNotEmpty)
                      AdminBadge(
                        icon: Icons.person_outline_rounded,
                        label: student.parent,
                        color: AppColors.gold,
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (onTap != null) ...[
            const SizedBox(width: 4),
            Icon(
              AdminTheme.chevron(context),
              size: 22,
              color: AdminTheme.muted(context),
            ),
          ],
        ],
      ),
    );
  }
}
