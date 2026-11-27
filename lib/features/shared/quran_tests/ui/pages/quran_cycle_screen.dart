import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/ui/providers/quran_tests_actions_controller.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/ui/pages/quran_tests_screen.dart'
    show QuranCycleKind, quranStatusLabel;

/// تفاصيل دورة اختبار واحدة: المقاطع أو المحاولات، وتسجيل محاولة جديدة.
class QuranCycleScreen extends ConsumerStatefulWidget {
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
  ConsumerState<QuranCycleScreen> createState() => _QuranCycleScreenState();
}

class _QuranCycleScreenState extends ConsumerState<QuranCycleScreen> {
  late final _service = ref.read(quranTestsActionsControllerProvider.notifier);

  /// الدورة جزئية أو نهائية حسب [_isPartial]؛ الأخرى تبقى فارغة.
  late final _cycleProvider = screenDataProvider(() async => _isPartial
      ? (
          partial: await ref
              .read(quranTestsActionsControllerProvider.notifier)
              .query((r) => r.partialCycle(widget.cycleId)),
          final_: null,
        )
      : (
          partial: null,
          final_: await ref
              .read(quranTestsActionsControllerProvider.notifier)
              .query((r) => r.finalCycle(widget.cycleId)),
        ));
  QuranPartialCycle? get _partial =>
      ref.watch(_cycleProvider).valueOrNull?.partial;
  QuranFinalCycle? get _final => ref.watch(_cycleProvider).valueOrNull?.final_;
  bool get _loading => ref.watch(_cycleProvider).isLoading;
  Object? get _error => ref.watch(_cycleProvider).error;

  bool get _isPartial => widget.kind == QuranCycleKind.partial;

  @override
  void initState() {
    super.initState();
  }

  void _reload() => ref.invalidate(_cycleProvider);

  bool get _canRecord => _isPartial
      ? ModuleAccess.canRecordPartialTests(widget.token)
      : ModuleAccess.canRecordFinalTests(widget.token);

  bool get _cyclePassed =>
      _isPartial ? _partial?.isPassed ?? false : _final?.isPassed ?? false;

