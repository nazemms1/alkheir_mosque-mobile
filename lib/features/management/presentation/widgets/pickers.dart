import 'dart:async';

import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/data/repositories/management_repository_impl.dart';
import 'package:alkheir_mosque/features/students/data/repositories/student_file_repository_impl.dart';
import 'module_widgets.dart';

/// عنصر قابل للاختيار في منتقٍ بحثي (طالب، ولي أمر، حلقة، كتالوج...).
class PickerItem {
  final int id;
  final String label;
  final String? subtitle;

  const PickerItem({required this.id, required this.label, this.subtitle});

  /// اختيار "بلا قيمة" — يُعاد من المنتقي عند مسح الاختيار.
  static const PickerItem clear = PickerItem(id: -1, label: '');
}

/// يفتح منتقياً بحثياً سفلياً. `load` يستقبل نص البحث ويُعيد العناصر.
Future<PickerItem?> showItemPicker(
  BuildContext context, {
  required String title,
  required Future<List<PickerItem>> Function(String search) load,
  bool allowClear = false,
  Future<PickerItem?> Function(String search)? onAddNew,
  String? addNewLabel,
}) {
  return showModalBottomSheet<PickerItem>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ItemPickerSheet(
      title: title,
      load: load,
      allowClear: allowClear,
      onAddNew: onAddNew,
      addNewLabel: addNewLabel,
    ),
  );
}

class _ItemPickerSheet extends StatefulWidget {
  final String title;
  final Future<List<PickerItem>> Function(String search) load;
  final bool allowClear;
  final Future<PickerItem?> Function(String search)? onAddNew;
  final String? addNewLabel;

  const _ItemPickerSheet({
    required this.title,
    required this.load,
    required this.allowClear,
    this.onAddNew,
    this.addNewLabel,
  });

  @override
  State<_ItemPickerSheet> createState() => _ItemPickerSheetState();
}

class _ItemPickerSheetState extends State<_ItemPickerSheet> {
  final _searchCtrl = TextEditingController();
  Timer? _debounce;
  List<PickerItem> _items = const [];
  bool _loading = true;
  Object? _error;
  int _request = 0;

  @override
  void initState() {
    super.initState();
    _run('');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchCtrl.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => _run(value));
  }

  Future<void> _run(String search) async {
    final request = ++_request;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final items = await widget.load(search.trim());
      if (!mounted || request != _request) return;
      setState(() {
        _items = items;
        _loading = false;
      });
    } catch (error) {
      if (!mounted || request != _request) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  Future<void> _handleAddNew() async {
    if (widget.onAddNew == null) return;
    final item = await widget.onAddNew!(_searchCtrl.text.trim());
    if (item != null && mounted) {
      Navigator.pop(context, item);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.sizeOf(context).height * 0.7;
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: theme.dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: Text(
                widget.title,
                style: appTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchCtrl,
                autofocus: true,
                style: appTextStyle(),
                onChanged: _onChanged,
                decoration: InputDecoration(
                  hintText: tr('ابحث…'),
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
            if (widget.allowClear)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton(
                  onPressed: () => Navigator.pop(context, PickerItem.clear),
                  child: Text(tr('بلا اختيار'), style: appTextStyle()),
                ),
              ),
            const SizedBox(height: 4),
            Expanded(child: _buildList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (_loading && _items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return ModuleMessage(
        text: errorText(_error!),
        icon: Icons.error_outline_rounded,
        color: AppColors.error,
        onRetry: () => _run(_searchCtrl.text),
      );
    }
    if (_items.isEmpty) {
      if (widget.onAddNew != null) {
        final query = _searchCtrl.text.trim();
        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_search_outlined,
                  size: 48,
                  color: Theme.of(context).disabledColor,
                ),
                const SizedBox(height: 12),
                Text(
                  query.isEmpty
                      ? tr('لا توجد نتائج')
                      : trf('لا توجد نتائج لـ "{0}"', [query]),
                  textAlign: TextAlign.center,
                  style: appTextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _handleAddNew,
                  icon: const Icon(Icons.add_rounded),
                  label: Text(
                    widget.addNewLabel ?? tr('إضافة جديد'),
                    style: appTextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return ModuleMessage(text: tr('لا توجد نتائج'));
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      itemCount: _items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) {
        final item = _items[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(item.label,
              style: appTextStyle(fontWeight: FontWeight.w700)),
          subtitle: item.subtitle == null
              ? null
              : Text(item.subtitle!, style: appTextStyle(fontSize: 12)),
          onTap: () => Navigator.pop(context, item),
        );
      },
    );
  }
}

/// حقل نموذج يعرض الاختيار الحالي ويفتح المنتقي عند النقر.
class PickerField extends StatelessWidget {
  final String label;
  final String? value;
  final VoidCallback onTap;
  final String? error;
  final VoidCallback? onClear;

  const PickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.error,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            errorText: error,
            suffixIcon: hasValue && onClear != null
                ? IconButton(
                    tooltip: tr('مسح'),
                    icon: const Icon(Icons.close_rounded, size: 18),
                    onPressed: onClear,
                  )
                : const Icon(Icons.arrow_drop_down_rounded),
          ),
          child: Text(
            hasValue ? value! : tr('اختر…'),
            style: appTextStyle(
              color: hasValue
                  ? Theme.of(context).colorScheme.onSurface
                  : moduleMuted(context),
            ),
          ),
        ),
      ),
    );
  }
}

/// الطلاب بالبحث بالاسم أو الرقم كعناصر منتقٍ.
Future<List<PickerItem>> studentPickerItems(String search) async {
  final page = await ManagementRepositoryImpl().students(search: search);
  return [
    for (final s in page.items)
      PickerItem(id: s.id, label: s.fullName, subtitle: s.studentNumber),
  ];
}

/// التسجيلات النشطة لطالب (من ملف تقدّمه) كعناصر منتقٍ.
Future<List<PickerItem>> studentActiveEnrollmentItems(int studentId) async {
  final progress = await StudentFileRepositoryImpl().progress(studentId);
  return [
    for (final e in progress.enrollments)
      if (e.isActive)
        PickerItem(
          id: e.id,
          label: e.group?.name ?? '#${e.id}',
          subtitle: e.course?.name,
        ),
  ];
}

/// المعلمون النشطون كعناصر منتقٍ مع البحث بالاسم.
Future<List<PickerItem>> activeTeacherItems(String search) async {
  final page = await ManagementRepositoryImpl().teachers(
    search: search,
    status: 'active',
    perPage: 50,
  );
  return [
    for (final t in page.items)
      PickerItem(id: t.id, label: t.fullName, subtitle: t.phone),
  ];
}

/// كتالوج مرجعي (السنوات، الصفوف، المعلمون المساعدون...) كعناصر منتقٍ.
Future<List<PickerItem>> referencePickerItems(
  String path, {
  String? search,
  bool includeInactive = false,
}) async {
  final rows = await ManagementRepositoryImpl().reference(
    path,
    search: search,
    includeInactive: includeInactive,
  );
  return [
    for (final RefItem row in rows)
      PickerItem(
        id: row.id,
        label: row.name,
        subtitle: row.code,
      ),
  ];
}
