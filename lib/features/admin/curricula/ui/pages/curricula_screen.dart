import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/shared/operations/ui/providers/operations_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/files/file_saver.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';

String curriculumLessonStatusLabel(String status) => switch (status) {
      'taught' => L10nGateway.current.taught,
      'partial' => L10nGateway.current.partlyTaught,
      'untaught' => L10nGateway.current.notTaught,
      _ => status,
    };

/// كتالوج المناهج: بحث، وفتح منهج لعرض موادّه ودروسه وملفات PDF.
class CurriculaScreen extends ConsumerStatefulWidget {
  final AuthToken token;

  const CurriculaScreen({super.key, required this.token});

  @override
  ConsumerState<CurriculaScreen> createState() => _CurriculaScreenState();
}

class _CurriculaScreenState extends ConsumerState<CurriculaScreen> {
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
        title: L10nGateway.current.curricula,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: context.l10n.curricula,
      body: PagedList<CurriculumSummary>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noMatchingCurricula,
        header: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _searchCtrl,
            textInputAction: TextInputAction.search,
            style: appTextStyle(),
            decoration: InputDecoration(
              hintText: context.l10n.searchByCurriculumName,
              prefixIcon: const Icon(Icons.search_rounded),
            ),
            onSubmitted: (value) => setState(() {
              _search = value.trim();
              _reloadToken++;
            }),
          ),
        ),
        fetch: (page) => ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.curricula(page: page, search: _search)),
        itemBuilder: (context, item, _) => ModuleCard(
          accent: item.isActive
              ? context.appColors.primaryLight
              : context.appColors.textMuted,
          onTap: () => context.push(AppRoutes.curriculumDetailRoute, extra: (
            token: widget.token,
            curriculumId: item.id,
            title: item.name
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: appTextStyle(
                  fontSize: FontSize.body,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${item.courseName ?? ''}  ·  ${item.gradeLevelName ?? ''}  ·  ${L10nGateway.current.subjects(item.subjectsCount)}',
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

/// تفاصيل منهج: الموارد المستقلة، والمواد والدروس، مع تنزيل الملفات.
class CurriculumDetailScreen extends ConsumerStatefulWidget {
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
  ConsumerState<CurriculumDetailScreen> createState() =>
      _CurriculumDetailScreenState();
}

class _CurriculumDetailScreenState
    extends ConsumerState<CurriculumDetailScreen> {
  late final _loadProvider = screenDataProvider(() async {
    final detail = await ref
        .read(operationsActionsControllerProvider.notifier)
        .query((r) => r.curriculum(widget.curriculumId));
    return detail;
  });
  CurriculumDetail? get _detail => ref.watch(_loadProvider).valueOrNull;
  bool get _loading => ref.watch(_loadProvider).isLoading;
  Object? get _error => ref.watch(_loadProvider).error;

  Future<void> _load() => reloadScreenData(ref, _loadProvider);

  Future<void> _openGroupProgress() async {
    final picked = await showItemPicker(
      context,
      title: L10nGateway.current.chooseAGroupToView,
      load: (search) async {
        final page = await ref
            .read(operationsActionsControllerProvider.notifier)
            .query((r) => r.groupsForPicker());
        final needle = search.toLowerCase();
        return [
          for (final g in page)
            if (needle.isEmpty || g.name.toLowerCase().contains(needle))
              PickerItem(id: g.id, label: g.name, subtitle: g.courseName),
        ];
      },
    );
    if (picked == null || !mounted) return;
    context.push(AppRoutes.groupCurriculumRoute, extra: (
      curriculumId: widget.curriculumId,
      groupId: picked.id,
      groupName: picked.label
    ));
  }

  Future<void> _download(CurriculumResource resource) async {
    final outcome2 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.downloadCurriculumResource(resource.id));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    final bytes = outcome2.value!;
    await saveDownloadedFile(
      fileName: '${resource.bookName}.pdf',
      bytes: bytes,
    );
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
      showModuleSnack(context, L10nGateway.current.noBookFilesToDownload);
      return;
    }
    if (list.length == 1) {
      _download(list.first);
      return;
    }
    final picked = await showItemPicker(
      context,
      title: L10nGateway.current.chooseBookToDownload,
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
          tooltip: context.l10n.groupProgress,
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
                  color: context.appColors.error,
                  onRetry: () {
                    _load();
                  },
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    _CurriculumBanner(
                      title: context.l10n.myCurriculum,
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
                              label: context.l10n.course,
                              value: detail.summary.courseName ?? ''),
                          InfoRow(
                              label: context.l10n.stage,
                              value: detail.summary.gradeLevelName ?? ''),
                          InfoRow(
                              label: context.l10n.numberOfGroups,
                              value: '${detail.summary.groupsCount}'),
                        ],
                      ),
                    ),
                    if (detail.standaloneResources.isNotEmpty) ...[
                      _SectionTitle(text: context.l10n.curriculumFiles),
                      for (final r in detail.standaloneResources)
                        _ResourceTile(resource: r, onDownload: _download),
                    ],
                    if (detail.subjects.isEmpty)
                      ModuleMessage(
                          text: context.l10n.noSubjectsInThisCurriculum)
                    else
                      for (final subject in detail.subjects) ...[
                        _SectionTitle(text: subject.name),
                        _SubjectLessonsTableCard(
                          bookTitle: subject.name,
                          lessonsCount: subject.lessons.length,
                          onPreview: () => showRecordSheet(
                            context,
                            title: subject.name,
                            subtitle: L10nGateway.current
                                .lessons(subject.lessons.length),
                            rows: [
                              for (final l in subject.lessons)
                                MapEntry(
                                  l.name,
                                  [
                                    if (l.chapterNumber != null)
                                      L10nGateway.current
                                          .chapter((l.chapterNumber ?? '')),
                                    if (l.pageCount != null)
                                      L10nGateway.current
                                          .pages((l.pageCount ?? '')),
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
                                isTaught: _taughtLessonIds
                                    .contains(subject.lessons[i].id),
                                onToggled: (val) {
                                  setState(() {
                                    if (val) {
                                      _taughtLessonIds
                                          .add(subject.lessons[i].id);
                                    } else {
                                      _taughtLessonIds
                                          .remove(subject.lessons[i].id);
                                    }
                                  });
                                  showModuleSnack(
                                    context,
                                    val
                                        ? L10nGateway.current.lessonMarkedTaught
                                        : L10nGateway
                                            .current.lessonUnmarkedTaught,
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
          Icon(Icons.picture_as_pdf_rounded, color: context.appColors.error),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              resource.bookName,
              style: appTextStyle(
                  fontSize: FontSize.label, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (resource.downloadable)
            Icon(Icons.download_rounded, color: context.appColors.primaryLight),
        ],
      ),
    );
  }
}

/// تقدّم منهج داخل حلقة: نسبة الإنجاز لكل مادة وحالة كل درس مع إمكانية تحديد تم إعطاء المنهاج.
class GroupCurriculumScreen extends ConsumerStatefulWidget {
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
  ConsumerState<GroupCurriculumScreen> createState() =>
      _GroupCurriculumScreenState();
}

class _GroupCurriculumScreenState extends ConsumerState<GroupCurriculumScreen> {
  late final _progressProvider = screenDataProvider(() => ref
      .read(operationsActionsControllerProvider.notifier)
      .query((r) => r.groupCurriculum(widget.groupId)));
  GroupCurriculum? get _progress => ref.watch(_progressProvider).valueOrNull;
  final Set<int> _taughtLessonIds = {};
  bool get _loading => ref.watch(_progressProvider).isLoading;
  Object? get _error => ref.watch(_progressProvider).error;

  @override
  void initState() {
    super.initState();
    // الدروس المنجزة قابلة للتبديل محلياً؛ تُملأ من الخادم عند كل تحميل.
    ref.listenManual(_progressProvider, (_, next) {
      if (next case AsyncData(:final value)) {
        setState(() => _taughtLessonIds
          ..clear()
          ..addAll([
            for (final s in value.subjects)
              for (final l in s.lessons)
                if (l.status == 'taught') l.id,
          ]));
      }
    }, fireImmediately: true);
  }

  void _load() => ref.invalidate(_progressProvider);

  Future<void> _toggleLesson(int lessonId, bool isTaught) async {
    setState(() {
      if (isTaught) {
        _taughtLessonIds.add(lessonId);
      } else {
        _taughtLessonIds.remove(lessonId);
      }
    });

    final outcome4 = await ref
        .read(operationsActionsControllerProvider.notifier)
        .run((r) => r.updateLessonTaught(
              groupId: widget.groupId,
              lessonId: lessonId,
              isTaught: isTaught,
            ));
    if (!mounted) return;
    if (outcome4.error case final e?) {
      showModuleSnack(context, errorText(e), error: true);
      return;
    }
    showModuleSnack(
      context,
      isTaught
          ? L10nGateway.current.lessonRecordedForGroup
          : L10nGateway.current.lessonTaughtCancelled,
    );
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
                  color: context.appColors.error,
                  onRetry: () {
                    _load();
                  },
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
                    _CurriculumBanner(
                      title: context.l10n.myCurriculum,
                      subtitle:
                          '${widget.groupName} - ${progress.curriculumName ?? ''}',
                      onDownload: () => showModuleSnack(
                        context,
                        L10nGateway.current.preparingCurriculumBooks,
                      ),
                    ),
                    ModuleCard(
                      accent: context.appColors.gold,
                      child: Column(
                        children: [
                          InfoRow(
                              label: context.l10n.curriculum,
                              value: progress.curriculumName ?? ''),
                          InfoRow(
                            label: context.l10n.completionRate,
                            value: '${progress.percentage.toStringAsFixed(1)}%',
                          ),
                          InfoRow(
                            label: context.l10n.lessonsCompleted,
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
                          subtitle: L10nGateway.current
                              .lessons(subject.lessons.length),
                          rows: [
                            for (final l in subject.lessons)
                              MapEntry(
                                l.name,
                                _taughtLessonIds.contains(l.id)
                                    ? L10nGateway.current.lessonTaught
                                    : L10nGateway.current.notTaught,
                              ),
                          ],
                        ),
                        lessons: [
                          for (int i = 0; i < subject.lessons.length; i++)
                            _LessonTableRowData(
                              id: subject.lessons[i].id,
                              name: subject.lessons[i].name,
                              importanceLevel: (i % 3) + 1,
                              isTaught: _taughtLessonIds
                                  .contains(subject.lessons[i].id),
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
          fontSize: FontSize.title,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: appTextStyle(
                    fontSize: FontSize.display,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: appTextStyle(
                    fontSize: FontSize.label,
                    color: const Color(0xFFB0D0C0),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
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
            icon: const Icon(Icons.download_rounded,
                size: 18, color: Colors.white),
            label: Text(
              context.l10n.downloadBooks,
              style: appTextStyle(
                fontSize: FontSize.label,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
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
        color: context.appColors.card,
        borderRadius: BorderRadius.circular(20),
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
          // Header: book title at start, preview at end
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    bookTitle,
                    textAlign: TextAlign.start,
                    style: appTextStyle(
                      fontSize: FontSize.title,
                      fontWeight: FontWeight.w800,
                      color: context.appColors.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: onPreview,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: context.appColors.primary.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: context.appColors.border),
                    ),
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      size: 20,
                      color: context.appColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.appColors.divider),
          // Table header: lesson at start, importance at end
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.lesson,
                  style: appTextStyle(
                    fontSize: FontSize.label,
                    fontWeight: FontWeight.w700,
                    color: context.appColors.textMuted,
                  ),
                ),
                Text(
                  context.l10n.importance,
                  style: appTextStyle(
                    fontSize: FontSize.label,
                    fontWeight: FontWeight.w700,
                    color: context.appColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: context.appColors.divider),
          // Lessons list
          for (int i = 0; i < lessons.length; i++) ...[
            _LessonRow(item: lessons[i]),
            if (i < lessons.length - 1)
              Divider(
                  height: 1, thickness: 1, color: context.appColors.divider),
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
            _CurriculumCheckbox(
              isChecked: item.isTaught,
              onChanged: item.onToggled,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                item.name,
                textAlign: TextAlign.start,
                style: appTextStyle(
                  fontSize: FontSize.body,
                  fontWeight: FontWeight.w600,
                  color: item.isTaught
                      ? context.appColors.successText
                      : context.appColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(width: 14),
            _ImportanceBars(level: item.importanceLevel),
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
    final activeColor = context.appColors.primary;
    final inactiveColor = context.appColors.border;
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
          color: isChecked
              ? context.appColors.primary.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isChecked
                ? context.appColors.primary
                : context.appColors.textMuted,
            width: 1.5,
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check_rounded,
                size: 16,
                color: context.appColors.primary,
              )
            : null,
      ),
    );
  }
}
