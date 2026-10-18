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

Color _lessonColor(String status) => switch (status) {
      'taught' => AppColors.success,
      'partial' => AppColors.warning,
      _ => AppColors.textMuted,
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
                    _SectionTitle(text: tr('المواد والدروس')),
                    if (detail.subjects.isEmpty)
                      ModuleMessage(text: tr('لا توجد مواد في هذا المنهج'))
                    else
                      for (final subject in detail.subjects)
                        ModuleCard(
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            title: Text(
                              subject.name,
                              style: appTextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              trf('الدروس: {0}', [subject.lessons.length]),
                              style: appTextStyle(
                                  fontSize: 12, color: moduleMuted(context)),
                            ),
                            children: [
                              for (final lesson in subject.lessons)
                                ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(lesson.name,
                                      style: appTextStyle(fontSize: 13)),
                                  subtitle: Text(
                                    [
                                      if (lesson.chapterNumber != null)
                                        trf('الفصل {0}',
                                            [lesson.chapterNumber]),
                                      if (lesson.pageCount != null)
                                        trf('صفحات: {0}', [lesson.pageCount]),
                                      if (lesson.topics.isNotEmpty)
                                        trf('المواضيع: {0}',
                                            [lesson.topics.length]),
                                    ].join('  ·  '),
                                    style: appTextStyle(
                                        fontSize: 11,
                                        color: moduleMuted(context)),
                                  ),
                                  trailing: lesson.resource == null
                                      ? null
                                      : IconButton(
                                          tooltip: tr('تنزيل'),
                                          icon: const Icon(
                                              Icons.picture_as_pdf_rounded),
                                          onPressed: () =>
                                              _download(lesson.resource!),
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

/// تقدّم منهج داخل حلقة: نسبة الإنجاز لكل مادة وحالة كل درس.
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
      setState(() {
        _progress = progress;
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
                )
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                  children: [
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
                                '${progress.completed.toStringAsFixed(1)} / ${progress.total}',
                          ),
                        ],
                      ),
                    ),
                    for (final subject in progress.subjects)
                      ModuleCard(
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: Text(subject.name,
                              style: appTextStyle(fontWeight: FontWeight.w800)),
                          subtitle: Text(
                            '${subject.percentage.toStringAsFixed(1)}%',
                            style: appTextStyle(
                                fontSize: 12, color: moduleMuted(context)),
                          ),
                          children: [
                            for (final lesson in subject.lessons)
                              ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: Text(lesson.name,
                                    style: appTextStyle(fontSize: 13)),
                                subtitle: Text(
                                  [
                                    if (lesson.taughtOn != null)
                                      lesson.taughtOn!,
                                    if (lesson.teacher != null) lesson.teacher!,
                                  ].join('  ·  '),
                                  style: appTextStyle(
                                      fontSize: 11,
                                      color: moduleMuted(context)),
                                ),
                                trailing: StatusPill(
                                  label: curriculumLessonStatusLabel(
                                      lesson.status),
                                  color: _lessonColor(lesson.status),
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

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
      child: Text(
        text,
        style: appTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
