import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:alkheir_mosque/ui/themes/app_style.dart';

enum AutoSaveStatus { idle, saving, saved, error }

/// حفظ تلقائي متسلسل: كل تغيير يُرسل فوراً، ولا يتداخل حفظان في وقت واحد.
///
/// إن تغيّرت البيانات أثناء حفظ جارٍ، يُعاد الإرسال بآخر حالة بعد انتهائه،
/// فالحالة النهائية على الخادم تطابق ما يراه المستخدم دائماً.
/// عند الفشل تتوقف الإعادة التلقائية ويُعرض زر لإعادة المحاولة بدل تجاهل الخطأ.
class AutoSaveController extends ChangeNotifier {
  AutoSaveController(this._persist);

  final Future<void> Function() _persist;
  AutoSaveStatus _status = AutoSaveStatus.idle;
  Object? _lastError;
  DateTime? _savedAt;
  bool _running = false;
  bool _dirty = false;
  bool _disposed = false;

  AutoSaveStatus get status => _status;
  Object? get lastError => _lastError;
  DateTime? get savedAt => _savedAt;

  /// يطلب حفظ الحالة الحالية. آمن للاستدعاء المتكرر أثناء الحفظ.
  Future<void> request() async {
    _dirty = true;
    if (_running) return;
    _running = true;
    try {
      while (_dirty && !_disposed) {
        _dirty = false;
        _set(AutoSaveStatus.saving);
        try {
          await _persist();
          _lastError = null;
          _savedAt = DateTime.now();
          _set(AutoSaveStatus.saved);
        } catch (error) {
          _lastError = error;
          _dirty = false;
          _set(AutoSaveStatus.error);
          return;
        }
      }
    } finally {
      _running = false;
    }
  }

  void _set(AutoSaveStatus value) {
    if (_disposed) return;
    _status = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}

/// شريط حالة الحفظ الموحّد لكل شاشات التعديل المباشر.
class AutoSaveIndicator extends StatelessWidget {
  final AutoSaveController controller;
  final VoidCallback? onRetry;

  const AutoSaveIndicator({
    super.key,
    required this.controller,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final (IconData? icon, String text, Color color, bool tappable) =
            switch (controller.status) {
          AutoSaveStatus.saving => (
              null,
              L10nGateway.current.autoSaveSaving,
              context.appColors.textSecondary,
              false,
            ),
          AutoSaveStatus.saved => (
              Icons.check_circle_rounded,
              L10nGateway.current.autoSaveSaved,
              context.appColors.success,
              false,
            ),
          AutoSaveStatus.error => (
              Icons.error_outline_rounded,
              L10nGateway.current.autoSaveFailed,
              context.appColors.error,
              onRetry != null,
            ),
          AutoSaveStatus.idle => (
              Icons.info_outline_rounded,
              L10nGateway.current.autoSaveHint,
              context.appColors.textMuted,
              false,
            ),
        };

        final content = Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon == null)
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: color,
                  ),
                )
              else
                Icon(icon, size: 16, color: color),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: appTextStyle(
                    fontSize: FontSize.caption,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        );

        return Align(
          alignment: AlignmentDirectional.centerEnd,
          child: tappable
              ? InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: onRetry,
                  child: content,
                )
              : content,
        );
      },
    );
  }
}
