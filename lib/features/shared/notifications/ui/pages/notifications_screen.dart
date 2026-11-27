import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';
import 'package:alkheir_mosque/features/shared/notifications/ui/providers/notifications_controller.dart';
import 'package:alkheir_mosque/ui/widgets/admin_ui.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  final int? studentId;
  const NotificationsScreen({super.key, this.studentId});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  NotificationsControllerProvider get _provider =>
      notificationsControllerProvider(widget.studentId);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  static final _sourceIcons = {
    NoteAuthor.teacher: Icons.school_rounded,
    NoteAuthor.admin: Icons.admin_panel_settings_rounded,
    NoteAuthor.parent: Icons.person_rounded,
  };
  static Map<NoteAuthor, Color> _sourceColors(BuildContext context) => {
        NoteAuthor.teacher: context.appColors.info,
        NoteAuthor.admin: context.appColors.gold,
        NoteAuthor.parent: context.appColors.primaryLight,
      };
  // getter لا final: النصوص تُترجم عند كل بناء فتتبع اللغة الحالية
  static Map<NoteAuthor, String> get _sourceLabels => {
        NoteAuthor.teacher: L10nGateway.current.teacher2,
        NoteAuthor.admin: L10nGateway.current.administration,
        NoteAuthor.parent: L10nGateway.current.parent4,
      };

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);
    final notes = state.valueOrNull ?? const <NoteMessage>[];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AdminAppBar(
        title: context.l10n.notifications,
        subtitle: notes.isNotEmpty ? context.l10n.noteS(notes.length) : null,
      ),
      body: FadeTransition(
        opacity: _fade,
        child: switch (state) {
          AsyncData(:final value) => _buildNotes(value),
          AsyncError(:final error) => _buildError(errorText(error)),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline_rounded,
              size: 48, color: context.appColors.error),
          const SizedBox(height: 12),
          Text(error,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Dubai', color: context.appColors.textSecondary)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.invalidate(_provider),
            child: Text(L10nGateway.current.tryAgain,
                style: const TextStyle(fontFamily: 'Dubai')),
          ),
        ],
      ),
    );
  }

  Widget _buildNotes(List<NoteMessage> notes) {
    if (notes.isEmpty) return const _EmptyNotifications();

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: _GroupHeader(
                  title: L10nGateway.current.notes2, count: notes.length)
              .animate()
              .fadeIn(delay: 100.ms, duration: 350.ms)
              .slideX(begin: 0.04, end: 0, delay: 100.ms),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) => _NoteCard(
                n: notes[i],
                icon: _sourceIcons[notes[i].author] ?? Icons.info_rounded,
                color: _sourceColors(context)[notes[i].author] ??
                    context.appColors.textSecondary,
                label: _sourceLabels[notes[i].author] ??
                    L10nGateway.current.general,
              )
                  .animate()
                  .fadeIn(delay: (150 + i * 55).ms, duration: 350.ms)
                  .slideX(begin: 0.04, end: 0, delay: (150 + i * 55).ms),
              childCount: notes.length,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Group Header ─────────────────────────────────────────────────────────────
class _GroupHeader extends StatelessWidget {
  final String title;
  final int count;
  const _GroupHeader({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              gradient: context.appColors.gradientPrimary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: context.appColors.primaryLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                color: context.appColors.primaryLight,
                fontSize: FontSize.caption,
                fontWeight: FontWeight.w700,
                fontFamily: 'Dubai',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Note Card ────────────────────────────────────────────────────────────────
class _NoteCard extends StatelessWidget {
  final NoteMessage n;
  final IconData icon;
  final Color color;
  final String label;
  const _NoteCard({
    required this.n,
    required this.icon,
    required this.color,
    required this.label,
  });

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 60) return L10nGateway.current.minAgo(diff.inMinutes);
    if (diff.inHours < 24) return L10nGateway.current.hoursAgo(diff.inHours);
    if (diff.inDays == 1) return L10nGateway.current.yesterday;
    return L10nGateway.current.daysAgo(diff.inDays);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(18)),
            ),
          ),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          n.authorName,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: color,
                            fontSize: FontSize.caption,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Dubai',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    n.content,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.75),
                          height: 1.4,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.schedule_rounded,
                          size: 11,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.4)),
                      const SizedBox(width: 3),
                      Text(
                        _timeAgo(n.dateTime),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.4),
                              fontSize: FontSize.caption,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}

// ─── Empty State ──────────────────────────────────────────────────────────────
class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      context.appColors.primaryLight.withValues(alpha: 0.15),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: context.appColors.primaryLight.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: context.appColors.primaryLight
                          .withValues(alpha: 0.2)),
                ),
                child: Icon(
                  Icons.notifications_off_outlined,
                  size: 36,
                  color: context.appColors.primaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            context.l10n.noNotes,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.anyNotesFromTheTeacher,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.appColors.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}
