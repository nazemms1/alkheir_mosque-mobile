import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/operations_model.dart';
import '../../../data/services/operations_service.dart';
import '../../management/widgets/module_form_fields.dart';
import '../../management/widgets/module_widgets.dart';
import '../../management/widgets/pickers.dart';

String assessmentResultStatusLabel(String status) => switch (status) {
      'passed' => tr('ناجح'),
      'failed' => tr('راسب'),
      'absent' => tr('غائب'),
      'pending' => tr('قيد الانتظار'),
      _ => status,
    };

Color _resultColor(String status) => switch (status) {
      'passed' => AppColors.success,
      'failed' => AppColors.error,
      'absent' => AppColors.warning,
      _ => AppColors.textMuted,
    };

/// قائمة التقييمات والاختبارات. التفاصيل تعرض النتائج وتسمح بتسجيل نتيجة.
class AssessmentsScreen extends StatelessWidget {
  final AuthToken token;

  const AssessmentsScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canViewAssessments(token)) {
      return ModuleScaffold(
        title: tr('التقييمات'),
        body: const ModuleAccessDenied(),
      );
    }
    final service = OperationsService();
    return ModuleScaffold(
      title: tr('التقييمات'),
      body: PagedList<AssessmentSummary>(
        emptyText: tr('لا توجد تقييمات'),
        fetch: (page) => service.assessments(page: page),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isActive ? AppColors.primaryLight : AppColors.textMuted,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AssessmentDetailScreen(
                token: token,
                assessmentId: item.id,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: item.isActive ? tr('نشط') : tr('غير نشط'),
                    color:
                        item.isActive ? AppColors.success : AppColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${item.typeName ?? ''}  ·  ${item.groupName ?? ''}  ·  ${(item.scheduledAt ?? '').split('T').first}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                trf('النتائج: {0}', [item.resultsCount]),
                style: appTextStyle(fontSize: 11, color: moduleMuted(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// تفاصيل تقييم: المعلومات والنتائج، مع زر تسجيل نتيجة.
class AssessmentDetailScreen extends StatefulWidget {
  final AuthToken token;
  final int assessmentId;

  const AssessmentDetailScreen({
    super.key,
    required this.token,
    required this.assessmentId,
  });

  @override
  State<AssessmentDetailScreen> createState() => _AssessmentDetailScreenState();
}

class _AssessmentDetailScreenState extends State<AssessmentDetailScreen> {
  final _service = OperationsService();
  AssessmentDetail? _detail;
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final detail = await _service.assessment(widget.assessmentId);
      if (!mounted) return;
      setState(() {
        _detail = detail;
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

  Future<void> _record() async {
    final detail = _detail;
    if (detail == null) return;
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => AssessmentResultFormScreen(
          token: widget.token,
          assessment: detail.summary,
        ),
      ),
    );
    if (saved == true) {
      setState(() => _loading = true);
      _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = _detail;
    final canRecord = ModuleAccess.canRecordAssessmentResults(widget.token);
    return ModuleScaffold(
      title: detail?.summary.title ?? tr('التقييم'),
      floatingActionButton: canRecord && detail != null
          ? FloatingActionButton.extended(
              onPressed: _record,
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.edit_note_rounded, color: Colors.white),
              label: Text(
                tr('تسجيل نتيجة'),
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
                  color: AppColors.error,
                  onRetry: () {
                    setState(() => _loading = true);
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
                              label: tr('النوع'),
                              value: detail.summary.typeName ?? ''),
                          InfoRow(
                            label: tr('المجموعات'),
                            value: detail.groups.map((g) => g.name).join('، '),
                          ),
                          InfoRow(
                            label: tr('الدرجة الكاملة'),
                            value: detail.summary.totalMark == null
                                ? ''
                                : formatAmount(detail.summary.totalMark!),
                          ),
                          InfoRow(
                            label: tr('درجة النجاح'),
                            value: detail.summary.passMark == null
                                ? ''
                                : formatAmount(detail.summary.passMark!),
                          ),
                          InfoRow(
                              label: tr('الوصف'),
                              value: detail.description ?? ''),
                        ],
                      ),
                    ),
                    if (detail.results.isEmpty)
                      ModuleMessage(text: tr('لا توجد نتائج مسجّلة بعد'))
                    else
                      for (final r in detail.results)
                        ModuleCard(
                          accent: _resultColor(r.status),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      r.studentName,
                                      style: appTextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${trf('المحاولة {0}', [
                                            r.attemptNo
                                          ])}  ·  ${r.teacherName ?? ''}',
                                      style: appTextStyle(
                                          fontSize: 11,
                                          color: moduleMuted(context)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                r.score == null ? '—' : formatAmount(r.score!),
                                style: appTextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(width: 8),
                              StatusPill(
                                label: assessmentResultStatusLabel(r.status),
                                color: _resultColor(r.status),
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
class AssessmentResultFormScreen extends StatefulWidget {
  final AuthToken token;
  final AssessmentSummary assessment;

  const AssessmentResultFormScreen({
    super.key,
    required this.token,
    required this.assessment,
  });

  @override
  State<AssessmentResultFormScreen> createState() =>
      _AssessmentResultFormScreenState();
}

class _AssessmentResultFormScreenState
    extends State<AssessmentResultFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _operations = OperationsService();
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
    setState(() => _error = _enrollment == null ? tr('اختر التسجيل') : null);
    if (!valid || _enrollment == null) return;
    final max = widget.assessment.totalMark;
    final score = _score.text.trim().isEmpty
        ? null
        : double.tryParse(_score.text.trim().replaceAll(',', '.'));
    if (score != null && (score < 0 || (max != null && score > max))) {
      showModuleSnack(
          context, trf('الدرجة بين 0 و {0}', [formatAmount(max ?? 100)]),
          error: true);
      return;
    }
    final attempt = int.tryParse(_attempt.text.trim()) ?? 1;
    setState(() => _saving = true);
    try {
      await _operations.saveAssessmentResults(widget.assessment.id, [
        {
          'enrollment_id': _enrollment!.id,
          'attempt_no': attempt,
          'score': score,
          'status': _status,
          if (nullIfBlank(_notes.text) != null) 'notes': _notes.text.trim(),
        },
      ]);
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
    if (!ModuleAccess.canRecordAssessmentResults(widget.token)) {
      return ModuleScaffold(
        title: tr('تسجيل نتيجة'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('تسجيل نتيجة'),
      body: ModuleFormPage(
        formKey: _formKey,
        children: [
          PickerField(
            label: tr('الطالب'),
            value: _student?.label,
            onTap: () async {
              final picked = await showItemPicker(
                context,
                title: tr('اختر الطالب'),
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
            label: tr('التسجيل النشط'),
            value: _enrollment?.label,
            error: _error,
            onTap: () async {
              final student = _student;
              if (student == null) {
                showModuleSnack(context, tr('اختر الطالب أولاً'), error: true);
                return;
              }
              final picked = await showItemPicker(
                context,
                title: tr('اختر التسجيل'),
                load: (_) => studentActiveEnrollmentItems(student.id),
              );
              if (picked != null) setState(() => _enrollment = picked);
            },
          ),
          moduleTextField(
            controller: _attempt,
            label: tr('رقم المحاولة'),
            keyboard: TextInputType.number,
          ),
          moduleTextField(
            controller: _score,
            label: trf('الدرجة (من {0})',
                [formatAmount(widget.assessment.totalMark ?? 100)]),
            keyboard: const TextInputType.numberWithOptions(decimal: true),
          ),
          DropdownButtonFormField<String>(
            initialValue: _status,
            isExpanded: true,
            decoration: InputDecoration(labelText: tr('النتيجة')),
            items: [
              DropdownMenuItem(value: 'passed', child: Text(tr('ناجح'))),
              DropdownMenuItem(value: 'failed', child: Text(tr('راسب'))),
              DropdownMenuItem(value: 'absent', child: Text(tr('غائب'))),
              DropdownMenuItem(
                  value: 'pending', child: Text(tr('قيد الانتظار'))),
            ],
            onChanged: (v) => setState(() => _status = v ?? _status),
          ),
          const SizedBox(height: 12),
          moduleTextField(
              controller: _notes, label: tr('ملاحظات'), maxLines: 2),
          const SizedBox(height: 8),
          ModuleSaveButton(saving: _saving, onPressed: _save, label: tr('حفظ')),
        ],
      ),
    );
  }
}
