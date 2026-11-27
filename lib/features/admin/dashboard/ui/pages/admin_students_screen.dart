import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/admin_actions_controller.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/paged_list_controller.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/app/core/session/auth_session.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

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
  final _searchCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();

  late final _provider = pagedListProvider<AdminStudentItem>(
    () => (page) => ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchStudents(
            page: page,
            perPage: 20,
            search: _search,
            groupId: widget.groupId,
            status: 'active'))
        .then((r) => PagedResult(
              items: r.items,
              currentPage: page,
              lastPage: r.lastPage,
              total: r.total,
            )),
  );

  PagedListState<AdminStudentItem> get _state => ref.watch(_provider);
  PagedListController<AdminStudentItem> get _controller =>
      ref.read(_provider.notifier);
  String _search = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
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
      _controller.reset();
    });
  }

  void _onScroll() {
    if (_scrollCtrl.position.pixels >=
            _scrollCtrl.position.maxScrollExtent - 200 &&
        !ref.read(_provider).isLoading &&
        ref.read(_provider).hasMore) {
      _controller.loadMore();
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
    await context.push(AppRoutes.studentProgressRoute,
        extra: (token: token, student: studentListItem));
    if (mounted) _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    final hasGroupFilter = widget.groupId != null;
    return RefreshIndicator(
      onRefresh: _controller.reset,
      color: context.appColors.primaryLight,
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
                    ? (widget.groupName ?? context.l10n.groupStudents)
                    : context.l10n.students,
                subtitle: context.l10n.activeStudentsQuickSearchBy,
                metrics: [
                  AdminHeroMetric(
                    icon: Icons.people_rounded,
                    label: context.l10n.totalStudents,
                    value: _state.isFirstLoad ? '…' : '${_state.total}',
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
                    hint: context.l10n.searchByStudentNameOr,
                  ),
                  if (hasGroupFilter) ...[
                    const SizedBox(height: 10),
                    _GroupFilterChip(
                      label: widget.groupName ?? context.l10n.selectedGroup,
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
    if (_state.isFirstLoad) {
      return [
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        ),
      ];
    }
    if (_state.error != null && _state.items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: AdminErrorState(
            message: errorText(_state.error!),
            onRetry: _controller.reset,
            retryLabel: L10nGateway.current.tryAgain,
          ),
        ),
      ];
    }
    if (_state.items.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: AdminEmptyState(
            icon: Icons.person_search_rounded,
            title: L10nGateway.current.noStudents,
            subtitle: _search.isEmpty
                ? null
                : L10nGateway.current.tryADifferentSearchTerm,
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
              if (i == _state.items.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _StudentCard(
                  student: _state.items[i],
                  onTap: () => _openStudentProfile(_state.items[i]),
                )
                    .animate()
                    .fadeIn(delay: (i * 30).ms, duration: 300.ms)
                    .slideX(begin: 0.04, end: 0, delay: (i * 30).ms),
              );
            },
            childCount: _state.items.length + (_state.isLoadingMore ? 1 : 0),
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
    final color = context.appColors.gold;
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
            Icon(Icons.groups_rounded, color: color, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: appTextStyle(
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
            IconButton(
              tooltip: context.l10n.clearFilter,
              onPressed: onClear,
              constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              padding: EdgeInsets.zero,
              icon: Icon(Icons.close_rounded, size: 16, color: color),
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
    final statusColor =
        student.isActive ? context.appColors.success : context.appColors.error;
    return AdminCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          AdminAvatar(
              text: student.initials, color: context.appColors.gold, size: 48),
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
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AdminBadge(
                      label: student.isActive
                          ? context.l10n.active
                          : context.l10n.inactive,
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
                      fontSize: FontSize.caption,
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
                        color: context.appColors.info,
                      ),
                    AdminBadge(
                      icon: Icons.menu_book_outlined,
                      label: context.l10n.juz2(student.currentJuz),
                      color: context.appColors.primaryLight,
                    ),
                    if (student.parent.isNotEmpty)
                      AdminBadge(
                        icon: Icons.person_outline_rounded,
                        label: student.parent,
                        color: context.appColors.gold,
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
