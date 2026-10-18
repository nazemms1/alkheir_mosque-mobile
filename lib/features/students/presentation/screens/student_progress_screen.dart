import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/files/file_saver.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/students/data/models/student_progress_model.dart';
import 'package:alkheir_mosque/features/students/data/repositories/student_file_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';
import 'package:alkheir_mosque/features/management/presentation/screens/student_form_screen.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/management/presentation/screens/parent_form_screen.dart';

const _maxFileBytes = 10 * 1024 * 1024;

/// ملف الطالب: الصورة، الإحصاءات، التسجيلات، والمرفقات (رفع/تنزيل/حذف).
/// كل إجراء يظهر فقط إذا كانت صلاحيته موجودة في تسجيل الدخول.
class StudentProgressScreen extends StatefulWidget {
  final AuthToken token;
  final StudentListItem student;

  const StudentProgressScreen({
    super.key,
    required this.token,
    required this.student,
  });

  @override
  State<StudentProgressScreen> createState() => _StudentProgressScreenState();
}

class _StudentProgressScreenState extends State<StudentProgressScreen> {
  final _service = StudentFileRepositoryImpl();
  final _managementService = ManagementRepositoryImpl();
  StudentProgress? _progress;
  List<StudentFileItem> _files = const [];
  Uint8List? _photo;
  bool _loading = true;
  bool _busy = false;
  Object? _error;

  int get _studentId => widget.student.id;

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  Future<void> _loadAll() async {
    try {
      final results = await Future.wait<Object?>([
        _service.progress(_studentId),
        _service.files(_studentId),
        _service.photo(_studentId).catchError((_) => null),
      ]);
      if (!mounted) return;
      setState(() {
        _progress = results[0] as StudentProgress;
        _files = results[1] as List<StudentFileItem>;
        _photo = results[2] as Uint8List?;
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

  void _reload() {
    setState(() {
      _loading = true;
      _error = null;
    });
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
      () async => _service.uploadPhoto(
        _studentId,
        fileName: file.name,
        bytes: bytes,
      ),
      success: tr('تم تحديث صورة الطالب'),
    );
  }

  Future<void> _deletePhoto() async {
    final ok = await confirmAction(
      context,
      title: tr('حذف الصورة'),
      message: tr('ستُحذف صورة الطالب من النظام.'),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok) return;
    await _run(
      () => _service.deletePhoto(_studentId),
      success: tr('تم حذف الصورة'),
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
      showModuleSnack(context, tr('حجم الملف يتجاوز 10 ميغابايت'), error: true);
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
          .uploadFile(
            _studentId,
            fileType: fileType,
            fileName: file.name,
            bytes: bytes,
          )
          .then((_) {}),
      success: tr('تم رفع الملف'),
    );
  }

  Future<String?> _askFileType() {
    final ctrl = TextEditingController(text: 'document');
    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr('نوع الملف'),
            style: appTextStyle(fontWeight: FontWeight.w700)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          style: appTextStyle(),
          decoration: InputDecoration(
            labelText: tr('نوع الملف'),
            helperText: tr('مثل: شهادة ميلاد، تقرير، عقد'),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(tr('إلغاء'), style: appTextStyle()),
          ),
          FilledButton(
            onPressed: () {
              final value = ctrl.text.trim();
              Navigator.pop(ctx, value.isEmpty ? null : value);
            },
            child: Text(tr('متابعة'), style: appTextStyle(color: Colors.white)),
          ),
        ],
      ),
    ).whenComplete(ctrl.dispose);
  }

