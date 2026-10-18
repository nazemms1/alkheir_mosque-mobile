import 'package:flutter/material.dart';

import '../../../../../app/core/http/api_error.dart';
import '../../../../../app/core/l10n/l10n_gateway.dart';
import '../../../../../app/core/utils/extensions/design_extension.dart';
import '../../../../../ui/themes/font_size.dart';
import '../../../../../ui/themes/theme_extension.dart';
import '../../../../../ui/themes/ui_constants.dart';

class ApiErrorWidget extends StatelessWidget {
  final ApiErrorType type;
  final String? message;
  final VoidCallback? onRetry;
  final bool isCompact;

  const ApiErrorWidget({
    super.key,
    required this.type,
    this.message,
    this.onRetry,
    this.isCompact = false,
  });

  IconData _getIcon() {
    switch (type) {
      case ApiErrorType.network:
        return Icons.wifi_off_rounded;
      case ApiErrorType.internalServer:
      case ApiErrorType.badGateway:
        return Icons.cloud_off_rounded;
      case ApiErrorType.notFound:
        return Icons.search_off_rounded;
      case ApiErrorType.unauthorized:
        return Icons.lock_outline_rounded;
      case ApiErrorType.forbidden:
        return Icons.gpp_bad_outlined;
      case ApiErrorType.requestTimeout:
        return Icons.timer_off_outlined;
      case ApiErrorType.badRequest:
      case ApiErrorType.conflict:
        return Icons.warning_amber_rounded;
      case ApiErrorType.cancelled:
        return Icons.cancel_outlined;
      case ApiErrorType.unexpected:
      case ApiErrorType.custom:
        return Icons.error_outline_rounded;
    }
  }

  String _getDefaultMessage(BuildContext context) {
    final l10n = context.l10n;
    switch (type) {
      case ApiErrorType.network:
        return l10n.errorsConnection;
      case ApiErrorType.internalServer:
      case ApiErrorType.badGateway:
        return l10n.errorsServer;
      case ApiErrorType.notFound:
        return l10n.errorsNotFound;
      case ApiErrorType.unauthorized:
        return l10n.errorsUnauthorized;
      case ApiErrorType.forbidden:
        return l10n.errorsForbidden;
      case ApiErrorType.requestTimeout:
        return l10n.errorsTimeout;
      case ApiErrorType.badRequest:
        return l10n.errorsBadRequest;
      case ApiErrorType.conflict:
      case ApiErrorType.cancelled:
      case ApiErrorType.unexpected:
      case ApiErrorType.custom:
        return l10n.errorsUnknown;
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveMessage = (message != null && message!.isNotEmpty)
        ? message!
        : _getDefaultMessage(context);

    if (isCompact) {
      return _buildCompact(context, effectiveMessage);
    }
    return _buildFull(context, effectiveMessage);
  }

  Widget _buildCompact(BuildContext context, String effectiveMessage) {
    final colors = context.appColors;
    final isDark = context.isDarkTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? colors.error.withValues(alpha: 0.15)
            : colors.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
        border: Border.all(
          color: colors.error.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getIcon(),
            color: colors.error,
            size: 22,
          ),
          12.horizontalSpace,
          Expanded(
            child: Text(
              effectiveMessage,
              style: TextStyle(
                fontSize: FontSize.s13,
                fontWeight: FontWeight.w500,
                color: isDark ? const Color(0xFFFCA5A5) : colors.error,
              ),
            ),
          ),
          if (onRetry != null) ...[
            8.horizontalSpace,
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              iconSize: 20,
              color: colors.error,
              tooltip: context.l10n.maintenanceRetry,
              onPressed: onRetry,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFull(BuildContext context, String effectiveMessage) {
    final colors = context.appColors;
    final isDark = context.isDarkTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? colors.error.withValues(alpha: 0.15)
                    : colors.error.withValues(alpha: 0.08),
              ),
              child: Icon(
                _getIcon(),
                size: 48,
                color: colors.error,
              ),
            ),
            20.verticalSpace,
            Text(
              effectiveMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.s16,
                fontWeight: FontWeight.w600,
                color: isDark ? const Color(0xFFF1F5F9) : const Color(0xFF1E293B),
                height: 1.4,
              ),
            ),
            if (onRetry != null) ...[
              24.verticalSpace,
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: Text(context.l10n.maintenanceRetry),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: Colors.white,
                  padding: UIConstants.buttonPadding,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
