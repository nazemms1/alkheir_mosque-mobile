import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/features/auth/domain/repositories/auth_repository.dart';
import 'package:alkheir_mosque/app/core/services/url_launcher_service.dart';

/// عناصر واجهة مشتركة لشاشات وحدات الإدارة (المالية، الأولياء، المعلمون...).

Color moduleMuted(BuildContext context) =>
    Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);

/// هيكل شاشة وحدة: شريط علوي متدرّج بألوان الهوية ومحتوى.
class ModuleScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;

  const ModuleScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions = const [],
    this.floatingActionButton,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: appTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: actions,
        bottom: bottom,
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: color ?? moduleMuted(context)),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: appTextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(tr('إعادة المحاولة'), style: appTextStyle()),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// شاشة بديلة عند غياب الصلاحية — لا تُظهر أي بيانات.
class ModuleAccessDenied extends StatelessWidget {
  const ModuleAccessDenied({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleMessage(
      icon: Icons.lock_outline_rounded,
      text: tr('ليس لديك صلاحية لعرض هذه الشاشة'),
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
    final theme = Theme.of(context);
    final borderColor = (accent ?? theme.dividerColor).withValues(alpha: 0.3);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: borderColor),
            ),
            child: child,
          ),
        ),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: appTextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
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
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: onTap != null
            ? AppColors.primaryLight
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
              style: appTextStyle(fontSize: 12, color: moduleMuted(context)),
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
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: appTextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: appTextStyle(
                    fontSize: 12,
                    color: moduleMuted(context),
                  ),
                ),
              const SizedBox(height: 12),
              for (final row in rows) ...[
                if (_isPhoneField(row.key, row.value))
                  InfoRow(
                    label: row.key,
                    value: row.value,
                    onTap: () => UrlLauncherService().launchPhone(row.value),
                    trailing: Tooltip(
                      message: tr('اتصال بالرقم'),
                      child: GestureDetector(
                        onTap: () =>
                            UrlLauncherService().launchPhone(row.value),
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color:
                                AppColors.primaryLight.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.primaryLight
                                  .withValues(alpha: 0.25),
                            ),
                          ),
                          child: const Icon(
                            Icons.phone_in_talk_rounded,
                            size: 15,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  InfoRow(label: row.key, value: row.value),
              ],
              if (actions.isNotEmpty) ...[
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final action in actions)
                      OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context, action.id),
                        icon: Icon(action.icon, size: 18),
                        label: Text(action.label, style: appTextStyle()),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: action.destructive
                              ? AppColors.error
                              : AppColors.primary,
                        ),
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// نافذة نموذج سفلية تتكيّف مع لوحة المفاتيح.
class ModuleFormSheet extends StatelessWidget {
  final String title;
  final Widget child;

  const ModuleFormSheet({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final keyboard = MediaQuery.viewInsetsOf(context).bottom;
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 12, 20, 20 + keyboard),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: appTextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 14),
              child,
            ],
          ),
        ),
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
      content: Text(message, style: appTextStyle(fontSize: 14)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(tr('إلغاء'), style: appTextStyle()),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          style: FilledButton.styleFrom(
            backgroundColor: destructive ? AppColors.error : AppColors.primary,
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

void showModuleSnack(BuildContext context, String message,
    {bool error = false}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message, style: appTextStyle(color: Colors.white)),
        backgroundColor: error ? AppColors.error : AppColors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
}

/// نص خطأ مفهوم للمستخدم: رسائل الخادم كما هي، وغيرها برسالة عامة.
String errorText(Object error) {
  if (error is ApiException || error is AuthException) return error.toString();
  return tr('تعذّر إكمال الطلب. حاول مرة أخرى.');
}

/// تنسيق مبلغ بمنزلتين عشريتين.
String formatAmount(double value) => value.toStringAsFixed(2);

/// قائمة مرقّمة مع السحب للتحديث وزر "تحميل المزيد".
/// يُعاد تحميلها بتغيير [reloadToken] من الشاشة الأم.
class PagedList<T> extends StatefulWidget {
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
  State<PagedList<T>> createState() => _PagedListState<T>();
}

class _PagedListState<T> extends State<PagedList<T>> {
  final List<T> _items = [];
  int _currentPage = 0;
  int _lastPage = 1;
  bool _loading = true;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _fetch(1);
  }

  @override
  void didUpdateWidget(covariant PagedList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.reloadToken != widget.reloadToken) _reset();
  }

  Future<void> _reset() {
    setState(() {
      _items.clear();
      _error = null;
      _loading = true;
    });
    return _fetch(1);
  }

  Future<void> _loadMore() {
    setState(() => _loading = true);
    return _fetch(_currentPage + 1);
  }

  Future<void> _fetch(int page) async {
    try {
      final result = await widget.fetch(page);
      if (!mounted) return;
      setState(() {
        _items.addAll(result.items);
        _currentPage = page;
        _lastPage = result.lastPage;
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
    final body = _buildBody(context);
    final header = widget.header;
    if (header == null) return body;
    return Column(
      children: [
        header,
        Expanded(child: body),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_items.isEmpty) {
      if (_loading) return const Center(child: CircularProgressIndicator());
      if (_error != null) {
        return ModuleMessage(
          text: errorText(_error!),
          icon: Icons.error_outline_rounded,
          color: AppColors.error,
          onRetry: _reset,
        );
      }
      return ModuleMessage(text: widget.emptyText);
    }
    return RefreshIndicator(
      onRefresh: _reset,
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
        itemCount: _items.length + 1,
        itemBuilder: (ctx, index) {
          if (index < _items.length) {
            return widget.itemBuilder(ctx, _items[index], _reset);
          }
          return _buildFooter(ctx);
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (_currentPage < _lastPage) {
      return Center(
        child: TextButton(
          onPressed: _loadMore,
          child: Text(tr('تحميل المزيد'), style: appTextStyle()),
        ),
      );
    }
    return const SizedBox(height: 8);
  }
}
