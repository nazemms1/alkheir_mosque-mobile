import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../core/navigation/app_tab.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student_model.dart';
import '../../../shared/widgets/rating_badge.dart';
import '../home_widget_registry.dart';

part 'widgets/home_hero_card.dart';
part 'widgets/home_quick_stats.dart';
part 'widgets/home_memorization_card.dart';
part 'widgets/home_tiles.dart';
part 'widgets/home_shared.dart';

/// ويدجتس الشاشة الرئيسية لولي الأمر/الطالب — مرتّبة حسب ظهورها.
/// لإضافة ويدجت جديد: أنشئ الويدجت ثم أضف HomeWidgetDef هنا فقط.
final List<HomeWidgetDef<TabContext>> parentHomeWidgets = [
  // البطاقة الترحيبية العلوية
  HomeWidgetDef(
    id: 'parent-hero',
    slivers: (context, ctx) => [
      SliverToBoxAdapter(
        child: _HeroCard(child: ctx.activeChild)
            .animate()
            .fadeIn(duration: 500.ms, curve: Curves.easeOut)
            .slideY(begin: -0.04, end: 0, duration: 500.ms),
      ),
      // Spacer to clear the floating stats card (bottom: -48 + safe margin)
      const SliverToBoxAdapter(child: SizedBox(height: 64)),
    ],
  ),
  // شريط اختيار الابن — يظهر فقط عند وجود أكثر من ابن
  HomeWidgetDef(
    id: 'parent-child-selector',
    visibleWhen: (_, ctx) => ctx.parentData!.children.length > 1,
    slivers: (context, ctx) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _ChildSelectorStrip(
            children: ctx.parentData!.children,
            selectedIndex: ctx.selectedChildIndex,
            onSelected: ctx.onChildSelected,
          ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
        ),
      ),
    ],
  ),
  // صف الإحصائيات السريعة
  HomeWidgetDef(
    id: 'parent-quick-stats',
    slivers: (context, ctx) => [
      SliverPadding(
        padding: EdgeInsets.fromLTRB(
            16, ctx.parentData!.children.length > 1 ? 16 : 0, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _QuickStatsRow(child: ctx.activeChild, onTabChange: ctx.onTabChange)
              .animate()
              .fadeIn(delay: 120.ms, duration: 450.ms)
              .slideY(begin: 0.06, end: 0, delay: 120.ms, duration: 450.ms),
        ),
      ),
    ],
  ),
  // بطاقة تقدم الحفظ
  HomeWidgetDef(
    id: 'parent-memorization',
    slivers: (context, ctx) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _MemorizationCard(
                  child: ctx.activeChild, onTap: () => ctx.onTabChange(3))
              .animate()
              .fadeIn(delay: 220.ms, duration: 450.ms)
              .slideY(begin: 0.06, end: 0, delay: 220.ms, duration: 450.ms),
        ),
      ),
    ],
  ),
  // آخر الإشعارات (عنوان + أحدث 3)
  HomeWidgetDef(
    id: 'parent-notifications',
    slivers: (context, ctx) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _SectionLabel(title: 'آخر الإشعارات', onMore: () {})
              .animate()
              .fadeIn(delay: 320.ms, duration: 400.ms),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => _NotifTile(n: ctx.parentData!.notifications[i])
                .animate()
                .fadeIn(delay: (360 + i * 60).ms, duration: 380.ms)
                .slideX(begin: 0.05, end: 0, delay: (360 + i * 60).ms),
            childCount: math.min(3, ctx.parentData!.notifications.length),
          ),
        ),
      ),
    ],
  ),
  // آخر التقييمات (عنوان + أحدث 2)
  HomeWidgetDef(
    id: 'parent-evaluations',
    slivers: (context, ctx) => [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
        sliver: SliverToBoxAdapter(
          child: _SectionLabel(
                  title: 'آخر التقييمات', onMore: () => ctx.onTabChange(4))
              .animate()
              .fadeIn(delay: 550.ms, duration: 400.ms),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 120),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => _EvalTile(eval: ctx.activeChild.evaluations[i])
                .animate()
                .fadeIn(delay: (590 + i * 60).ms, duration: 380.ms)
                .slideX(begin: 0.05, end: 0, delay: (590 + i * 60).ms),
            childCount: math.min(2, ctx.activeChild.evaluations.length),
          ),
        ),
      ),
    ],
  ),
];

class HomeScreen extends StatelessWidget {
  final TabContext ctx;

  const HomeScreen({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: buildHomeSlivers(
        context: context,
        token: ctx.token,
        registry: parentHomeWidgets,
        data: ctx,
      ),
    );
  }
}

// ─── Horizontal child selector strip ─────────────────────────────────────────
class _ChildSelectorStrip extends StatelessWidget {
  final List<ChildData> children;
  final int selectedIndex;
  final void Function(int) onSelected;

  const _ChildSelectorStrip({
    required this.children,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: children.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final child = children[i];
          final isSelected = i == selectedIndex;
          final name = child.student.name.split(' ').take(2).join(' ');
          return GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                gradient: isSelected ? AppColors.gradientPrimary : null,
                color: isSelected ? null : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary.withOpacity(0.0)
                      : AppColors.primary.withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: isSelected
                    ? [BoxShadow(color: AppColors.primary.withOpacity(0.35), blurRadius: 12, offset: const Offset(0, 4))]
                    : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelected
                          ? AppColors.gradientGold
                          : const LinearGradient(colors: [Color(0xFF9E9E9E), Color(0xFF757575)]),
                    ),
                    child: Center(
                      child: Text(
                        child.student.avatarInitials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      Text(
                        child.student.groupName,
                        style: TextStyle(
                          color: isSelected ? Colors.white.withOpacity(0.75) : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                          fontSize: 10,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
