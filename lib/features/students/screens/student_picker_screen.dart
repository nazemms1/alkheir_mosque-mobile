import 'package:flutter/material.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/rbac/module_access.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/auth_token.dart';
import '../../../data/models/group_student_model.dart';
import '../../../data/services/management_service.dart';
import '../../management/widgets/module_widgets.dart';

/// بحث عن طالب واختياره. ما بعد الاختيار تحدده الشاشة المستدعية عبر [onPicked].
class StudentPickerScreen extends StatefulWidget {
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
  State<StudentPickerScreen> createState() => _StudentPickerScreenState();
}

class _StudentPickerScreenState extends State<StudentPickerScreen> {
  final _service = ManagementService();
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
        emptyText: tr('لا يوجد طلاب مطابقون للبحث'),
        header: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _searchCtrl,
            textInputAction: TextInputAction.search,
            style: appTextStyle(),
            decoration: InputDecoration(
              hintText: tr('بحث بالاسم أو رقم الطالب'),
              prefixIcon: const Icon(Icons.search_rounded),
            ),
            onSubmitted: (value) => setState(() {
              _search = value.trim();
              _reloadToken++;
            }),
          ),
        ),
        fetch: (page) => _service.students(page: page, search: _search),
        itemBuilder: (context, student, _) => ModuleCard(
          accent: student.status == 'active'
              ? AppColors.primaryLight
              : AppColors.textMuted,
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
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${student.studentNumber ?? ''}  ·  ${student.gradeLevel ?? ''}',
                      style: appTextStyle(
                          fontSize: 12, color: moduleMuted(context)),
                    ),
                    if (student.parentName != null)
                      Text(
                        trf('ولي الأمر: {0}', [student.parentName]),
                        style: appTextStyle(
                            fontSize: 11, color: moduleMuted(context)),
                      ),
                  ],
                ),
              ),
              Icon(Icons.chevron_left_rounded, color: moduleMuted(context)),
            ],
          ),
        ),
      ),
    );
  }
}
