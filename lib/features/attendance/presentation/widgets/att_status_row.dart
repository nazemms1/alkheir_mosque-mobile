import 'package:alkheir_mosque/ui/themes/font_size.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';

/// صف حضور موحّد: اسم الشخص وقائمة اختيار حالته. يُستخدم للطلاب والمعلمين
/// لتبقى الصفوف بالشكل نفسه في كل شاشات الحضور.
class AttendanceStatusRow extends StatelessWidget {
  final String name;
  final List<RefItem> statuses;
  final int? value;
  final bool enabled;
  final ValueChanged<int> onChanged;

  const AttendanceStatusRow({
    super.key,
    required this.name,
    required this.statuses,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final current = statuses.any((s) => s.id == value) ? value : null;
    return ModuleCard(
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: appTextStyle(fontSize: FontSize.label, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 150,
            child: DropdownButtonFormField<int>(
              // المفتاح يتغيّر مع القيمة حتى تُعرض الحالة المحمّلة من الخادم.
              key: ValueKey('att-status-${value ?? 'none'}'),
              initialValue: current,
              isExpanded: true,
              decoration: const InputDecoration(isDense: true),
              items: [
                for (final s in statuses)
                  DropdownMenuItem(
                    value: s.id,
                    child: Text(s.name, style: appTextStyle(fontSize: FontSize.caption)),
                  ),
              ],
              onChanged: enabled
                  ? (id) {
                      if (id != null) onChanged(id);
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
