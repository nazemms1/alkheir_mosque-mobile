import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

String assessmentResultStatusLabel(String status) => switch (status) {
      'passed' => L10nGateway.current.passed,
      'failed' => L10nGateway.current.failed,
      'absent' => L10nGateway.current.absent,
      'pending' => L10nGateway.current.pending,
      _ => status,
    };

Color _resultColor(BuildContext context, String status) => switch (status) {
      'passed' => context.appColors.success,
      'failed' => context.appColors.error,
      'absent' => context.appColors.warning,
      _ => context.appColors.textMuted,
    };

/// قائمة التقييمات والاختبارات. التفاصيل تعرض النتائج وتسمح بتسجيل نتيجة.
class AssessmentsScreen extends ConsumerWidget {
  final AuthToken token;

  const AssessmentsScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ModuleAccess.canViewAssessments(token)) {
      return ModuleScaffold(
        title: L10nGateway.current.assessments,
        body: const ModuleAccessDenied(),
      );
    }
    final service = ref.read(operationsActionsControllerProvider.notifier);
    return ModuleScaffold(
      title: context.l10n.assessments,
      body: PagedList<AssessmentSummary>(
        emptyText: context.l10n.noAssessments,
        fetch: (page) => service.query((r) => r.assessments(page: page)),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isActive
              ? context.appColors.primaryLight
              : context.appColors.textMuted,
          onTap: () => context.push(AppRoutes.assessmentDetailRoute,
              extra: (token: token, assessmentId: item.id)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: item.isActive
                        ? L10nGateway.current.active
                        : L10nGateway.current.inactive,
                    color: item.isActive
                        ? context.appColors.success
                        : context.appColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${item.typeName ?? ''}  ·  ${item.groupName ?? ''}  ·  ${(item.scheduledAt ?? '').split('T').first}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                L10nGateway.current.results(item.resultsCount),
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

/// تفاصيل تقييم: المعلومات والنتائج، مع زر تسجيل نتيجة.
class AssessmentDetailScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final int assessmentId;

  const AssessmentDetailScreen({
    super.key,
    required this.token,
    required this.assessmentId,
  });

  @override
  ConsumerState<AssessmentDetailScreen> createState() =>
      _AssessmentDetailScreenState();
}

class _AssessmentDetailScreenState
    extends ConsumerState<AssessmentDetailScreen> {
  late final _loadProvider = screenDataProvider(() async {
    final detail = await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.assessment(widget.assessmentId));
    return detail;
  });
  AssessmentDetail? get _detail => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  Future<void> _record() async {
    final detail = _detail;
    if (detail == null) return;
    final saved = await context.push<bool>(AppRoutes.assessmentResultFormRoute,
        extra: (token: widget.token, assessment: detail.summary));
    if (saved == true) {
      _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = _detail;
    final canRecord = ModuleAccess.canRecordAssessmentResults(widget.token);
    return ModuleScaffold(
      title: detail?.summary.title ?? context.l10n.assessment,
      floatingActionButton: canRecord && detail != null
          ? FloatingActionButton.extended(
              onPressed: _record,
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.edit_note_rounded, color: Colors.white),
              label: Text(
                context.l10n.recordResult,
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null || detail == null
              ? ModuleMessage(
                  text: errorText(_error ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: context.appColors.error,
                  onRetry: () {
                    _load();
                  },
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
                  children: [
                    ModuleCard(
                      child: Column(
                        children: [
                          InfoRow(
                              label: context.l10n.type,
                              value: detail.summary.typeName ?? ''),
                          InfoRow(
                            label: context.l10n.groups2,
                            value: detail.groups.map((g) => g.name).join('، '),
                          ),
                          InfoRow(
                            label: context.l10n.fullMark,
                            value: detail.summary.totalMark == null
                                ? ''
                                : formatAmount(detail.summary.totalMark!),
                          ),
                          InfoRow(
                            label: context.l10n.passingScore,
                            value: detail.summary.passMark == null
                                ? ''
                                : formatAmount(detail.summary.passMark!),
                          ),
                          InfoRow(
                              label: context.l10n.description,
                              value: detail.description ?? ''),
                        ],
                      ),
                    ),
                    if (detail.results.isEmpty)
                      ModuleMessage(text: context.l10n.noResultsRecordedYet)
                    else
                      for (final r in detail.results)
                        ModuleCard(
                          accent: _resultColor(context, r.status),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      r.studentName,
                                      style: appTextStyle(
                                          fontSize: FontSize.label,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${context.l10n.attempt(r.attemptNo)}  ·  ${r.teacherName ?? ''}',
                                      style: appTextStyle(
                                          fontSize: FontSize.caption,
                                          color: moduleMuted(context)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                r.score == null ? '—' : formatAmount(r.score!),
                                style: appTextStyle(
                                    fontSize: FontSize.body,
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(width: 8),
                              StatusPill(
                                label: assessmentResultStatusLabel(r.status),
                                color: _resultColor(context, r.status),
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
    );
  }
}

/// نموذج نتيجة: الطالب (عبر تسجيله النشط) والمحاولة والدرجة والحالة.
class AssessmentResultFormScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final AssessmentSummary assessment;

  const AssessmentResultFormScreen({
    super.key,
    required this.token,
    required this.assessment,
  });

  @override
  ConsumerState<AssessmentResultFormScreen> createState() =>
      _AssessmentResultFormScreenState();
}

class _AssessmentResultFormScreenState
    extends ConsumerState<AssessmentResultFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _score = TextEditingController();
  final _attempt = TextEditingController(text: '1');
  final _notes = TextEditingController();
  PickerItem? _student;
  PickerItem? _enrollment;
  String _status = 'passed';
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    for (final c in [_score, _attempt, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final valid = _formKey.currentState!.validate();
    setState(() => _error =
        _enrollment == null ? L10nGateway.current.chooseEnrollment : null);
    if (!valid || _enrollment == null) return;
    final max = widget.assessment.totalMark;
    final score = _score.text.trim().isEmpty
        ? null
        : double.tryParse(_score.text.trim().replaceAll(',', '.'));
    if (score != null && (score < 0 || (max != null && score > max))) {
      showModuleSnack(context,
          L10nGateway.current.scoreBetweenAnd(formatAmount(max ?? 100)),
          error: true);
      return;
    }
    final attempt = int.tryParse(_attempt.text.trim()) ?? 1;
    setState(() => _saving = true);
    final outcome2 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.saveAssessmentResults(widget.assessment.id, [
              {
                'enrollment_id': _enrollment!.id,
                'attempt_no': attempt,
                'score': score,
                'status': _status,
                if (nullIfBlank(_notes.text) != null)
                  'notes': _notes.text.trim(),
              },
            ]));
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
    if (!ModuleAccess.canRecordAssessmentResults(widget.token)) {
      return ModuleScaffold(
        title: L10nGateway.current.recordResult,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.recordResult,
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
          moduleTextField(
            controller: _attempt,
            label: context.l10n.attemptNumber,
            keyboard: TextInputType.number,
          ),
          moduleTextField(
            controller: _score,
            label: context.l10n
                .scoreOutOf(formatAmount(widget.assessment.totalMark ?? 100)),
            keyboard: const TextInputType.numberWithOptions(decimal: true),
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
                  value: 'absent', child: Text(context.l10n.absent)),
              DropdownMenuItem(
                  value: 'pending', child: Text(context.l10n.pending)),
            ],
            onChanged: (v) => setState(() => _status = v ?? _status),
          ),
          const SizedBox(height: 12),
          moduleTextField(
              controller: _notes, label: context.l10n.notes, maxLines: 2),
          const SizedBox(height: 8),
          ModuleSaveButton(
              saving: _saving, onPressed: _save, label: context.l10n.save),
        ],
      ),
    );
  }
}
