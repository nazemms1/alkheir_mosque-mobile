import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/student_service.dart';

class ChildProfileScreen extends StatefulWidget {
  final StudentModel student;
  final bool shrinkWrap;
  const ChildProfileScreen({super.key, required this.student, this.shrinkWrap = false});

  @override
  State<ChildProfileScreen> createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  final _service = StudentService();
  ChildDetail? _detail;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchDetail();
  }

  @override
  void didUpdateWidget(ChildProfileScreen old) {
    super.didUpdateWidget(old);
    if (old.student.id != widget.student.id) {
      setState(() { _loading = true; _detail = null; });
      _fetchDetail();
    }
  }

  Future<void> _fetchDetail() async {
    final idInt = int.tryParse(widget.student.id);
    if (idInt == null) { setState(() => _loading = false); return; }
    try {
      final detail = await _service.fetchChildDetail(idInt);
      if (!mounted) return;
      setState(() { _detail = detail; _loading = false; });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // بناء StudentModel من ChildDetail إذا كانت متاحة
    final student = _detail != null ? _buildStudentFromDetail(_detail!) : widget.student;
    return _ChildProfileView(student: student, detail: _detail, loading: _loading, shrinkWrap: widget.shrinkWrap);
  }

  StudentModel _buildStudentFromDetail(ChildDetail d) => StudentModel(
    id: d.studentNumber,
    name: d.fullName,
    avatarInitials: d.avatarInitials,
    groupName: d.groupName,
    courseName: d.courseName,
    teacherName: d.teacherName,
    academicYear: d.gradeLevelName ?? '',
    enrollmentYear: d.joinedAt != null
        ? int.tryParse(d.joinedAt!.split('-').first) ?? DateTime.now().year
        : DateTime.now().year,
    phone: d.activeEnrollments.isNotEmpty
        ? d.activeEnrollments.first.group.teacherPhone
        : '',
    enrollmentId: d.activeEnrollments.isNotEmpty ? d.activeEnrollments.first.id : null,
  );
}

class _ChildProfileView extends StatelessWidget {
  final StudentModel student;
  final ChildDetail? detail;
  final bool loading;
  final bool shrinkWrap;

  const _ChildProfileView({
    required this.student,
    required this.detail,
    required this.loading,
    required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: _ProfileHero(student: student)
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: -0.03, end: 0, duration: 500.ms, curve: Curves.easeOut),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoCard(
              title: 'بيانات التسجيل',
              icon: Icons.badge_rounded,
              gradient: AppColors.gradientEmerald,
              items: [
                _Item('رقم الطالب', student.id),
                _Item('الاسم الكامل', student.name),
                if (detail != null) ...[
                  _Item('تاريخ الميلاد', detail!.birthDate ?? '-'),
                  _Item('المدرسة', detail!.schoolName ?? '-'),
                  _Item('المستوى الدراسي', detail!.gradeLevelName ?? '-'),
                ],
                _Item('سنة الالتحاق', '${student.enrollmentYear}م'),
              ],
            ).animate().fadeIn(delay: 120.ms, duration: 450.ms)
                .slideY(begin: 0.05, end: 0, delay: 120.ms, duration: 450.ms),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoCard(
              title: 'بيانات الحلقة',
              icon: Icons.groups_rounded,
              gradient: AppColors.gradientSapphire,
              items: [
                _Item('المجموعة', student.groupName),
                _Item('الدورة', student.courseName),
                _Item('المعلم', student.teacherName),
                if (detail != null && detail!.quranCurrentJuz != null)
                  _Item('الجزء الحالي', 'الجزء ${detail!.quranCurrentJuz}'),
                if (detail != null)
                  _Item('الصفحات المحفوظة', '${detail!.memorizedPages} صفحة'),
              ],
            ).animate().fadeIn(delay: 220.ms, duration: 450.ms)
                .slideY(begin: 0.05, end: 0, delay: 220.ms, duration: 450.ms),
          ),
        ),
        if (loading)
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 0),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ),
          ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoCard(
              title: 'بيانات التواصل',
              icon: Icons.contact_phone_rounded,
              gradient: AppColors.gradientTeal,
              items: [
                _Item('رقم جوال المعلم', student.phone, isLtr: true),
              ],
            ).animate().fadeIn(delay: 320.ms, duration: 450.ms)
                .slideY(begin: 0.05, end: 0, delay: 320.ms, duration: 450.ms),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
          sliver: SliverToBoxAdapter(
            child: _ContactCard()
                .animate()
                .fadeIn(delay: 420.ms, duration: 450.ms)
                .slideY(begin: 0.05, end: 0, delay: 420.ms, duration: 450.ms),
          ),
        ),
      ],
    );
  }
}

