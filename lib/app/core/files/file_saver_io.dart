import 'dart:io';
import 'dart:typed_data';

import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

/// يكتب الملف في المجلد المؤقت للتطبيق ثم يفتحه بالتطبيق الافتراضي للنظام.
/// يُعيد `false` إن تعذّر فتح الملف (لا يوجد تطبيق مناسب مثلاً).
Future<bool> saveDownloadedFile({
  required String fileName,
  required Uint8List bytes,
}) async {
  final dir = await getTemporaryDirectory();
  final safeName = fileName.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
  final file = File('${dir.path}/$safeName');
  await file.writeAsBytes(bytes, flush: true);
  final result = await OpenFilex.open(file.path);
  return result.type == ResultType.done;
}
