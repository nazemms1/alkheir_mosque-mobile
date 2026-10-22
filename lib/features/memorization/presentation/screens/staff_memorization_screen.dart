import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/operations/data/models/operations_model.dart';
import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';
import 'package:alkheir_mosque/features/sabr/presentation/screens/saber_entry_screen.dart';

String memorizationTypeLabel(String type) => switch (type) {
      'new' => tr('حفظ جديد'),
      'review' => tr('مراجعة'),
      'correction' => tr('تصحيح'),
      _ => type,
    };

/// سجل الحفظ للطاقم: تصفية بالنوع، وتسجيل حفظ جديد أو مراجعة لطالب.
class StaffMemorizationScreen extends StatefulWidget {
  final AuthToken token;

  const StaffMemorizationScreen({super.key, required this.token});

  @override
  State<StaffMemorizationScreen> createState() =>
      _StaffMemorizationScreenState();
}

class _StaffMemorizationScreenState extends State<StaffMemorizationScreen> {
  final _service = OperationsRepositoryImpl();
  String? _type;
  int _reloadToken = 0;

  Future<void> _record() async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => RecordMemorizationScreen(token: widget.token),
      ),
    );
    if (saved == true) setState(() => _reloadToken++);
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewMemorization(t)) {
      return ModuleScaffold(
        title: tr('الحفظ'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('الحفظ'),
      actions: [
        if (ModuleAccess.canRecordPartialTests(t) ||
            ModuleAccess.canViewQuranTests(t))
          IconButton(
            tooltip: tr('إدخال سبر'),
            icon: const Icon(Icons.playlist_add_check_circle_rounded),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SaberEntryScreen(token: widget.token),
              ),
            ),
          ),
      ],
      floatingActionButton: ModuleAccess.canRecordMemorization(t)
          ? FloatingActionButton.extended(
              onPressed: _record,
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.edit_note_rounded, color: Colors.white),
              label: Text(
                tr('تسجيل حفظ'),
                style: appTextStyle(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          : null,
      body: PagedList<MemorizationEntry>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد سجلات حفظ'),
        header: _TypeFilter(
          selected: _type,
          onSelected: (value) => setState(() {
            _type = value;
            _reloadToken++;
          }),
        ),
        fetch: (page) => _service.memorization(page: page, entryType: _type),
        itemBuilder: (context, entry, _) => ModuleCard(
          accent: entry.entryType == 'review'
              ? AppColors.info
              : AppColors.primaryLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.student?.name ?? '—',
                      style: appTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StatusPill(
                    label: memorizationTypeLabel(entry.entryType),
                    color: entry.entryType == 'review'
                        ? AppColors.info
                        : AppColors.primaryLight,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                trf('من الصفحة {0} إلى {1}  ·  {2} صفحة', [
                  entry.fromPage,
                  entry.toPage,
                  entry.pagesCount,
                ]),
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
              ),
              Text(
                '${entry.groupName ?? ''}  ·  ${entry.recordedOn}  ·  ${entry.teacher?.name ?? ''}',
                style: appTextStyle(fontSize: 11, color: moduleMuted(context)),
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
      null: tr('الكل'),
      'new': tr('حفظ جديد'),
      'review': tr('مراجعة'),
      'correction': tr('تصحيح'),
    };
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
        children: [
          for (final entry in options.entries)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ChoiceChip(
                label: Text(entry.value, style: appTextStyle(fontSize: 12)),
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
class RecordMemorizationScreen extends StatefulWidget {
  final AuthToken token;

  const RecordMemorizationScreen({super.key, required this.token});

  @override
  State<RecordMemorizationScreen> createState() =>
      _RecordMemorizationScreenState();
}

class _RecordMemorizationScreenState extends State<RecordMemorizationScreen> {
  final _operations = OperationsRepositoryImpl();
  PickerItem? _student;
  PickerItem? _enrollment;
  int _selectedJuz = 28; // Default to Juz 28 or current Juz
  int? _selectedPage;
  bool _loadingStudentData = false;
  bool _saving = false;
  final Set<int> _recitedPages = {};

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
      _selectedPage = null;
      _loadingStudentData = true;
      _recitedPages.clear();
    });

    try {
      final enrollments = await studentActiveEnrollmentItems(student.id);
      final memEntries = await _operations.memorization(
        studentId: student.id,
        page: 1,
      );

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

      if (!mounted) return;
      setState(() {
        _enrollment = enrollments.isNotEmpty ? enrollments.first : null;
        _recitedPages.addAll(heard);
        _selectedJuz = candidateJuz;
        _loadingStudentData = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingStudentData = false);
    }
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
      showModuleSnack(context, tr('اختر الطالب أولاً'), error: true);
      return;
    }
    if (_enrollment == null) {
      showModuleSnack(context, tr('لا يوجد تسجيل نشط لهذا الطالب'),
          error: true);
      return;
    }
    if (_selectedPage == null) {
      showModuleSnack(context, tr('اختر الصفحة المراد تسميعها'), error: true);
      return;
    }

    final pageToSave = _selectedPage!;
    final teacherId = _teacherIsSelf ? widget.token.teacherId : null;

    setState(() => _saving = true);
    try {
      await _operations.recordMemorization(
        _enrollment!.id,
        entryType: 'new',
        fromPage: pageToSave,
        toPage: pageToSave,
        recordedOn: isoDate(DateTime.now()),
        teacherId: teacherId,
      );

      if (!mounted) return;
      setState(() {
        _recitedPages.add(pageToSave);
        _selectedPage = null;
        _saving = false;
      });

      showModuleSnack(
        context,
        trf('تم تسجيل تسميع الصفحة {0} بنجاح', [pageToSave]),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      if (error is ApiException && error.hasDuplicatePages) {
        showModuleSnack(
          context,
          trf('صفحة مسمّعة مسبقاً: {0}', [error.duplicatePages!.join('، ')]),
          error: true,
        );
      } else {
        showModuleSnack(context, errorText(error), error: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final allowed = ModuleAccess.canRecordMemorization(widget.token);
    if (!allowed) {
      return ModuleScaffold(
        title: tr('تسجيل تسميع'),
        body: const ModuleAccessDenied(),
      );
    }

    final missingPages = _currentJuzMissingPages;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return ModuleScaffold(
      title: tr('تسجيل تسميع'),
      actions: [
        IconButton(
          tooltip: tr('إدخال سبر'),
          icon: const Icon(Icons.fact_check_outlined, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SaberEntryScreen(
                  token: widget.token,
                  initialStudent: _student,
                ),
              ),
            );
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
                // Label: الطالب
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

                // Student Selector Box
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
                      border: Border.all(color: const Color(0x33445544)),
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
                      color: const Color(0xB30F0C09),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0x33445544)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Juz Selector Header with arrows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.chevron_left_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: isRtl ? _nextJuz : _prevJuz,
                              tooltip: isRtl
                                  ? tr('الجزء التالي')
                                  : tr('الجزء السابق'),
                            ),
                            Text(
                              trf('الجزء {0}', [_selectedJuz]),
                              style: appTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: isRtl ? _prevJuz : _nextJuz,
                              tooltip: isRtl
                                  ? tr('الجزء السابق')
                                  : tr('الجزء التالي'),
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
                                tr('تم تسميع جميع صفحات هذا الجزء'),
                                style: appTextStyle(
                                  fontSize: 13,
                                  color: const Color(0xFF88AB98),
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
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: _saving ? null : _save,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color(0xFF14472F),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFF266E47),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: _saving
                                  ? const Center(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
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
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        tr('يرجى اختيار طالب لعرض الأجزاء والصفحات للتسميع'),
                        style: appTextStyle(
                          fontSize: 13,
                          color: const Color(0xFF88AB98),
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
          color: isSelected ? const Color(0xFF185537) : const Color(0xB30F0C09),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF00E676) : const Color(0xFF1B4E34),
            width: isSelected ? 2.0 : 1.2,
          ),
        ),
        child: Center(
          child: Text(
            '$page',
            style: appTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: isSelected ? const Color(0xFF00E676) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