  Future<void> _recordPartial(QuranPartialPart part) async {
    final saved = await showFormSheet(
      context,
      title: L10nGateway.current.recordAttemptPart(part.partNumber),
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
      title: L10nGateway.current.recordFinalAttempt,
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
        title: L10nGateway.current.testDetails,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: _isPartial ? context.l10n.partialTest : context.l10n.finalTest,
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
    final juz = _isPartial ? _partial?.juz : _final?.juz;
    final status = _isPartial ? _partial?.status : _final?.status;
    final passedOn = _isPartial ? _partial?.passedOn : _final?.passedOn;
    final group = _isPartial ? _partial?.group : _final?.group;
    return RefreshIndicator(
      onRefresh: () async => _reload(),
      color: context.appColors.primaryLight,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        children: [
          ModuleCard(
            accent: _cyclePassed
                ? context.appColors.success
                : context.appColors.warning,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        juz == null
                            ? '—'
                            : L10nGateway.current.juz(juz.juzNumber),
                        style: appTextStyle(
                          fontSize: FontSize.title,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    StatusPill(
                      label: quranStatusLabel(status ?? ''),
                      color: _cyclePassed
                          ? context.appColors.success
                          : context.appColors.warning,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                InfoRow(
                    label: L10nGateway.current.course,
                    value: group?.courseName ?? ''),
                InfoRow(
                    label: L10nGateway.current.group, value: group?.name ?? ''),
                InfoRow(
                    label: L10nGateway.current.passedOn2,
                    value: passedOn ?? ''),
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
      _sectionTitle(L10nGateway.current.theFourParts),
      if (parts.isEmpty)
        ModuleMessage(text: L10nGateway.current.noPartsForThisCycle)
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
            label: Text(L10nGateway.current.recordAttempt,
                style: appTextStyle(fontWeight: FontWeight.w700)),
          ),
        ),
      _sectionTitle(L10nGateway.current.attempts2),
      if (attempts.isEmpty)
        ModuleMessage(text: L10nGateway.current.noAttemptsYet)
      else
        for (final attempt in attempts)
          ModuleCard(
            accent: attempt.status == 'passed'
                ? context.appColors.success
                : context.appColors.warning,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        L10nGateway.current.attempt(attempt.attemptNo),
                        style: appTextStyle(
                            fontSize: FontSize.body,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Text(
                      formatAmount(attempt.score),
                      style: appTextStyle(
                        fontSize: FontSize.bodyLarge,
                        fontWeight: FontWeight.w800,
                        color: context.appColors.primaryLight,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${attempt.testedOn ?? ''}  ·  ${attempt.teacher?.name ?? ''}',
                  style: appTextStyle(
                      fontSize: FontSize.caption, color: moduleMuted(context)),
                ),
                if (attempt.notes != null)
                  Text(attempt.notes!,
                      style: appTextStyle(fontSize: FontSize.caption)),
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
          fontSize: FontSize.body,
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
    final color =
        part.isPassed ? context.appColors.success : context.appColors.warning;
    return ModuleCard(
      accent: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.part(part.partNumber),
                  style: appTextStyle(
                      fontSize: FontSize.body, fontWeight: FontWeight.w800),
                ),
              ),
              StatusPill(label: quranStatusLabel(part.status), color: color),
            ],
          ),
          if (part.attempts.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                context.l10n.noAttemptsYet,
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
            )
          else
            for (final attempt in part.attempts)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  context.l10n.attemptMistakes(attempt.attemptNo,
                      attempt.mistakeCount, attempt.testedOn ?? ''),
                  style: appTextStyle(fontSize: FontSize.caption),
                ),
              ),
          if (canRecord) ...[
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton.icon(
                onPressed: onRecord,
                icon: const Icon(Icons.edit_note_rounded, size: 18),
                label: Text(context.l10n.recordAttempt, style: appTextStyle()),
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
class _AttemptForm extends ConsumerStatefulWidget {
  final AuthToken token;
  final QuranCycleKind kind;
  final int cycleId;
  final int? partId;
  final QuranTestsActionsController service;

  const _AttemptForm({
    required this.token,
    required this.kind,
    required this.cycleId,
    required this.service,
    this.partId,
  });

  @override
  ConsumerState<_AttemptForm> createState() => _AttemptFormState();
}

class _AttemptFormState extends ConsumerState<_AttemptForm> {
  final _formKey = GlobalKey<FormState>();
  final _countCtrl = TextEditingController(text: '0');
  final _dateCtrl = TextEditingController(text: isoDate(DateTime.now()));
  final _notesCtrl = TextEditingController();
  // بلا معلّم مرتبط بالحساب يُختار المعلّم من القائمة؛ تبقى فارغة إن تعذّر جلبها.
  late final _teachersProvider = screenDataProvider<List<TeacherItem>>(
      () async => _needsTeacher
          ? (await ref
                  .read(managementActionsControllerProvider.notifier)
                  .query((r) => r.teachers(perPage: 100, status: 'active')))
              .items
          : const []);
  List<TeacherItem> get _teachers =>
      ref.watch(_teachersProvider).valueOrNull ?? const [];
  int? _teacherId;
  bool _saving = false;
  String? _error;

  bool get _needsTeacher => widget.token.teacherId == null;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _countCtrl.dispose();
    _dateCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_needsTeacher && _teacherId == null) {
      setState(() => _error = L10nGateway.current.chooseTheTeacherWhoConducted);
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final notes = nullIfBlank(_notesCtrl.text);
      if (widget.kind == QuranCycleKind.partial) {
        await ref
            .read(quranTestsActionsControllerProvider.notifier)
            .query((r) => r.recordPartialAttempt(
                  widget.cycleId,
                  widget.partId!,
                  mistakeCount: int.parse(_countCtrl.text.trim()),
                  testedOn: _dateCtrl.text,
                  notes: notes,
                  teacherId: _teacherId,
                ));
      } else {
        await ref
            .read(quranTestsActionsControllerProvider.notifier)
            .query((r) => r.recordFinalAttempt(
                  widget.cycleId,
                  score: double.parse(_countCtrl.text.trim()),
                  testedOn: _dateCtrl.text,
                  notes: notes,
                  teacherId: _teacherId,
                ));
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
          ? L10nGateway.current.enterAMistakeCountBetween
          : null;
    }
    final n = double.tryParse(text.replaceAll(',', '.'));
    return (n == null || n < 0 || n > 100)
        ? L10nGateway.current.enterAScoreBetweenAnd
        : null;
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
              labelText: isPartial
                  ? context.l10n.mistakeCount
                  : context.l10n.scoreOutOf2,
            ),
            validator: _validateNumber,
          ),
          const SizedBox(height: 12),
          moduleDateField(
            context: context,
            controller: _dateCtrl,
            label: context.l10n.testDate,
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
                  labelText: context.l10n.teacher,
                  helperText: _teachers.isEmpty
                      ? context.l10n.noTeacherListAvailable
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
            label: context.l10n.notes,
            maxLines: 2,
          ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                _error!,
                style: appTextStyle(
                    fontSize: FontSize.label,
                    color: context.appColors.errorText),
              ),
            ),
          ModuleSaveButton(
            saving: _saving,
            onPressed: _save,
            label: context.l10n.saveAttempt,
          ),
        ],
      ),
    );
  }
}
