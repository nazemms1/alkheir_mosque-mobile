import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/providers/admin_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart'
    show StudentParentInfo;
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

class SupervisorStudentDetail extends ConsumerStatefulWidget {
  final int studentId;
  final String studentName;
  final AuthToken token;

  const SupervisorStudentDetail({
    super.key,
    required this.studentId,
    required this.studentName,
    required this.token,
  });

  @override
  ConsumerState<SupervisorStudentDetail> createState() =>
      _SupervisorStudentDetailState();
}

class _SupervisorStudentDetailState
    extends ConsumerState<SupervisorStudentDetail> {
  late final _service = ref.read(adminActionsControllerProvider.notifier);

  late final _loadProvider = screenDataProvider(() async {
    final result = await ref
        .read(adminActionsControllerProvider.notifier)
        .query((r) => r.fetchStudentProgress(widget.studentId));
    return (
      enrollments: result.enrollments,
      assessments: _canViewAssessments
          ? result.assessments
          : const <AdminAssessmentItem>[],
      parentInfo: result.parentInfo
    );
  });
  List<AdminEnrollmentItem> get _enrollments =>
      ref.watch(_loadProvider).valueOrNull?.enrollments ?? const [];
  List<AdminAssessmentItem> get _assessments =>
      ref.watch(_loadProvider).valueOrNull?.assessments ?? const [];
  StudentParentInfo? get _parentInfo =>
      ref.watch(_loadProvider).valueOrNull?.parentInfo;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  String? get _error {
    final e = ref.watch(_loadProvider).error;
    return e == null ? null : errorText(e);
  }

  bool get _canViewAssessments =>
      widget.token.hasPermission(Permissions.assessmentsView);

  // تسجيل الحفظ يتطلب teacher_id فعلي من جدول teachers — الـ API يرجعه الآن
  // ضمن user.teacher_id، فنعتمد عليه مباشرة بدل تخمين الحساب من الدور.
  bool get _canRecordMemorization =>
      widget.token.hasPermission(Permissions.memorizationRecord) &&
      widget.token.teacherId != null;

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  int get _totalPoints => _enrollments.fold(0, (sum, e) => sum + e.finalPoints);

  int get _totalMemorizedPages =>
      _enrollments.fold(0, (sum, e) => sum + e.memorizedPages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        title: widget.studentName,
        subtitle: context.l10n.studentFile,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _ErrorView(message: _error!, onRetry: _load)
              : _Body(
                  studentName: widget.studentName,
                  enrollments: _enrollments,
                  assessments: _assessments,
                  parentInfo: _parentInfo,
                  totalPoints: _totalPoints,
                  totalMemorizedPages: _totalMemorizedPages,
                  canViewAssessments: _canViewAssessments,
                  canRecordMemorization: _canRecordMemorization,
                  teacherId: widget.token.teacherId,
                  service: _service,
                  onRecorded: _load,
                ),
    );
  }
}

// ─── Body ─────────────────────────────────────────────────────────────────────
class _Body extends StatelessWidget {
  final String studentName;
  final List<AdminEnrollmentItem> enrollments;
  final List<AdminAssessmentItem> assessments;
  final StudentParentInfo? parentInfo;
  final int totalPoints;
  final int totalMemorizedPages;
  final bool canViewAssessments;
  final bool canRecordMemorization;
  final int? teacherId;
  final AdminActionsController service;
  final VoidCallback onRecorded;

  const _Body({
    required this.studentName,
    required this.enrollments,
    required this.assessments,
    required this.parentInfo,
    required this.totalPoints,
    required this.totalMemorizedPages,
    required this.canViewAssessments,
    required this.canRecordMemorization,
    required this.teacherId,
    required this.service,
    required this.onRecorded,
  });

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceDeepGreen,
            context.appColors.brandDeep,
            context.appColors.brandGreen
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.appColors.brandDeep.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              gradient: context.appColors.gradientGold,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: context.appColors.gold.withValues(alpha: 0.35),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Center(
              child: Text(
                studentName.isNotEmpty ? studentName[0] : '؟',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: FontSize.headlineLarge,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Dubai',
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  studentName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.title,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai',
                  ),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    _Chip(
                      label: L10nGateway.current.pages2(totalMemorizedPages),
                      color: context.appColors.gold,
                      icon: Icons.menu_book_rounded,
                    ),
                    _Chip(
                      label: L10nGateway.current.pointS(totalPoints),
                      color: context.appColors.primaryLight,
                      icon: Icons.star_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0);
  }

