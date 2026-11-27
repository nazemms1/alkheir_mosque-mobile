import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/app/core/services/url_launcher_service.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/paged_list_controller.dart';

// إعادة التصدير: الشاشات القديمة تستورد errorText من هذا الملف.
export 'package:alkheir_mosque/ui/widgets/app_feedback.dart'
    show errorText, showAppSnack;

/// عناصر واجهة مشتركة لشاشات وحدات الإدارة (المالية، الأولياء، المعلمون...).
/// تستخدم نفس عناصر شاشات الإدارة (admin_ui.dart) لتبقى الواجهتان متطابقتين.

Color moduleMuted(BuildContext context) => AdminTheme.muted(context);

/// سهم "التالي" يتجه تلقائياً حسب لغة الواجهة (يسار في العربية، يمين في الإنجليزية).
IconData moduleChevron(BuildContext context) => AdminTheme.chevron(context);
IconData moduleChevronForward(BuildContext context) =>
    AdminTheme.chevron(context);

/// سهم "السابق" يتجه تلقائياً حسب لغة الواجهة (يمين في العربية، يسار في الإنجليزية).
IconData moduleChevronBack(BuildContext context) =>
    AdminTheme.chevronBack(context);

/// هيكل شاشة وحدة: شريط علوي متدرّج ومثبت بألوان الهوية ومحتوى.
class ModuleScaffold extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget body;
  final List<Widget> actions;
  final Widget? leading;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;
  final bool showTitle;

  const ModuleScaffold({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
    this.actions = const [],
    this.leading,
    this.floatingActionButton,
    this.bottom,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
        title: title,
        subtitle: subtitle,
        actions: actions,
        leading: leading,
        bottom: bottom,
        showTitle: showTitle,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

/// رسالة وسط الشاشة: فارغة، خطأ، أو عدم صلاحية.
class ModuleMessage extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final VoidCallback? onRetry;

  const ModuleMessage({
    super.key,
    required this.text,
    this.icon = Icons.inbox_outlined,
    this.color,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final retry = onRetry;
    if (retry != null) {
      return AdminErrorState(
        message: text,
        onRetry: retry,
        retryLabel: L10nGateway.current.tryAgain,
      );
    }
    return AdminEmptyState(icon: icon, title: text);
  }
}

/// شاشة بديلة عند غياب الصلاحية — لا تُظهر أي بيانات.
class ModuleAccessDenied extends StatelessWidget {
  const ModuleAccessDenied({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleMessage(
      icon: Icons.lock_outline_rounded,
      text: context.l10n.youDonTHavePermission2,
    );
  }
}

/// بطاقة قابلة للنقر بنفس أسلوب بطاقات التطبيق.
class ModuleCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? accent;

  const ModuleCard({super.key, required this.child, this.onTap, this.accent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AdminCard(
        onTap: onTap,
        accent: accent,
        padding: const EdgeInsets.all(14),
        child: child,
      ),
    );
  }
}

/// شارة حالة صغيرة (نشط، منتهي، مدفوع...).
class StatusPill extends StatelessWidget {
  final String label;
  final Color color;

  const StatusPill({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return AdminBadge(label: label, color: color);
  }
}

/// سطر "عنوان: قيمة" في البطاقات والنوافذ.
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;
  final VoidCallback? onTap;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final valueWidget = Text(
      value.isEmpty ? '—' : value,
      style: appTextStyle(
        fontSize: FontSize.label,
        fontWeight: FontWeight.w600,
        color: onTap != null
            ? context.appColors.primaryLight
            : Theme.of(context).colorScheme.onSurface,
      ).copyWith(
        decoration: onTap != null ? TextDecoration.underline : null,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 116,
            child: Text(
              label,
              style: appTextStyle(
                  fontSize: FontSize.caption, color: moduleMuted(context)),
            ),
          ),
          Flexible(
            child: onTap != null
                ? InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: valueWidget,
                    ),
                  )
                : valueWidget,
          ),
          if (trailing != null) ...[
            const SizedBox(width: 8),
            trailing!,
          ],
        ],
      ),
    );
  }
}

/// إجراء في نافذة التفاصيل. `id` يُعاد للمستدعي عند الضغط.
class SheetAction {
  final String id;
  final String label;
  final IconData icon;
  final bool destructive;

  const SheetAction({
    required this.id,
    required this.label,
    required this.icon,
    this.destructive = false,
  });
}

/// نافذة سفلية بتفاصيل سجل وأزرار إجراءات. تُعيد معرّف الإجراء المختار أو null.
Future<String?> showRecordSheet(
  BuildContext context, {
  required String title,
  String? subtitle,
  List<MapEntry<String, String>> rows = const [],
  List<SheetAction> actions = const [],
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _RecordSheet(
      title: title,
      subtitle: subtitle,
      rows: rows,
      actions: actions,
    ),
  );
}

