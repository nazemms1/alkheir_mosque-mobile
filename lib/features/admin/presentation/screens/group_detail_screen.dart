import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'group_form_screen.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

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
  final _service = AdminRepositoryImpl();

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
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final detail = await _service.fetchGroupDetail(widget.group);
      if (!mounted) return;
      setState(() {
        _detail = detail;
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

  Future<void> _editGroup() async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
          builder: (_) => GroupFormScreen(token: widget.token, group: _detail)),
    );
    if (saved == true && mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> _deleteGroup() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr('حذف الحلقة'),
            style: appTextStyle(fontWeight: FontWeight.w700)),
        content: Text(
            trf('هل أنت متأكد من حذف "{0}"؟ لا يمكن التراجع عن هذا الإجراء.',
                [widget.group.name]),
            style: appTextStyle(fontSize: 14)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(tr('إلغاء'), style: appTextStyle()),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(tr('حذف'),
                style: appTextStyle(fontWeight: FontWeight.w700)),
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
        SnackBar(content: Text(e.toString(), style: appTextStyle())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        title: widget.group.name,
        subtitle: tr('تفاصيل الحلقة'),
        actions: [
          if (_canDelete)
            _deleting
                ? const Padding(
                    padding: EdgeInsets.all(14),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.5),
                    ),
                  )
                : IconButton(
                    tooltip: tr('حذف الحلقة'),
                    icon: const Icon(Icons.delete_outline_rounded,
                        color: Colors.white),
                    onPressed: _deleteGroup,
                  ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _errorBody()
              : _Body(group: _detail!),
      floatingActionButton: (!_loading && _error == null && _canUpdate)
          ? AdminFab(
              label: tr('تعديل'),
              icon: Icons.edit_rounded,
              onPressed: _editGroup,
            )
          : null,
    );
  }

  /// رفض الصلاحية يظهر كحالة قفل بدون زر إعادة محاولة.
  Widget _errorBody() {
    final message = _error!;
    if (message.contains('صلاحية') || message.contains('403')) {
      return AdminEmptyState(
        icon: Icons.lock_outline_rounded,
        title: tr('ليس لديك صلاحية'),
        subtitle: message,
      );
    }
    return AdminErrorState(
      message: message,
      onRetry: _load,
      retryLabel: tr('إعادة المحاولة'),
    );
  }
}

// ─── Group Hero Banner ────────────────────────────────────────────────────────
class _GroupHeroBanner extends StatelessWidget {
  final AdminGroupDetail group;
  const _GroupHeroBanner({required this.group});

  @override
  Widget build(BuildContext context) {
    return AdminHero(
      icon: Icons.groups_rounded,
      title: group.name,
      subtitle: group.course,
      metrics: [
        AdminHeroMetric(
          icon: group.isActive
              ? Icons.check_circle_rounded
              : Icons.archive_rounded,
          label: tr('الحالة'),
          value: group.isActive ? tr('نشطة') : tr('منتهية'),
        ),
        AdminHeroMetric(
          icon: Icons.people_rounded,
          label: tr('الطلاب'),
          value: '${group.enrollments.length}',
        ),
      ],
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        _GroupHeroBanner(group: group),
        const SizedBox(height: 14),
        _Card(
          title: tr('بيانات الحلقة'),
          icon: Icons.info_outline_rounded,
          color: AppColors.gold,
          children: [
            AdminInfoRow(
                icon: Icons.person_rounded,
                label: tr('المعلم'),
                value: group.teacher),
            if (group.assistantTeacher.isNotEmpty)
              AdminInfoRow(
                  icon: Icons.person_outline_rounded,
                  label: tr('المساعد'),
                  value: group.assistantTeacher),
            AdminInfoRow(
                icon: Icons.menu_book_rounded,
                label: tr('المقرر'),
                value: group.course),
            AdminInfoRow(
                icon: Icons.calendar_month_rounded,
                label: tr('السنة الدراسية'),
                value: group.academicYear),
            if (group.startsOn != null)
              AdminInfoRow(
                  icon: Icons.play_circle_outline_rounded,
                  label: tr('تاريخ البدء'),
                  value: group.startsOn!),
            if (group.endsOn != null)
              AdminInfoRow(
                  icon: Icons.stop_circle_outlined,
                  label: tr('تاريخ الانتهاء'),
                  value: group.endsOn!),
          ],
        ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0),
        const SizedBox(height: 12),
        _Card(
          title: trf('الطلاب المسجّلون ({0})', [group.enrollments.length]),
          icon: Icons.people_rounded,
          color: AppColors.primaryLight,
          children: group.enrollments.isEmpty
              ? [_EmptyRow(message: tr('لا يوجد طلاب مسجّلون في هذه الحلقة'))]
              : group.enrollments
                  .map((e) => _EnrollmentRow(enrollment: e))
                  .toList(),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 300.ms)
            .slideY(begin: 0.05, end: 0),
      ],
    );
  }
}

class _EnrollmentRow extends StatelessWidget {
  final AdminEnrollmentItem enrollment;
  const _EnrollmentRow({required this.enrollment});

  @override
  Widget build(BuildContext context) {
    final isActive = enrollment.status == 'active';
    final statusColor =
        isActive ? AppColors.success : AdminTheme.muted(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AdminTheme.card(context),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: statusColor.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(enrollment.studentName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AdminTheme.text(context),
                    )),
              ),
              const SizedBox(width: 8),
              AdminBadge(
                label: isActive ? tr('نشط') : tr('غير نشط'),
                color: statusColor,
              ),
            ],
          ),
          if (enrollment.parentName?.isNotEmpty == true) ...[
            const SizedBox(height: 4),
            Text(enrollment.parentName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: appTextStyle(
                  fontSize: 12,
                  color: AdminTheme.muted(context),
                )),
          ],
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              AdminBadge(
                icon: Icons.menu_book_rounded,
                label: trf('{0} صفحة', [enrollment.memorizedPages]),
                color: AppColors.gold,
              ),
              AdminBadge(
                icon: Icons.star_rounded,
                label: trf('{0} نقطة', [enrollment.finalPoints]),
                color: AppColors.primaryLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Shared ───────────────────────────────────────────────────────────────────
class _Card extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Widget> children;
  const _Card(
      {required this.title,
      required this.icon,
      required this.color,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      accent: color,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            AdminIconBubble(icon: icon, color: color, size: 36),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AdminTheme.text(context),
                  )),
            ),
          ]),
          const SizedBox(height: 10),
          Divider(color: AdminTheme.border(context), height: 1),
          const SizedBox(height: 8),
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
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(message,
            textAlign: TextAlign.center,
            style:
                appTextStyle(fontSize: 13, color: AdminTheme.muted(context))),
      );
}
