import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/management_model.dart';
import '../../../data/models/quran_test_model.dart';
import '../../../data/services/management_service.dart';
import '../../../data/services/quran_test_service.dart';
import '../../management/widgets/module_form_fields.dart';
import '../../management/widgets/module_widgets.dart';
import 'quran_tests_screen.dart' show QuranCycleKind, quranStatusLabel;

/// تفاصيل دورة اختبار واحدة: المقاطع أو المحاولات، وتسجيل محاولة جديدة.
class QuranCycleScreen extends StatefulWidget {
  final AuthToken token;
  final QuranCycleKind kind;
  final int cycleId;

  const QuranCycleScreen({
    super.key,
    required this.token,
    required this.kind,
    required this.cycleId,
  });

  @override
  State<QuranCycleScreen> createState() => _QuranCycleScreenState();
}

class _QuranCycleScreenState extends State<QuranCycleScreen> {
  final _service = QuranTestService();
  QuranPartialCycle? _partial;
  QuranFinalCycle? _final;
  bool _loading = true;
  Object? _error;

  bool get _isPartial => widget.kind == QuranCycleKind.partial;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      if (_isPartial) {
        final cycle = await _service.partialCycle(widget.cycleId);
        if (!mounted) return;
        setState(() {
          _partial = cycle;
          _loading = false;
          _error = null;
        });
      } else {
        final cycle = await _service.finalCycle(widget.cycleId);
        if (!mounted) return;
        setState(() {
          _final = cycle;
          _loading = false;
          _error = null;
        });
      }
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

  bool get _canRecord => _isPartial
      ? ModuleAccess.canRecordPartialTests(widget.token)
      : ModuleAccess.canRecordFinalTests(widget.token);

  bool get _cyclePassed =>
      _isPartial ? _partial?.isPassed ?? false : _final?.isPassed ?? false;

  Future<void> _recordPartial(QuranPartialPart part) async {
    final saved = await showFormSheet(
      context,
      title: trf('تسجيل محاولة - المقطع {0}', [part.partNumber]),
      builder: (_) => _AttemptForm(
        token: widget.token,
        kind: QuranCycleKind.partial,
        cycleId: widget.cycleId,
        partId: part.id,
        service: _service,
      ),
    );
    if (saved == true) _reload();
  }

  Future<void> _recordFinal() async {
    final saved = await showFormSheet(
      context,
      title: tr('تسجيل محاولة نهائية'),
      builder: (_) => _AttemptForm(
        token: widget.token,
        kind: QuranCycleKind.finalTest,
        cycleId: widget.cycleId,
        service: _service,
      ),
    );
    if (saved == true) _reload();
  }

