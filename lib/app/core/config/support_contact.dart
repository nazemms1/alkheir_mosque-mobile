import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';

/// بيانات التواصل مع إدارة المسجد.
abstract final class SupportContact {
  /// رقم واتساب الإدارة بالصيغة الدولية بدون `+` أو مسافات (مثال: 9665XXXXXXXX).
  ///
  /// يجب تعبئته قبل النشر. طالما هو فارغ يعرض التطبيق إشعاراً بدل فتح واتساب.
  static const whatsappNumber = '';

  static bool get hasWhatsapp => whatsappNumber.isNotEmpty;
}

/// يفتح محادثة واتساب مع إدارة المسجد، مع رسالة مبدئية اختيارية.
Future<void> openSupportWhatsApp(BuildContext context,
    {String? message}) async {
  if (!SupportContact.hasWhatsapp) {
    showAppSnack(
      context,
      L10nGateway.current.adminWhatsappUnavailable,
      error: true,
    );
    return;
  }
  final query = (message == null || message.isEmpty)
      ? ''
      : '?text=${Uri.encodeComponent(message)}';
  final uri = Uri.parse('https://wa.me/${SupportContact.whatsappNumber}$query');
  // نفتح الرابط مباشرة: canLaunchUrl قد يُرجع false دون استعلامات الحزم في أندرويد.
  var opened = false;
  try {
    opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (_) {
    opened = false;
  }
  if (!opened && context.mounted) {
    showAppSnack(context, L10nGateway.current.couldNotOpenWhatsapp,
        error: true);
  }
}
