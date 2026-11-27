import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/http/api_error.dart';
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
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart';

/// شاشة إدخال سبر مطابقة تماماً للموقع والتصميم المطلوب.
class SaberEntryScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final PickerItem? initialStudent;

  const SaberEntryScreen({
    super.key,
    required this.token,
    this.initialStudent,
  });

  @override
  ConsumerState<SaberEntryScreen> createState() => _SaberEntryScreenState();
}

class _SaberEntryScreenState extends ConsumerState<SaberEntryScreen> {
  final _mistakesCtrl = TextEditingController();

  PickerItem? _student;
  PickerItem? _enrollment;
  List<QuranJuz> _eligibleJuz = const [];
  int? _selectedJuzIndex;
  int _selectedQuarter = 1; // 1, 2, 3, or 4
  bool _saving = false;

  /// تسجيل الطالب المختار وأجزاؤه المؤهلة للسبر.
  late final _studentDataProvider = screenDataProvider(() async {
    final student = _student;
    if (student == null) return null;
    final enrollments = await studentActiveEnrollmentItems(student.id);
    if (enrollments.isEmpty) {
      throw ApiError(
        type: ApiErrorType.custom,
        message: L10nGateway.current.noActiveEnrollmentForThis,
      );
    }
    final enrollment = enrollments.first;
    final eligible = await ref
        .read(quranTestsActionsControllerProvider.notifier)
        .query((r) => r.partialEligibleJuz(enrollment.id));
    return (enrollment: enrollment, eligible: eligible);
  });
  bool get _loadingData =>
      _student != null && ref.watch(_studentDataProvider).isLoading;

  @override
  void initState() {
    super.initState();
    ref.listenManual(_studentDataProvider, (_, next) {
      switch (next) {
        case AsyncData(:final value?):
          setState(() {
            _enrollment = value.enrollment;
            _eligibleJuz = value.eligible;
            _selectedJuzIndex = value.eligible.isNotEmpty ? 0 : null;
          });
        case AsyncError(:final error):
          showModuleSnack(context, errorText(error), error: true);
        default:
      }
    });
    if (widget.initialStudent != null) {
      _selectStudent(widget.initialStudent!);
    }
  }

