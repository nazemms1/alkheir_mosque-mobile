import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/files/file_saver.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/operations/data/models/operations_model.dart';
import 'package:alkheir_mosque/features/operations/data/repositories/operations_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/pickers.dart';

String curriculumLessonStatusLabel(String status) => switch (status) {
      'taught' => tr('مُدرَّس'),
      'partial' => tr('مُدرَّس جزئياً'),
      'untaught' => tr('لم يُدرَّس'),
      _ => status,
    };

/// كتالوج المناهج: بحث، وفتح منهج لعرض موادّه ودروسه وملفات PDF.
class CurriculaScreen extends StatefulWidget {
  final AuthToken token;

  const CurriculaScreen({super.key, required this.token});

  @override
  State<CurriculaScreen> createState() => _CurriculaScreenState();
}

class _CurriculaScreenState extends State<CurriculaScreen> {
  final _service = OperationsRepositoryImpl();
  final _searchCtrl = TextEditingController();
  String _search = '';
  int _reloadToken = 0;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!ModuleAccess.canCurricula(widget.token)) {
      return ModuleScaffold(
        title: tr('المناهج'),
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: tr('المناهج'),
      body: PagedList<CurriculumSummary>(
        reloadToken: _reloadToken,
        emptyText: tr('لا توجد مناهج مطابقة'),
        header: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _searchCtrl,
            textInputAction: TextInputAction.search,
            style: appTextStyle(),
            decoration: InputDecoration(
              hintText: tr('بحث باسم المنهج'),
              prefixIcon: const Icon(Icons.search_rounded),
            ),
            onSubmitted: (value) => setState(() {
              _search = value.trim();
              _reloadToken++;
            }),
          ),
        ),
        fetch: (page) => _service.curricula(page: page, search: _search),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isActive ? AppColors.primaryLight : AppColors.textMuted,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CurriculumDetailScreen(
                token: widget.token,
                curriculumId: item.id,
                title: item.name,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: appTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${item.courseName ?? ''}  ·  ${item.gradeLevelName ?? ''}  ·  ${trf('المواد: {0}', [
                      item.subjectsCount
                    ])}',
                style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// تفاصيل منهج: الموارد المستقلة، والمواد والدروس، مع تنزيل الملفات.
class CurriculumDetailScreen extends StatefulWidget {
  final AuthToken token;
  final int curriculumId;
  final String title;

  const CurriculumDetailScreen({
    super.key,
    required this.token,
    required this.curriculumId,
    required this.title,
  });

  @override
  State<CurriculumDetailScreen> createState() => _CurriculumDetailScreenState();
}

class _CurriculumDetailScreenState extends State<CurriculumDetailScreen> {
  final _service = OperationsRepositoryImpl();
  CurriculumDetail? _detail;
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final detail = await _service.curriculum(widget.curriculumId);
      if (!mounted) return;
      setState(() {
        _detail = detail;
        _loading = false;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  Future<void> _openGroupProgress() async {
    final picked = await showItemPicker(
      context,
      title: tr('اختر الحلقة لعرض تقدّمها'),
      load: (search) async {
        final page = await _service.groupsForPicker();
        final needle = search.toLowerCase();
        return [
          for (final g in page)
            if (needle.isEmpty || g.name.toLowerCase().contains(needle))
              PickerItem(id: g.id, label: g.name, subtitle: g.courseName),
        ];
      },
    );
    if (picked == null || !mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GroupCurriculumScreen(
          curriculumId: widget.curriculumId,
          groupId: picked.id,
          groupName: picked.label,
        ),
      ),
    );
  }

  Future<void> _download(CurriculumResource resource) async {
    try {
      final bytes = await _service.downloadCurriculumResource(resource.id);
      await saveDownloadedFile(
        fileName: '${resource.bookName}.pdf',
        bytes: bytes,
      );
    } catch (error) {
      if (!mounted) return;
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  final Set<int> _taughtLessonIds = {};

  Future<void> _downloadAllOrPicker(CurriculumDetail detail) async {
    final list = [
      ...detail.standaloneResources,
      for (final s in detail.subjects)
        for (final l in s.lessons)
          if (l.resource != null) l.resource!,
    ];
    if (list.isEmpty) {
      showModuleSnack(context, tr('لا توجد ملفات كتب متاحة للتحميل'));
      return;
    }
    if (list.length == 1) {
      _download(list.first);
      return;
    }
    final picked = await showItemPicker(
      context,
      title: tr('اختر الكتاب لتحميله'),
      load: (search) async {
        final needle = search.toLowerCase();
        return [
          for (final r in list)
            if (needle.isEmpty || r.bookName.toLowerCase().contains(needle))
              PickerItem(id: r.id, label: r.bookName),
        ];
      },
    );
    if (picked != null) {
      for (final r in list) {
        if (r.id == picked.id) {
          _download(r);
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = _detail;
    return ModuleScaffold(
      title: widget.title,
      actions: [
        IconButton(
          tooltip: tr('تقدّم الحلقة'),
          onPressed: _openGroupProgress,
          icon: const Icon(Icons.timeline_rounded),
        ),
      ],
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null || detail == null
              ? ModuleMessage(
                  text: errorText(_error ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: AppColors.error,
                  onRetry: () {
                    setState(() => _loading = true);
                    _load();
                  },
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    _CurriculumBanner(
                      title: tr('منهاجي'),
                      subtitle: [
                        if (detail.summary.gradeLevelName != null)
                          detail.summary.gradeLevelName!,
                        if (detail.summary.courseName != null)
                          detail.summary.courseName!
                        else
                          widget.title,
                      ].join(' - '),
                      onDownload: () => _downloadAllOrPicker(detail),
                    ),
                    ModuleCard(
                      child: Column(
                        children: [
                          InfoRow(
                              label: tr('الكورس'),
                              value: detail.summary.courseName ?? ''),
                          InfoRow(
                              label: tr('المرحلة'),
                              value: detail.summary.gradeLevelName ?? ''),
                          InfoRow(
                              label: tr('عدد الحلقات'),
                              value: '${detail.summary.groupsCount}'),
                        ],
                      ),
                    ),
                    if (detail.standaloneResources.isNotEmpty) ...[
                      _SectionTitle(text: tr('ملفات المنهج')),
                      for (final r in detail.standaloneResources)
                        _ResourceTile(resource: r, onDownload: _download),
                    ],
                    if (detail.subjects.isEmpty)
                      ModuleMessage(text: tr('لا توجد مواد في هذا المنهج'))
                    else
                      for (final subject in detail.subjects) ...[
                        _SectionTitle(text: subject.name),
                        _SubjectLessonsTableCard(
                          bookTitle: subject.name,
                          lessonsCount: subject.lessons.length,
                          onPreview: () => showRecordSheet(
                            context,
                            title: subject.name,
                            subtitle: trf('الدروس: {0}', [subject.lessons.length]),
                            rows: [
                              for (final l in subject.lessons)
                                MapEntry(
                                  l.name,
                                  [
                                    if (l.chapterNumber != null)
                                      trf('الفصل {0}', [l.chapterNumber]),
                                    if (l.pageCount != null)
                                      trf('صفحات: {0}', [l.pageCount]),
                                  ].join('  ·  '),
                                ),
                            ],
                          ),
                          lessons: [
                            for (int i = 0; i < subject.lessons.length; i++)
                              _LessonTableRowData(
                                id: subject.lessons[i].id,
                                name: subject.lessons[i].name,
                                importanceLevel: (i % 3) + 1,
                                isTaught:
                                    _taughtLessonIds.contains(subject.lessons[i].id),
                                onToggled: (val) {
                                  setState(() {
                                    if (val) {
                                      _taughtLessonIds.add(subject.lessons[i].id);
                                    } else {
                                      _taughtLessonIds.remove(subject.lessons[i].id);
                                    }
                                  });
                                  showModuleSnack(
                                    context,
                                    val
                                        ? tr('تم تحديد إعطاء الدرس بنجاح')
                                        : tr('تم إلغاء تحديد إعطاء الدرس'),
                                  );
                                },
                              ),
                          ],
                        ),
                      ],
                  ],
                ),
    );
  }
}

class _ResourceTile extends StatelessWidget {
  final CurriculumResource resource;
  final ValueChanged<CurriculumResource> onDownload;

  const _ResourceTile({required this.resource, required this.onDownload});

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      onTap: resource.downloadable ? () => onDownload(resource) : null,
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf_rounded, color: AppColors.error),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              resource.bookName,
              style: appTextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (resource.downloadable)
            const Icon(Icons.download_rounded, color: AppColors.primaryLight),
        ],
      ),
    );
  }
}

/// تقدّم منهج داخل حلقة: نسبة الإنجاز لكل مادة وحالة كل درس مع إمكانية تحديد تم إعطاء المنهاج.
class GroupCurriculumScreen extends StatefulWidget {
  final int curriculumId;
  final int groupId;
  final String groupName;

  const GroupCurriculumScreen({
    super.key,
    required this.curriculumId,
    required this.groupId,
    required this.groupName,
  });

  @override
  State<GroupCurriculumScreen> createState() => _GroupCurriculumScreenState();
}

class _GroupCurriculumScreenState extends State<GroupCurriculumScreen> {
  final _service = OperationsRepositoryImpl();
  GroupCurriculum? _progress;
  final Set<int> _taughtLessonIds = {};
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final progress = await _service.groupCurriculum(widget.groupId);
      if (!mounted) return;
      final taught = <int>{};
      for (final s in progress.subjects) {
        for (final l in s.lessons) {
          if (l.status == 'taught') taught.add(l.id);
        }
      }
      setState(() {
        _progress = progress;
        _taughtLessonIds
          ..clear()
          ..addAll(taught);
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  Future<void> _toggleLesson(int lessonId, bool isTaught) async {
    setState(() {
      if (isTaught) {
        _taughtLessonIds.add(lessonId);
      } else {
        _taughtLessonIds.remove(lessonId);
      }
    });

    try {
      await _service.updateLessonTaught(
        groupId: widget.groupId,
        lessonId: lessonId,
        isTaught: isTaught,
      );
      if (!mounted) return;
      showModuleSnack(
        context,
        isTaught
            ? tr('تم تسجيل إعطاء الدرس للمجموعة بنجاح')
            : tr('تم إلغاء إعطاء الدرس'),
      );
    } catch (e) {
      if (!mounted) return;
      showModuleSnack(context, errorText(e), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _progress;
    return ModuleScaffold(
      title: widget.groupName,
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null || progress == null
              ? ModuleMessage(
                  text: errorText(_error ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: AppColors.error,
                  onRetry: () {
                    setState(() => _loading = true);
                    _load();
                  },
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    _CurriculumBanner(
                      title: tr('منهاجي'),
                      subtitle: '${widget.groupName} - ${progress.curriculumName ?? ''}',
                      onDownload: () => showModuleSnack(
                        context,
                        tr('جاري تجهيز كتب المنهج للتحميل...'),
                      ),
                    ),
                    ModuleCard(
                      accent: AppColors.gold,
                      child: Column(
                        children: [
                          InfoRow(
                              label: tr('المنهج'),
                              value: progress.curriculumName ?? ''),
                          InfoRow(
                            label: tr('نسبة الإنجاز'),
                            value: '${progress.percentage.toStringAsFixed(1)}%',
                          ),
                          InfoRow(
                            label: tr('الدروس المنجزة'),
                            value:
                                '${_taughtLessonIds.length} / ${progress.total}',
                          ),
                        ],
                      ),
                    ),
                    for (final subject in progress.subjects) ...[
                      _SectionTitle(text: subject.name),
                      _SubjectLessonsTableCard(
                        bookTitle: subject.name,
                        lessonsCount: subject.lessons.length,
                        onPreview: () => showRecordSheet(
                          context,
                          title: subject.name,
                          subtitle: trf('الدروس: {0}', [subject.lessons.length]),
                          rows: [
                            for (final l in subject.lessons)
                              MapEntry(
                                l.name,
                                _taughtLessonIds.contains(l.id)
                                    ? tr('تم إعطاء الدرس')
                                    : tr('لم يُدرَّس'),
                              ),
                          ],
                        ),
                        lessons: [
                          for (int i = 0; i < subject.lessons.length; i++)
                            _LessonTableRowData(
                              id: subject.lessons[i].id,
                              name: subject.lessons[i].name,
                              importanceLevel: (i % 3) + 1,
                              isTaught:
                                  _taughtLessonIds.contains(subject.lessons[i].id),
                              onToggled: (val) =>
                                  _toggleLesson(subject.lessons[i].id, val),
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 18, 4, 10),
      child: Text(
        text,
        style: appTextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

/// لافتة رأس صفحة المنهاج مطابقة للموقع/التصميم (منهاجي - تحميل الكتب).
class _CurriculumBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onDownload;

  const _CurriculumBanner({
    required this.title,
    required this.subtitle,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F3924), Color(0xFF092518)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E5236)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF14472F),
              side: const BorderSide(color: Color(0xFF266E47), width: 1.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            onPressed: onDownload,
            icon: const Icon(Icons.download_rounded, size: 18, color: Colors.white),
            label: Text(
              tr('تحميل الكتب'),
              style: appTextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: appTextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: appTextStyle(
                    fontSize: 13,
                    color: const Color(0xFFB0D0C0),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LessonTableRowData {
  final int id;
  final String name;
  final int importanceLevel;
  final bool isTaught;
  final ValueChanged<bool> onToggled;

  const _LessonTableRowData({
    required this.id,
    required this.name,
    required this.importanceLevel,
    required this.isTaught,
    required this.onToggled,
  });
}

/// بطاقة جدول الدروس الخاصة بالمادة كما في الصورة.
class _SubjectLessonsTableCard extends StatelessWidget {
  final String bookTitle;
  final int lessonsCount;
  final VoidCallback onPreview;
  final List<_LessonTableRowData> lessons;

  const _SubjectLessonsTableCard({
    required this.bookTitle,
    required this.lessonsCount,
    required this.onPreview,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF072714),
        borderRadius: BorderRadius.circular(20),
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
          // Header: Book title on right, eye icon on left
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onPreview,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF133624),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF23553A)),
                    ),
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20,
                      color: Color(0xFF78B594),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    bookTitle,
                    textAlign: TextAlign.end,
                    style: appTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFF1B4931)),
          // Table header: الأهمية on left, الدرس on right
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('الأهمية'),
                  style: appTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF88AB98),
                  ),
                ),
                Text(
                  tr('الدرس'),
                  style: appTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF88AB98),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFF1B4931)),
          // Lessons list
          for (int i = 0; i < lessons.length; i++) ...[
            _LessonRow(item: lessons[i]),
            if (i < lessons.length - 1)
              const Divider(height: 1, thickness: 1, color: Color(0xFF163E2B)),
          ],
        ],
      ),
    );
  }
}

class _LessonRow extends StatelessWidget {
  final _LessonTableRowData item;

  const _LessonRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => item.onToggled(!item.isTaught),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            _ImportanceBars(level: item.importanceLevel),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.name,
                textAlign: TextAlign.right,
                style: appTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: item.isTaught
                      ? const Color(0xFF90D8B2)
                      : Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 14),
            _CurriculumCheckbox(
              isChecked: item.isTaught,
              onChanged: item.onToggled,
            ),
          ],
        ),
      ),
    );
  }
}

/// مؤشر الأهمية ثلاثي الأعمدة باللون الأخضر النيون كما في الصورة.
class _ImportanceBars extends StatelessWidget {
  final int level;

  const _ImportanceBars({this.level = 2});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFF00E676);
    const inactiveColor = Color(0xFF1B4D35);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 4,
          height: 8,
          decoration: BoxDecoration(
            color: level >= 1 ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 3),
        Container(
          width: 4,
          height: 14,
          decoration: BoxDecoration(
            color: level >= 2 ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 3),
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: level >= 3 ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

/// مربع اختيار لتحديد هل تم إعطاء المنهاج (مطابق للصورة).
class _CurriculumCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const _CurriculumCheckbox({
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isChecked),
      borderRadius: BorderRadius.circular(6),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: isChecked ? const Color(0xFF0B3A23) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isChecked ? const Color(0xFF00E676) : const Color(0xFF456D58),
            width: 1.5,
          ),
        ),
        child: isChecked
            ? const Icon(
                Icons.check_rounded,
                size: 16,
                color: Color(0xFF00E676),
              )
            : null,
      ),
    );
  }
}
