import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/data/models/admin_dashboard_model.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/students/data/models/student_model.dart' show StudentParentInfo;
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';

class SupervisorStudentDetail extends StatefulWidget {
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
  State<SupervisorStudentDetail> createState() =>
      _SupervisorStudentDetailState();
}

class _SupervisorStudentDetailState extends State<SupervisorStudentDetail> {
  final _service = AdminRepositoryImpl();

  List<AdminEnrollmentItem> _enrollments = [];
  List<AdminAssessmentItem> _assessments = [];
  StudentParentInfo? _parentInfo;
  bool _loading = true;
  String? _error;

  bool get _canViewAssessments =>
      widget.token.hasPermission(Permissions.assessmentsView);

  // تسجيل الحفظ يتطلب teacher_id فعلي من جدول teachers — الـ API يرجعه الآن
  // ضمن user.teacher_id، فنعتمد عليه مباشرة بدل تخمين الحساب من الدور.
  bool get _canRecordMemorization =>
      widget.token.hasPermission(Permissions.memorizationRecord) &&
      widget.token.teacherId != null;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await _service.fetchStudentProgress(widget.studentId);
      if (!mounted) return;
      setState(() {
        _enrollments = result.enrollments;
        _assessments = _canViewAssessments ? result.assessments : [];
        _parentInfo = result.parentInfo;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  int get _totalPoints => _enrollments.fold(0, (sum, e) => sum + e.finalPoints);

  int get _totalMemorizedPages =>
      _enrollments.fold(0, (sum, e) => sum + e.memorizedPages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        title: widget.studentName,
        subtitle: tr('ملف الطالب'),
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
  final AdminRepositoryImpl service;
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

  Widget _buildHeroBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0D5016).withValues(alpha: 0.25),
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
              gradient: AppColors.gradientGold,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gold.withValues(alpha: 0.35),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Center(
              child: Text(
                studentName.isNotEmpty ? studentName[0] : '؟',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
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
                    fontSize: 16,
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
                      label: trf('{0} صفحة', [totalMemorizedPages]),
                      color: AppColors.gold,
                      icon: Icons.menu_book_rounded,
                    ),
                    _Chip(
                      label: trf('{0} نقطة', [totalPoints]),
                      color: AppColors.primaryLight,
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
          _buildHeroBanner(),
          const SizedBox(height: 32),
          _Empty(
            icon: Icons.school_outlined,
            message: tr('لا توجد تسجيلات لهذا الطالب'),
          ),
        ],
      );
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      children: [
        _buildHeroBanner(),
        const SizedBox(height: 12),

        _Card(
          title: tr('ملخص الطالب'),
          icon: Icons.insights_rounded,
          color: AppColors.gold,
          children: [
            Row(
              children: [
                Expanded(
                    child: _SummaryStat(
                        label: tr('الحلقات'),
                        value: '${enrollments.length}',
                        color: AppColors.primaryLight)),
                const SizedBox(width: 10),
                Expanded(
                    child: _SummaryStat(
                        label: tr('صفحات محفوظة'),
                        value: '$totalMemorizedPages',
                        color: AppColors.gold)),
                const SizedBox(width: 10),
                Expanded(
                    child: _SummaryStat(
                        label: tr('النقاط'),
                        value: '$totalPoints',
                        color: AppColors.success)),
              ],
            ),
          ],
        ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0),
        if (parentInfo != null && parentInfo!.hasAnyData) ...[
          const SizedBox(height: 12),
          _Card(
            title: tr('بيانات ولي الأمر'),
            icon: Icons.family_restroom_rounded,
            color: AppColors.info,
            children: [
              if (parentInfo!.fatherName.isNotEmpty)
                _InfoRow(label: tr('الأب'), value: parentInfo!.fatherName),
              if (parentInfo!.fatherPhone.isNotEmpty)
                _InfoRow(
                    label: tr('هاتف الأب'), value: parentInfo!.fatherPhone),
              if (parentInfo!.motherName.isNotEmpty)
                _InfoRow(label: tr('الأم'), value: parentInfo!.motherName),
              if (parentInfo!.motherPhone.isNotEmpty)
                _InfoRow(
                    label: tr('هاتف الأم'), value: parentInfo!.motherPhone),
              if (parentInfo!.homePhone.isNotEmpty)
                _InfoRow(
                    label: tr('هاتف المنزل'), value: parentInfo!.homePhone),
              if (parentInfo!.address.isNotEmpty)
                _InfoRow(label: tr('العنوان'), value: parentInfo!.address),
            ],
          )
              .animate()
              .fadeIn(delay: 60.ms, duration: 300.ms)
              .slideY(begin: 0.05, end: 0),
        ] else if (enrollments.first.parentName?.isNotEmpty == true) ...[
          const SizedBox(height: 12),
          _Card(
            title: tr('بيانات ولي الأمر'),
            icon: Icons.family_restroom_rounded,
            color: AppColors.info,
            children: [
              _InfoRow(
                  label: tr('ولي الأمر'), value: enrollments.first.parentName!)
            ],
          )
              .animate()
              .fadeIn(delay: 60.ms, duration: 300.ms)
              .slideY(begin: 0.05, end: 0),
        ],
        const SizedBox(height: 12),
        _Card(
          title: tr('الحلقات المسجّل بها'),
          icon: Icons.groups_rounded,
          color: AppColors.primaryLight,
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
            title: tr('التقييمات (حلقات الطالب)'),
            icon: Icons.assignment_rounded,
            color: AppColors.info,
            children: assessments.isEmpty
                ? [_EmptyRow(message: tr('لا توجد تقييمات'))]
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
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: color)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 10,
                  color: AppColors.textMuted)),
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
                  style: const TextStyle(
                      fontFamily: 'Dubai',
                      fontSize: 12,
                      color: AppColors.textMuted)),
            ),
            Expanded(
              child: Text(value,
                  style: TextStyle(
                      fontFamily: 'Dubai',
                      fontSize: 12,
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
  final AdminRepositoryImpl service;
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
    final statusColor =
        enrollment.status == 'active' ? AppColors.success : AppColors.textMuted;
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
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                    enrollment.status == 'active' ? tr('نشط') : tr('غير نشط'),
                    style: TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: statusColor)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(enrollment.courseName,
              style: const TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 11,
                  color: AppColors.textMuted)),
          const SizedBox(height: 8),
          Row(
            children: [
              _MiniStat(
                  icon: Icons.menu_book_rounded,
                  label: trf('{0} صفحة', [enrollment.memorizedPages]),
                  color: AppColors.gold),
              const SizedBox(width: 8),
              _MiniStat(
                  icon: Icons.star_rounded,
                  label: trf('{0} نقطة', [enrollment.finalPoints]),
                  color: AppColors.primaryLight),
              if (canRecordMemorization && enrollment.status == 'active') ...[
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _openRecordDialog(context),
                  icon: const Icon(Icons.add_circle_outline_rounded, size: 16),
                  label: Text(tr('تسجيل حفظ'),
                      style: const TextStyle(fontFamily: 'Dubai', fontSize: 12)),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primaryLight,
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
class RecordMemorizationDialog extends StatefulWidget {
  final AdminEnrollmentItem enrollment;
  final int? teacherId;
  final AdminRepositoryImpl service;

  const RecordMemorizationDialog({
    super.key,
    required this.enrollment,
    required this.teacherId,
    required this.service,
  });

  @override
  State<RecordMemorizationDialog> createState() =>
      _RecordMemorizationDialogState();
}

class _RecordMemorizationDialogState extends State<RecordMemorizationDialog> {
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
      setState(() => _error = tr('تعذّر تحديد المعلم الحالي'));
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await widget.service.recordMemorization(
        widget.enrollment.id,
        entryType: _entryType,
        fromPage: int.parse(_fromPageCtrl.text),
        toPage: int.parse(_toPageCtrl.text),
        recordedOn:
            '${_recordedOn.year.toString().padLeft(4, '0')}-${_recordedOn.month.toString().padLeft(2, '0')}-${_recordedOn.day.toString().padLeft(2, '0')}',
        teacherId: '${widget.teacherId}',
        notes: _notesCtrl.text.trim(),
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _saving = false;
      });
    }
  }

  static const _fieldRadius = 16.0;

  InputDecoration _decoration({required String label, required IconData icon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontFamily: 'Dubai', fontSize: 13),
      prefixIcon: Icon(icon, size: 20, color: AppColors.primaryLight),
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
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_fieldRadius),
        borderSide: const BorderSide(color: AppColors.error, width: 1.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('d MMMM yyyy', AppLanguage.intlCode).format(_recordedOn);
    final fillColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white.withValues(alpha: 0.06)
        : AppColors.primaryLight.withValues(alpha: 0.06);
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
          final borderColor =
              isDark ? const Color(0xFF1E3A24) : const Color(0xFFD8E8DC);
          final handleColor =
              isDark ? const Color(0xFF2A4A32) : const Color(0xFFCAD8CE);

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
                  color: const Color(0xFF0D5016)
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
                      Text(tr('نوع التسجيل'),
                          style: TextStyle(
                              fontFamily: 'Dubai',
                              fontSize: 13,
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
                              label: tr('حفظ جديد'),
                              icon: Icons.auto_stories_rounded,
                              selected: _entryType == 'new',
                              onTap: () => setState(() => _entryType = 'new'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _EntryTypeChip(
                              label: tr('مراجعة'),
                              icon: Icons.replay_rounded,
                              selected: _entryType == 'review',
                              onTap: () =>
                                  setState(() => _entryType = 'review'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(tr('نطاق الصفحات'),
                          style: TextStyle(
                              fontFamily: 'Dubai',
                              fontSize: 13,
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
                                  fontFamily: 'Dubai', fontSize: 15),
                              decoration: _decoration(
                                      label: tr('من صفحة'),
                                      icon: Icons.first_page_rounded)
                                  .copyWith(fillColor: fillColor),
                              validator: (v) =>
                                  (v == null || int.tryParse(v) == null)
                                      ? tr('مطلوب')
                                      : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _toPageCtrl,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontFamily: 'Dubai', fontSize: 15),
                              decoration: _decoration(
                                      label: tr('إلى صفحة'),
                                      icon: Icons.last_page_rounded)
                                  .copyWith(fillColor: fillColor),
                              validator: (v) {
                                final to = int.tryParse(v ?? '');
                                final from = int.tryParse(_fromPageCtrl.text);
                                if (to == null) return tr('مطلوب');
                                if (from != null && to < from) {
                                  return tr('غير صحيح');
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(tr('التاريخ'),
                          style: TextStyle(
                              fontFamily: 'Dubai',
                              fontSize: 13,
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
                            const Icon(Icons.today_rounded,
                                size: 20, color: AppColors.primaryLight),
                            const SizedBox(width: 12),
                            Text(dateStr,
                                style: const TextStyle(
                                    fontFamily: 'Dubai', fontSize: 15)),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(tr('اليوم'),
                                  style: const TextStyle(
                                      fontFamily: 'Dubai',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryLight)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(tr('ملاحظات'),
                          style: TextStyle(
                              fontFamily: 'Dubai',
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.7))),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _notesCtrl,
                        maxLines: 3,
                        style:
                            const TextStyle(fontFamily: 'Dubai', fontSize: 14),
                        decoration: _decoration(
                                label: tr('اكتب ملاحظة عن الجلسة'),
                                icon: Icons.edit_note_rounded)
                            .copyWith(fillColor: fillColor),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? tr('مطلوب')
                            : null,
                      ),
                      if (_error != null) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.error.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: AppColors.error.withValues(alpha: 0.25)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.error_outline_rounded,
                                  size: 18, color: AppColors.error),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(_error!,
                                    style: const TextStyle(
                                        fontFamily: 'Dubai',
                                        fontSize: 12,
                                        color: AppColors.error)),
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
                        top: BorderSide(color: Theme.of(context).dividerColor)),
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
                          child: Text(tr('إلغاء'),
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
                            backgroundColor: AppColors.primaryLight,
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
                                    const Icon(Icons.check_circle_rounded, size: 18),
                                    const SizedBox(width: 8),
                                    Text(tr('حفظ التسجيل'),
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
                gradient: AppColors.gradientPrimary,
                borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.record_voice_over_rounded,
                color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr('تسجيل حفظ جديد'),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 2),
                Text('$studentName · $groupName',
                    style: const TextStyle(
                        fontFamily: 'Dubai',
                        fontSize: 12,
                        color: AppColors.textMuted),
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
          gradient: selected ? AppColors.gradientPrimary : null,
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
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4))
                ]
              : null,
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 22, color: selected ? Colors.white : AppColors.textMuted),
            const SizedBox(height: 6),
            Text(label,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 13,
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
    final color = assessment.isActive ? AppColors.success : AppColors.textMuted;
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
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface)),
          ),
          Text(trf('{0} نتيجة', [assessment.resultsCount]),
              style: const TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 11,
                  color: AppColors.textMuted)),
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
                  fontSize: 11,
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
                    fontSize: 14,
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
            style: const TextStyle(
                fontFamily: 'Dubai', fontSize: 12, color: AppColors.textMuted)),
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
                  fontSize: 11,
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
  Widget build(BuildContext context) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 48, color: AppColors.textMuted),
          const SizedBox(height: 12),
          Text(message,
              style: const TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 14,
                  color: AppColors.textMuted)),
        ]),
      );
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  bool get _isForbidden =>
      message.contains('صلاحية') || message.contains('403');

  @override
  Widget build(BuildContext context) {
    final color = _isForbidden ? AppColors.warning : AppColors.error;
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
          Text(_isForbidden ? tr('ليس لديك صلاحية') : tr('حدث خطأ'),
              style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: color)),
          const SizedBox(height: 8),
          Text(message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: 13,
                  color: AppColors.textMuted)),
          if (!_isForbidden) ...[
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: Text(tr('إعادة المحاولة'),
                  style: const TextStyle(fontFamily: 'Dubai')),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLight,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ]),
      ),
    ).animate().fadeIn(duration: 350.ms);
  }
}
