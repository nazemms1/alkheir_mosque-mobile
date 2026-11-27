import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/management_actions_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

/// بحث عن طالب واختياره. ما بعد الاختيار تحدده الشاشة المستدعية عبر [onPicked].
class StudentPickerScreen extends ConsumerStatefulWidget {
  final AuthToken token;
  final String title;
  final Future<void> Function(BuildContext context, StudentListItem student)
      onPicked;

  const StudentPickerScreen({
    super.key,
    required this.token,
    required this.title,
    required this.onPicked,
  });

  @override
  ConsumerState<StudentPickerScreen> createState() =>
      _StudentPickerScreenState();
}

class _StudentPickerScreenState extends ConsumerState<StudentPickerScreen> {
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
    if (!ModuleAccess.canViewStudents(widget.token)) {
      return ModuleScaffold(
        title: widget.title,
        body: const ModuleAccessDenied(),
      );
    }
    return ModuleScaffold(
      title: widget.title,
      body: PagedList<StudentListItem>(
        reloadToken: _reloadToken,
        emptyText: context.l10n.noStudentsMatchTheSearch,
        header: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _searchCtrl,
            textInputAction: TextInputAction.search,
            style: appTextStyle(),
            decoration: InputDecoration(
              hintText: context.l10n.searchByNameOrStudent,
              prefixIcon: const Icon(Icons.search_rounded),
            ),
            onSubmitted: (value) => setState(() {
              _search = value.trim();
              _reloadToken++;
            }),
          ),
        ),
        fetch: (page) => ref
            .read(managementActionsControllerProvider.notifier)
            .query((r) => r.students(page: page, search: _search)),
        itemBuilder: (context, student, _) => ModuleCard(
          accent: student.status == 'active'
              ? context.appColors.primaryLight
              : context.appColors.textMuted,
          onTap: () => widget.onPicked(context, student),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.fullName,
                      style: appTextStyle(
                        fontSize: FontSize.bodyLarge,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${student.studentNumber ?? ''}  ·  ${student.gradeLevel ?? ''}',
                      style: appTextStyle(
                          fontSize: FontSize.caption,
                          color: moduleMuted(context)),
                    ),
                    if (student.parentName != null)
                      Text(
                        L10nGateway.current.parent2((student.parentName ?? '')),
                        style: appTextStyle(
                            fontSize: FontSize.caption,
                            color: moduleMuted(context)),
                      ),
                  ],
                ),
              ),
              Icon(moduleChevronForward(context), color: moduleMuted(context)),
            ],
          ),
        ),
      ),
    );
  }
}
