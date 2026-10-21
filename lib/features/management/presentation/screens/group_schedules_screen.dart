import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import '../widgets/module_widgets.dart';

/// فترات الحصص كما في الخادم (`ScheduleTimeSlots::TIMES`) — للعرض في المنتقي فقط،
/// والخادم هو من يحسب أوقات البداية والنهاية الفعلية.
const _timeSlots = <({String key, String range})>[
  (key: 'morning', range: '08:00 - 10:00'),
  (key: 'before_noon', range: '10:30 - 12:00'),
  (key: 'between_noon_afternoon', range: '12:30 - 15:00'),
  (key: 'between_afternoon_sunset', range: '15:30 - 18:00'),
  (key: 'between_sunset_night', range: '18:30 - 20:00'),
  (key: 'after_night', range: '20:30 - 22:00'),
];

/// أيام الأسبوع بترتيب Carbon الذي يستخدمه الخادم (0 = الأحد).
String dayName(int day) => switch (day) {
      0 => tr('الأحد'),
      1 => tr('الاثنين'),
      2 => tr('الثلاثاء'),
      3 => tr('الأربعاء'),
      4 => tr('الخميس'),
      5 => tr('الجمعة'),
      6 => tr('السبت'),
      _ => '',
    };

/// اختيار حلقة قبل عرض جدولها.
class GroupPickerScreen extends StatelessWidget {
  final AuthToken token;

  const GroupPickerScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canViewGroups(token)) {
      return ModuleScaffold(
        title: tr('جداول الحلقات'),
        body: const ModuleAccessDenied(),
      );
    }
    final service = ManagementRepositoryImpl();
    return ModuleScaffold(
      title: tr('جداول الحلقات'),
      body: PagedList<GroupItem>(
        emptyText: tr('لا توجد حلقات'),
        fetch: (page) => service.groups(page: page),
        itemBuilder: (context, group, _) => _GroupPickCard(
          group: group,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => GroupSchedulesScreen(token: token, group: group),
            ),
          ),
        ),
      ),
    );
  }
}

class _GroupPickCard extends StatelessWidget {
  final GroupItem group;
  final VoidCallback onTap;

  const _GroupPickCard({required this.group, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final muted = AdminTheme.muted(context);
    final color = group.isActive ? AppColors.primaryLight : muted;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AdminCard(
        accent: color,
        onTap: onTap,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            AdminIconBubble(icon: Icons.groups_rounded, color: color, size: 44),
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
                  if ((group.courseName ?? '').isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      group.courseName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(fontSize: 12, color: muted),
                    ),
                  ],
                ],
              ),
            ),
            Icon(AdminTheme.chevron(context), color: muted),
          ],
        ),
      ),
    );
  }
}

/// جدول حلقة واحدة: عرض الحصص وإضافتها وتعديلها وحذفها حسب الصلاحية.
class GroupSchedulesScreen extends StatefulWidget {
  final AuthToken token;
  final GroupItem group;

  const GroupSchedulesScreen({
    super.key,
    required this.token,
    required this.group,
  });

  @override
  State<GroupSchedulesScreen> createState() => _GroupSchedulesScreenState();
}

