import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/features/shared/students/ui/providers/student_file_actions_controller.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/files/file_saver.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_progress_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

const _maxFileBytes = 10 * 1024 * 1024;

/// ملف الطالب: الصورة، الإحصاءات، التسجيلات، والمرفقات (رفع/تنزيل/حذف).
/// كل إجراء يظهر فقط إذا كانت صلاحيته موجودة في تسجيل الدخول.
class StudentProgressScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final StudentListItem student;

  const StudentProgressScreen({
    super.key,
    required this.token,
    required this.student,
  });

  @override
  ConsumerState<StudentProgressScreen> createState() =>
      _StudentProgressScreenState();
}

class _StudentProgressScreenState extends ConsumerState<StudentProgressScreen> {
  late final _service = ref.read(studentFileActionsControllerProvider.notifier);
  late final _loadAllProvider = screenDataProvider(() async {
    final results = await Future.wait<Object?>([
      ref
          .read(studentFileActionsControllerProvider.notifier)
          .query((r) => r.progress(_studentId)),
      ref
          .read(studentFileActionsControllerProvider.notifier)
          .query((r) => r.files(_studentId)),
      ref
          .read(studentFileActionsControllerProvider.notifier)
          .query((r) => r.photo(_studentId))
          .catchError((_) => null),
    ]);
    return (
      progress: results[0] as StudentProgress,
      files: results[1] as List<StudentFileItem>,
      photo: results[2] as Uint8List?
    );
  });
  StudentProgress? get _progress =>
      ref.watch(_loadAllProvider).valueOrNull?.progress;
  List<StudentFileItem> get _files =>
      ref.watch(_loadAllProvider).valueOrNull?.files ?? const [];
  Uint8List? get _photo => ref.watch(_loadAllProvider).valueOrNull?.photo;
  bool get _loading => ref.watch(_loadAllProvider).isLoading;
  Object? get _error => ref.watch(_loadAllProvider).error;
  bool _busy = false;

  int get _studentId => widget.student.id;

  Future<void> _loadAll() => reloadScreenData(ref, _loadAllProvider);

  void _reload() {
    _loadAll();
  }

  /// تنفيذ عملية تغيّر البيانات مع قفل الواجهة وعرض النتيجة.
  Future<void> _run(
    Future<void> Function() action, {
    required String success,
  }) async {
    setState(() => _busy = true);
    try {
      await action();
      if (!mounted) return;
      showModuleSnack(context, success);
      setState(() => _busy = false);
      _reload();
    } catch (error) {
      if (!mounted) return;
      setState(() => _busy = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  Future<void> _uploadPhoto() async {
    final picked =
        await FilePicker.pickFiles(type: FileType.image, withData: true);
    if (picked == null || picked.files.isEmpty) return;
    final file = picked.files.first;
    final bytes = file.bytes ??
        (file.path != null
            ? await File(file.path!).readAsBytes()
            : Uint8List(0));
    await _run(
      () async => ref
          .read(studentFileActionsControllerProvider.notifier)
          .query((r) => r.uploadPhoto(
                _studentId,
                fileName: file.name,
                bytes: bytes,
              )),
      success: L10nGateway.current.studentPhotoUpdated,
    );
  }

  Future<void> _deletePhoto() async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deletePhoto,
      message: L10nGateway.current.theStudentSPhotoWill,
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok) return;
    await _run(
      () => ref
          .read(studentFileActionsControllerProvider.notifier)
          .query((r) => r.deletePhoto(_studentId)),
      success: L10nGateway.current.photoDeleted,
    );
  }

  Future<void> _uploadFile() async {
    final picked = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: const [
        'pdf',
        'jpg',
        'jpeg',
        'png',
        'webp',
        'doc',
        'docx'
      ],
    );
    if (picked == null || picked.files.isEmpty || !mounted) return;
    final file = picked.files.first;
    final size = file.size;
    if (!mounted) return;
    if (size > _maxFileBytes) {
      showModuleSnack(context, L10nGateway.current.fileSizeExceedsMb,
          error: true);
      return;
    }
    if (!mounted) return;
    final fileType = await _askFileType();
    if (fileType == null || !mounted) return;
    final bytes = file.bytes ??
        (file.path != null
            ? await File(file.path!).readAsBytes()
            : Uint8List(0));
    await _run(
      () async => _service
          .query((r) => r.uploadFile(
                _studentId,
                fileType: fileType,
                fileName: file.name,
                bytes: bytes,
              ))
          .then((_) {}),
      success: L10nGateway.current.fileUploaded,
    );
  }

