import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'group_detail_screen.dart';
import 'group_form_screen.dart';
import 'qr_scanner_screen.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

class AdminGroupsScreen extends StatefulWidget {
  final AuthToken token;

  const AdminGroupsScreen({super.key, required this.token});

  @override
  State<AdminGroupsScreen> createState() => _AdminGroupsScreenState();
}

class _AdminGroupsScreenState extends State<AdminGroupsScreen> {
  final _service = AdminRepositoryImpl();

  List<AdminGroupItem> _active = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await _service.fetchGroups(perPage: 100, isActive: true);
      if (!mounted) return;
      setState(() {
        _active = result.items;
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

  bool get _canCreate => widget.token.hasPermission(Permissions.groupsCreate);

  Future<void> _createGroup() async {
    final created = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => GroupFormScreen(token: widget.token)),
    );
    if (created == true) _load();
  }

  void _openScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QrScannerScreen(token: widget.token)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return AdminErrorState(
        message: _error!,
        onRetry: _load,
        retryLabel: tr('إعادة المحاولة'),
      );
    }

    final totalStudents =
        _active.fold<int>(0, (sum, g) => sum + g.enrollmentsCount);

    return Scaffold(
      // رفع زر الإضافة فوق شريط التنقل السفلي العائم في MainShell.
      floatingActionButton: _canCreate
          ? Padding(
              padding: const EdgeInsets.only(bottom: 96),
              child: AdminFab(
                label: tr('حلقة جديدة'),
                icon: Icons.add_rounded,
                onPressed: _createGroup,
              ),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: _load,
        color: AppColors.primaryLight,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: kAdminPagePadding,
          children: [
            AdminHero(
              icon: Icons.groups_rounded,
              title: tr('إدارة الحلقات'),
              subtitle: tr('الحلقات النشطة وعدد الطلاب المسجّلين'),
              // زر المسح يظهر فقط لمن يملك صلاحية تسجيل الحضور.
              trailing: !ModuleAccess.canTakeStudentAttendance(widget.token)
                  ? null
                  : IconButton(
                      tooltip: tr('مسح رمز QR'),
                      onPressed: _openScanner,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.12),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(44, 44),
                      ),
                      icon: const Icon(Icons.qr_code_scanner_rounded),
                    ),
              metrics: [
                AdminHeroMetric(
                  icon: Icons.check_circle_rounded,
                  label: tr('حلقات نشطة'),
                  value: '${_active.length}',
                ),
                AdminHeroMetric(
                  icon: Icons.people_rounded,
                  label: tr('إجمالي الطلاب'),
                  value: '$totalStudents',
                ),
              ],
            ),
            const SizedBox(height: 18),
            if (_active.isEmpty)
              AdminEmptyState(
                icon: Icons.groups_outlined,
                title: tr('لا توجد حلقات'),
                subtitle: tr('ستظهر الحلقات النشطة هنا فور إنشائها'),
              )
            else
              for (var i = 0; i < _active.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _GroupCard(
                    group: _active[i],
                    token: widget.token,
                    onRefresh: _load,
                  )
                      .animate()
                      .fadeIn(delay: (i * 40).ms, duration: 350.ms)
                      .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
                ),
          ],
        ),
      ),
    );
  }
}

// ─── Group card ───────────────────────────────────────────────────────────────
class _GroupCard extends StatelessWidget {
  final AdminGroupItem group;
  final AuthToken token;
  final Future<void> Function() onRefresh;
  const _GroupCard(
      {required this.group, required this.token, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final color =
        group.isActive ? AppColors.primaryLight : AdminTheme.muted(context);
    return AdminCard(
      padding: EdgeInsets.zero,
      accent: color,
      onTap: () async {
        final changed = await Navigator.push<bool>(
          context,
          MaterialPageRoute(
            builder: (_) => GroupDetailScreen(
              group: group,
              token: token,
            ),
          ),
        );
        if (changed == true) onRefresh();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Row(
              children: [
                AdminIconBubble(
                  icon: Icons.groups_rounded,
                  color: color,
                  size: 44,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        group.course,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 12,
                          color: AdminTheme.muted(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AdminBadge(
                  label: group.isActive ? tr('نشطة') : tr('منتهية'),
                  color: color,
                  icon: group.isActive
                      ? Icons.check_circle_rounded
                      : Icons.pause_circle_rounded,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: AdminTheme.border(context)),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
            child: Column(
              children: [
                AdminInfoRow(
                  icon: Icons.person_rounded,
                  label: tr('المعلم'),
                  value: group.teacher,
                ),
                if (group.assistantTeacher.isNotEmpty)
                  AdminInfoRow(
                    icon: Icons.person_outline_rounded,
                    label: tr('المساعد'),
                    value: group.assistantTeacher,
                  ),
                AdminInfoRow(
                  icon: Icons.school_rounded,
                  label: tr('السنة الدراسية'),
                  value: group.academicYear,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_rounded, color: color, size: 18),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      trf('{0} طالب مسجّل', [group.enrollmentsCount]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