  @override
  Widget build(BuildContext context) {
    if (enrollments.isEmpty) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeroBanner(context),
          const SizedBox(height: 32),
          _Empty(
            icon: Icons.school_outlined,
            message: L10nGateway.current.noRecordsForThisStudent,
          ),
        ],
      );
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      children: [
        _buildHeroBanner(context),
        const SizedBox(height: 12),
        _Card(
          title: context.l10n.studentSummary,
          icon: Icons.insights_rounded,
          color: context.appColors.gold,
          children: [
            Row(
              children: [
                Expanded(
                    child: _SummaryStat(
                        label: context.l10n.groups,
                        value: '${enrollments.length}',
                        color: context.appColors.primaryLight)),
                const SizedBox(width: 10),
                Expanded(
                    child: _SummaryStat(
                        label: context.l10n.savedPages2,
                        value: '$totalMemorizedPages',
                        color: context.appColors.gold)),
                const SizedBox(width: 10),
                Expanded(
                    child: _SummaryStat(
                        label: context.l10n.points,
                        value: '$totalPoints',
                        color: context.appColors.success)),
              ],
            ),
          ],
        ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0),
        if (parentInfo != null && parentInfo!.hasAnyData) ...[
          const SizedBox(height: 12),
          _Card(
            title: context.l10n.parentDetails,
            icon: Icons.family_restroom_rounded,
            color: context.appColors.info,
            children: [
              if (parentInfo!.fatherName.isNotEmpty)
                _InfoRow(
                    label: context.l10n.father, value: parentInfo!.fatherName),
              if (parentInfo!.fatherPhone.isNotEmpty)
                _InfoRow(
                    label: context.l10n.fatherSPhone,
                    value: parentInfo!.fatherPhone),
              if (parentInfo!.motherName.isNotEmpty)
                _InfoRow(
                    label: context.l10n.mother, value: parentInfo!.motherName),
              if (parentInfo!.motherPhone.isNotEmpty)
                _InfoRow(
                    label: context.l10n.motherSPhone,
                    value: parentInfo!.motherPhone),
              if (parentInfo!.homePhone.isNotEmpty)
                _InfoRow(
                    label: context.l10n.homePhone,
                    value: parentInfo!.homePhone),
              if (parentInfo!.address.isNotEmpty)
                _InfoRow(
                    label: context.l10n.address, value: parentInfo!.address),
            ],
          )
              .animate()
              .fadeIn(delay: 60.ms, duration: 300.ms)
              .slideY(begin: 0.05, end: 0),
        ] else if (enrollments.first.parentName?.isNotEmpty == true) ...[
          const SizedBox(height: 12),
          _Card(
            title: context.l10n.parentDetails,
            icon: Icons.family_restroom_rounded,
            color: context.appColors.info,
            children: [
              _InfoRow(
                  label: context.l10n.parent,
                  value: enrollments.first.parentName!)
            ],
          )
              .animate()
              .fadeIn(delay: 60.ms, duration: 300.ms)
              .slideY(begin: 0.05, end: 0),
        ],
        const SizedBox(height: 12),
        _Card(
          title: context.l10n.enrolledGroups,
          icon: Icons.groups_rounded,
          color: context.appColors.primaryLight,
          children: enrollments
              .map((e) => _EnrollmentRow(
                    enrollment: e,
                    canRecordMemorization: canRecordMemorization,
                    teacherId: teacherId,
                    service: service,
                    onRecorded: onRecorded,
                  ))
              .toList(),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 300.ms)
            .slideY(begin: 0.05, end: 0),
        if (canViewAssessments) ...[
          const SizedBox(height: 12),
          _Card(
            title: context.l10n.assessmentsStudentGroups,
            icon: Icons.assignment_rounded,
            color: context.appColors.info,
            children: assessments.isEmpty
                ? [_EmptyRow(message: context.l10n.noAssessments)]
                : assessments
                    .map((a) => _AssessmentRow(assessment: a))
                    .toList(),
          )
              .animate()
              .fadeIn(delay: 140.ms, duration: 300.ms)
              .slideY(begin: 0.05, end: 0),
        ],
      ],
    );
  }
}

