import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/group_student_model.dart';
import '../../../data/models/management_model.dart';
import '../../../data/services/management_service.dart';
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
    final service = ManagementService();
    return ModuleScaffold(
      title: tr('جداول الحلقات'),
      body: PagedList<GroupItem>(
        emptyText: tr('لا توجد حلقات'),
        fetch: (page) => service.groups(page: page),
        itemBuilder: (context, group, _) => ModuleCard(
          accent: group.isActive ? AppColors.primaryLight : AppColors.textMuted,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => GroupSchedulesScreen(token: token, group: group),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.name,
                      style: appTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      group.courseName ?? '',
                      style: appTextStyle(
                        fontSize: 12,
                        color: moduleMuted(context),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_left_rounded,
                color: moduleMuted(context),
              ),
            ],
          ),
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
  final _service = ManagementService();
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
          ? FloatingActionButton.extended(
              onPressed: () => _edit(),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: Text(
                tr('إضافة حصة'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
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
      return ModuleMessage(text: tr('لا توجد حصص لهذه الحلقة'));
    }
    return RefreshIndicator(
      onRefresh: () async => _reload(),
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        itemCount: _slots.length,
        itemBuilder: (_, index) {
          final slot = _slots[index];
          return ModuleCard(
            onTap: () => _openSlot(slot),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    dayName(slot.dayOfWeek).isEmpty
                        ? '?'
                        : dayName(slot.dayOfWeek).substring(0, 1),
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
                        dayName(slot.dayOfWeek),
                        style: appTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        '${slot.timeSlotLabel}  ·  ${slot.startsAt} - ${slot.endsAt}',
                        style: appTextStyle(
                          fontSize: 12,
                          color: moduleMuted(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// نموذج حصة: اليوم والفترة الزمنية. يمنع الخادم تكرار الفترة في اليوم نفسه.
class _ScheduleForm extends StatefulWidget {
  final int groupId;
  final GroupScheduleSlot? slot;
  final ManagementService service;

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