class _GroupSchedulesScreenState extends State<GroupSchedulesScreen> {
  final _service = ManagementRepositoryImpl();
  List<GroupScheduleSlot> _slots = const [];
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final slots = await _service.schedules(widget.group.id);
      if (!mounted) return;
      setState(() {
        _slots = slots;
        _loading = false;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  void _reload() {
    setState(() => _loading = true);
    _load();
  }

  Future<void> _edit({GroupScheduleSlot? slot}) async {
    final saved = await showFormSheet(
      context,
      title: slot == null ? tr('إضافة حصة') : tr('تعديل الحصة'),
      builder: (_) => _ScheduleForm(
        groupId: widget.group.id,
        slot: slot,
        service: _service,
      ),
    );
    if (saved == true) _reload();
  }

  Future<void> _openSlot(GroupScheduleSlot slot) async {
    final canManage = ModuleAccess.canManageSchedules(widget.token);
    final choice = await showRecordSheet(
      context,
      title: dayName(slot.dayOfWeek),
      subtitle: slot.timeSlotLabel,
      rows: [
        MapEntry(tr('من'), slot.startsAt),
        MapEntry(tr('إلى'), slot.endsAt),
      ],
      actions: [
        if (canManage)
          SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
        if (canManage)
          SheetAction(
            id: 'delete',
            label: tr('حذف'),
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted) return;
    if (choice == 'edit') await _edit(slot: slot);
    if (choice == 'delete') await _delete(slot);
  }

  Future<void> _delete(GroupScheduleSlot slot) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف الحصة'),
      message: tr('لا يمكن أن تبقى الحلقة بلا حصص.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    try {
      await _service.deleteSchedule(widget.group.id, slot.id);
      if (!mounted) return;
      showModuleSnack(context, tr('تم حذف الحصة'));
      _reload();
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canManage = ModuleAccess.canManageSchedules(widget.token);
    return ModuleScaffold(
      title: widget.group.name,
      floatingActionButton: canManage
          ? AdminFab(
              label: tr('إضافة حصة'),
              icon: Icons.add_rounded,
              onPressed: () => _edit(),
            )
          : null,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return ModuleMessage(
        text: errorText(_error!),
        icon: Icons.error_outline_rounded,
        color: AppColors.error,
        onRetry: _reload,
      );
    }
    if (_slots.isEmpty) {
      return ModuleMessage(
        text: tr('لا توجد حصص لهذه الحلقة'),
        icon: Icons.event_busy_rounded,
      );
    }
    return RefreshIndicator(
      onRefresh: () async => _reload(),
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, kAdminBottomInset),
        itemCount: _slots.length,
        itemBuilder: (_, index) => _SlotCard(
          slot: _slots[index],
          onTap: () => _openSlot(_slots[index]),
        ),
      ),
    );
  }
}

class _SlotCard extends StatelessWidget {
  final GroupScheduleSlot slot;
  final VoidCallback onTap;

  const _SlotCard({required this.slot, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final day = dayName(slot.dayOfWeek);
    final muted = AdminTheme.muted(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AdminCard(
        onTap: onTap,
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                day.isEmpty ? '?' : day.substring(0, 1),
                style: appTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryLight,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: appTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AdminTheme.text(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.schedule_rounded, size: 14, color: muted),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${slot.timeSlotLabel}  ·  ${slot.startsAt} - ${slot.endsAt}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appTextStyle(fontSize: 12, color: muted),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Icon(AdminTheme.chevron(context), color: muted),
          ],
        ),
      ),
    );
  }
}

/// نموذج حصة: اليوم والفترة الزمنية. يمنع الخادم تكرار الفترة في اليوم نفسه.
class _ScheduleForm extends StatefulWidget {
  final int groupId;
  final GroupScheduleSlot? slot;
  final ManagementRepositoryImpl service;

  const _ScheduleForm({
    required this.groupId,
    required this.slot,
    required this.service,
  });

  @override
  State<_ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<_ScheduleForm> {
  late int _day;
  late String _slot;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _day = widget.slot?.dayOfWeek ?? 0;
    _slot = widget.slot?.timeSlot ?? _timeSlots.first.key;
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await widget.service.saveSchedule(
        widget.groupId,
        widget.slot?.id,
        dayOfWeek: _day,
        timeSlot: _slot,
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownButtonFormField<int>(
          initialValue: _day,
          isExpanded: true,
          decoration: InputDecoration(labelText: tr('اليوم')),
          items: [
            for (var day = 0; day <= 6; day++)
              DropdownMenuItem(value: day, child: Text(dayName(day))),
          ],
          onChanged: (value) => setState(() => _day = value ?? 0),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _slot,
          isExpanded: true,
          decoration: InputDecoration(labelText: tr('الفترة')),
          items: [
            for (final slot in _timeSlots)
              DropdownMenuItem(value: slot.key, child: Text(slot.range)),
          ],
          onChanged: (value) => setState(() => _slot = value ?? _slot),
        ),
        const SizedBox(height: 18),
        FilledButton(
          onPressed: _saving ? null : _save,
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: AppColors.primary,
          ),
          child: _saving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  tr('حفظ'),
                  style: appTextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
        ),
      ],
    );
  }
}