class _SummaryStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _SummaryStat(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Text(value,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.title,
                  fontWeight: FontWeight.w800,
                  color: color)),
          const SizedBox(height: 2),
          Text(label,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  color: context.appColors.textMuted)),
        ]),
      );
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Text(label,
                  style: TextStyle(
                      fontFamily: 'Dubai',
                      fontSize: FontSize.caption,
                      color: context.appColors.textMuted)),
            ),
            Expanded(
              child: Text(value,
                  style: TextStyle(
                      fontFamily: 'Dubai',
                      fontSize: FontSize.caption,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface)),
            ),
          ],
        ),
      );
}

class _EnrollmentRow extends StatelessWidget {
  final AdminEnrollmentItem enrollment;
  final bool canRecordMemorization;
  final int? teacherId;
  final AdminActionsController service;
  final VoidCallback onRecorded;

  const _EnrollmentRow({
    required this.enrollment,
    required this.canRecordMemorization,
    required this.teacherId,
    required this.service,
    required this.onRecorded,
  });

  Future<void> _openRecordDialog(BuildContext context) async {
    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => RecordMemorizationDialog(
        enrollment: enrollment,
        teacherId: teacherId,
        service: service,
      ),
    );
    if (saved == true) onRecorded();
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = enrollment.status == 'active'
        ? context.appColors.success
        : context.appColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: statusColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(enrollment.groupName,
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.label,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                    enrollment.status == 'active'
                        ? context.l10n.active
                        : context.l10n.inactive,
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.caption,
                        fontWeight: FontWeight.w700,
                        color: statusColor)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(enrollment.courseName,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  color: context.appColors.textMuted)),
          const SizedBox(height: 8),
          Row(
            children: [
              _MiniStat(
                  icon: Icons.menu_book_rounded,
                  label: context.l10n.pages2(enrollment.memorizedPages),
                  color: context.appColors.gold),
              const SizedBox(width: 8),
              _MiniStat(
                  icon: Icons.star_rounded,
                  label: context.l10n.pointS(enrollment.finalPoints),
                  color: context.appColors.primaryLight),
              if (canRecordMemorization && enrollment.status == 'active') ...[
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _openRecordDialog(context),
                  icon: const Icon(Icons.add_circle_outline_rounded, size: 16),
                  label: Text(context.l10n.recordMemorization,
                      style: const TextStyle(
                          fontFamily: 'Dubai', fontSize: FontSize.caption)),
                  style: TextButton.styleFrom(
                    foregroundColor: context.appColors.primaryLight,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Record memorization dialog ────────────────────────────────────────────────
class RecordMemorizationDialog extends ConsumerStatefulWidget {
  final AdminEnrollmentItem enrollment;
  final int? teacherId;
  final AdminActionsController service;

  const RecordMemorizationDialog({
    super.key,
    required this.enrollment,
    required this.teacherId,
    required this.service,
  });

  @override
  ConsumerState<RecordMemorizationDialog> createState() =>
      _RecordMemorizationDialogState();
}

class _RecordMemorizationDialogState
    extends ConsumerState<RecordMemorizationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _fromPageCtrl = TextEditingController();
  final _toPageCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  String _entryType = 'new';
  final DateTime _recordedOn = DateTime.now();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _fromPageCtrl.dispose();
    _toPageCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (widget.teacherId == null) {
      setState(() => _error = L10nGateway.current.couldnTDetermineTheCurrent);
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref
          .read(adminActionsControllerProvider.notifier)
          .query((r) => r.recordMemorization(
                widget.enrollment.id,
                entryType: _entryType,
                fromPage: int.parse(_fromPageCtrl.text),
                toPage: int.parse(_toPageCtrl.text),
                recordedOn:
                    '${_recordedOn.year.toString().padLeft(4, '0')}-${_recordedOn.month.toString().padLeft(2, '0')}-${_recordedOn.day.toString().padLeft(2, '0')}',
                teacherId: '${widget.teacherId}',
                notes: _notesCtrl.text.trim(),
              ));
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = errorText(e);
        _saving = false;
      });
    }
  }

  static const _fieldRadius = 16.0;

  InputDecoration _decoration({required String label, required IconData icon}) {
    return InputDecoration(
      labelText: label,
      labelStyle:
          const TextStyle(fontFamily: 'Dubai', fontSize: FontSize.label),
      prefixIcon: Icon(icon, size: 20, color: context.appColors.primaryLight),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide:
            BorderSide(color: context.appColors.primaryLight, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide: BorderSide(color: context.appColors.error, width: 1.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateStr =
        DateFormat('d MMMM yyyy', AppLanguage.intlCode).format(_recordedOn);
    final fillColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withValues(alpha: 0.06)
        : context.appColors.primaryLight.withValues(alpha: 0.06);
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        initialChildSize: 0.72,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollCtrl) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final borderColor = context.appColors.border;
          final handleColor = context.appColors.border;

          return Container(
            decoration: BoxDecoration(
              color: bg,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(32)),
              border: Border(top: BorderSide(color: borderColor, width: 1.5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.16),
                  blurRadius: 36,
                  offset: const Offset(0, -8),
                ),
                BoxShadow(
                  color: context.appColors.brandDeep
                      .withValues(alpha: isDark ? 0.25 : 0.08),
                  blurRadius: 18,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 12, bottom: 6),
                      width: 48,
                      height: 5,
                      decoration: BoxDecoration(
                        color: handleColor,
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                  ),
                  _SheetHeaderRow(
                      studentName: widget.enrollment.studentName,
                      groupName: widget.enrollment.groupName),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: borderColor.withValues(alpha: 0.6),
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollCtrl,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                      children: [
                        Text(L10nGateway.current.entryType,
                            style: TextStyle(
                                fontFamily: 'Dubai',
                                fontSize: FontSize.label,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.7))),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _EntryTypeChip(
                                label: L10nGateway.current.newMemorization,
                                icon: Icons.auto_stories_rounded,
                                selected: _entryType == 'new',
                                onTap: () => setState(() => _entryType = 'new'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _EntryTypeChip(
                                label: L10nGateway.current.review,
                                icon: Icons.replay_rounded,
                                selected: _entryType == 'review',
                                onTap: () =>
                                    setState(() => _entryType = 'review'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(L10nGateway.current.pageRange,
                            style: TextStyle(
                                fontFamily: 'Dubai',
                                fontSize: FontSize.label,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.7))),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _fromPageCtrl,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    fontFamily: 'Dubai',
                                    fontSize: FontSize.bodyLarge),
                                decoration: _decoration(
                                        label: L10nGateway.current.fromPage,
                                        icon: Icons.first_page_rounded)
                                    .copyWith(fillColor: fillColor),
                                validator: (v) =>
                                    (v == null || int.tryParse(v) == null)
                                        ? L10nGateway.current.required
                                        : null,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextFormField(
                                controller: _toPageCtrl,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    fontFamily: 'Dubai',
                                    fontSize: FontSize.bodyLarge),
                                decoration: _decoration(
                                        label: L10nGateway.current.toPage,
                                        icon: Icons.last_page_rounded)
                                    .copyWith(fillColor: fillColor),
                                validator: (v) {
                                  final to = int.tryParse(v ?? '');
                                  final from = int.tryParse(_fromPageCtrl.text);
                                  if (to == null) {
                                    return L10nGateway.current.required;
                                  }
                                  if (from != null && to < from) {
                                    return L10nGateway.current.invalid;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(L10nGateway.current.date,
                            style: TextStyle(
                                fontFamily: 'Dubai',
                                fontSize: FontSize.label,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.7))),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(_fieldRadius),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.today_rounded,
                                  size: 20,
                                  color: context.appColors.primaryLight),
                              const SizedBox(width: 12),
                              Text(dateStr,
                                  style: const TextStyle(
                                      fontFamily: 'Dubai',
                                      fontSize: FontSize.bodyLarge)),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: context.appColors.primaryLight
                                      .withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(L10nGateway.current.today,
                                    style: TextStyle(
                                        fontFamily: 'Dubai',
                                        fontSize: FontSize.caption,
                                        fontWeight: FontWeight.w700,
                                        color: context.appColors.primaryLight)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(L10nGateway.current.notes,
                            style: TextStyle(
                                fontFamily: 'Dubai',
                                fontSize: FontSize.label,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.7))),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _notesCtrl,
                          maxLines: 3,
                          style: const TextStyle(
                              fontFamily: 'Dubai', fontSize: FontSize.body),
                          decoration: _decoration(
                                  label: L10nGateway.current.writeANoteAboutThe,
                                  icon: Icons.edit_note_rounded)
                              .copyWith(fillColor: fillColor),
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? L10nGateway.current.required
                              : null,
                        ),
                        if (_error != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: context.appColors.error
                                  .withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: context.appColors.error
                                      .withValues(alpha: 0.25)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline_rounded,
                                    size: 18, color: context.appColors.error),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(_error!,
                                      style: TextStyle(
                                          fontFamily: 'Dubai',
                                          fontSize: FontSize.caption,
                                          color: context.appColors.errorText)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        20, 12, 20, MediaQuery.of(context).padding.bottom + 16),
                    decoration: BoxDecoration(
                      color: bg,
                      border: Border(
                          top: BorderSide(
                              color: Theme.of(context).dividerColor)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _saving
                                ? null
                                : () => Navigator.pop(context, false),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            child: Text(L10nGateway.current.cancel,
                                style: const TextStyle(
                                    fontFamily: 'Dubai',
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: _saving ? null : _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.appColors.primaryLight,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              elevation: 0,
                            ),
                            child: _saving
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2.2, color: Colors.white))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.check_circle_rounded,
                                          size: 18),
                                      const SizedBox(width: 8),
                                      Text(L10nGateway.current.saveRecord,
                                          style: const TextStyle(
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w800)),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SheetHeaderRow extends StatelessWidget {
  final String studentName;
  final String groupName;
  const _SheetHeaderRow({required this.studentName, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                gradient: context.appColors.gradientPrimary,
                borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.record_voice_over_rounded,
                color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.newMemorizationRecord,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Text('$studentName · $groupName',
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: FontSize.caption,
                        color: context.appColors.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AdminSheetCloseButton(onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}

class _EntryTypeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _EntryTypeChip(
      {required this.label,
      required this.icon,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: selected ? context.appColors.gradientPrimary : null,
          color: selected ? null : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                selected ? Colors.transparent : Theme.of(context).dividerColor,
            width: 1.4,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                      color:
                          context.appColors.brandPrimary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4))
                ]
              : null,
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 22,
                color: selected ? Colors.white : context.appColors.textMuted),
            const SizedBox(height: 6),
            Text(label,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  fontWeight: FontWeight.w700,
                  color: selected
                      ? Colors.white
                      : Theme.of(context).colorScheme.onSurface,
                )),
          ],
        ),
      ),
    );
  }
}

class _AssessmentRow extends StatelessWidget {
  final AdminAssessmentItem assessment;
  const _AssessmentRow({required this.assessment});

  @override
  Widget build(BuildContext context) {
    final color = assessment.isActive
        ? context.appColors.success
        : context.appColors.textMuted;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(assessment.title,
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface)),
          ),
          Text(context.l10n.resultS(assessment.resultsCount),
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  color: context.appColors.textMuted)),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _MiniStat(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  color: color)),
        ]),
      );
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
              color: color.withValues(alpha: 0.07),
              blurRadius: 16,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 10),
            Text(title,
                style: TextStyle(
                    fontFamily: 'Dubai',
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface)),
          ]),
          const SizedBox(height: 10),
          Divider(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
              height: 1),
          const SizedBox(height: 10),
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
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(message,
            style: TextStyle(
                fontFamily: 'Dubai',
                fontSize: FontSize.caption,
                color: context.appColors.textMuted)),
      );
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;
  const _Chip({required this.label, required this.color, this.icon});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4)
          ],
          Text(label,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                  color: color)),
        ]),
      );
}

class _Empty extends StatelessWidget {
  final IconData icon;
  final String message;
  const _Empty({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) =>
      AdminEmptyState(icon: icon, title: message);
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  bool get _isForbidden =>
      message.contains('صلاحية') || message.contains('403');

  @override
  Widget build(BuildContext context) {
    final color = _isForbidden
        ? context.appColors.warningText
        : context.appColors.errorText;
    final icon =
        _isForbidden ? Icons.lock_outline_rounded : Icons.error_outline_rounded;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, size: 48, color: color),
          ),
          const SizedBox(height: 16),
          Text(
              _isForbidden
                  ? context.l10n.youDonTHavePermission3
                  : context.l10n.somethingWentWrong,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.headlineSmall,
                  fontWeight: FontWeight.w700,
                  color: color)),
          const SizedBox(height: 8),
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.label,
                  color: context.appColors.textMuted)),
          if (!_isForbidden) ...[
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: Text(context.l10n.tryAgain,
                  style: const TextStyle(fontFamily: 'Dubai')),
            ),
          ],
        ]),
      ),
    ).animate().fadeIn(duration: 350.ms);
  }
}