bool _isPhoneField(String label, String value) {
  final cleanVal = value.trim();
  if (cleanVal.isEmpty || cleanVal == '—') return false;
  final l = label.toLowerCase();
  final isPhoneLabel = l.contains('هاتف') ||
      l.contains('جوال') ||
      l.contains('موبايل') ||
      l.contains('phone') ||
      l.contains('mobile') ||
      l.contains('tel');
  if (!isPhoneLabel) return false;
  final digits = cleanVal.replaceAll(RegExp(r'\D'), '');
  return digits.length >= 3;
}

class _RecordSheet extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<MapEntry<String, String>> rows;
  final List<SheetAction> actions;

  const _RecordSheet({
    required this.title,
    required this.subtitle,
    required this.rows,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = context.appColors.background;
    final cardBorder = context.appColors.border;

    return AdminBottomSheetShell(
      title: title,
      subtitle: subtitle,
      icon: Icons.description_rounded,
      iconColor: context.appColors.primaryLight,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (rows.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: cardBorder, width: 1.2),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Column(
                  children: [
                    for (int i = 0; i < rows.length; i++) ...[
                      if (i > 0)
                        Divider(
                          height: 14,
                          thickness: 1,
                          color: cardBorder.withValues(alpha: 0.7),
                        ),
                      if (_isPhoneField(rows[i].key, rows[i].value))
                        InfoRow(
                          label: rows[i].key,
                          value: rows[i].value,
                          onTap: () =>
                              UrlLauncherService().launchPhone(rows[i].value),
                          trailing: Tooltip(
                            message: context.l10n.callThisNumber,
                            child: Material(
                              color: context.appColors.primaryLight
                                  .withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () => UrlLauncherService()
                                    .launchPhone(rows[i].value),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: context.appColors.primaryLight
                                          .withValues(alpha: 0.3),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone_in_talk_rounded,
                                        size: 14,
                                        color: context.appColors.primaryLight,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        context.l10n.call,
                                        style: TextStyle(
                                          fontFamily: 'Dubai',
                                          fontSize: FontSize.caption,
                                          fontWeight: FontWeight.w700,
                                          color: context.appColors.primaryLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        InfoRow(label: rows[i].key, value: rows[i].value),
                    ],
                  ],
                ),
              ),
            if (actions.isNotEmpty)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final action in actions)
                    _SheetActionButton(
                      action: action,
                      onTap: () => Navigator.pop(context, action.id),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _SheetActionButton extends StatelessWidget {
  final SheetAction action;
  final VoidCallback onTap;

  const _SheetActionButton({required this.action, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = action.destructive
        ? context.appColors.error
        : context.appColors.primaryLight;
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border:
                Border.all(color: color.withValues(alpha: 0.35), width: 1.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(action.icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                action.label,
                style: TextStyle(
                  fontFamily: 'Dubai',
                  fontSize: FontSize.body,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// نافذة نموذج سفلية فاخرة تتكيّف مع لوحة المفاتيح.
class ModuleFormSheet extends StatelessWidget {
  final String title;
  final Widget child;

  const ModuleFormSheet({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.viewInsetsOf(context).bottom;
    return AdminBottomSheetShell(
      title: title,
      icon: Icons.edit_note_rounded,
      iconColor: context.appColors.gold,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: keyboard),
        child: child,
      ),
    );
  }
}

/// يفتح [ModuleFormSheet] ويُعيد `true` عند الحفظ الناجح.
Future<bool?> showFormSheet(
  BuildContext context, {
  required String title,
  required Widget Function(BuildContext sheetContext) builder,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => ModuleFormSheet(
      title: title,
      child: builder(sheetContext),
    ),
  );
}

/// حوار تأكيد قبل أي عملية حذف أو إنهاء أو تغيير حالة.
Future<bool> confirmAction(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  bool destructive = false,
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title, style: appTextStyle(fontWeight: FontWeight.w700)),
      content: Text(message, style: appTextStyle(fontSize: FontSize.body)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(L10nGateway.current.cancel, style: appTextStyle()),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          style: FilledButton.styleFrom(
            backgroundColor: destructive
                ? context.appColors.error
                : context.appColors.brandPrimary,
          ),
          child: Text(
            confirmLabel,
            style: appTextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
  return ok ?? false;
}

/// تاريخ بصيغة `YYYY-MM-DD` كما يتوقعها الـ API.
String isoDate(DateTime date) {
  final y = date.year.toString().padLeft(4, '0');
  final m = date.month.toString().padLeft(2, '0');
  final d = date.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

/// يفتح منتقي التاريخ ويُعيد التاريخ بصيغة API أو null عند الإلغاء.
Future<String?> pickIsoDate(BuildContext context, {String? current}) async {
  final initial = DateTime.tryParse(current ?? '') ?? DateTime.now();
  final picked = await showDatePicker(
    context: context,
    initialDate: initial,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  return picked == null ? null : isoDate(picked);
}

/// يُبقى الاسم للتوافق مع الشاشات القائمة، والتنفيذ الفعلي في [showAppSnack].
void showModuleSnack(BuildContext context, String message,
        {bool error = false}) =>
    showAppSnack(context, message, error: error);

/// تنسيق مبلغ بمنزلتين عشريتين.
String formatAmount(double value) => value.toStringAsFixed(2);

/// قائمة مرقّمة مع السحب للتحديث وزر "تحميل المزيد".
/// يُعاد تحميلها بتغيير [reloadToken] من الشاشة الأم.
class PagedList<T> extends ConsumerStatefulWidget {
  final Future<PagedResult<T>> Function(int page) fetch;
  final Widget Function(
    BuildContext context,
    T item,
    Future<void> Function() reload,
  ) itemBuilder;
  final String emptyText;
  final int reloadToken;
  final Widget? header;

  const PagedList({
    super.key,
    required this.fetch,
    required this.itemBuilder,
    required this.emptyText,
    this.reloadToken = 0,
    this.header,
  });

  @override
  ConsumerState<PagedList<T>> createState() => _PagedListState<T>();
}

class _PagedListState<T> extends ConsumerState<PagedList<T>> {
  late final _provider = pagedListProvider<T>(() => widget.fetch);

  PagedListController<T> get _controller => ref.read(_provider.notifier);

  @override
  void didUpdateWidget(covariant PagedList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reloadToken != widget.reloadToken) _controller.reset();
  }

  Future<void> _reset() => _controller.reset();

  /// الترويسة (بحث وفلاتر) تتمرّر مع القائمة بدل أن تثبت أعلى الشاشة.
  @override
  Widget build(BuildContext context) {
    final header = widget.header;
    final state = ref.watch(_provider);
    return RefreshIndicator(
      onRefresh: _reset,
      color: context.appColors.primaryLight,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (header != null) SliverToBoxAdapter(child: header),
          ..._buildSlivers(context, state),
        ],
      ),
    );
  }

  List<Widget> _buildSlivers(BuildContext context, PagedListState<T> state) {
    if (state.items.isEmpty) {
      final Widget message;
      if (state.isLoading) {
        message = const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        message = ModuleMessage(
          text: errorText(state.error!),
          icon: Icons.error_outline_rounded,
          color: context.appColors.error,
          onRetry: _reset,
        );
      } else {
        message = ModuleMessage(text: widget.emptyText);
      }
      return [SliverFillRemaining(hasScrollBody: false, child: message)];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, kAdminBottomInset),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              if (index < state.items.length) {
                return widget.itemBuilder(ctx, state.items[index], _reset);
              }
              return _buildFooter(ctx, state);
            },
            childCount: state.items.length + 1,
          ),
        ),
      ),
    ];
  }

  Widget _buildFooter(BuildContext context, PagedListState<T> state) {
    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (state.hasMore) {
      return Center(
        child: TextButton(
          onPressed: _controller.loadMore,
          child: Text(L10nGateway.current.loadMore, style: appTextStyle()),
        ),
      );
    }
    return const SizedBox(height: 8);
  }
}

/// حقل بحث لقوائم الوحدات: يطلب النتائج بعد توقّف الكتابة (350ms)،
/// أو فور الضغط على بحث. المسح يعيد القائمة كاملة.
class ModuleSearchBar extends StatefulWidget {
  final String hint;
  final ValueChanged<String> onSearch;

  const ModuleSearchBar({
    super.key,
    required this.hint,
    required this.onSearch,
  });

  @override
  State<ModuleSearchBar> createState() => _ModuleSearchBarState();
}

class _ModuleSearchBarState extends State<ModuleSearchBar> {
  final _ctrl = TextEditingController();
  Timer? _debounce;
  String _applied = '';

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    _debounce?.cancel();
    _debounce =
        Timer(const Duration(milliseconds: 350), () => _apply(_ctrl.text));
  }

  void _apply(String value) {
    final next = value.trim();
    if (next == _applied) return;
    _applied = next;
    widget.onSearch(next);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
      child: AdminSearchField(
        controller: _ctrl,
        hint: widget.hint,
        onSubmitted: (value) {
          _debounce?.cancel();
          _apply(value);
        },
      ),
    );
  }
}

/// أول حرف من أول كلمتين في الاسم، للصور الرمزية.
String moduleInitials(String name) {
  final parts = name.trim().split(RegExp(r'\s+'))
    ..removeWhere((p) => p.isEmpty);
  if (parts.isEmpty) return '?';
  if (parts.length == 1) return parts.first.substring(0, 1);
  return parts.first.substring(0, 1) + parts[1].substring(0, 1);
}
