import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

/// يطلق تنزيلاً من المتصفح عبر رابط Blob مؤقت. يُعيد `true` دائماً لأن
/// المتصفح يتولى التنزيل بعد النقر.
Future<bool> saveDownloadedFile({
  required String fileName,
  required Uint8List bytes,
}) async {
  final blob = web.Blob(
    <web.BlobPart>[bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'application/octet-stream'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
  anchor.href = url;
  anchor.download = fileName;
  web.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
  web.URL.revokeObjectURL(url);
  return true;
}
