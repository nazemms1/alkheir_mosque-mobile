import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/admin_dashboard_model.dart';
import '../../../data/models/auth_token.dart';
import '../../../core/rbac/permissions.dart';
import '../../../data/services/admin_service.dart';
import 'group_detail_screen.dart';
import 'group_form_screen.dart';
import 'qr_scanner_screen.dart';

class AdminGroupsScreen extends StatefulWidget {
  final AuthToken token;

  const AdminGroupsScreen({super.key, required this.token});

  @override
  State<AdminGroupsScreen> createState() => _AdminGroupsScreenState();
}

class _AdminGroupsScreenState extends State<AdminGroupsScreen> {
  final _service = AdminService();

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
      MaterialPageRoute(builder: (_) => const GroupFormScreen()),
    );
    if (created == true) _load();
  }

  void _openScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QrScannerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return _ErrorView(message: _error!, onRetry: _load);
    }

    return Scaffold(
      floatingActionButton: Padding(
        // رفع الأزرار فوق شريط التنقل السفلي العائم في MainShell — بدون هذا
        // الهامش تتراكب الأزرار بجانب الناف بار بدل الظهور فوقه.
        padding: const EdgeInsets.only(bottom: 88),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'qr_scan_fab',
              onPressed: _openScanner,
              backgroundColor: AppColors.gold,
              child: const Icon(Icons.qr_code_scanner_rounded,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // ── Summary pills ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                _SummaryPill(
                  label: 'حلقات نشطة',
                  value: '${_active.length}',
                  color: AppColors.success,
                  icon: Icons.check_circle_rounded,
                ),
                const SizedBox(width: 10),
                _SummaryPill(
                  label: 'إجمالي الطلاب',
                  value: '${_active.fold(0, (s, g) => s + g.enrollmentsCount)}',
                  color: AppColors.primaryLight,
                  icon: Icons.people_rounded,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          // ── List ──────────────────────────────────────────────────────────
          Expanded(
            child: _GroupList(
                groups: _active, onRefresh: _load, token: widget.token),
          ),
        ],
      ),
    );
  }
}

// ─── Group list ───────────────────────────────────────────────────────────────
class _GroupList extends StatelessWidget {
  final List<AdminGroupItem> groups;
  final Future<void> Function() onRefresh;
  final AuthToken token;
  const _GroupList(
      {required this.groups, required this.onRefresh, required this.token});

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      return const Center(
        child: Text('لا توجد حلقات',
            style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)),
      );
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 120),
        itemCount: groups.length,
        itemBuilder: (_, i) =>
            _GroupCard(group: groups[i], token: token, onRefresh: onRefresh)
                .animate()
                .fadeIn(delay: (i * 40).ms, duration: 350.ms)
                .slideY(begin: 0.05, end: 0, delay: (i * 40).ms),
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
    final color = group.isActive ? AppColors.primaryLight : AppColors.textMuted;
    return GestureDetector(
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.18), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: group.isActive
                      ? [
                          AppColors.primary.withOpacity(0.9),
                          AppColors.primaryMid
                        ]
                      : [const Color(0xFF4A4A4A), const Color(0xFF3A3A3A)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(18)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.groups_rounded,
                        color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Cairo',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          group.course,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 11,
                            fontFamily: 'Cairo',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: group.isActive
                          ? AppColors.success.withOpacity(0.25)
                          : Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: group.isActive
                            ? AppColors.success.withOpacity(0.5)
                            : Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      group.isActive ? 'نشطة' : 'منتهية',
                      style: TextStyle(
                        color: group.isActive
                            ? AppColors.success
                            : Colors.white.withOpacity(0.75),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cairo',
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
                  _InfoRow(
                      icon: Icons.person_rounded,
                      label: 'المعلم',
                      value: group.teacher.isEmpty ? '—' : group.teacher),
                  if (group.assistantTeacher.isNotEmpty)
                    _InfoRow(
                        icon: Icons.person_outline_rounded,
                        label: 'المساعد',
                        value: group.assistantTeacher),
                  _InfoRow(
                      icon: Icons.school_rounded,
                      label: 'السنة الدراسية',
                      value: group.academicYear.isEmpty
                          ? '—'
                          : group.academicYear),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: color.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.people_rounded, color: color, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          '${group.enrollmentsCount} طالب مسجّل',
                          style: TextStyle(
                            color: color,
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
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;
  const _InfoRow(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 15, color: AppColors.textMuted),
          const SizedBox(width: 6),
          Text(
            '$label: ',
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryPill extends StatelessWidget {
  final String label, value;
  final Color color;
  final IconData icon;
  const _SummaryPill(
      {required this.label,
      required this.value,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 4),
            Text(value,
                style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo')),
            Text(label,
                style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 10,
                    fontFamily: 'Cairo')),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline_rounded,
              size: 48, color: AppColors.error),
          const SizedBox(height: 12),
          Text(message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Cairo')),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: onRetry,
              child: const Text('إعادة المحاولة',
                  style: TextStyle(fontFamily: 'Cairo'))),
        ],
      ),
    );
  }
}
