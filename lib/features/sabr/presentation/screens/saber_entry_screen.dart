import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';
import 'package:alkheir_mosque/features/quran_tests/data/models/quran_test_model.dart';
import 'package:alkheir_mosque/features/quran_tests/data/repositories/quran_tests_repository_impl.dart';

/// شاشة إدخال سبر مطابقة تماماً للموقع والتصميم المطلوب.
class SaberEntryScreen extends StatefulWidget {
  final AuthToken token;
  final PickerItem? initialStudent;

  const SaberEntryScreen({
    super.key,
    required this.token,
    this.initialStudent,
  });

  @override
  State<SaberEntryScreen> createState() => _SaberEntryScreenState();
}

class _SaberEntryScreenState extends State<SaberEntryScreen> {
  final _service = QuranTestsRepositoryImpl();
  final _mistakesCtrl = TextEditingController();

  PickerItem? _student;
  PickerItem? _enrollment;
  List<QuranJuz> _eligibleJuz = const [];
  int? _selectedJuzIndex;
  int _selectedQuarter = 1; // 1, 2, 3, or 4
  bool _loadingData = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
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
    final page = await ManagementRepositoryImpl().students(search: search);
    return [
      for (final s in page.items)
        PickerItem(id: s.id, label: s.fullName, subtitle: s.studentNumber),
    ];
  }

  Future<void> _selectStudent(PickerItem student) async {
    setState(() {
      _student = student;
      _enrollment = null;
      _eligibleJuz = const [];
      _selectedJuzIndex = null;
      _loadingData = true;
    });

    try {
      final enrollments = await studentActiveEnrollmentItems(student.id);
      if (enrollments.isEmpty) {
        if (!mounted) return;
        setState(() => _loadingData = false);
        showModuleSnack(context, tr('لا يوجد تسجيل نشط لهذا الطالب'),
            error: true);
        return;
      }

      final activeEnrollment = enrollments.first;
      final eligible = await _service.partialEligibleJuz(activeEnrollment.id);

      if (!mounted) return;
      setState(() {
        _enrollment = activeEnrollment;
        _eligibleJuz = eligible;
        _selectedJuzIndex = eligible.isNotEmpty ? 0 : null;
        _loadingData = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loadingData = false);
      showModuleSnack(context, errorText(e), error: true);
    }
  }

  Future<void> _save() async {
    if (_student == null) {
      showModuleSnack(context, tr('اختر الطالب أولاً'), error: true);
      return;
    }
    if (_enrollment == null) {
      showModuleSnack(context, tr('لا يوجد تسجيل نشط لهذا الطالب'),
          error: true);
      return;
    }
    if (_eligibleJuz.isEmpty || _selectedJuzIndex == null) {
      showModuleSnack(context, tr('لا يوجد جزء متاح للسبر حالياً.'),
          error: true);
      return;
    }

    final mistakesText = _mistakesCtrl.text.trim();
    if (mistakesText.isEmpty) {
      showModuleSnack(context, tr('أدخل عدد الأخطاء'), error: true);
      return;
    }
    final mistakes = int.tryParse(mistakesText);
    if (mistakes == null || mistakes < 0 || mistakes > 999) {
      showModuleSnack(context, tr('أدخل عدد أخطاء صحيح بين 0 و 999'),
          error: true);
      return;
    }

    final juz = _eligibleJuz[_selectedJuzIndex!];
    final teacherId = widget.token.teacherId;

    setState(() => _saving = true);
    try {
      // 1. Fetch in-progress partial cycles for this enrollment/student
      final cycles = await _service.partialCycles(
        studentId: _student!.id,
        status: 'in_progress',
      );

      QuranPartialCycle? targetCycle;
      for (final c in cycles.items) {
        if (c.juz?.id == juz.id || c.juz?.juzNumber == juz.juzNumber) {
          targetCycle = c;
          break;
        }
      }

      // If no in-progress cycle for this Juz, start a new one
      targetCycle ??= await _service.startPartial(
        _enrollment!.id,
        juzId: juz.id,
        allowParallelCycle: true,
      );

      // 2. Fetch full cycle details to get its parts
      final fullCycle = await _service.partialCycle(targetCycle.id);
      QuranPartialPart? targetPart;
      for (final p in fullCycle.parts) {
        if (p.partNumber == _selectedQuarter) {
          targetPart = p;
          break;
        }
      }

      targetPart ??= fullCycle.parts.isNotEmpty ? fullCycle.parts.first : null;
      if (targetPart == null) {
        throw Exception(tr('تعذر العثور على الربع المحدد في الدورة'));
      }

      // 3. Record attempt
      await _service.recordPartialAttempt(
        fullCycle.id,
        targetPart.id,
        mistakeCount: mistakes,
        testedOn: isoDate(DateTime.now()),
        teacherId: teacherId,
      );

      if (!mounted) return;
      setState(() {
        _saving = false;
        _mistakesCtrl.clear();
      });

      showModuleSnack(
        context,
        trf('تم تسجيل سبر الربع {0} بنجاح', [_selectedQuarter]),
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
        title: tr('إدخال سبر'),
        body: const ModuleAccessDenied(),
      );
    }

    final hasEligibleJuz = _eligibleJuz.isNotEmpty && _selectedJuzIndex != null;
    final juzText = hasEligibleJuz
        ? trf('الجزء {0}', [_eligibleJuz[_selectedJuzIndex!].juzNumber])
        : tr('لا يوجد جزء متاح للسبر حالياً.');

    return ModuleScaffold(
      title: tr('إدخال سبر'),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          // Main Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF072714),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF1B4931)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
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
                          alignment: Alignment.centerRight,
                          child: Text(
                            tr('الطالب'),
                            style: appTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFB5D7C3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () async {
                            final picked = await showItemPicker(
                              context,
                              title: tr('اختر الطالب'),
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
                              color: const Color(0xB30F0C09),
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0x33445544)),
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
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: 18,
                                        color: Color(0xFF88AB98),
                                      ),
                                    ),
                                  )
                                else
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Color(0xFF88AB98),
                                  ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _student?.label ?? tr('اسم الطالب'),
                                    textAlign: TextAlign.right,
                                    style: appTextStyle(
                                      fontSize: 14,
                                      fontWeight: _student != null
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                      color: _student != null
                                          ? Colors.white
                                          : const Color(0xFF759785),
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
                          alignment: Alignment.centerRight,
                          child: Text(
                            tr('الجزء'),
                            style: appTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFB5D7C3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xB30F0C09),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0x33445544)),
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
                                        color: Colors.white70,
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
                                        color: Colors.white70,
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
                                      ? tr('جاري التحميل...')
                                      : juzText,
                                  textAlign: TextAlign.right,
                                  style: appTextStyle(
                                    fontSize: 13,
                                    fontWeight: hasEligibleJuz
                                        ? FontWeight.w800
                                        : FontWeight.w500,
                                    color: hasEligibleJuz
                                        ? Colors.white
                                        : const Color(0xFF759785),
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
                          alignment: Alignment.centerRight,
                          child: Text(
                            tr('الأرباع المتاحة'),
                            style: appTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFB5D7C3),
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
                          alignment: Alignment.centerRight,
                          child: Text(
                            tr('عدد الأخطاء'),
                            style: appTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFB5D7C3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xB30F0C09),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0x33445544)),
                          ),
                          child: TextField(
                            controller: _mistakesCtrl,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right,
                            style: appTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: tr('أخطاء'),
                              hintStyle: appTextStyle(
                                fontSize: 13,
                                color: const Color(0xFF759785),
                              ),
                              border: InputBorder.none,
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
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: _saving ? null : _save,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF14472F),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF266E47),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: _saving
                          ? const Center(
                              child: SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const Icon(
                              Icons.save_rounded,
                              color: Colors.white,
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
          color: isSelected ? const Color(0xFF185537) : const Color(0xB30F0C09),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF00E676) : const Color(0xFF1B4E34),
            width: isSelected ? 2.0 : 1.2,
          ),
        ),
        child: Center(
          child: Text(
            trf('الربع {0}', [quarter]),
            style: appTextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: isSelected ? const Color(0xFF00E676) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
