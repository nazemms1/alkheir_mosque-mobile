import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

String awqafStatusLabel(String status) => switch (status) {
      'passed' => L10nGateway.current.passed,
      'failed' => L10nGateway.current.failed,
      'cancelled' => L10nGateway.current.cancelled,
      _ => status,
    };

Color _awqafStatusColor(BuildContext context, String status) =>
    switch (status) {
      'passed' => context.appColors.success,
      'failed' => context.appColors.error,
      _ => context.appColors.textMuted,
    };

/// اختبارات الأوقاف: قائمة مع تصفية بالحالة، وتسجيل اختبار لطالب عبر تسجيله النشط.
class AwqafTestsScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const AwqafTestsScreen({super.key, required this.token});

  @override
  ConsumerState<AwqafTestsScreen> createState() => _AwqafTestsScreenState();
}

class _AwqafTestsScreenState extends ConsumerState<AwqafTestsScreen> {
  String? _status;
  int _reloadToken = 0;

  Future<void> _record() async {
    final saved = await context.push<bool>(AppRoutes.recordAwqafRoute,
        extra: widget.token);
    if (saved == true) setState(() => _reloadToken++);
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewAwqafTests(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.awqafTests,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.awqafTests,
      floatingActionButton: ModuleAccess.canRecordAwqafTests(t)
          ? FloatingActionButton.extended(
              onPressed: _record,
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.fact_check_rounded, color: Colors.white),
              label: Text(
                context.l10n.recordTest,
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<AwqafTest>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noAwqafTests,
        header: _StatusChips(
          selected: _status,
          onSelected: (value) => setState(() {
            _status = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.awqafTests(page: page, status: _status)),
        itemBuilder: (context, test, _) => ModuleCard(
          accent: _awqafStatusColor(context, test.status),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      test.student?.name ?? '—',
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: awqafStatusLabel(test.status),
                    color: _awqafStatusColor(context, test.status),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${test.juz?.name ?? ''}  ·  ${test.typeName ?? ''}  ·  ${test.testedOn}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
              Text(
                '${test.groupName ?? ''}${test.score == null ? '' : '  ·  ${formatAmount(test.score!)}'}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChips extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _StatusChips({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final options = <String?, String>{
      null: L10nGateway.current.all,
      'passed': L10nGateway.current.passed,
      'failed': L10nGateway.current.failed,
      'cancelled': L10nGateway.current.cancelled,
    };
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: ChoiceChip(
                label: Text(entry.value,
                    style: appTextStyle(fontSize: FontSize.caption)),
                selected: entry.key == selected,
                onSelected: (_) => onSelected(entry.key),
              ),
            ),
        ],
      ),
    );
  }
}

/// نموذج تسجيل اختبار أوقاف. نوع الاختبار يُختار من الكتالوج، والخادم يقبل نوع الأوقاف فقط.
class RecordAwqafScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const RecordAwqafScreen({super.key, required this.token});

  @override
  ConsumerState<RecordAwqafScreen> createState() => _RecordAwqafScreenState();
}

class _RecordAwqafScreenState extends ConsumerState<RecordAwqafScreen> {
  final _formKey = GlobalKey<FormState>();
  final _score = TextEditingController();
  final _date = TextEditingController(text: isoDate(DateTime.now()));
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _enrollment;
  PickerItem? _juz;
  PickerItem? _testType;
  PickerItem? _teacher;
  String _status = 'passed';
  bool _saving = false;
  String? _error;

  bool get _teacherIsSelf => widget.token.teacherId != null;

