import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/app/core/config/support_contact.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/parent/child_profile/ui/providers/child_profile_controller.dart';

class ChildProfileScreen extends ConsumerWidget {
  final StudentModel student;
  final bool shrinkWrap;
  const ChildProfileScreen(
      {super.key, required this.student, this.shrinkWrap = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch(childProfileControllerProvider(int.tryParse(student.id)));
    final detail = state.valueOrNull;
    // بناء StudentModel من ChildDetail إذا كانت متاحة
    return _ChildProfileView(
        student: detail != null ? _buildStudentFromDetail(detail) : student,
        detail: detail,
        loading: state.isLoading,
        shrinkWrap: shrinkWrap);
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
        enrollmentId: d.activeEnrollments.isNotEmpty
            ? d.activeEnrollments.first.id
            : null,
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
      physics: shrinkWrap
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: _ProfileHero(student: student)
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(
                  begin: -0.03,
                  end: 0,
                  duration: 500.ms,
                  curve: Curves.easeOut),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoCard(
              title: context.l10n.enrollmentDetails,
              icon: Icons.badge_rounded,
              gradient: context.appColors.gradientEmerald,
              items: [
                _Item(context.l10n.studentNumber, student.id),
                _Item(context.l10n.fullName, student.name),
                if (detail != null) ...[
                  _Item(context.l10n.dateOfBirth, detail!.birthDate ?? '-'),
                  _Item(context.l10n.school, detail!.schoolName ?? '-'),
                  _Item(
                      context.l10n.gradeLevel2, detail!.gradeLevelName ?? '-'),
                ],
                _Item(context.l10n.enrollmentYear,
                    context.l10n.m(student.enrollmentYear)),
              ],
            )
                .animate()
                .fadeIn(delay: 120.ms, duration: 450.ms)
                .slideY(begin: 0.05, end: 0, delay: 120.ms, duration: 450.ms),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoCard(
              title: context.l10n.groupDetails,
              icon: Icons.groups_rounded,
              gradient: context.appColors.gradientSapphire,
              items: [
                _Item(context.l10n.group2, student.groupName),
                _Item(context.l10n.course3, student.courseName),
                _Item(context.l10n.teacher, student.teacherName),
                if (detail != null && detail!.quranCurrentJuz != null)
                  _Item(context.l10n.currentJuz,
                      context.l10n.juz((detail!.quranCurrentJuz ?? ''))),
                if (detail != null)
                  _Item(context.l10n.savedPages,
                      context.l10n.pages2(detail!.memorizedPages)),
              ],
            )
                .animate()
                .fadeIn(delay: 220.ms, duration: 450.ms)
                .slideY(begin: 0.05, end: 0, delay: 220.ms, duration: 450.ms),
          ),
        ),
        if (loading)
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 0),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.appColors.primaryLight,
                  ),
                ),
              ),
            ),
          ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          sliver: SliverToBoxAdapter(
            child: _InfoCard(
              title: context.l10n.contactDetails,
              icon: Icons.contact_phone_rounded,
              gradient: context.appColors.gradientTeal,
              items: [
                _Item(context.l10n.teacherSMobileNumber, student.phone,
                    isLtr: true),
              ],
            )
                .animate()
                .fadeIn(delay: 320.ms, duration: 450.ms)
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceBlackGreen,
            Color(0xFF0A2C10),
            context.appColors.brandDeep,
            context.appColors.brandGreen
          ],
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
                    fontSize: FontSize.headlineSmall,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Dubai',
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.tag_rounded,
                        color: Colors.white.withValues(alpha: 0.5), size: 12),
                    const SizedBox(width: 3),
                    Text(
                      student.id,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: FontSize.caption,
                        fontFamily: 'Dubai',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _InfoRow(icon: Icons.groups_rounded, label: student.groupName),
                const SizedBox(height: 5),
                _InfoRow(
                    icon: Icons.person_rounded, label: student.teacherName),
                const SizedBox(height: 5),
                _InfoRow(icon: Icons.school_rounded, label: student.courseName),
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
            gradient: context.appColors.gradientGold,
            boxShadow: [
              BoxShadow(
                color: context.appColors.gold.withValues(alpha: 0.5),
                blurRadius: 24,
                spreadRadius: 2,
              ),
            ],
            border: Border.all(
                color: Colors.white.withValues(alpha: 0.25), width: 3),
          ),
          child: Center(
            child: Text(
              student.avatarInitials,
              style: const TextStyle(
                color: Colors.white,
                fontSize: FontSize.display,
                fontWeight: FontWeight.w800,
                fontFamily: 'Dubai',
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
              gradient: context.appColors.gradientPrimary,
              shape: BoxShape.circle,
              border: Border.all(
                  color: context.appColors.surfaceBlackGreen, width: 2),
            ),
            child: const Icon(Icons.verified_rounded,
                color: Colors.white, size: 13),
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
        Icon(icon, color: context.appColors.goldLight, size: 13),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: FontSize.caption,
              fontFamily: 'Dubai',
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
            color: Colors.black.withValues(alpha: 0.06),
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(22)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3)),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(11),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Icon(icon, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                Text(title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.bodyLarge,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Dubai',
                    )),
              ],
            ),
          ),
          ...items.asMap().entries.map((e) {
            final isLast = e.key == items.length - 1;
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(e.value.label,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.55))),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          e.value.value,
                          textAlign:
                              e.value.isLtr ? TextAlign.left : TextAlign.end,
                          textDirection:
                              e.value.isLtr ? TextDirection.ltr : null,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
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
        gradient: LinearGradient(
          colors: [
            context.appColors.surfaceDeepGreen,
            context.appColors.brandMid,
            Color(0xFF1A6622)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: context.appColors.brandPrimary.withValues(alpha: 0.4),
            blurRadius: 28,
            spreadRadius: -4,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
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
                  color: context.appColors.whatsapp.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color:
                          context.appColors.whatsapp.withValues(alpha: 0.35)),
                ),
                child: Icon(Icons.chat_rounded,
                    color: context.appColors.whatsapp, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.contactAdministration,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.title,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Dubai',
                        )),
                    Text(context.l10n.viaWhatsappToInquireAbout,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.65),
                          fontSize: FontSize.caption,
                          fontFamily: 'Dubai',
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () => openSupportWhatsApp(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 3)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_rounded,
                      color: context.appColors.whatsapp, size: 18),
                  const SizedBox(width: 8),
                  Text(context.l10n.contactViaWhatsapp,
                      style: TextStyle(
                        color: context.appColors.whatsapp,
                        fontSize: FontSize.bodyLarge,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Dubai',
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
