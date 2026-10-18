import 'dart:typed_data';
import '../../data/models/student_progress_model.dart';

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