  @override
  void dispose() {
    for (final c in [_score, _date, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickTestType() async {
    final picked = await showItemPicker(
      context,
      title: L10nGateway.current.testType,
      load: (s) => referencePickerItems('quran-test-types', search: s),
    );
    if (picked != null) setState(() => _testType = picked);
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    final teacherId = _teacherIsSelf ? widget.token.teacherId : _teacher?.id;
    setState(() {
      _error = _enrollment == null
          ? L10nGateway.current.chooseEnrollment
          : _juz == null
              ? L10nGateway.current.chooseJuz
              : _testType == null
                  ? L10nGateway.current.chooseTestType
                  : teacherId == null
                      ? L10nGateway.current.chooseTeacher
                      : null;
    });
    if (!valid || _error != null) return;
    final score = _score.text.trim().isEmpty
        ? null
        : double.tryParse(_score.text.trim().replaceAll(',', '.'));
    if (score != null && (score < 0 || score > 100)) {
      setState(() => _error = L10nGateway.current.enterAScoreBetweenAnd);
      return;
    }
    setState(() => _saving = true);
    final outcome = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.recordAwqafTest(
              _enrollment!.id,
              juzId: _juz!.id,
              quranTestTypeId: _testType!.id,
              testedOn: _date.text,
              status: _status,
              score: score,
              teacherId: teacherId,
              notes: nullIfBlank(_notes.text),
            ));
    if (!mounted) return;
    if (outcome.error case final error?) {
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canRecordAwqafTests(widget.token)) {
      return ModuleScaffold(
        title: L10nGateway.current.recordTest,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.recordAwqafTest,
      body: ModuleFormPage(
        formKey: _formKey,
        children: [
          PickerField(
            label: context.l10n.student,
            value: _student?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: L10nGateway.current.chooseStudent,
                load: studentPickerItems,
              );
              if (picked == null) return;
              setState(() {
                _student = picked;
                _enrollment = null;
              });
            },
          ),
          PickerField(
            label: context.l10n.activeEnrollment,
            value: _enrollment?.label,
            error: _error,
            onTap: () async {
              final student = _student;
              if (student == null) {
                showModuleSnack(
                    context, L10nGateway.current.chooseAStudentFirst,
                    error: true);
                return;
              }
              final picked = await showItemPicker(
                context,
                title: L10nGateway.current.chooseEnrollment,
                load: (_) => studentActiveEnrollmentItems(student.id),
              );
              if (picked != null) setState(() => _enrollment = picked);
            },
          ),
          PickerField(
            label: context.l10n.juz3,
            value: _juz?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: L10nGateway.current.chooseJuz,
                load: (s) => referencePickerItems('quran-juz', search: s),
              );
              if (picked != null) setState(() => _juz = picked);
            },
          ),
          PickerField(
            label: context.l10n.testType,
            value: _testType?.label,
            onTap: _pickTestType,
          ),
          DropdownButtonFormField<String>(
            initialValue: _status,
            isExpanded: true,
            decoration: InputDecoration(labelText: context.l10n.result),
            items: [
              DropdownMenuItem(
                  value: 'passed', child: Text(context.l10n.passed)),
              DropdownMenuItem(
                  value: 'failed', child: Text(context.l10n.failed)),
              DropdownMenuItem(
                  value: 'cancelled', child: Text(context.l10n.cancelled)),
            ],
            onChanged: (v) => setState(() => _status = v ?? _status),
          ),
          const SizedBox(height: 12),
          moduleTextField(
            controller: _score,
            label: context.l10n.scoreOptional,
            keyboard: const TextInputType.numberWithOptions(decimal: true),
          ),
          moduleDateField(
            context: context,
            controller: _date,
            label: context.l10n.testDate,
            required: true,
          ),
          if (_teacherIsSelf)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                context.l10n.theTestIsRecordedUnder,
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
            )
          else
            PickerField(
              label: context.l10n.teacher,
              value: _teacher?.label,
              onTap: () async {
                final picked = await showItemPicker(
                  context,
                  title: L10nGateway.current.chooseTeacher,
                  load: activeTeacherItems,
                );
                if (picked != null) setState(() => _teacher = picked);
              },
            ),
          moduleTextField(
            controller: _notes,
            label: context.l10n.notes,
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          ModuleSaveButton(
              saving: _saving, onPressed: _save, label: context.l10n.save),
        ],
      ),
    );
  }
}
