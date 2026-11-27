import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

String memorizationTypeLabel(String type) => switch (type) {
      'new' => L10nGateway.current.newMemorization,
      'review' => L10nGateway.current.review,
      'correction' => L10nGateway.current.correction,
      _ => type,
    };

/// سجل الحفظ للطاقم: تصفية بالنوع، وتسجيل حفظ جديد أو مراجعة لطالب.
class StaffMemorizationScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const StaffMemorizationScreen({super.key, required this.token});

  @override
  ConsumerState<StaffMemorizationScreen> createState() =>
      _StaffMemorizationScreenState();
}

class _StaffMemorizationScreenState
    extends ConsumerState<StaffMemorizationScreen> {
  String? _type;
  int _reloadToken = 0;

  Future<void> _record() async {
    final saved = await context.push<bool>(AppRoutes.recordMemorizationRoute,
        extra: widget.token);
    if (saved == true) setState(() => _reloadToken++);
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewMemorization(t)) {
      return ModuleScaffold(
        title: L10nGateway.current.memorization,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.memorization,
      actions: [
        if (ModuleAccess.canRecordPartialTests(t) ||
            ModuleAccess.canViewQuranTests(t))
          IconButton(
            tooltip: context.l10n.testEntry,
            icon: const Icon(Icons.playlist_add_check_circle_rounded),
            onPressed: () => context.push(AppRoutes.saberEntryRoute,
                extra: (token: widget.token, initialStudent: null)),
          ),
      ],
      floatingActionButton: ModuleAccess.canRecordMemorization(t)
          ? FloatingActionButton.extended(
              onPressed: _record,
              backgroundColor: context.appColors.brandPrimary,
              icon: const Icon(Icons.edit_note_rounded, color: Colors.white),
              label: Text(
                context.l10n.recordMemorization,
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<MemorizationEntry>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noMemorizationRecords,
        header: _TypeFilter(
          selected: _type,
          onSelected: (value) => setState(() {
            _type = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.memorization(page: page, entryType: _type)),
        itemBuilder: (context, entry, _) => ModuleCard(
          accent: entry.entryType == 'review'
              ? context.appColors.info
              : context.appColors.primaryLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.student?.name ?? '—',
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: memorizationTypeLabel(entry.entryType),
                    color: entry.entryType == 'review'
                        ? context.appColors.info
                        : context.appColors.primaryLight,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                L10nGateway.current.fromPageToPages(
                    entry.fromPage, entry.toPage, entry.pagesCount),
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
              ),
              Text(
                '${entry.groupName ?? ''}  ·  ${entry.recordedOn}  ·  ${entry.teacher?.name ?? ''}',
                style: appTextStyle(
                    fontSize: FontSize.caption, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeFilter extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onSelected;

  const _TypeFilter({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final options = <String?, String>{
      null: L10nGateway.current.all,
      'new': L10nGateway.current.newMemorization,
      'review': L10nGateway.current.review,
      'correction': L10nGateway.current.correction,
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

/// شاشة تسجيل التسميع بالتصميم الجديد: اختيار الطالب، عرض أجزائه، واختيار الصفحة من الصفحات الناقصة دون إدخال يدوي.
class RecordMemorizationScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const RecordMemorizationScreen({super.key, required this.token});

  @override
  ConsumerState<RecordMemorizationScreen> createState() =>
      _RecordMemorizationScreenState();
}

class _RecordMemorizationScreenState
    extends ConsumerState<RecordMemorizationScreen> {
  PickerItem? _student;
  PickerItem? _enrollment;
  int _selectedJuz = 28; // Default to Juz 28 or current Juz
  int? _selectedPage;
  // الصفحات المسمّعة سابقاً وأول جزء ناقص؛ بلا بيانات إن تعذّر الجلب.
  late final _studentDataProvider = screenDataProvider(_loadStudentData);
  bool get _loadingStudentData =>
      _student != null && ref.watch(_studentDataProvider).isLoading;
  bool _saving = false;
  final Set<int> _recitedPages = {};

  @override
  void initState() {
    super.initState();
    ref.listenManual(_studentDataProvider, (_, next) {
      if (next case AsyncData(:final value?)) {
        setState(() {
          _enrollment = value.enrollment;
          _recitedPages.addAll(value.heard);
          _selectedJuz = value.candidateJuz;
        });
      }
    });
  }

  static const _juzFirstPage = [
    1,
    22,
    42,
    62,
    82,
    102,
    122,
    142,
    162,
    182,
    202,
    222,
    242,
    262,
    282,
    302,
    322,
    342,
    362,
    382,
    402,
    422,
    442,
    462,
    482,
    502,
    522,
    542,
    562,
    582,
  ];

  static const _juzLastPage = [
    21,
    41,
    61,
    81,
    101,
    121,
    141,
    161,
    181,
    201,
    221,
    241,
    261,
    281,
    301,
    321,
    341,
    361,
    381,
    401,
    421,
    441,
    461,
    481,
    501,
    521,
    541,
    561,
    581,
    604,
  ];

  bool get _teacherIsSelf => widget.token.teacherId != null;

  List<int> get _currentJuzMissingPages {
    final idx = _selectedJuz - 1;
    if (idx < 0 || idx >= 30) return [];
    final first = _juzFirstPage[idx];
    final last = _juzLastPage[idx];
    final pages = <int>[];
    for (int p = first; p <= last; p++) {
      if (!_recitedPages.contains(p)) {
        pages.add(p);
      }
    }
    return pages;
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

  void _selectStudent(PickerItem student) {
    setState(() {
      _student = student;
      _enrollment = null;
      _selectedPage = null;
      _recitedPages.clear();
    });
    ref.invalidate(_studentDataProvider);
  }

  Future<({PickerItem? enrollment, Set<int> heard, int candidateJuz})?>
      _loadStudentData() async {
    final student = _student;
    if (student == null) return null;
    final enrollments = await studentActiveEnrollmentItems(student.id);
    final memEntries = await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.memorization(
              studentId: student.id,
              page: 1,
            ));

    final heard = <int>{};
    for (final e in memEntries.items) {
      for (int p = e.fromPage; p <= e.toPage; p++) {
        heard.add(p);
      }
    }

    int candidateJuz = 28;
    for (int j = 1; j <= 30; j++) {
      final f = _juzFirstPage[j - 1];
      final l = _juzLastPage[j - 1];
      final hasHeard = heard.any((p) => p >= f && p <= l);
      final hasMissing =
          [for (int p = f; p <= l; p++) p].any((p) => !heard.contains(p));
      if (hasHeard && hasMissing) {
        candidateJuz = j;
        break;
      }
    }

    return (
      enrollment: enrollments.isNotEmpty ? enrollments.first : null,
      heard: heard,
      candidateJuz: candidateJuz,
    );
  }

  void _prevJuz() {
    setState(() {
      _selectedJuz = _selectedJuz > 1 ? _selectedJuz - 1 : 30;
      _selectedPage = null;
    });
  }

  void _nextJuz() {
    setState(() {
      _selectedJuz = _selectedJuz < 30 ? _selectedJuz + 1 : 1;
      _selectedPage = null;
    });
  }

  Future<void> _save() async {
    if (_student == null) {
      showModuleSnack(context, L10nGateway.current.chooseAStudentFirst,
          error: true);
      return;
    }
    if (_enrollment == null) {
      showModuleSnack(context, L10nGateway.current.noActiveEnrollmentForThis,
          error: true);
      return;
    }
    if (_selectedPage == null) {
      showModuleSnack(context, L10nGateway.current.choosePageToRecite,
          error: true);
      return;
    }

    final pageToSave = _selectedPage!;
    final teacherId = _teacherIsSelf ? widget.token.teacherId : null;

    setState(() => _saving = true);
    final outcome = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.recordMemorization(
              _enrollment!.id,
              entryType: 'new',
              fromPage: pageToSave,
              toPage: pageToSave,
              recordedOn: isoDate(DateTime.now()),
              teacherId: teacherId,
            ));
    if (!mounted) return;
    if (outcome.error case final error?) {
      setState(() => _saving = false);
      if (error.hasDuplicatePages) {
        showModuleSnack(
          context,
          L10nGateway.current
              .pageAlreadyRecited(error.duplicatePages!.join('، ')),
          error: true,
        );
      } else {
        showModuleSnack(context, errorText(error), error: true);
      }
      return;
    }

    if (!mounted) return;
    setState(() {
      _recitedPages.add(pageToSave);
      _selectedPage = null;
      _saving = false;
    });

    showModuleSnack(
      context,
      L10nGateway.current.pageRecitationRecorded(pageToSave),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allowed = ModuleAccess.canRecordMemorization(widget.token);
    if (!allowed) {
      return ModuleScaffold(
        title: L10nGateway.current.recordRecitation,
        body: const ModuleAccessDenied(),
      );
    }

    final missingPages = _currentJuzMissingPages;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return ModuleScaffold(
      title: context.l10n.recordRecitation,
      actions: [
        IconButton(
          tooltip: context.l10n.testEntry,
          icon: const Icon(Icons.fact_check_outlined, color: Colors.white),
          onPressed: () {
            context.push(AppRoutes.saberEntryRoute,
                extra: (token: widget.token, initialStudent: _student));
          },
        ),
      ],
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          // Main Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: context.appColors.card,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: context.appColors.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Label: الطالب
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    context.l10n.student,
                    style: appTextStyle(
                      fontSize: FontSize.body,
                      fontWeight: FontWeight.w700,
                      color: context.appColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Student Selector Box
                InkWell(
                  onTap: () async {
                    final picked = await showItemPicker(
                      context,
                      title: L10nGateway.current.chooseStudent,
                      load: _loadStudents,
                    );
                    if (picked != null) {
                      _selectStudent(picked);
                    }
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 52,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: context.appColors.field,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: context.appColors.border),
                    ),
                    child: Row(
                      children: [
                        if (_student != null)
                          InkWell(
                            onTap: () => setState(() {
                              _student = null;
                              _enrollment = null;
                              _selectedPage = null;
                              _recitedPages.clear();
                            }),
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.close_rounded,
                                size: 18,
                                color: context.appColors.textMuted,
                              ),
                            ),
                          )
                        else
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: context.appColors.textMuted,
                          ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _student?.label ?? context.l10n.studentNameLabel,
                            textAlign: TextAlign.start,
                            style: appTextStyle(
                              fontSize: FontSize.body,
                              fontWeight: _student != null
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: _student != null
                                  ? context.appColors.textPrimary
                                  : context.appColors.textMuted,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Sub-container for Juz and Pages
                if (_loadingStudentData)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 36),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (_student != null)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: context.appColors.field,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: context.appColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Juz Selector Header with arrows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left_rounded,
                                color: context.appColors.textPrimary,
                                size: 28,
                              ),
                              onPressed: isRtl ? _nextJuz : _prevJuz,
                              tooltip: isRtl
                                  ? context.l10n.nextPart
                                  : context.l10n.previousPart,
                            ),
                            Text(
                              context.l10n.juz(_selectedJuz),
                              style: appTextStyle(
                                fontSize: FontSize.headlineSmall,
                                fontWeight: FontWeight.w800,
                                color: context.appColors.textPrimary,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.chevron_right_rounded,
                                color: context.appColors.textPrimary,
                                size: 28,
                              ),
                              onPressed: isRtl ? _prevJuz : _nextJuz,
                              tooltip: isRtl
                                  ? context.l10n.previousPart
                                  : context.l10n.nextPart,
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // Pages grid (missing pages)
                        if (missingPages.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Center(
                              child: Text(
                                context.l10n.allPartPagesRecited,
                                style: appTextStyle(
                                  fontSize: FontSize.label,
                                  color: context.appColors.textMuted,
                                ),
                              ),
                            ),
                          )
                        else
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: [
                              for (final page in missingPages)
                                _PageChipButton(
                                  page: page,
                                  isSelected: _selectedPage == page,
                                  onTap: () {
                                    setState(() {
                                      _selectedPage =
                                          (_selectedPage == page ? null : page);
                                    });
                                  },
                                ),
                            ],
                          ),

                        const SizedBox(height: 20),

                        // Bottom right Floppy Save Icon Button
                        Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: InkWell(
                            onTap: _saving ? null : _save,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: context.appColors.primary,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: context.appColors.primary,
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.06),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: _saving
                                  ? Center(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: context.appColors.onPrimary,
                                        ),
                                      ),
                                    )
                                  : Icon(
                                      Icons.save_rounded,
                                      color: context.appColors.onPrimary,
                                      size: 24,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        context.l10n.chooseStudentForRecitation,
                        style: appTextStyle(
                          fontSize: FontSize.label,
                          color: context.appColors.textMuted,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// زر رقم الصفحة مطابق للصورة.
class _PageChipButton extends StatelessWidget {
  final int page;
  final bool isSelected;
  final VoidCallback onTap;

  const _PageChipButton({
    required this.page,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 58,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected
              ? context.appColors.primary.withValues(alpha: 0.14)
              : context.appColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? context.appColors.primary
                : context.appColors.border,
            width: isSelected ? 2.0 : 1.2,
          ),
        ),
        child: Center(
          child: Text(
            '$page',
            style: appTextStyle(
              fontSize: FontSize.body,
              fontWeight: FontWeight.w800,
              color: isSelected
                  ? context.appColors.primary
                  : context.appColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
