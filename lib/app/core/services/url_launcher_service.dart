import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<bool> launchWebUrl(
    String url, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri, mode: mode);
    }
    return false;
  }

  Future<bool> launchPhone(String phoneNumber) async {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[\s\-\(\)]+'), '');
    final uri = Uri(scheme: 'tel', path: cleanPhone);
    try {
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri);
      }
      return await launchUrl(uri);
    } catch (_) {
      return false;
    }
  }

  Future<bool> launchEmail(
    String email, {
    String? subject,
    String? body,
  }) async {
    final queryParameters = <String, String>{};
    if (subject != null && subject.isNotEmpty) {
      queryParameters['subject'] = subject;
    }
    if (body != null && body.isNotEmpty) {
      queryParameters['body'] = body;
    }

    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
    );

    if (await canLaunchUrl(uri)) {
      return await launchUrl(uri);
    }
    return false;
  }
}
