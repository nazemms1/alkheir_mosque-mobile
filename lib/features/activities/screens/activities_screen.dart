import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_toast.dart';
import '../../../data/models/student_model.dart';
import '../../../data/services/api_service.dart';
import '../../../data/services/student_service.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final _service = StudentService();
  List<ParentActivity> _activities = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final activities = await _service.fetchActivities();
      if (!mounted) return;
      setState(() {
        _activities = activities;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _respond(ParentActivity activity, ActivityChildEligibility child,
      String response) async {
    try {
      await _service.respondToActivity(activity.id,
          studentId: child.studentId, response: response);
      if (!mounted) return;
      AppToast.success(
          context,
          response == 'registered'
              ? 'تم تسجيل ${child.studentName}'
              : 'تم الاعتذار عن ${child.studentName}');
      _load();
    } on ApiException catch (e) {
      if (!mounted) return;
      AppToast.error(context, e.message);
    } catch (_) {
      if (!mounted) return;
      AppToast.error(context, 'حدث خطأ، حاول مرة أخرى');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded,
                size: 48, color: AppColors.error),
            const SizedBox(height: 12),
            Text(_error!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Cairo')),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: _load,
                child: const Text('إعادة المحاولة',
                    style: TextStyle(fontFamily: 'Cairo'))),
          ],
        ),
      );
    }
    if (_activities.isEmpty) {
      return const Center(
        child: Text('لا توجد أنشطة متاحة حالياً',
            style: TextStyle(fontFamily: 'Cairo', color: AppColors.textMuted)),
      );
    }
    return RefreshIndicator(
      onRefresh: _load,
      color: AppColors.primaryLight,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        itemCount: _activities.length,
        itemBuilder: (_, i) => _ActivityCard(
          activity: _activities[i],
          onRespond: (child, response) =>
              _respond(_activities[i], child, response),
        )
            .animate()
            .fadeIn(delay: (i * 50).ms, duration: 350.ms)
            .slideY(begin: 0.05, end: 0, delay: (i * 50).ms),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientPrimary,
          boxShadow: [
            BoxShadow(
                color: Color(0x30000000), blurRadius: 12, offset: Offset(0, 3))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.glassWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white, size: 18),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text('الأنشطة',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final ParentActivity activity;
  final void Function(ActivityChildEligibility child, String response)
      onRespond;
  const _ActivityCard({required this.activity, required this.onRespond});

  @override
  Widget build(BuildContext context) {
    final color =
        activity.isActive ? AppColors.primaryLight : AppColors.textMuted;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(Icons.event_rounded, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity.title,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onSurface),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    if (activity.groupName != null)
                      Text(activity.groupName!,
                          style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 11,
                              color: AppColors.textMuted)),
                  ],
                ),
              ),
              if (activity.feeAmount > 0)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: AppColors.gold.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('${activity.feeAmount.toInt()}',
                      style: const TextStyle(
                          color: AppColors.gold,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Cairo')),
                ),
            ],
          ),
          if (activity.description != null &&
              activity.description!.trim().isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(activity.description!,
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    color: AppColors.textSecondary),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
          ],
          const SizedBox(height: 12),
          ...activity.children.map((child) => Padding(
                padding: const EdgeInsets.only(top: 6),
                child: _ChildResponseRow(
                  child: child,
                  activityActive: activity.isActive,
                  onRespond: (response) => onRespond(child, response),
                ),
              )),
        ],
      ),
    );
  }
}

class _ChildResponseRow extends StatelessWidget {
  final ActivityChildEligibility child;
  final bool activityActive;
  final void Function(String response) onRespond;
  const _ChildResponseRow(
      {required this.child,
      required this.activityActive,
      required this.onRespond});

  @override
  Widget build(BuildContext context) {
    final registered = child.responseStatus == 'registered';
    final declined = child.responseStatus == 'declined';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(child.studentName,
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ),
          if (registered)
            const _StatusChip(label: 'مسجَّل', color: AppColors.success)
          else if (declined)
            const _StatusChip(label: 'معتذر', color: AppColors.textMuted)
          else if (child.canRespond && activityActive) ...[
            _RespondButton(
                label: 'تسجيل',
                color: AppColors.success,
                onTap: () => onRespond('registered')),
            const SizedBox(width: 8),
          ] else
            const _StatusChip(label: 'غير متاح', color: AppColors.textMuted),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20)),
      child: Text(label,
          style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              fontFamily: 'Cairo')),
    );
  }
}

class _RespondButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _RespondButton(
      {required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                fontFamily: 'Cairo')),
      ),
    );
  }
}
