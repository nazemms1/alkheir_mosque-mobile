import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/operations/data/params/operations_params.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/records_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// تسمية حالة التسجيل بالنص المترجم (كل نص حرفي ليظهر في فحص الترجمة).
String enrollmentStatusLabel(String status) => switch (status) {
      'active' => L10nGateway.current.active,
      'completed' => L10nGateway.current.completed,
      'cancelled' => L10nGateway.current.cancelled,
      _ => status,
    };

/// تسجيلات الطلاب في الحلقات. يمكن حصرها بطالب أو بحلقة.
class EnrollmentsScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int? studentId;
  final String? studentName;
  final int? groupId;
  final String? groupName;

  const EnrollmentsScreen({
    super.key,
    required this.token,
    this.studentId,
    this.studentName,
    this.groupId,
    this.groupName,
  });

  @override
  ConsumerState<EnrollmentsScreen> createState() => _EnrollmentsScreenState();
}

class _EnrollmentsScreenState extends ConsumerState<EnrollmentsScreen> {
  String? _status;
  int _reloadToken = 0;

  void _refresh() => setState(() => _reloadToken++);

  String get _title {
    if (widget.studentName != null) return widget.studentName!;
    if (widget.groupName != null) return widget.groupName!;
    return L10nGateway.current.registrations;
  }

  Future<void> _openForm({EnrollmentRecord? enrollment}) async {
    final saved =
        await context.push<bool>(AppRoutes.enrollmentFormRoute, extra: (
      token: widget.token,
      enrollment: enrollment,
      studentId: widget.studentId,
      studentName: widget.studentName,
      groupId: widget.groupId,
      groupName: widget.groupName
    ));
    if (saved == true) _refresh();
  }

  Future<void> _openSheet(EnrollmentRecord e) async {
    final t = widget.token;
    final choice = await showRecordSheet(
      context,
      title: e.studentName,
      subtitle: e.groupName ?? '',
      rows: [
        MapEntry(L10nGateway.current.status, enrollmentStatusLabel(e.status)),
        MapEntry(L10nGateway.current.enrollmentDate, e.enrolledAt ?? ''),
        MapEntry(L10nGateway.current.leftOn, e.leftAt ?? ''),
        MapEntry(L10nGateway.current.points, '${e.finalPoints}'),
        MapEntry(L10nGateway.current.savedPages, '${e.memorizedPages}'),
        MapEntry(L10nGateway.current.course, e.courseName ?? ''),
        MapEntry(L10nGateway.current.notes, e.notes ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateEnrollments(t))
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteEnrollments(t))
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted) return;
    if (choice == 'edit') await _openForm(enrollment: e);
    if (choice == 'delete') await _delete(e);
  }

  Future<void> _delete(EnrollmentRecord e) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteEnrollment,
      message: L10nGateway.current.thisEnrollmentWillBeRemoved,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok || !mounted) return;
    final outcome = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.deleteEnrollment(e.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    showModuleSnack(context, L10nGateway.current.enrollmentDeleted);
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewEnrollments(t)) {
      return ModuleScaffold(title: _title, body: const ModuleAccessDenied());
    }
    return ModuleScaffold(
      title: _title,
      floatingActionButton: ModuleAccess.canCreateEnrollments(t)
          ? AdminFab(
              label: context.l10n.newEnrollment,
              icon: Icons.add_rounded,
              onPressed: () => _openForm(),
            )
          : null,
      body: PagedList<EnrollmentRecord>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noEnrollments,
        header: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 10),
          child: AdminChoiceBar<String?>(
            options: const <String?>[null, 'active', 'completed', 'cancelled'],
            selected: _status,
            labelOf: (value) => value == null
                ? L10nGateway.current.all
                : enrollmentStatusLabel(value),
            onSelected: (value) => setState(() {
              _status = value;
              _reloadToken++;
            }),
          ),
        ),
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.enrollments(
                  page: page,
                  studentId: widget.studentId,
                  groupId: widget.groupId,
                  status: _status,
                )),
        itemBuilder: (context, e, _) => _EnrollmentCard(
          enrollment: e,
          onTap: () => _openSheet(e),
        ),
      ),
    );
  }
}

class _EnrollmentCard extends StatelessWidget {
  final EnrollmentRecord enrollment;
  final VoidCallback onTap;

