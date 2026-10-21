import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/theme/app_theme.dart';

/// عناصر واجهة موحّدة لشاشات الإدارة (الرئيسية، الحلقات، الطلاب، المالية، الوحدات...).
///
/// تستخدم الألوان وبطاقات التطبيق نفسها (`AppColors` / `PremiumCard`)،
/// وتتكيّف مع الوضع الفاتح والداكن عبر `Theme.of(context)`.

/// مسافة سفلية تكفي لتجنّب شريط التنقل العائم أسفل الشاشة.
const double kAdminBottomInset = 120;

/// هوامش الصفحة الموحّدة: أفقية 16 ومسافة سفلية تحت شريط التنقل.
const EdgeInsets kAdminPagePadding =
    EdgeInsets.fromLTRB(16, 12, 16, kAdminBottomInset);

/// ألوان مشتقة من الوضع الحالي. النصوص لا تستخدم ألواناً ثابتة حتى تبقى قابلة للقراءة.
abstract final class AdminTheme {
  static const _lightBorder = Color(0xFFD5DECF);
  static const _darkBorder = Color(0xFF193222);

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color card(BuildContext context) =>
      isDark(context) ? AppColors.bgCard : AppColors.bgWhiteCard;

  static Color border(BuildContext context) =>
      isDark(context) ? _darkBorder : _lightBorder;

  static Color text(BuildContext context) =>
      isDark(context) ? AppColors.textOnDark : AppColors.textPrimary;

  static Color muted(BuildContext context) =>
      isDark(context) ? AppColors.textOnDarkSub : AppColors.textSecondary;

  static Color accent(BuildContext context) =>
      isDark(context) ? AppColors.primaryGlow : AppColors.primary;

  /// سهم "التالي" يتجه حسب اتجاه الصفحة (يسار في العربية، يمين في الإنجليزية).
  static IconData chevron(BuildContext context) =>
      Directionality.of(context) == TextDirection.rtl
          ? Icons.chevron_left_rounded
          : Icons.chevron_right_rounded;
}

/// شريط علوي متدرّج بنفس هوية الشريط الرئيسي للتطبيق.
class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;

  const AdminAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions = const [],
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight +
            (subtitle != null ? 14 : 0) +
            (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      flexibleSpace: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: appTextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
        ],
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}

/// أيقونة ملوّنة مستديرة الزوايا تُستخدم في البطاقات والرؤوس.
class AdminIconBubble extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const AdminIconBubble({
    super.key,
    required this.icon,
    required this.color,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      child: Icon(icon, color: color, size: size * 0.5),
    );
  }
}

/// بطاقة موحّدة: حدود خفيفة وتأثير ضغط، بنفس شكل `PremiumCard`.
class AdminCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color? accent;

  const AdminCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(20);
    final isDark = AdminTheme.isDark(context);
    return Material(
      color: AdminTheme.card(context),
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color:
                  accent?.withValues(alpha: 0.35) ?? AdminTheme.border(context),
            ),
            boxShadow: isDark
                ? const []
                : [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: child,
        ),
      ),
    );
  }
}

/// رأس الشاشة الداكن: عنوان وأيقونة ومقاييس اختيارية تظهر أسفله.
class AdminHero extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final List<AdminHeroMetric> metrics;

  const AdminHero({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.metrics = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.bgDeep, Color(0xFF1A3D0A), Color(0xFF0D4515)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppColors.heroShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: AppColors.gradientGold,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          if (metrics.isNotEmpty) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                for (var i = 0; i < metrics.length; i++) ...[
                  if (i > 0) const SizedBox(width: 8),
                  Expanded(child: _HeroMetricPill(metric: metrics[i])),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// بيانات مقياس يظهر داخل [AdminHero].
class AdminHeroMetric {
  final IconData icon;
  final String label;
  final String value;

  const AdminHeroMetric({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class _HeroMetricPill extends StatelessWidget {
  final AdminHeroMetric metric;
  const _HeroMetricPill({required this.metric});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(metric.icon, color: AppColors.goldLight, size: 18),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              metric.value,
              style: appTextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            metric.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTextStyle(
              fontSize: 11,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }
}

/// بطاقة إحصائية: أيقونة ملوّنة وقيمة كبيرة وعنوان.
class AdminStatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback? onTap;

  const AdminStatTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      accent: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AdminIconBubble(icon: icon, color: color, size: 36),
              const Spacer(),
              if (onTap != null)
                Icon(
                  AdminTheme.chevron(context),
                  size: 20,
                  color: AdminTheme.muted(context),
                ),
            ],
          ),
          const SizedBox(height: 12),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              value,
              style: appTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AdminTheme.text(context),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: appTextStyle(
              fontSize: 12,
              color: AdminTheme.muted(context),
            ),
          ),
        ],
      ),
    );
  }
}

/// شبكة بطاقات متساوية الارتفاع: عمودان على الهاتف وأربعة على الشاشات الواسعة.
class AdminStatGrid extends StatelessWidget {
  final List<Widget> tiles;
  final int? columns;

  const AdminStatGrid({super.key, required this.tiles, this.columns});

