import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../models/json_helpers.dart';
import '../models/student_progress_model.dart';
import 'api_service.dart';

/// ملف تقدّم الطالب، مرفقاته (PDF/صور...) وصورته الشخصية.
class StudentFileService {
  final ApiService _api;

  StudentFileService({ApiService? api}) : _api = api ?? ApiService();

  Future<StudentProgress> progress(int studentId) async {
    final json =
        await _api.get('students/$studentId/progress') as Map<String, dynamic>;
    return StudentProgress.fromJson(jsonMap(json['data']) ?? const {});
  }

  Future<List<StudentFileItem>> files(int studentId) async {
    final json =
        await _api.get('students/$studentId/files') as Map<String, dynamic>;
    return jsonList(json['data'], StudentFileItem.fromJson);
  }

  Future<StudentFileItem> uploadFile(
    int studentId, {
    required String fileType,
    required String fileName,
    required Uint8List bytes,
  }) async {
    final json = await _api.postMultipart(
      'students/$studentId/files',
      fields: {'file_type': fileType},
      file: http.MultipartFile.fromBytes('file', bytes, filename: fileName),
    ) as Map<String, dynamic>;
    return StudentFileItem.fromJson(json['data'] as Map<String, dynamic>);
  }

  Future<Uint8List> downloadFile(int studentId, int fileId) =>
      _api.getBytes('students/$studentId/files/$fileId/download');

  Future<void> deleteFile(int studentId, int fileId) =>
      _api.delete('students/$studentId/files/$fileId');

  /// صورة الطالب الحالية كبايتات. يُرجع `null` عند عدم وجود صورة (404).
  Future<Uint8List?> photo(int studentId) async {
    try {
      return await _api.getBytes('students/$studentId/photo');
    } on ApiException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<void> uploadPhoto(
    int studentId, {
    required String fileName,
    required Uint8List bytes,
  }) async {
    await _api.postMultipart(
      'students/$studentId/photo',
      file: http.MultipartFile.fromBytes('photo', bytes, filename: fileName),
    );
  }

  Future<void> deletePhoto(int studentId) =>
      _api.delete('students/$studentId/photo');
}