  const _EnrollmentCard({required this.enrollment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final e = enrollment;
    final muted = AdminTheme.muted(context);
    final color = e.isActive ? context.appColors.success : muted;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AdminCard(
        accent: color,
        onTap: onTap,
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AdminIconBubble(
                  icon: Icons.how_to_reg_rounded,
                  color: color,
                  size: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.studentName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: FontSize.body,
                          fontWeight: FontWeight.w800,
                          color: AdminTheme.text(context),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${e.groupName ?? ''}  ·  ${e.enrolledAt ?? ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                            fontSize: FontSize.caption, color: muted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AdminBadge(
                    label: enrollmentStatusLabel(e.status), color: color),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.stars_rounded,
                    size: 15, color: context.appColors.gold),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    context.l10n.pointsPages(e.finalPoints, e.memorizedPages),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        appTextStyle(fontSize: FontSize.caption, color: muted),
                  ),
                ),
                Icon(AdminTheme.chevron(context), color: muted),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// نموذج تسجيل: الطالب والحلقة وتاريخ الالتحاق والحالة.
class EnrollmentFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final EnrollmentRecord? enrollment;
  final int? studentId;
  final String? studentName;
  final int? groupId;
  final String? groupName;

  const EnrollmentFormScreen({
    super.key,
    required this.token,
    this.enrollment,
    this.studentId,
    this.studentName,
    this.groupId,
    this.groupName,
  });

  @override
  ConsumerState<EnrollmentFormScreen> createState() =>
      _EnrollmentFormScreenState();
}

class _EnrollmentFormScreenState extends ConsumerState<EnrollmentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _enrolledAt = TextEditingController();
  final _leftAt = TextEditingController();
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _group;
  String _status = 'active';
  bool _saving = false;
  String? _error;

  bool get _isEdit => widget.enrollment != null;

  @override
  void initState() {
    super.initState();
    final e = widget.enrollment;
    if (e != null) {
      _student = PickerItem(id: e.studentId, label: e.studentName);
      _group = PickerItem(id: e.groupId, label: e.groupName ?? '');
      _enrolledAt.text = e.enrolledAt ?? '';
      _leftAt.text = e.leftAt ?? '';
      _notes.text = e.notes ?? '';
      _status = e.status;
    } else {
      if (widget.studentId != null) {
        _student = PickerItem(
          id: widget.studentId!,
          label: widget.studentName ?? '',
        );
      }
      if (widget.groupId != null) {
        _group = PickerItem(id: widget.groupId!, label: widget.groupName ?? '');
      }
      _enrolledAt.text = isoDate(DateTime.now());
    }
  }

  @override
  void dispose() {
    _enrolledAt.dispose();
    _leftAt.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<List<PickerItem>> _loadStudents(String search) async {
    final page = await ref
        .read(managementActionsControllerProvider.notifier)
        .query((r) => r.students(search: search));
    return [
      for (final s in page.items)
        PickerItem(id: s.id, label: s.fullName, subtitle: s.studentNumber),
    ];
  }

  Future<List<PickerItem>> _loadGroups(String search) async {
    final page = await ref
        .read(managementActionsControllerProvider.notifier)
        .query((r) => r.groups());
    final needle = search.toLowerCase();
    return [
      for (final g in page.items)
        if (needle.isEmpty || g.name.toLowerCase().contains(needle))
          PickerItem(id: g.id, label: g.name, subtitle: g.courseName),
    ];
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() {
      _error = _student == null
          ? L10nGateway.current.chooseStudent
          : _group == null
              ? L10nGateway.current.chooseGroup
              : null;
    });
    if (!valid || _student == null || _group == null) return;
    setState(() => _saving = true);
    final outcome2 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.saveEnrollment(
            widget.enrollment?.id,
            SaveEnrollmentParams(
                studentId: _student!.id,
                groupId: _group!.id,
                enrolledAt: _enrolledAt.text,
                status: _status,
                leftAt: nullIfBlank(_leftAt.text),
                notes: nullIfBlank(_notes.text))));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    final allowed = _isEdit
        ? ModuleAccess.canUpdateEnrollments(t)
        : ModuleAccess.canCreateEnrollments(t);
    return ModuleScaffold(
      title: _isEdit ? context.l10n.editEnrollment : context.l10n.newEnrollment,
      body: !allowed
          ? const ModuleAccessDenied()
          : ModuleFormPage(
              formKey: _formKey,
              children: [
                ModuleFormSection(
                  title: context.l10n.studentAndGroup,
                  icon: Icons.how_to_reg_rounded,
                  children: [
                    PickerField(
                      label: context.l10n.student,
                      value: _student?.label,
                      error: _error,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: L10nGateway.current.chooseStudent,
                          load: _loadStudents,
                        );
                        if (picked != null) setState(() => _student = picked);
                      },
                    ),
                    PickerField(
                      label: context.l10n.group,
                      value: _group?.label,
                      onTap: () async {
                        final picked = await showItemPicker(
                          context,
                          title: L10nGateway.current.chooseGroup,
                          load: _loadGroups,
                        );
                        if (picked != null) setState(() => _group = picked);
                      },
                    ),
                  ],
                ),
                ModuleFormSection(
                  title: context.l10n.datesAndStatus,
                  icon: Icons.event_rounded,
                  children: [
                    moduleDateField(
                      context: context,
                      controller: _enrolledAt,
                      label: context.l10n.enrollmentDate,
                      required: true,
                    ),
                    DropdownButtonFormField<String>(
                      initialValue: _status,
                      isExpanded: true,
                      decoration:
                          InputDecoration(labelText: context.l10n.status),
                      items: [
                        for (final code in const [
                          'active',
                          'completed',
                          'cancelled'
                        ])
                          DropdownMenuItem(
                            value: code,
                            child: Text(enrollmentStatusLabel(code)),
                          ),
                      ],
                      onChanged: (v) => setState(() => _status = v ?? _status),
                    ),
                    const SizedBox(height: 12),
                    moduleDateField(
                      context: context,
                      controller: _leftAt,
                      label: context.l10n.leftOn,
                    ),
                  ],
                ),
                ModuleFormSection(
                  title: context.l10n.additionalInformation,
                  icon: Icons.notes_rounded,
                  children: [
                    moduleTextField(
                      controller: _notes,
                      label: context.l10n.notes,
                      maxLines: 2,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ModuleSaveButton(
                  saving: _saving,
                  onPressed: _save,
                  label: context.l10n.save,
                ),
              ],
            ),
    );
  }
}
