import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

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
      0 => L10nGateway.current.sunday,
      1 => L10nGateway.current.monday,
      2 => L10nGateway.current.tuesday,
      3 => L10nGateway.current.wednesday,
      4 => L10nGateway.current.thursday,
      5 => L10nGateway.current.friday,
      6 => L10nGateway.current.saturday,
      _ => '',
    };

/// اختيار حلقة قبل عرض جدولها.
class GroupPickerScreen extends ConsumerWidget {
  final AuthToken token;

  const GroupPickerScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ModuleAccess.canViewGroups(token)) {
      return ModuleScaffold(
        title: L10nGateway.current.groupSchedules,
        body: const ModuleAccessDenied(),
      );
    }
    final service = ref.read(managementActionsControllerProvider.notifier);
    return ModuleScaffold(
      title: context.l10n.groupSchedules,
      body: PagedList<GroupItem>(
        emptyText: context.l10n.noGroups,
        fetch: (page) => service.query((r) => r.groups(page: page)),
        itemBuilder: (context, group, _) => _GroupPickCard(
          group: group,
          onTap: () => context.push(AppRoutes.groupSchedulesRoute,
              extra: (token: token, group: group)),
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
    final color = group.isActive ? context.appColors.primaryLight : muted;
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
                      fontSize: FontSize.bodyLarge,
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
                      style: appTextStyle(
                          fontSize: FontSize.caption, color: muted),
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
class GroupSchedulesScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final GroupItem group;

  const GroupSchedulesScreen({
    super.key,
    required this.token,
    required this.group,
  });

  @override
  ConsumerState<GroupSchedulesScreen> createState() =>
      _GroupSchedulesScreenState();
}

class _GroupSchedulesScreenState extends ConsumerState<GroupSchedulesScreen> {
  late final _service = ref.read(managementActionsControllerProvider.notifier);
  late final _loadProvider = screenDataProvider(() async {
    final slots = await ref
        .read(managementActionsControllerProvider.notifier)
        .query((r) => r.schedules(widget.group.id));
    return slots;
  });
  List<GroupScheduleSlot> get _slots =>
      ref.watch(_loadProvider).valueOrNull ?? const [];
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  void _reload() {
    _load();
  }

  Future<void> _edit({GroupScheduleSlot? slot}) async {
    final saved = await showFormSheet(
      context,
      title: slot == null
          ? L10nGateway.current.addSession
          : L10nGateway.current.editSession,
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
        MapEntry(L10nGateway.current.from, slot.startsAt),
        MapEntry(L10nGateway.current.to, slot.endsAt),
      ],
      actions: [
        if (canManage)
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (canManage)
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
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
      title: L10nGateway.current.deleteSession,
      message: L10nGateway.current.aGroupCannotBeLeft,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome2 = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.deleteSchedule(widget.group.id, slot.id));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.sessionDeleted);
    _reload();
  }

  @override
  Widget build(BuildContext context) {
    final canManage = ModuleAccess.canManageSchedules(widget.token);
    return ModuleScaffold(
      title: widget.group.name,
      floatingActionButton: canManage
          ? AdminFab(
              label: context.l10n.addSession,
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
        color: context.appColors.error,
        onRetry: _reload,
      );
    }
    if (_slots.isEmpty) {
      return ModuleMessage(
        text: L10nGateway.current.noSessionsForThisGroup,
        icon: Icons.event_busy_rounded,
      );
    }
    return RefreshIndicator(
      onRefresh: () async => _reload(),
      color: context.appColors.primaryLight,
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
                color: context.appColors.primaryLight.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                day.isEmpty ? '?' : day.substring(0, 1),
                style: appTextStyle(
                  fontSize: FontSize.title,
                  fontWeight: FontWeight.w800,
                  color: context.appColors.primaryLight,
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
                      fontSize: FontSize.body,
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
                          style: appTextStyle(
                              fontSize: FontSize.caption, color: muted),
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
class _ScheduleForm extends ConsumerStatefulWidget {
  final int groupId;
  final GroupScheduleSlot? slot;
  final ManagementActionsController service;

  const _ScheduleForm({
    required this.groupId,
    required this.slot,
    required this.service,
  });

  @override
  ConsumerState<_ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends ConsumerState<_ScheduleForm> {
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
      await ref
          .read(managementActionsControllerProvider.notifier)
          .query((r) => r.saveSchedule(
                widget.groupId,
                widget.slot?.id,
                dayOfWeek: _day,
                timeSlot: _slot,
              ));
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
          decoration: InputDecoration(labelText: context.l10n.today),
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
          decoration: InputDecoration(labelText: context.l10n.timeSlot),
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
            backgroundColor: context.appColors.brandPrimary,
          ),
          child: _saving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  context.l10n.save,
                  style: appTextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
        ),
      ],
    );
  }
}
