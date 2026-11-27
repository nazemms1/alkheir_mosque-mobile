import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/ui/providers/quran_tests_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_progress_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

/// اختبارات القرآن لطالب واحد: الدورات الجزئية والنهائية، وبدء دورة جديدة.
class QuranTestsScreen extends ConsumerStatefulWidget {
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
  ConsumerState<QuranTestsScreen> createState() => _QuranTestsScreenState();
}

class _QuranTestsScreenState extends ConsumerState<QuranTestsScreen>
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
        QuranCycleKind.partial => L10nGateway.current.partial,
        QuranCycleKind.finalTest => L10nGateway.current.tFinal,
      };

  Future<void> _startCycle(QuranCycleKind kind) async {
    final saved = await showFormSheet(
      context,
      title: L10nGateway.current.startTest(_kindLabel(kind)),
      builder: (_) => _StartCycleForm(
        kind: kind,
        enrollments: widget.enrollments,
        service: ref.read(quranTestsActionsControllerProvider.notifier),
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
      actions: [
        IconButton(
          tooltip: context.l10n.testEntry,
          icon: const Icon(Icons.playlist_add_check_circle_rounded),
          onPressed: () => context.push(AppRoutes.saberEntryRoute, extra: (
            token: widget.token,
            initialStudent: PickerItem(
              id: widget.student.id,
              label: widget.student.fullName,
              subtitle: widget.student.studentNumber,
            )
          )),
        ),
      ],
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
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
              label: Text(
                context.l10n.startTest(_kindLabel(activeKind)),
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
class _CycleList extends ConsumerStatefulWidget {
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
  ConsumerState<_CycleList> createState() => _CycleListState();
}

class _CycleListState extends ConsumerState<_CycleList> {
  @override
  Widget build(BuildContext context) {
    final isPartial = widget.kind == QuranCycleKind.partial;
    return PagedList<Object>(
      reloadToken: widget.reloadToken,
      emptyText: isPartial
          ? context.l10n.noPartialTestCyclesFor
          : context.l10n.noFinalTestCyclesFor,
      fetch: (page) async {
        if (isPartial) {
          final result = await ref
              .read(quranTestsActionsControllerProvider.notifier)
              .query((r) => r.partialCycles(
                    page: page,
                    studentId: widget.studentId,
                  ));
          return PagedResult<Object>(
            items: result.items,
            currentPage: result.currentPage,
            lastPage: result.lastPage,
            total: result.total,
          );
        }
        final result = await ref
            .read(quranTestsActionsControllerProvider.notifier)
            .query((r) => r.finalCycles(
                  page: page,
                  studentId: widget.studentId,
                ));
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
            await context.push<void>(AppRoutes.quranCycleRoute, extra: (
              token: widget.token,
              kind: widget.kind,
              cycleId: cycleId
            ));
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
    final color =
        passed ? context.appColors.success : context.appColors.warning;
    final detail = partial != null
        ? context.l10n
            .partsOfPassed(partial.parts.where((p) => p.isPassed).length)
        : context.l10n.attempts(finalTest?.attempts.length ?? 0);
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
                  juz == null ? '—' : context.l10n.juz(juz.juzNumber),
                  style: appTextStyle(
                    fontSize: FontSize.bodyLarge,
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
            style: appTextStyle(
                fontSize: FontSize.caption, color: moduleMuted(context)),
          ),
          if ((partial?.passedOn ?? finalTest?.passedOn) != null)
            Text(
              context.l10n
                  .passedOn(partial?.passedOn ?? finalTest?.passedOn ?? ''),
              style: appTextStyle(
                  fontSize: FontSize.caption,
                  color: context.appColors.successText),
            ),
        ],
      ),
    );
  }
}

/// تسمية حالة الدورة أو المحاولة كما يعرضها الموقع.
String quranStatusLabel(String status) => switch (status) {
      'in_progress' => L10nGateway.current.inProgress,
      'passed' => L10nGateway.current.passed,
      'failed' => L10nGateway.current.failed,
      _ => status,
    };

/// نموذج بدء دورة: يعرض الأجزاء المؤهلة فقط ويبدأ بالتسجيل النشط.
class _StartCycleForm extends ConsumerStatefulWidget {
  final QuranCycleKind kind;
  final List<StudentEnrollmentInfo> enrollments;
  final QuranTestsActionsController service;

  const _StartCycleForm({
    required this.kind,
    required this.enrollments,
    required this.service,
  });

  @override
  ConsumerState<_StartCycleForm> createState() => _StartCycleFormState();
}

class _StartCycleFormState extends ConsumerState<_StartCycleForm> {
  late final List<StudentEnrollmentInfo> _active;
  int? _enrollmentId;
  late final _juzProvider = screenDataProvider<List<QuranJuz>>(() async {
    final enrollmentId = _enrollmentId;
    if (enrollmentId == null) return const [];
    return widget.kind == QuranCycleKind.partial
        ? ref
            .read(quranTestsActionsControllerProvider.notifier)
            .query((r) => r.partialEligibleJuz(enrollmentId))
        : ref
            .read(quranTestsActionsControllerProvider.notifier)
            .query((r) => r.finalEligibleJuz(enrollmentId));
  });
  List<QuranJuz> get _juz => ref.watch(_juzProvider).valueOrNull ?? const [];
  int? _juzId;
  bool get _loadingJuz => ref.watch(_juzProvider).isLoading;
  bool _allowParallel = false;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _active = widget.enrollments.where((e) => e.isActive).toList();
    if (_active.isNotEmpty) {
      _enrollmentId = _active.first.id;
    }
    // خطأ جلب الأجزاء يظهر في رسالة النموذج نفسها.
    ref.listenManual(_juzProvider, (_, next) {
      if (next case AsyncError(:final error)) {
        setState(() => _error = errorText(error));
      }
    });
  }

  /// تغيّر التسجيل: تُفرَّغ قائمة الأجزاء والاختيار وتُجلب من جديد.
  void _loadJuz() {
    if (_enrollmentId == null) return;
    setState(() {
      _juzId = null;
      _error = null;
    });
    ref.invalidate(_juzProvider);
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
        await ref
            .read(quranTestsActionsControllerProvider.notifier)
            .query((r) => r.startPartial(
                  enrollmentId,
                  juzId: juzId,
                  allowParallelCycle: _allowParallel,
                ));
      } else {
        await ref
            .read(quranTestsActionsControllerProvider.notifier)
            .query((r) => r.startFinal(enrollmentId, juzId: juzId));
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
      return ModuleMessage(text: L10nGateway.current.theStudentHasNoActive);
    }
    final isPartial = widget.kind == QuranCycleKind.partial;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DropdownButtonFormField<int>(
          initialValue: _enrollmentId,
          isExpanded: true,
          decoration: InputDecoration(labelText: context.l10n.enrollment),
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
              labelText: context.l10n.juz3,
              helperText:
                  _juz.isEmpty ? context.l10n.noJuzEligibleToStart : null,
            ),
            items: [
              for (final juz in _juz)
                DropdownMenuItem(
                  value: juz.id,
                  child: Text(context.l10n.juz(juz.juzNumber)),
                ),
            ],
            onChanged: (value) => setState(() => _juzId = value),
          ),
        if (isPartial) ...[
          const SizedBox(height: 8),
          moduleSwitch(
            context,
            label: context.l10n.allowAParallelCycle,
            subtitle: context.l10n.enableOnlyAfterConfirmingThe,
            value: _allowParallel,
            onChanged: (v) => setState(() => _allowParallel = v),
          ),
        ],
        if (_error != null) ...[
          const SizedBox(height: 8),
          Text(_error!,
              style: appTextStyle(
                  fontSize: FontSize.label,
                  color: context.appColors.errorText)),
        ],
        const SizedBox(height: 16),
        ModuleSaveButton(
          saving: _saving,
          onPressed: _juzId == null ? () {} : _save,
          label: context.l10n.startTest2,
        ),
      ],
    );
  }
}