  @override
  Widget build(BuildContext context) {
    if (!(_isPartial
        ? ModuleAccess.canViewPartialTests(widget.token)
        : ModuleAccess.canViewFinalTests(widget.token))) {
      return ModuleScaffold(
        title: tr('تفاصيل الاختبار'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: _isPartial ? tr('الاختبار الجزئي') : tr('الاختبار النهائي'),
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
    final juz = _isPartial ? _partial?.juz : _final?.juz;
    final status = _isPartial ? _partial?.status : _final?.status;
    final passedOn = _isPartial ? _partial?.passedOn : _final?.passedOn;
    final group = _isPartial ? _partial?.group : _final?.group;
    return RefreshIndicator(
      onRefresh: () async => _reload(),
      color: AppColors.primaryLight,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        children: [
          ModuleCard(
            accent: _cyclePassed ? AppColors.success : AppColors.warning,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        juz == null ? '—' : trf('الجزء {0}', [juz.juzNumber]),
                        style: appTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    StatusPill(
                      label: quranStatusLabel(status ?? ''),
                      color:
                          _cyclePassed ? AppColors.success : AppColors.warning,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                InfoRow(label: tr('الكورس'), value: group?.courseName ?? ''),
                InfoRow(label: tr('الحلقة'), value: group?.name ?? ''),
                InfoRow(label: tr('تاريخ النجاح'), value: passedOn ?? ''),
              ],
            ),
          ),
          if (_isPartial) ..._partialSections() else ..._finalSections(),
        ],
      ),
    );
  }

  List<Widget> _partialSections() {
    final parts = _partial?.parts ?? const <QuranPartialPart>[];
    return [
      _sectionTitle(tr('المقاطع الأربعة')),
      if (parts.isEmpty)
        ModuleMessage(text: tr('لا توجد مقاطع لهذه الدورة'))
      else
        for (final part in parts)
          _PartCard(
            part: part,
            canRecord: _canRecord && !part.isPassed && !_cyclePassed,
            onRecord: () => _recordPartial(part),
          ),
    ];
  }

  List<Widget> _finalSections() {
    final attempts = _final?.attempts ?? const <QuranFinalAttempt>[];
    return [
      if (_canRecord && !_cyclePassed)
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: FilledButton.icon(
            onPressed: _recordFinal,
            icon: const Icon(Icons.edit_note_rounded),
            label: Text(tr('تسجيل محاولة'),
                style: appTextStyle(fontWeight: FontWeight.w700)),
          ),
        ),
      _sectionTitle(tr('المحاولات')),
      if (attempts.isEmpty)
        ModuleMessage(text: tr('لا توجد محاولات بعد'))
      else
        for (final attempt in attempts)
          ModuleCard(
            accent: attempt.status == 'passed'
                ? AppColors.success
                : AppColors.warning,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        trf('المحاولة {0}', [attempt.attemptNo]),
                        style: appTextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Text(
                      formatAmount(attempt.score),
                      style: appTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${attempt.testedOn ?? ''}  ·  ${attempt.teacher?.name ?? ''}',
                  style:
                      appTextStyle(fontSize: 12, color: moduleMuted(context)),
                ),
                if (attempt.notes != null)
                  Text(attempt.notes!, style: appTextStyle(fontSize: 12)),
              ],
            ),
          ),
    ];
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
      child: Text(
        text,
        style: appTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _PartCard extends StatelessWidget {
  final QuranPartialPart part;
  final bool canRecord;
  final VoidCallback onRecord;

  const _PartCard({
    required this.part,
    required this.canRecord,
    required this.onRecord,
  });

  @override
  Widget build(BuildContext context) {
    final color = part.isPassed ? AppColors.success : AppColors.warning;
    return ModuleCard(
      accent: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  trf('المقطع {0}', [part.partNumber]),
                  style:
                      appTextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
              ),
              StatusPill(label: quranStatusLabel(part.status), color: color),
            ],
          ),
          if (part.attempts.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                tr('لا توجد محاولات بعد'),
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
            )
          else
            for (final attempt in part.attempts)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  trf('محاولة {0}: {1} خطأ · {2}', [
                    attempt.attemptNo,
                    attempt.mistakeCount,
                    attempt.testedOn ?? '',
                  ]),
                  style: appTextStyle(fontSize: 12),
                ),
              ),
          if (canRecord) ...[
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton.icon(
                onPressed: onRecord,
                icon: const Icon(Icons.edit_note_rounded, size: 18),
                label: Text(tr('تسجيل محاولة'), style: appTextStyle()),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// نموذج تسجيل محاولة (جزئية: عدد الأخطاء، نهائية: الدرجة).
/// المعلم المسجَّل دخوله يسجّل باسمه؛ غيره يختار المعلم من القائمة.
class _AttemptForm extends StatefulWidget {
  final AuthToken token;
  final QuranCycleKind kind;
  final int cycleId;
  final int? partId;
  final QuranTestService service;

  const _AttemptForm({
    required this.token,
    required this.kind,
    required this.cycleId,
    required this.service,
    this.partId,
  });

  @override
  State<_AttemptForm> createState() => _AttemptFormState();
}

class _AttemptFormState extends State<_AttemptForm> {
  final _formKey = GlobalKey<FormState>();
  final _countCtrl = TextEditingController(text: '0');
  final _dateCtrl = TextEditingController(text: isoDate(DateTime.now()));
  final _notesCtrl = TextEditingController();
  List<TeacherItem> _teachers = const [];
  int? _teacherId;
  bool _saving = false;
  String? _error;

  bool get _needsTeacher => widget.token.teacherId == null;

  @override
  void initState() {
    super.initState();
    if (_needsTeacher) _loadTeachers();
  }

  @override
  void dispose() {
    _countCtrl.dispose();
    _dateCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadTeachers() async {
    List<TeacherItem> teachers = const [];
    try {
      teachers = (await ManagementService().teachers(
        perPage: 100,
        status: 'active',
      ))
          .items;
    } catch (_) {}
    if (!mounted) return;
    setState(() => _teachers = teachers);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_needsTeacher && _teacherId == null) {
      setState(() => _error = tr('اختر المعلم الذي أجرى الاختبار'));
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final notes = nullIfBlank(_notesCtrl.text);
      if (widget.kind == QuranCycleKind.partial) {
        await widget.service.recordPartialAttempt(
          widget.cycleId,
          widget.partId!,
          mistakeCount: int.parse(_countCtrl.text.trim()),
          testedOn: _dateCtrl.text,
          notes: notes,
          teacherId: _teacherId,
        );
      } else {
        await widget.service.recordFinalAttempt(
          widget.cycleId,
          score: double.parse(_countCtrl.text.trim()),
          testedOn: _dateCtrl.text,
          notes: notes,
          teacherId: _teacherId,
        );
      }
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = errorText(error);
      });
    }
  }

  String? _validateNumber(String? value) {
    final text = value?.trim() ?? '';
    if (widget.kind == QuranCycleKind.partial) {
      final n = int.tryParse(text);
      return (n == null || n < 0 || n > 999)
          ? tr('أدخل عدد أخطاء بين 0 و 999')
          : null;
    }
    final n = double.tryParse(text.replaceAll(',', '.'));
    return (n == null || n < 0 || n > 100) ? tr('أدخل درجة بين 0 و 100') : null;
  }

  @override
  Widget build(BuildContext context) {
    final isPartial = widget.kind == QuranCycleKind.partial;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _countCtrl,
            keyboardType: TextInputType.numberWithOptions(decimal: !isPartial),
            style: appTextStyle(),
            decoration: InputDecoration(
              labelText: isPartial ? tr('عدد الأخطاء') : tr('الدرجة (من 100)'),
            ),
            validator: _validateNumber,
          ),
          const SizedBox(height: 12),
          moduleDateField(
            context: context,
            controller: _dateCtrl,
            label: tr('تاريخ الاختبار'),
            required: true,
          ),
          if (_needsTeacher)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: DropdownButtonFormField<int>(
                initialValue: _teachers.any((t) => t.id == _teacherId)
                    ? _teacherId
                    : null,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: tr('المعلم'),
                  helperText: _teachers.isEmpty
                      ? tr('لا توجد قائمة معلمين متاحة')
                      : null,
                ),
                items: [
                  for (final teacher in _teachers)
                    DropdownMenuItem(
                      value: teacher.id,
                      child: Text(teacher.fullName),
                    ),
                ],
                onChanged: (value) => setState(() => _teacherId = value),
              ),
            ),
          moduleTextField(
            controller: _notesCtrl,
            label: tr('ملاحظات'),
            maxLines: 2,
          ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                _error!,
                style: appTextStyle(fontSize: 13, color: AppColors.error),
              ),
            ),
          ModuleSaveButton(
            saving: _saving,
            onPressed: _save,
            label: tr('حفظ المحاولة'),
          ),
        ],
      ),
    );
  }
}
