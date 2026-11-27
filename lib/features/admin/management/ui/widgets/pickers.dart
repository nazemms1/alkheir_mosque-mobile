import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/features/shared/students/ui/providers/student_file_actions_controller.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/di/di_locator.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

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

class _ItemPickerSheet extends ConsumerStatefulWidget {
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
  ConsumerState<_ItemPickerSheet> createState() => _ItemPickerSheetState();
}

class _ItemPickerSheetState extends ConsumerState<_ItemPickerSheet> {
  final _searchCtrl = TextEditingController();
  Timer? _debounce;
  String _query = '';
  // A new search invalidates the provider, which drops any older response.
  late final _itemsProvider =
      screenDataProvider<List<PickerItem>>(() => widget.load(_query));
  List<PickerItem> get _items =>
      ref.watch(_itemsProvider).valueOrNull ?? const [];
  bool get _loading => ref.watch(_itemsProvider).isLoading;
  Object? get _error => ref.watch(_itemsProvider).error;

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

  void _run(String search) {
    _query = search.trim();
    ref.invalidate(_itemsProvider);
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
    final height = MediaQuery.sizeOf(context).height * 0.75;
    return AdminBottomSheetShell(
      maxHeight: height,
      title: widget.title,
      icon: Icons.manage_search_rounded,
      iconColor: context.appColors.primaryLight,
      padding: EdgeInsets.zero,
      trailing: widget.allowClear
          ? TextButton(
              onPressed: () => Navigator.pop(context, PickerItem.clear),
              style: TextButton.styleFrom(
                foregroundColor: context.appColors.error,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              ),
              child: Text(
                context.l10n.noSelection,
                style: const TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.caption,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : null,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
            child: AdminSearchField(
              controller: _searchCtrl,
              hint: context.l10n.search,
              autofocus: true,
              onChanged: _onChanged,
            ),
          ),
          Expanded(child: _buildList(context)),
        ],
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
        color: context.appColors.error,
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
                      ? L10nGateway.current.noResults
                      : L10nGateway.current.noResultsFor(query),
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
                    widget.addNewLabel ?? L10nGateway.current.addNew,
                    style: appTextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return ModuleMessage(text: L10nGateway.current.noResults);
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      itemCount: _items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, index) {
        final item = _items[index];
        final subtitle = item.subtitle ?? '';
        return AdminCard(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          onTap: () => Navigator.pop(context, item),
          child: Row(
            children: [
              AdminAvatar(text: moduleInitials(item.label), size: 38),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontWeight.w700,
                        color: AdminTheme.text(context),
                      ),
                    ),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: FontSize.caption,
                          color: AdminTheme.muted(context),
                        ),
                      ),
                  ],
                ),
              ),
              Icon(AdminTheme.chevron(context),
                  color: AdminTheme.muted(context)),
            ],
          ),
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
                    tooltip: context.l10n.scan,
                    icon: const Icon(Icons.close_rounded, size: 18),
                    onPressed: onClear,
                  )
                : const Icon(Icons.arrow_drop_down_rounded),
          ),
          child: Text(
            hasValue ? value! : context.l10n.choose,
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
  final page = await appProviderContainer
      .read(managementActionsControllerProvider.notifier)
      .query((r) => r.students(search: search));
  return [
    for (final s in page.items)
      PickerItem(id: s.id, label: s.fullName, subtitle: s.studentNumber),
  ];
}

/// التسجيلات النشطة لطالب (من ملف تقدّمه) كعناصر منتقٍ.
Future<List<PickerItem>> studentActiveEnrollmentItems(int studentId) async {
  final progress = await appProviderContainer
      .read(studentFileActionsControllerProvider.notifier)
      .query((r) => r.progress(studentId));
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
  final page = await appProviderContainer
      .read(managementActionsControllerProvider.notifier)
      .query((r) => r.teachers(
            search: search,
            status: 'active',
            perPage: 50,
          ));
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
  final rows = await appProviderContainer
      .read(managementActionsControllerProvider.notifier)
      .query((r) => r.reference(
            path,
            search: search,
            includeInactive: includeInactive,
          ));
  return [
    for (final RefItem row in rows)
      PickerItem(
        id: row.id,
        label: row.name,
        subtitle: row.code,
      ),
  ];
}

/// الكورسات النشطة كعناصر منتقٍ مع البحث بالاسم.
Future<List<PickerItem>> activeCoursePickerItems(String search) async {
  final page = await appProviderContainer
      .read(managementActionsControllerProvider.notifier)
      .query((r) => r.courses(
            search: search,
            isActive: true,
            perPage: 50,
          ));
  return [
    for (final c in page.items)
      PickerItem(
        id: c.id,
        label: c.name,
        subtitle:
            c.isDefault ? L10nGateway.current.defaultCourse : c.academicYear,
      ),
  ];
}