  Future<String?> _askFileType() {
    final ctrl = TextEditingController(text: 'document');
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10nGateway.current.fileType,
            style: appTextStyle(fontWeight: FontWeight.w700)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          style: appTextStyle(),
          decoration: InputDecoration(
            labelText: L10nGateway.current.fileType,
            helperText: L10nGateway.current.forExampleBirthCertificateReport,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(L10nGateway.current.cancel, style: appTextStyle()),
          ),
          FilledButton(
            onPressed: () {
              final value = ctrl.text.trim();
              Navigator.pop(ctx, value.isEmpty ? null : value);
            },
            child: Text(L10nGateway.current.tContinue,
                style: appTextStyle(color: Colors.white)),
          ),
        ],
      ),
    ).whenComplete(ctrl.dispose);
  }

  Future<void> _downloadFile(StudentFileItem file) async {
    setState(() => _busy = true);
    final outcome = await ref
        .read(studentFileActionsControllerProvider.notifier)
        .run((r) => r.downloadFile(_studentId, file.id));
    if (!mounted) return;
    if (outcome.error case final error?) {
      setState(() => _busy = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    final bytes = outcome.value!;
    await saveDownloadedFile(fileName: file.originalName, bytes: bytes);
    if (!mounted) return;
    setState(() => _busy = false);
  }

  Future<void> _deleteFile(StudentFileItem file) async {
    final ok = await confirmAction(
      context,
      title: L10nGateway.current.deleteFile,
      message: L10nGateway.current.theFileWillBePermanently(file.originalName),
      confirmLabel: L10nGateway.current.delete,
      destructive: true,
    );
    if (!ok) return;
    await _run(
      () => ref
          .read(studentFileActionsControllerProvider.notifier)
          .query((r) => r.deleteFile(_studentId, file.id)),
      success: L10nGateway.current.fileDeleted,
    );
  }

  void _showPhoto() {
    final bytes = _photo;
    if (bytes == null) return;
    showDialog<void>(
      context: context,
      builder: (ctx) => Dialog(
        clipBehavior: Clip.antiAlias,
        child:
            InteractiveViewer(child: Image.memory(bytes, fit: BoxFit.contain)),
      ),
    );
  }

  Future<void> _openEditStudent() async {
    final t = widget.token;
    final saved = await context.push<bool>(AppRoutes.studentFormRoute,
        extra: (token: t, studentId: _studentId));
    if (saved == true && mounted) {
      _reload();
    }
  }

  Future<void> _showParentDetail() async {
    final parentRef = _progress?.profile.parent;
    if (parentRef == null) return;
    final t = widget.token;
    setState(() => _busy = true);
    final outcome2 = await ref
        .read(managementActionsControllerProvider.notifier)
        .run((r) => r.parent(parentRef.id));
    if (!mounted) return;
    if (outcome2.error case final error?) {
      setState(() => _busy = false);
      showModuleSnack(context, errorText(error), error: true);
      return;
    }
    final parent = outcome2.value!;
    setState(() => _busy = false);

    final choice = await showRecordSheet(
      context,
      title: parent.fatherName,
      subtitle: parent.parentNumber,
      rows: [
        MapEntry(L10nGateway.current.phone, parent.fatherPhone ?? ''),
        MapEntry(L10nGateway.current.work, parent.fatherWork ?? ''),
        MapEntry(L10nGateway.current.motherName, parent.motherName ?? ''),
        MapEntry(L10nGateway.current.motherSPhone, parent.motherPhone ?? ''),
        MapEntry(L10nGateway.current.homePhone, parent.homePhone ?? ''),
        MapEntry(L10nGateway.current.address, parent.address ?? ''),
        MapEntry(
            L10nGateway.current.numberOfStudents, '${parent.studentsCount}'),
        MapEntry(
            L10nGateway.current.status,
            parent.isActive
                ? L10nGateway.current.active
                : L10nGateway.current.inactive),
        MapEntry(L10nGateway.current.notes, parent.notes ?? ''),
      ],
      actions: [
        if (ModuleAccess.canUpdateParents(t))
          SheetAction(
              id: 'edit',
              label: L10nGateway.current.edit,
              icon: Icons.edit_rounded),
        if (ModuleAccess.canDeleteParents(t))
          SheetAction(
            id: 'delete',
            label: L10nGateway.current.delete,
            icon: Icons.delete_outline_rounded,
            destructive: true,
          ),
      ],
    );
    if (!mounted || choice == null) return;
    if (choice == 'edit') {
      final saved = await context.push<Object?>(AppRoutes.parentFormRoute,
          extra: (token: t, parent: parent, initialFatherName: null));
      if (saved != null && mounted) _reload();
    } else if (choice == 'delete') {
      final ok = await confirmAction(
        context,
        title: L10nGateway.current.deleteParent,
        message: L10nGateway.current.theParentSFileAnd,
        confirmLabel: L10nGateway.current.delete,
        destructive: true,
      );
      if (!ok || !mounted) return;
      await _run(
        () => ref
            .read(managementActionsControllerProvider.notifier)
            .query((r) => r.deleteParent(parent.id)),
        success: L10nGateway.current.parentDeleted,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.token;
    if (!ModuleAccess.canViewStudents(t)) {
      return ModuleScaffold(
        title: _progress?.profile.name ?? widget.student.fullName,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: _progress?.profile.name ?? widget.student.fullName,
      actions: [
        if (ModuleAccess.canUpdateStudents(t))
          IconButton(
            icon: const Icon(Icons.edit_rounded, color: Colors.white),
            tooltip: context.l10n.editStudentDetails,
            onPressed: _openEditStudent,
          ),
      ],
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    final progress = _progress;
    if (progress == null) {
      return ModuleMessage(
        text: errorText(_error ?? ''),
        icon: Icons.error_outline_rounded,
        color: context.appColors.error,
        onRetry: _reload,
      );
    }
    final t = widget.token;
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => _reload(),
          color: context.appColors.primaryLight,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            children: [
              _ProfileHeader(
                progress: progress,
                photo: _photo,
                canEditPhoto: ModuleAccess.canUpdateStudentPhoto(t),
                busy: _busy,
                onViewPhoto: _showPhoto,
                onUploadPhoto: _uploadPhoto,
                onDeletePhoto: _deletePhoto,
                onShowParentInfo: _showParentDetail,
              ),
              const SizedBox(height: 14),
              _StatsGrid(stats: progress.stats),
              _SectionTitle(text: L10nGateway.current.registrations),
              if (progress.enrollments.isEmpty)
                ModuleMessage(text: L10nGateway.current.noRecordsForThisStudent)
              else
                for (final enrollment in progress.enrollments)
                  _EnrollmentCard(enrollment: enrollment),
              _FilesHeader(
                canManage: ModuleAccess.canManageStudentFiles(t),
                busy: _busy,
                onUpload: _uploadFile,
              ),
              if (_files.isEmpty)
                ModuleMessage(text: L10nGateway.current.noUploadedFiles)
              else
                for (final file in _files)
                  _FileCard(
                    file: file,
                    canManage: ModuleAccess.canManageStudentFiles(t),
                    busy: _busy,
                    onDownload: () => _downloadFile(file),
                    onDelete: () => _deleteFile(file),
                  ),
            ],
          ),
        ),
        if (_busy)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(minHeight: 2),
          ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final StudentProgress progress;
  final Uint8List? photo;
  final bool canEditPhoto;
  final bool busy;
  final VoidCallback onViewPhoto;
  final VoidCallback onUploadPhoto;
  final VoidCallback onDeletePhoto;
  final VoidCallback? onShowParentInfo;

  const _ProfileHeader({
    required this.progress,
    required this.photo,
    required this.canEditPhoto,
    required this.busy,
    required this.onViewPhoto,
    required this.onUploadPhoto,
    required this.onDeletePhoto,
    this.onShowParentInfo,
  });

  @override
  Widget build(BuildContext context) {
    final profile = progress.profile;
    final initials =
        profile.name.trim().isEmpty ? '?' : profile.name.trim().substring(0, 1);
    return ModuleCard(
      accent: context.appColors.gold,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: photo == null ? null : onViewPhoto,
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor:
                      context.appColors.gold.withValues(alpha: 0.2),
                  backgroundImage: photo == null ? null : MemoryImage(photo!),
                  child: photo == null
                      ? Text(
                          initials,
                          style: appTextStyle(
                            fontSize: FontSize.headlineLarge,
                            fontWeight: FontWeight.w800,
                            color: context.appColors.goldText,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: appTextStyle(
                        fontSize: FontSize.title,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${profile.studentNumber ?? ''}  ·  ${profile.gradeLevel?.name ?? ''}',
                      style: appTextStyle(
                          fontSize: FontSize.caption,
                          color: moduleMuted(context)),
                    ),
                    const SizedBox(height: 6),
                    StatusPill(
                      label: profile.status,
                      color: profile.status == 'active'
                          ? context.appColors.success
                          : context.appColors.textMuted,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 22),
          InfoRow(
            label: context.l10n.parent,
            value: profile.parent?.name ?? '',
            trailing: (profile.parent != null && onShowParentInfo != null)
                ? Tooltip(
                    message: context.l10n.parentDetails,
                    child: GestureDetector(
                      onTap: onShowParentInfo,
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: context.appColors.primaryLight
                              .withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: context.appColors.primaryLight
                                .withValues(alpha: 0.25),
                          ),
                        ),
                        child: Icon(
                          Icons.info_outline_rounded,
                          size: 15,
                          color: context.appColors.primaryLight,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          InfoRow(
            label: context.l10n.currentJuz,
            value: profile.quranCurrentJuz == null
                ? ''
                : context.l10n.juz((profile.quranCurrentJuz ?? '')),
          ),
          InfoRow(
              label: context.l10n.dateOfBirth, value: profile.birthDate ?? ''),
          if (canEditPhoto) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: busy ? null : onUploadPhoto,
                  icon: const Icon(Icons.photo_camera_outlined, size: 18),
                  label: Text(
                    photo == null
                        ? context.l10n.addPhoto
                        : context.l10n.changePhoto,
                    style: appTextStyle(),
                  ),
                ),
                if (photo != null)
                  OutlinedButton.icon(
                    onPressed: busy ? null : onDeletePhoto,
                    icon: const Icon(Icons.delete_outline_rounded, size: 18),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: context.appColors.error,
                    ),
                    label:
                        Text(context.l10n.deletePhoto, style: appTextStyle()),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  final StudentProgressStats stats;

  const _StatsGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    final items = <MapEntry<String, String>>[
      MapEntry(context.l10n.savedPages, '${stats.memorizedPages}'),
      if (stats.points != null)
        MapEntry(context.l10n.totalPoints2, '${stats.points}'),
      if (stats.assessmentAverage != null)
        MapEntry(
          context.l10n.averageAssessment,
          stats.assessmentAverage!.toStringAsFixed(1),
        ),
      if (stats.attendanceDays != null)
        MapEntry(context.l10n.attendanceDays, '${stats.attendanceDays}'),
      if (stats.passedPartialTests != null)
        MapEntry(context.l10n.partialPassed, '${stats.passedPartialTests}'),
      if (stats.passedFinalTests != null)
        MapEntry(context.l10n.finalPassed, '${stats.passedFinalTests}'),
      if (stats.notes != null) MapEntry(context.l10n.notes2, '${stats.notes}'),
      if (stats.files != null) MapEntry(context.l10n.files, '${stats.files}'),
    ];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final item in items)
          SizedBox(
            width: (MediaQuery.sizeOf(context).width - 42) / 2,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.value,
                    style: appTextStyle(
                      fontSize: FontSize.headlineSmall,
                      fontWeight: FontWeight.w800,
                      color: context.appColors.primaryLight,
                    ),
                  ),
                  Text(
                    item.key,
                    style: appTextStyle(
                        fontSize: FontSize.caption,
                        color: moduleMuted(context)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _EnrollmentCard extends StatelessWidget {
  final StudentEnrollmentInfo enrollment;

  const _EnrollmentCard({required this.enrollment});

  @override
  Widget build(BuildContext context) {
    final color = enrollment.isActive
        ? context.appColors.success
        : context.appColors.textMuted;
    return ModuleCard(
      accent: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  enrollment.group?.name ?? '—',
                  style: appTextStyle(
                    fontSize: FontSize.body,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              StatusPill(label: enrollment.status, color: color),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${enrollment.course?.name ?? ''}  ·  ${enrollment.teacher?.name ?? ''}',
            style: appTextStyle(
                fontSize: FontSize.caption, color: moduleMuted(context)),
          ),
          Text(
            enrollment.enrolledAt ?? '',
            style: appTextStyle(
                fontSize: FontSize.caption, color: moduleMuted(context)),
          ),
        ],
      ),
    );
  }
}

class _FilesHeader extends StatelessWidget {
  final bool canManage;
  final bool busy;
  final VoidCallback onUpload;

  const _FilesHeader({
    required this.canManage,
    required this.busy,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 14, 4, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.attachments,
              style: appTextStyle(
                fontSize: FontSize.body,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          if (canManage)
            FilledButton.tonalIcon(
              onPressed: busy ? null : onUpload,
              icon: const Icon(Icons.upload_file_rounded, size: 18),
              label: Text(context.l10n.uploadFile,
                  style: appTextStyle(fontWeight: FontWeight.w700)),
            ),
        ],
      ),
    );
  }
}

class _FileCard extends StatelessWidget {
  final StudentFileItem file;
  final bool canManage;
  final bool busy;
  final VoidCallback onDownload;
  final VoidCallback onDelete;

  const _FileCard({
    required this.file,
    required this.canManage,
    required this.busy,
    required this.onDownload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ModuleCard(
      child: Row(
        children: [
          Icon(Icons.description_outlined, color: context.appColors.info),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.originalName,
                  style: appTextStyle(
                    fontSize: FontSize.label,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${file.fileType}  ·  ${file.uploadedByName ?? ''}  ·  ${file.uploadedAt ?? ''}',
                  style: appTextStyle(
                      fontSize: FontSize.caption, color: moduleMuted(context)),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: context.l10n.download,
            onPressed: busy ? null : onDownload,
            icon: const Icon(Icons.download_rounded),
          ),
          if (canManage)
            IconButton(
              tooltip: context.l10n.delete,
              onPressed: busy ? null : onDelete,
              icon: Icon(Icons.delete_outline_rounded,
                  color: context.appColors.error),
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
          fontSize: FontSize.body,
          fontWeight: FontWeight.w800,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
