import 'package:alkheir_mosque/features/admin/management/data/models/group_student_model.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';

extension GroupItemModelMapper on GroupItemModel? {
  GroupItem toDomain() {
    return GroupItem(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      courseName: this?.courseName,
      teacherName: this?.teacherName,
      isActive: this?.isActive ?? false,
      enrollmentsCount: this?.enrollmentsCount ?? 0,
    );
  }
}

extension StudentListItemModelMapper on StudentListItemModel? {
  StudentListItem toDomain() {
    return StudentListItem(
      id: this?.id ?? 0,
      firstName: this?.firstName ?? '',
      lastName: this?.lastName ?? '',
      studentNumber: this?.studentNumber,
      status: this?.status ?? '',
      parentName: this?.parentName,
      gradeLevel: this?.gradeLevel,
    );
  }
}