// ─── Profile Hero ─────────────────────────────────────────────────────────────
class _ProfileHero extends StatelessWidget {
  final StudentModel student;
  const _ProfileHero({required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF060E08), Color(0xFF0A2C10), Color(0xFF0D5016), Color(0xFF1A7A26)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ProfileAvatar(student: student),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo',
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.tag_rounded, color: Colors.white.withOpacity(0.5), size: 12),
                    const SizedBox(width: 3),
                    Text(
                      student.id,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12, fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _InfoRow(icon: Icons.groups_rounded,  label: student.groupName),
                const SizedBox(height: 5),
                _InfoRow(icon: Icons.person_rounded,  label: student.teacherName),
                const SizedBox(height: 5),
                _InfoRow(icon: Icons.school_rounded,  label: student.courseName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  final StudentModel student;
  const _ProfileAvatar({required this.student});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.gradientGold,
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withOpacity(0.5),
                blurRadius: 24,
                spreadRadius: 2,
              ),
            ],
            border: Border.all(color: Colors.white.withOpacity(0.25), width: 3),
          ),
          child: Center(
            child: Text(
              student.avatarInitials,
              style: const TextStyle(
                color: Colors.white, fontSize: 26,
                fontWeight: FontWeight.w800, fontFamily: 'Cairo',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              gradient: AppColors.gradientPrimary,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF060E08), width: 2),
            ),
            child: const Icon(Icons.verified_rounded, color: Colors.white, size: 13),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.goldLight, size: 13),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 12,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ─── Info Card ────────────────────────────────────────────────────────────────
class _Item {
  final String label, value;
  final bool isLtr;
  const _Item(this.label, this.value, {this.isLtr = false});
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final LinearGradient gradient;
  final List<_Item> items;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            spreadRadius: -3,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 3)),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: Colors.white.withOpacity(0.25)),
                  ),
                  child: Icon(icon, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                Text(title,
                    style: const TextStyle(
                      color: Colors.white, fontSize: 15,
                      fontWeight: FontWeight.w700, fontFamily: 'Cairo',
                    )),
              ],
            ),
          ),
          ...items.asMap().entries.map((e) {
            final isLast = e.key == items.length - 1;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(e.value.label,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.55))),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          e.value.value,
                          textAlign: e.value.isLtr ? TextAlign.left : TextAlign.end,
                          textDirection: e.value.isLtr ? TextDirection.ltr : null,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  const Divider(height: 1, indent: 18, endIndent: 18),
              ],
            );
          }),
        ],
      ),
    );
  }
}

// ─── Contact Card ─────────────────────────────────────────────────────────────
class _ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF071A0A), Color(0xFF0D4515), Color(0xFF1A6622)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.4),
            blurRadius: 28,
            spreadRadius: -4,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: const Color(0xFF25D366).withOpacity(0.18),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF25D366).withOpacity(0.35)),
                ),
                child: const Icon(Icons.chat_rounded, color: Color(0xFF25D366), size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('التواصل مع الإدارة',
                        style: TextStyle(
                          color: Colors.white, fontSize: 16,
                          fontWeight: FontWeight.w700, fontFamily: 'Cairo',
                        )),
                    Text('عبر واتساب للاستفسار عن الطالب',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.65),
                          fontSize: 12, fontFamily: 'Cairo',
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 3)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.chat_rounded, color: Color(0xFF25D366), size: 18),
                  SizedBox(width: 8),
                  Text('تواصل عبر واتساب',
                      style: TextStyle(
                        color: Color(0xFF25D366), fontSize: 15,
                        fontWeight: FontWeight.w700, fontFamily: 'Cairo',
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
