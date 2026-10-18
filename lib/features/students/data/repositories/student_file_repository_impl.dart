import 'dart:typed_data';

import 'package:dio/dio.dart' as dio;

import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../domain/repositories/student_file_repository.dart';
import '../models/student_progress_model.dart';

class StudentFileRepositoryImpl implements StudentFileRepository {
  final ApiService _api;

  StudentFileRepositoryImpl({ApiService? api}) : _api = api ?? ApiService();

  @override
  Future<StudentProgress> progress(int studentId) async {
    final json =
        await _api.get('students/$studentId/progress') as Map<String, dynamic>;
    return StudentProgress.fromJson(jsonMap(json['data']) ?? const {});
  }

  @override
  Future<List<StudentFileItem>> files(int studentId) async {
    final json =
        await _api.get('students/$studentId/files') as Map<String, dynamic>;
    return jsonList(json['data'], StudentFileItem.fromJson);
  }

  @override
  Future<StudentFileItem> uploadFile(
    int studentId, {
    required String fileType,
    required String fileName,
    required Uint8List bytes,
  }) async {
    final json = await _api.postMultipart(
      'students/$studentId/files',
      fields: {'file_type': fileType},
      fileField: 'file',
      file: dio.MultipartFile.fromBytes(bytes, filename: fileName),
    ) as Map<String, dynamic>;
    return StudentFileItem.fromJson(json['data'] as Map<String, dynamic>);
  }

  @override
  Future<Uint8List> downloadFile(int studentId, int fileId) =>
      _api.getBytes('students/$studentId/files/$fileId/download');

  @override
  Future<void> deleteFile(int studentId, int fileId) =>
      _api.delete('students/$studentId/files/$fileId');

  /// صورة الطالب الحالية كبايتات. يُرجع `null` عند عدم وجود صورة (404).
  @override
  Future<Uint8List?> photo(int studentId) async {
    try {
      return await _api.getBytes('students/$studentId/photo');
    } on ApiException catch (e) {
      if (e.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  Future<void> uploadPhoto(
    int studentId, {
    required String fileName,
    required Uint8List bytes,
  }) async {
    await _api.postMultipart(
      'students/$studentId/photo',
      fileField: 'photo',
      file: dio.MultipartFile.fromBytes(bytes, filename: fileName),
    );
  }

  @override
  Future<void> deletePhoto(int studentId) =>
      _api.delete('students/$studentId/photo');
}