  Future<void> _downloadFile(StudentFileItem file) async {
    setState(() => _busy = true);
    try {
      final bytes = await _service.downloadFile(_studentId, file.id);
      await saveDownloadedFile(fileName: file.originalName, bytes: bytes);
      if (!mounted) return;
      setState(() => _busy = false);
    } catch (error) {
      if (!mounted) return;
      setState(() => _busy = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  Future<void> _deleteFile(StudentFileItem file) async {
    final ok = await confirmAction(
      context,
      title: tr('حذف الملف'),
      message: trf('سيتم حذف الملف "{0}" نهائياً.', [file.originalName]),
      confirmLabel: tr('حذف'),
      destructive: true,
    );
    if (!ok) return;
    await _run(
      () => _service.deleteFile(_studentId, file.id),
      success: tr('تم حذف الملف'),
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
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => StudentFormScreen(
          token: t,
          studentId: _studentId,
        ),
      ),
    );
    if (saved == true && mounted) {
      _reload();
    }
  }

  Future<void> _showParentDetail() async {
    final parentRef = _progress?.profile.parent;
    if (parentRef == null) return;
    final t = widget.token;
    setState(() => _busy = true);
    try {
      final parent = await _managementService.parent(parentRef.id);
      if (!mounted) return;
      setState(() => _busy = false);

      final choice = await showRecordSheet(
        context,
        title: parent.fatherName,
        subtitle: parent.parentNumber,
        rows: [
          MapEntry(tr('الهاتف'), parent.fatherPhone ?? ''),
          MapEntry(tr('العمل'), parent.fatherWork ?? ''),
          MapEntry(tr('اسم الأم'), parent.motherName ?? ''),
          MapEntry(tr('هاتف الأم'), parent.motherPhone ?? ''),
          MapEntry(tr('هاتف المنزل'), parent.homePhone ?? ''),
          MapEntry(tr('العنوان'), parent.address ?? ''),
          MapEntry(tr('عدد الطلاب'), '${parent.studentsCount}'),
          MapEntry(tr('الحالة'), parent.isActive ? tr('نشط') : tr('غير نشط')),
          MapEntry(tr('ملاحظات'), parent.notes ?? ''),
        ],
        actions: [
          if (ModuleAccess.canUpdateParents(t))
            SheetAction(id: 'edit', label: tr('تعديل'), icon: Icons.edit_rounded),
          if (ModuleAccess.canDeleteParents(t))
            SheetAction(
              id: 'delete',
              label: tr('حذف'),
              icon: Icons.delete_outline_rounded,
              destructive: true,
            ),
        ],
      );
      if (!mounted || choice == null) return;
      if (choice == 'edit') {
        final saved = await Navigator.of(context).push<Object?>(
          MaterialPageRoute(
            builder: (_) => ParentFormScreen(token: t, parent: parent),
          ),
        );
        if (saved != null && mounted) _reload();
      } else if (choice == 'delete') {
        final ok = await confirmAction(
          context,
          title: tr('حذف ولي الأمر'),
          message: tr('سيتم حذف ملف ولي الأمر وحسابه. لا يمكن التراجع.'),
          confirmLabel: tr('حذف'),
          destructive: true,
        );
        if (!ok || !mounted) return;
        await _run(
          () => _managementService.deleteParent(parent.id),
          success: tr('تم حذف ولي الأمر'),
        );
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _busy = false);
      showModuleSnack(context, errorText(error), error: true);
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
            tooltip: tr('تعديل بيانات الطالب'),
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
        color: AppColors.error,
        onRetry: _reload,
      );
    }
    final t = widget.token;
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => _reload(),
          color: AppColors.primaryLight,
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
              _SectionTitle(text: tr('التسجيلات')),
              if (progress.enrollments.isEmpty)
                ModuleMessage(text: tr('لا توجد تسجيلات لهذا الطالب'))
              else
                for (final enrollment in progress.enrollments)
                  _EnrollmentCard(enrollment: enrollment),
              _FilesHeader(
                canManage: ModuleAccess.canManageStudentFiles(t),
                busy: _busy,
                onUpload: _uploadFile,
              ),
              if (_files.isEmpty)
                ModuleMessage(text: tr('لا توجد ملفات مرفوعة'))
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
      accent: AppColors.gold,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: photo == null ? null : onViewPhoto,
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.gold.withValues(alpha: 0.2),
                  backgroundImage: photo == null ? null : MemoryImage(photo!),
                  child: photo == null
                      ? Text(
                          initials,
                          style: appTextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: AppColors.gold,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${profile.studentNumber ?? ''}  ·  ${profile.gradeLevel?.name ?? ''}',
                      style: appTextStyle(
                          fontSize: 12, color: moduleMuted(context)),
                    ),
                    const SizedBox(height: 6),
                    StatusPill(
                      label: profile.status,
                      color: profile.status == 'active'
                          ? AppColors.success
                          : AppColors.textMuted,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 22),
          InfoRow(
            label: tr('ولي الأمر'),
            value: profile.parent?.name ?? '',
            trailing: (profile.parent != null && onShowParentInfo != null)
                ? Tooltip(
                    message: tr('بيانات ولي الأمر'),
                    child: GestureDetector(
                      onTap: onShowParentInfo,
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppColors.primaryLight.withValues(alpha: 0.25),
                          ),
                        ),
                        child: const Icon(
                          Icons.info_outline_rounded,
                          size: 15,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          InfoRow(
            label: tr('الجزء الحالي'),
            value: profile.quranCurrentJuz == null
                ? ''
                : trf('الجزء {0}', [profile.quranCurrentJuz]),
          ),
          InfoRow(label: tr('تاريخ الميلاد'), value: profile.birthDate ?? ''),
          if (canEditPhoto) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: busy ? null : onUploadPhoto,
                  icon: const Icon(Icons.photo_camera_outlined, size: 18),
                  label: Text(
                    photo == null ? tr('إضافة صورة') : tr('تغيير الصورة'),
                    style: appTextStyle(),
                  ),
                ),
                if (photo != null)
                  OutlinedButton.icon(
                    onPressed: busy ? null : onDeletePhoto,
                    icon: const Icon(Icons.delete_outline_rounded, size: 18),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                    ),
                    label: Text(tr('حذف الصورة'), style: appTextStyle()),
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
      MapEntry(tr('الصفحات المحفوظة'), '${stats.memorizedPages}'),
      if (stats.points != null) MapEntry(tr('مجموع النقاط'), '${stats.points}'),
      if (stats.assessmentAverage != null)
        MapEntry(
          tr('متوسط التقييمات'),
          stats.assessmentAverage!.toStringAsFixed(1),
        ),
      if (stats.attendanceDays != null)
        MapEntry(tr('أيام الحضور'), '${stats.attendanceDays}'),
      if (stats.passedPartialTests != null)
        MapEntry(tr('جزئية ناجحة'), '${stats.passedPartialTests}'),
      if (stats.passedFinalTests != null)
        MapEntry(tr('نهائية ناجحة'), '${stats.passedFinalTests}'),
      if (stats.notes != null) MapEntry(tr('الملاحظات'), '${stats.notes}'),
      if (stats.files != null) MapEntry(tr('الملفات'), '${stats.files}'),
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
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  Text(
                    item.key,
                    style:
                        appTextStyle(fontSize: 11, color: moduleMuted(context)),
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
    final color = enrollment.isActive ? AppColors.success : AppColors.textMuted;
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
                    fontSize: 14,
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
            style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
          ),
          Text(
            enrollment.enrolledAt ?? '',
            style: appTextStyle(fontSize: 11, color: moduleMuted(context)),
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
              tr('المرفقات'),
              style: appTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          if (canManage)
            FilledButton.tonalIcon(
              onPressed: busy ? null : onUpload,
              icon: const Icon(Icons.upload_file_rounded, size: 18),
              label: Text(tr('رفع ملف'),
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
          const Icon(Icons.description_outlined, color: AppColors.info),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.originalName,
                  style: appTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${file.fileType}  ·  ${file.uploadedByName ?? ''}  ·  ${file.uploadedAt ?? ''}',
                  style:
                      appTextStyle(fontSize: 11, color: moduleMuted(context)),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: tr('تنزيل'),
            onPressed: busy ? null : onDownload,
            icon: const Icon(Icons.download_rounded),
          ),
          if (canManage)
            IconButton(
              tooltip: tr('حذف'),
              onPressed: busy ? null : onDelete,
              icon: const Icon(Icons.delete_outline_rounded,
                  color: AppColors.error),
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
