import 'package:alkheir_mosque/features/shared/students/data/models/student_progress_model.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_progress_entity.dart';
import 'package:alkheir_mosque/features/shared/students/data/mapper/student_progress_mapper.dart';
import '../../data/apis/student_file_apis.dart';
import 'dart:typed_data';
import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/dio_client.dart';
import 'package:dio/dio.dart' as dio;

abstract class StudentFileRepository {
  Future<StudentProgress> progress(int studentId);

  Future<List<StudentFileItem>> files(int studentId);

  Future<StudentFileItem> uploadFile(
    int studentId, {
    required String fileType,
    required String fileName,
    required Uint8List bytes,
  });

  Future<Uint8List> downloadFile(int studentId, int fileId);

  Future<void> deleteFile(int studentId, int fileId);

  Future<Uint8List?> photo(int studentId);

  Future<void> uploadPhoto(
    int studentId, {
    required String fileName,
    required Uint8List bytes,
  });

  Future<void> deletePhoto(int studentId);
}

class StudentFileRepositoryImpl implements StudentFileRepository {
  final StudentFileApis api;

  StudentFileRepositoryImpl(this.api);

  @override
  Future<StudentProgress> progress(int studentId) async {
    final result = await handleRepoData(() => api.progress(studentId));
    return result.data.toDomain();
  }

  @override
  Future<List<StudentFileItem>> files(int studentId) async {
    final result = await handleRepoData(() => api.files(studentId));
    return [
      for (final e in result.data ?? const <StudentFileItemModel>[])
        e.toDomain()
    ];
  }

  @override
  Future<StudentFileItem> uploadFile(
    int studentId, {
    required String fileType,
    required String fileName,
    required Uint8List bytes,
  }) async {
    final result = await handleRepoData(() => api.uploadFile(
        studentId,
        dio.FormData.fromMap({
          ...{'file_type': fileType},
          'file': dio.MultipartFile.fromBytes(bytes, filename: fileName)
        }),
        kFileRequestOptions));
    return result.data.toDomain();
  }

  @override
  Future<Uint8List> downloadFile(int studentId, int fileId) => handleRepoData(
          () => api.downloadFile(studentId, fileId, kBytesRequestOptions))
      .then((r) => Uint8List.fromList(r.data));

  @override
  Future<void> deleteFile(int studentId, int fileId) =>
      handleRepoData(() => api.deleteFile(studentId, fileId));

  /// صورة الطالب الحالية كبايتات. يُرجع `null` عند عدم وجود صورة (404).
  @override
  Future<Uint8List?> photo(int studentId) async {
    try {
      return await handleRepoData(
              () => api.photo(studentId, kBytesRequestOptions))
          .then((r) => Uint8List.fromList(r.data));
    } on ApiError catch (e) {
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
    await handleRepoData(() => api.uploadPhoto(
        studentId,
        dio.FormData.fromMap({
          ...const <String, String>{},
          'photo': dio.MultipartFile.fromBytes(bytes, filename: fileName)
        }),
        kFileRequestOptions));
  }

  @override
  Future<void> deletePhoto(int studentId) =>
      handleRepoData(() => api.deletePhoto(studentId));
}
