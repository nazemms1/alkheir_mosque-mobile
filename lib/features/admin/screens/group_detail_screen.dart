import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/admin_dashboard_model.dart';
import '../../../data/models/auth_token.dart';
import '../../../core/rbac/permissions.dart';
import '../../../data/services/admin_service.dart';
import 'group_form_screen.dart';

class GroupDetailScreen extends StatefulWidget {
  final AdminGroupItem group;
  final AuthToken token;

  const GroupDetailScreen({
    super.key,
    required this.group,
    required this.token,
  });

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  final _service = AdminService();

  AdminGroupDetail? _detail;
  bool _loading = true;
  bool _deleting = false;
  String? _error;

  bool get _canUpdate => widget.token.hasPermission(Permissions.groupsUpdate);
  bool get _canDelete => widget.token.hasPermission(Permissions.groupsDelete);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() { _loading = true; _error = null; });
    try {
      final detail = await _service.fetchGroupDetail(widget.group);
      if (!mounted) return;
      setState(() { _detail = detail; _loading = false; });
    } catch (e) {
      if (!mounted) return;
      setState(() { _error = e.toString(); _loading = false; });
    }
  }

  Future<void> _editGroup() async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => GroupFormScreen(group: _detail)),
    );
    if (saved == true && mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> _deleteGroup() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('حذف الحلقة', style: TextStyle(fontFamily: 'Cairo')),
        content: Text('هل أنت متأكد من حذف "${widget.group.name}"؟ لا يمكن التراجع عن هذا الإجراء.',
            style: const TextStyle(fontFamily: 'Cairo')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('إلغاء', style: TextStyle(fontFamily: 'Cairo')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('حذف', style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    setState(() => _deleting = true);
    try {
      await _service.deleteGroup(widget.group.id);
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _deleting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString(), style: const TextStyle(fontFamily: 'Cairo'))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, __) => [_buildAppBar()],
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? _ErrorView(message: _error!, onRetry: _load)
                : _Body(group: _detail!),
      ),
      floatingActionButton: (!_loading && _error == null && _canUpdate)
          ? FloatingActionButton.extended(
              onPressed: _editGroup,
              backgroundColor: AppColors.primaryLight,
              icon: const Icon(Icons.edit_rounded, color: Colors.white),
              label: const Text('تعديل', style: TextStyle(fontFamily: 'Cairo', color: Colors.white)),
            )
          : null,
    );
  }

  Widget _buildAppBar() {
    final group = widget.group;
    return SliverAppBar(
      expandedHeight: 190,
      pinned: true,
      stretch: true,
      backgroundColor: const Color(0xFF0D5016),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        if (_canDelete)
          _deleting
              ? const Padding(
                  padding: EdgeInsets.all(14),
                  child: SizedBox(
                    width: 20, height: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.delete_outline_rounded, color: Colors.white),
                  onPressed: _deleteGroup,
                ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.blurBackground],
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 44),
                Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientGold,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.3), width: 2.5),
                    boxShadow: [
                      BoxShadow(color: AppColors.gold.withOpacity(0.4), blurRadius: 20, spreadRadius: 2),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.groups_rounded, color: Colors.white, size: 34),
                  ),
                ).animate().scale(begin: const Offset(0.7, 0.7), curve: Curves.easeOutBack, duration: 500.ms).fadeIn(),
                const SizedBox(height: 10),
                Text(
                  group.name,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Cairo'),
                ).animate().fadeIn(delay: 150.ms),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Chip(label: group.isActive ? 'نشطة' : 'منتهية',
                        color: group.isActive ? AppColors.success : AppColors.textMuted,
                        icon: group.isActive ? Icons.check_circle_rounded : Icons.archive_rounded),
                    const SizedBox(width: 8),
                    _Chip(label: '${group.enrollmentsCount} طالب', color: AppColors.primaryLight,
                        icon: Icons.people_rounded),
                  ],
                ).animate().fadeIn(delay: 250.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────
class _Body extends StatelessWidget {
  final AdminGroupDetail group;
  const _Body({required this.group});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      children: [
        _Card(
          title: 'بيانات الحلقة',
          icon: Icons.info_outline_rounded,
          color: AppColors.gold,
          children: [
            _InfoRow(label: 'المعلم', value: group.teacher.isEmpty ? '—' : group.teacher),
            if (group.assistantTeacher.isNotEmpty)
              _InfoRow(label: 'المساعد', value: group.assistantTeacher),
            _InfoRow(label: 'المقرر', value: group.course.isEmpty ? '—' : group.course),
            _InfoRow(label: 'السنة الدراسية', value: group.academicYear.isEmpty ? '—' : group.academicYear),
            if (group.startsOn != null) _InfoRow(label: 'تاريخ البدء', value: group.startsOn!),
            if (group.endsOn != null) _InfoRow(label: 'تاريخ الانتهاء', value: group.endsOn!),
          ],
        ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0),

        const SizedBox(height: 12),
        _Card(
          title: 'الطلاب المسجّلون (${group.enrollments.length})',
          icon: Icons.people_rounded,
          color: AppColors.primaryLight,
          children: group.enrollments.isEmpty
              ? [const _EmptyRow(message: 'لا يوجد طلاب مسجّلون في هذه الحلقة')]
              : group.enrollments.map((e) => _EnrollmentRow(enrollment: e)).toList(),
        ).animate().fadeIn(delay: 100.ms, duration: 300.ms).slideY(begin: 0.05, end: 0),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textMuted)),
        ),
        Expanded(
          child: Text(value, style: TextStyle(fontFamily: 'Cairo', fontSize: 12, fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface)),
        ),
      ],
    ),
  );
}