  @override
  void dispose() {
    _mistakesCtrl.dispose();
    super.dispose();
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
      _eligibleJuz = const [];
      _selectedJuzIndex = null;
    });
    ref.invalidate(_studentDataProvider);
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
    if (_eligibleJuz.isEmpty || _selectedJuzIndex == null) {
      showModuleSnack(context, L10nGateway.current.noPartAvailableForTest,
          error: true);
      return;
    }

    final mistakesText = _mistakesCtrl.text.trim();
    if (mistakesText.isEmpty) {
      showModuleSnack(context, L10nGateway.current.enterMistakeCount,
          error: true);
      return;
    }
    final mistakes = int.tryParse(mistakesText);
    if (mistakes == null || mistakes < 0 || mistakes > 999) {
      showModuleSnack(context, L10nGateway.current.mistakeCountRange,
          error: true);
      return;
    }

    final juz = _eligibleJuz[_selectedJuzIndex!];
    final teacherId = widget.token.teacherId;

    setState(() => _saving = true);
    try {
      // 1. Fetch in-progress partial cycles for this enrollment/student
      final cycles = await ref
          .read(quranTestsActionsControllerProvider.notifier)
          .query((r) => r.partialCycles(
                studentId: _student!.id,
                status: 'in_progress',
              ));

      QuranPartialCycle? targetCycle;
      for (final c in cycles.items) {
        if (c.juz?.id == juz.id || c.juz?.juzNumber == juz.juzNumber) {
          targetCycle = c;
          break;
        }
      }

      // If no in-progress cycle for this Juz, start a new one
      targetCycle ??= await ref
          .read(quranTestsActionsControllerProvider.notifier)
          .query<QuranPartialCycle>((r) => r.startPartial(
                _enrollment!.id,
                juzId: juz.id,
                allowParallelCycle: true,
              ));

      // 2. Fetch full cycle details to get its parts
      final cycle = targetCycle;
      final fullCycle = await ref
          .read(quranTestsActionsControllerProvider.notifier)
          .query((r) => r.partialCycle(cycle.id));
      QuranPartialPart? targetPart;
      for (final p in fullCycle.parts) {
        if (p.partNumber == _selectedQuarter) {
          targetPart = p;
          break;
        }
      }

      targetPart ??= fullCycle.parts.isNotEmpty ? fullCycle.parts.first : null;
      if (targetPart == null) {
        throw Exception(L10nGateway.current.quarterNotFoundInCourse);
      }

      // 3. Record attempt
      final part = targetPart;
      await ref
          .read(quranTestsActionsControllerProvider.notifier)
          .query((r) => r.recordPartialAttempt(
                fullCycle.id,
                part.id,
                mistakeCount: mistakes,
                testedOn: isoDate(DateTime.now()),
                teacherId: teacherId,
              ));

      if (!mounted) return;
      setState(() {
        _saving = false;
        _mistakesCtrl.clear();
      });

      showModuleSnack(
        context,
        L10nGateway.current.quarterTestRecorded(_selectedQuarter),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      showModuleSnack(context, errorText(e), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canRecordPartialTests(widget.token) &&
        !ModuleAccess.canRecordAwqafTests(widget.token)) {
      return ModuleScaffold(
        title: L10nGateway.current.testEntry,
        body: const ModuleAccessDenied(),
      );
    }

    final hasEligibleJuz = _eligibleJuz.isNotEmpty && _selectedJuzIndex != null;
    final juzText = hasEligibleJuz
        ? context.l10n.juz(_eligibleJuz[_selectedJuzIndex!].juzNumber)
        : context.l10n.noPartAvailableForTest;

    return ModuleScaffold(
      title: context.l10n.testEntry,
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 500;

                    final studentField = Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            L10nGateway.current.student,
                            style: appTextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontWeight.w700,
                              color: context.appColors.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
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
                              border:
                                  Border.all(color: context.appColors.border),
                            ),
                            child: Row(
                              children: [
                                if (_student != null)
                                  InkWell(
                                    onTap: () => setState(() {
                                      _student = null;
                                      _enrollment = null;
                                      _eligibleJuz = const [];
                                      _selectedJuzIndex = null;
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
                                    _student?.label ??
                                        L10nGateway.current.studentNameLabel,
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
                      ],
                    );

                    final juzField = Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            L10nGateway.current.juz3,
                            style: appTextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontWeight.w700,
                              color: context.appColors.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: context.appColors.field,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: context.appColors.border),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (hasEligibleJuz && _eligibleJuz.length > 1)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        moduleChevronBack(context),
                                        size: 20,
                                        color: context.appColors.textSecondary,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _selectedJuzIndex =
                                              (_selectedJuzIndex! > 0)
                                                  ? _selectedJuzIndex! - 1
                                                  : _eligibleJuz.length - 1;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        moduleChevronForward(context),
                                        size: 20,
                                        color: context.appColors.textSecondary,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _selectedJuzIndex =
                                              (_selectedJuzIndex! <
                                                      _eligibleJuz.length - 1)
                                                  ? _selectedJuzIndex! + 1
                                                  : 0;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              else
                                const SizedBox.shrink(),
                              Expanded(
                                child: Text(
                                  _loadingData
                                      ? L10nGateway.current.loadingEllipsis
                                      : juzText,
                                  textAlign: TextAlign.start,
                                  style: appTextStyle(
                                    fontSize: FontSize.label,
                                    fontWeight: hasEligibleJuz
                                        ? FontWeight.w800
                                        : FontWeight.w500,
                                    color: hasEligibleJuz
                                        ? context.appColors.textPrimary
                                        : context.appColors.textMuted,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );

                    final quartersField = Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            L10nGateway.current.availableQuarters,
                            style: appTextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontWeight.w700,
                              color: context.appColors.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            for (int q = 1; q <= 4; q++) ...[
                              Expanded(
                                child: _QuarterButton(
                                  quarter: q,
                                  isSelected: _selectedQuarter == q,
                                  onTap: () =>
                                      setState(() => _selectedQuarter = q),
                                ),
                              ),
                              if (q < 4) const SizedBox(width: 8),
                            ],
                          ],
                        ),
                      ],
                    );

                    final mistakesField = Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            L10nGateway.current.mistakeCount,
                            style: appTextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontWeight.w700,
                              color: context.appColors.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: context.appColors.field,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: context.appColors.border),
                          ),
                          child: TextField(
                            controller: _mistakesCtrl,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            style: appTextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontWeight.w700,
                              color: context.appColors.textPrimary,
                            ),
                            decoration: InputDecoration(
                              hintText: L10nGateway.current.mistakes,
                              hintStyle: appTextStyle(
                                fontSize: FontSize.label,
                                color: context.appColors.textMuted,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: false,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );

                    if (isWide) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: juzField),
                              const SizedBox(width: 16),
                              Expanded(child: studentField),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: mistakesField),
                              const SizedBox(width: 16),
                              Expanded(child: quartersField),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          studentField,
                          const SizedBox(height: 16),
                          juzField,
                          const SizedBox(height: 16),
                          quartersField,
                          const SizedBox(height: 16),
                          mistakesField,
                        ],
                      );
                    }
                  },
                ),

                const SizedBox(height: 24),

                // Bottom Right Floppy Disk Save Button
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: InkWell(
                    onTap: _saving ? null : _save,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 48,
                      height: 48,
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
                                width: 22,
                                height: 22,
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
          ),
        ],
      ),
    );
  }
}

/// زر الربع (الربع 1، الربع 2، الربع 3، الربع 4) مطابق للصورة.
class _QuarterButton extends StatelessWidget {
  final int quarter;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuarterButton({
    required this.quarter,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 52,
        decoration: BoxDecoration(
          color: isSelected
              ? context.appColors.primary.withValues(alpha: 0.14)
              : context.appColors.field,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? context.appColors.primary
                : context.appColors.border,
            width: isSelected ? 2.0 : 1.2,
          ),
        ),
        child: Center(
          child: Text(
            context.l10n.quarterN(quarter),
            style: appTextStyle(
              fontSize: FontSize.label,
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