  static const double _gap = 10;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = columns ?? (constraints.maxWidth >= 560 ? 4 : 2);
        final rows = <Widget>[];
        for (var start = 0; start < tiles.length; start += cols) {
          final rowTiles = tiles.skip(start).take(cols).toList();
          rows.add(
            Padding(
              padding: EdgeInsets.only(
                bottom: start + cols < tiles.length ? _gap : 0,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var j = 0; j < cols; j++) ...[
                      if (j > 0) const SizedBox(width: _gap),
                      Expanded(
                        child: j < rowTiles.length
                            ? rowTiles[j]
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }
        return Column(children: rows);
      },
    );
  }
}

/// عنوان قسم مع أيقونة وإجراء اختياري.
class AdminSectionTitle extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? color;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AdminSectionTitle({
    super.key,
    required this.title,
    this.icon,
    this.color,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final accent = color ?? AdminTheme.accent(context);
    return Row(
      children: [
        if (icon != null) ...[
          AdminIconBubble(icon: icon!, color: accent, size: 32),
          const SizedBox(width: 10),
        ],
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: appTextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AdminTheme.text(context),
            ),
          ),
        ),
        if (actionLabel != null && onAction != null)
          TextButton(
            onPressed: onAction,
            style: TextButton.styleFrom(
              foregroundColor: accent,
              minimumSize: const Size(44, 44),
            ),
            child: Text(
              actionLabel!,
              style: appTextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
      ],
    );
  }
}

/// صورة رمزية بالأحرف الأولى من الاسم.
class AdminAvatar extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;

  const AdminAvatar({
    super.key,
    required this.text,
    this.color,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    final base = color;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: base == null
            ? AppColors.gradientPrimary
            : LinearGradient(
                colors: [base, base.withValues(alpha: 0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      child: Text(
        text,
        maxLines: 1,
        style: appTextStyle(
          fontSize: size * 0.3,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// شارة صغيرة بلون الحالة (نشط، منتهٍ، مدفوع...).
class AdminBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const AdminBadge({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: appTextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// حقل بحث بنفس شكل الحقول في التطبيق، مع زر مسح.
class AdminSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;

  const AdminSearchField({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = AdminTheme.border(context);
    final radius = BorderRadius.circular(16);
    final fill = AdminTheme.card(context);
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) => TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: autofocus,
        textInputAction: TextInputAction.search,
        style: appTextStyle(
          fontSize: 14,
          color: AdminTheme.text(context),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: appTextStyle(
            fontSize: 14,
            color: AdminTheme.muted(context),
          ),
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: value.text.isEmpty
              ? null
              : IconButton(
                  tooltip:
                      MaterialLocalizations.of(context).deleteButtonTooltip,
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () {
                    controller.clear();
                    onChanged?.call('');
                  },
                ),
          filled: true,
          fillColor: fill,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: radius,
            borderSide: BorderSide(color: border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: radius,
            borderSide: BorderSide(color: border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: radius,
            borderSide: BorderSide(
              color: AdminTheme.accent(context),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

/// شريط خيارات أفقي قابل للتمرير (فلاتر الحالة والفصل...).
class AdminChoiceBar<T> extends StatelessWidget {
  final List<T> options;
  final T selected;
  final String Function(T option) labelOf;
  final IconData? Function(T option)? iconOf;
  final ValueChanged<T> onSelected;

  const AdminChoiceBar({
    super.key,
    required this.options,
    required this.selected,
    required this.labelOf,
    required this.onSelected,
    this.iconOf,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AdminTheme.accent(context);
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final option = options[index];
          final isOn = option == selected;
          final icon = iconOf?.call(option);
          final foreground = isOn ? Colors.white : AdminTheme.muted(context);
          return Material(
            color: isOn ? accent : AdminTheme.card(context),
            shape: StadiumBorder(
              side: BorderSide(
                color: isOn ? accent : AdminTheme.border(context),
              ),
            ),
            child: InkWell(
              customBorder: const StadiumBorder(),
              onTap: () => onSelected(option),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 16, color: foreground),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      labelOf(option),
                      style: appTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: foreground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// حالة فارغة: أيقونة وعنوان ووصف اختياري.
class AdminEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const AdminEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AdminTheme.accent(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 36, color: accent),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: appTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AdminTheme.text(context),
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 6),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: appTextStyle(
                  fontSize: 13,
                  color: AdminTheme.muted(context),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// حالة خطأ مع زر إعادة المحاولة.
class AdminErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final String retryLabel;

  const AdminErrorState({
    super.key,
    required this.message,
    required this.onRetry,
    required this.retryLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded,
                size: 44, color: AppColors.error),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: appTextStyle(
                fontSize: 14,
                color: AdminTheme.text(context),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(120, 44),
              ),
              child: Text(retryLabel, style: appTextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}

/// سطر تفصيل: أيقونة صغيرة وعنوان وقيمة.
class AdminInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AdminInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AdminTheme.muted(context)),
          const SizedBox(width: 10),
          Text(
            label,
            style: appTextStyle(
              fontSize: 12,
              color: AdminTheme.muted(context),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value.isEmpty ? '—' : value,
              textAlign: TextAlign.end,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: appTextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AdminTheme.text(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// زر إجراء عائم موحّد بلون الهوية.
class AdminFab extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const AdminFab({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      icon: Icon(icon),
      label: Text(label, style: appTextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