class _EnrollmentRow extends StatelessWidget {
  final AdminEnrollmentItem enrollment;
  const _EnrollmentRow({required this.enrollment});

  @override
  Widget build(BuildContext context) {
    final statusColor = enrollment.status == 'active' ? AppColors.success : AppColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: statusColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(enrollment.studentName,
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 13, fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                child: Text(enrollment.status == 'active' ? 'نشط' : 'غير نشط',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 10, fontWeight: FontWeight.w700, color: statusColor)),
              ),
            ],
          ),
          if (enrollment.parentName?.isNotEmpty == true) ...[
            const SizedBox(height: 4),
            Text(enrollment.parentName!,
                style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.textMuted)),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              _MiniStat(icon: Icons.menu_book_rounded, label: '${enrollment.memorizedPages} صفحة', color: AppColors.gold),
              const SizedBox(width: 8),
              _MiniStat(icon: Icons.star_rounded, label: '${enrollment.finalPoints} نقطة', color: AppColors.primaryLight),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _MiniStat({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontFamily: 'Cairo', fontSize: 11, fontWeight: FontWeight.w700, color: color)),
        ]),
      );
}

// ─── Shared ───────────────────────────────────────────────────────────────────
class _Card extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Widget> children;
  const _Card({required this.title, required this.icon, required this.color, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [BoxShadow(color: color.withOpacity(0.07), blurRadius: 16, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title, style: TextStyle(fontFamily: 'Cairo', fontSize: 14, fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface)),
            ),
          ]),
          const SizedBox(height: 10),
          Divider(color: Theme.of(context).dividerColor.withOpacity(0.5), height: 1),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

class _EmptyRow extends StatelessWidget {
  final String message;
  const _EmptyRow({required this.message});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(message, style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.textMuted)),
      );
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;
  const _Chip({required this.label, required this.color, this.icon});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      if (icon != null) ...[Icon(icon, size: 12, color: color), const SizedBox(width: 4)],
      Text(label, style: TextStyle(fontFamily: 'Cairo', fontSize: 11, fontWeight: FontWeight.w700, color: color)),
    ]),
  );
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  bool get _isForbidden => message.contains('صلاحية') || message.contains('403');

  @override
  Widget build(BuildContext context) {
    final color = _isForbidden ? AppColors.warning : AppColors.error;
    final icon = _isForbidden ? Icons.lock_outline_rounded : Icons.error_outline_rounded;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, size: 48, color: color),
          ),
          const SizedBox(height: 16),
          Text(_isForbidden ? 'ليس لديك صلاحية' : 'حدث خطأ',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.w700, color: color)),
          const SizedBox(height: 8),
          Text(message, textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.textMuted)),
          if (!_isForbidden) ...[
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('إعادة المحاولة', style: TextStyle(fontFamily: 'Cairo')),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLight, foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ]),
      ),
    ).animate().fadeIn(duration: 350.ms);
  }
}
