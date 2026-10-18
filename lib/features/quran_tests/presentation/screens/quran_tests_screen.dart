import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/quran_tests/data/models/quran_test_model.dart';
import 'package:alkheir_mosque/features/students/data/models/student_progress_model.dart';
import 'package:alkheir_mosque/features/quran_tests/data/repositories/quran_tests_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'quran_cycle_screen.dart';

/// اختبارات القرآن لطالب واحد: الدورات الجزئية والنهائية، وبدء دورة جديدة.
class QuranTestsScreen extends StatefulWidget {
  final AuthToken token;
  final StudentListItem student;
  final List<StudentEnrollmentInfo> enrollments;

  const QuranTestsScreen({
    super.key,
    required this.token,
    required this.student,
    required this.enrollments,
  });

  @override
  State<QuranTestsScreen> createState() => _QuranTestsScreenState();
}

class _QuranTestsScreenState extends State<QuranTestsScreen>
    with SingleTickerProviderStateMixin {
  late final List<QuranCycleKind> _kinds;
  late final TabController _tabCtrl;
  int _reloadToken = 0;

  @override
  void initState() {
    super.initState();
    final t = widget.token;
    _kinds = [
      if (ModuleAccess.canViewPartialTests(t)) QuranCycleKind.partial,
      if (ModuleAccess.canViewFinalTests(t)) QuranCycleKind.finalTest,
    ];
    _tabCtrl =
        TabController(length: _kinds.isEmpty ? 1 : _kinds.length, vsync: this);
    // زر البدء يتبع التبويب الظاهر، سواء بالنقر أو بالتمرير.
    _tabCtrl.addListener(() {
      if (!_tabCtrl.indexIsChanging && mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  bool _canRecord(QuranCycleKind kind) => switch (kind) {
        QuranCycleKind.partial =>
          ModuleAccess.canRecordPartialTests(widget.token),
        QuranCycleKind.finalTest =>
          ModuleAccess.canRecordFinalTests(widget.token),
      };

  String _kindLabel(QuranCycleKind kind) => switch (kind) {
        QuranCycleKind.partial => tr('جزئي'),
        QuranCycleKind.finalTest => tr('نهائي'),
      };

  Future<void> _startCycle(QuranCycleKind kind) async {
    final saved = await showFormSheet(
      context,
      title: trf('بدء اختبار {0}', [_kindLabel(kind)]),
      builder: (_) => _StartCycleForm(
        kind: kind,
        enrollments: widget.enrollments,
        service: QuranTestsRepositoryImpl(),
      ),
    );
    if (saved == true) setState(() => _reloadToken++);
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.student.fullName;
    if (_kinds.isEmpty) {
      return ModuleScaffold(
        title: name,
        body: const ModuleAccessDenied(),
      );
    }
    final activeKind = _kinds[_tabCtrl.index.clamp(0, _kinds.length - 1)];
    final canStart =
        _canRecord(activeKind) && widget.enrollments.any((e) => e.isActive);
    return ModuleScaffold(
      title: name,
      bottom: _kinds.length > 1
          ? TabBar(
              controller: _tabCtrl,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: appTextStyle(fontWeight: FontWeight.w700),
              tabs: [for (final k in _kinds) Tab(text: _kindLabel(k))],
            )
          : null,
      floatingActionButton: canStart
          ? FloatingActionButton.extended(
              onPressed: () => _startCycle(activeKind),
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
              label: Text(
                trf('بدء اختبار {0}', [_kindLabel(activeKind)]),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: TabBarView(
        controller: _tabCtrl,
        physics:
            _kinds.length > 1 ? null : const NeverScrollableScrollPhysics(),
        children: [
          for (final kind in _kinds)
            _CycleList(
              kind: kind,
              studentId: widget.student.id,
              token: widget.token,
              reloadToken: _reloadToken,
              onChanged: () => setState(() => _reloadToken++),
            ),
        ],
      ),
    );
  }
}

enum QuranCycleKind { partial, finalTest }

/// قائمة دورات نوع واحد (جزئي أو نهائي) لطالب محدد.
class _CycleList extends StatefulWidget {
  final QuranCycleKind kind;
  final int studentId;
  final AuthToken token;
  final int reloadToken;
  final VoidCallback onChanged;

  const _CycleList({
    required this.kind,
    required this.studentId,
    required this.token,
    required this.reloadToken,
    required this.onChanged,
  });

  @override
  State<_CycleList> createState() => _CycleListState();
}

class _CycleListState extends State<_CycleList> {
  final _service = QuranTestsRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    final isPartial = widget.kind == QuranCycleKind.partial;
    return PagedList<Object>(
      reloadToken: widget.reloadToken,
      emptyText: isPartial
          ? tr('لا توجد دورات اختبار جزئي لهذا الطالب')
          : tr('لا توجد دورات اختبار نهائي لهذا الطالب'),
      fetch: (page) async {
        if (isPartial) {
          final result = await _service.partialCycles(
            page: page,
            studentId: widget.studentId,
          );
          return PagedResult<Object>(
            items: result.items,
            currentPage: result.currentPage,
            lastPage: result.lastPage,
            total: result.total,
          );
        }
        final result = await _service.finalCycles(
          page: page,
          studentId: widget.studentId,
        );
        return PagedResult<Object>(
          items: result.items,
          currentPage: result.currentPage,
          lastPage: result.lastPage,
          total: result.total,
        );
      },
      itemBuilder: (context, item, _) {
        final cycleId =
            item is QuranPartialCycle ? item.id : (item as QuranFinalCycle).id;
        return _CycleCard(
          item: item,
          onTap: () async {
            await Navigator.of(context).push<void>(
              MaterialPageRoute(
                builder: (_) => QuranCycleScreen(
                  token: widget.token,
                  kind: widget.kind,
                  cycleId: cycleId,
                ),
              ),
            );
            widget.onChanged();
          },
        );
      },
    );
  }
}

class _CycleCard extends StatelessWidget {
  final Object item;
  final VoidCallback onTap;

  const _CycleCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final partial =
        item is QuranPartialCycle ? item as QuranPartialCycle : null;
    final finalTest = item is QuranFinalCycle ? item as QuranFinalCycle : null;
    final juz = partial?.juz ?? finalTest?.juz;
    final status = partial?.status ?? finalTest?.status ?? '';
    final passed = status == 'passed';
    final color = passed ? AppColors.success : AppColors.warning;
    final detail = partial != null
        ? trf('المقاطع: {0} من 4 ناجحة',
            [partial.parts.where((p) => p.isPassed).length])
        : trf('المحاولات: {0}', [finalTest?.attempts.length ?? 0]);
    return ModuleCard(
      accent: color,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  juz == null ? '—' : trf('الجزء {0}', [juz.juzNumber]),
                  style: appTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              StatusPill(label: quranStatusLabel(status), color: color),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${(partial?.group ?? finalTest?.group)?.name ?? ''}  ·  $detail',
            style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
          ),
          if ((partial?.passedOn ?? finalTest?.passedOn) != null)
            Text(
              trf('تاريخ النجاح: {0}',
                  [partial?.passedOn ?? finalTest?.passedOn ?? '']),
              style: appTextStyle(fontSize: 11, color: AppColors.success),
            ),
        ],
      ),
    );
  }
}

/// تسمية حالة الدورة أو المحاولة كما يعرضها الموقع.
String quranStatusLabel(String status) => switch (status) {
      'in_progress' => tr('قيد التقدم'),
      'passed' => tr('ناجح'),
      'failed' => tr('راسب'),
      _ => status,
    };

/// نموذج بدء دورة: يعرض الأجزاء المؤهلة فقط ويبدأ بالتسجيل النشط.
class _StartCycleForm extends StatefulWidget {
  final QuranCycleKind kind;
  final List<StudentEnrollmentInfo> enrollments;
  final QuranTestsRepositoryImpl service;

  const _StartCycleForm({
    required this.kind,
    required this.enrollments,
    required this.service,
  });

  @override
  State<_StartCycleForm> createState() => _StartCycleFormState();
}

class _StartCycleFormState extends State<_StartCycleForm> {
  late final List<StudentEnrollmentInfo> _active;
  int? _enrollmentId;
  List<QuranJuz> _juz = const [];
  int? _juzId;
  bool _loadingJuz = false;
  bool _allowParallel = false;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _active = widget.enrollments.where((e) => e.isActive).toList();
    if (_active.isNotEmpty) {
      _enrollmentId = _active.first.id;
      _loadJuz();
    }
  }

  Future<void> _loadJuz() async {
    final enrollmentId = _enrollmentId;
    if (enrollmentId == null) return;
    setState(() {
      _loadingJuz = true;
      _juz = const [];
      _juzId = null;
      _error = null;
    });
    try {
      final juz = widget.kind == QuranCycleKind.partial
          ? await widget.service.partialEligibleJuz(enrollmentId)
          : await widget.service.finalEligibleJuz(enrollmentId);
      if (!mounted) return;
      setState(() {
        _juz = juz;
        _loadingJuz = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = errorText(error);
        _loadingJuz = false;
      });
    }
  }

  Future<void> _save() async {
    final enrollmentId = _enrollmentId;
    final juzId = _juzId;
    if (enrollmentId == null || juzId == null) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      if (widget.kind == QuranCycleKind.partial) {
        await widget.service.startPartial(
          enrollmentId,
          juzId: juzId,
          allowParallelCycle: _allowParallel,
        );
      } else {
        await widget.service.startFinal(enrollmentId, juzId: juzId);
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

  @override
  Widget build(BuildContext context) {
    if (_active.isEmpty) {
      return ModuleMessage(text: tr('لا يوجد تسجيل نشط لبدء اختبار للطالب'));
    }
    final isPartial = widget.kind == QuranCycleKind.partial;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownButtonFormField<int>(
          initialValue: _enrollmentId,
          isExpanded: true,
          decoration: InputDecoration(labelText: tr('التسجيل')),
          items: [
            for (final e in _active)
              DropdownMenuItem(
                value: e.id,
                child:
                    Text('${e.group?.name ?? ''}  ·  ${e.course?.name ?? ''}'),
              ),
          ],
          onChanged: (value) {
            setState(() => _enrollmentId = value);
            _loadJuz();
          },
        ),
        const SizedBox(height: 12),
        if (_loadingJuz)
          const LinearProgressIndicator()
        else
          DropdownButtonFormField<int>(
            key: ValueKey('juz-$_enrollmentId-${_juz.length}'),
            initialValue: _juz.any((j) => j.id == _juzId) ? _juzId : null,
            isExpanded: true,
            decoration: InputDecoration(
              labelText: tr('الجزء'),
              helperText: _juz.isEmpty ? tr('لا توجد أجزاء مؤهلة للبدء') : null,
            ),
            items: [
              for (final juz in _juz)
                DropdownMenuItem(
                  value: juz.id,
                  child: Text(trf('الجزء {0}', [juz.juzNumber])),
                ),
            ],
            onChanged: (value) => setState(() => _juzId = value),
          ),
        if (isPartial) ...[
          const SizedBox(height: 8),
          moduleSwitch(
            label: tr('السماح بدورة موازية'),
            subtitle: tr(
                'فعّله فقط بعد تأكيد أن الطالب لديه دورة مفتوحة وأنك تريد فتح أخرى.'),
            value: _allowParallel,
            onChanged: (v) => setState(() => _allowParallel = v),
          ),
        ],
        if (_error != null) ...[
          const SizedBox(height: 8),
          Text(_error!,
              style: appTextStyle(fontSize: 13, color: AppColors.error)),
        ],
        const SizedBox(height: 16),
        ModuleSaveButton(
          saving: _saving,
          onPressed: _juzId == null ? () {} : _save,
          label: tr('بدء الاختبار'),
        ),
      ],
    );
  }
}
