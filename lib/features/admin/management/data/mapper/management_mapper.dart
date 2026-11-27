import 'package:alkheir_mosque/features/admin/management/data/models/management_model.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';

extension ParentItemModelMapper on ParentItemModel? {
  ParentItem toDomain() {
    return ParentItem(
      id: this?.id ?? 0,
      parentNumber: this?.parentNumber ?? '',
      fatherName: this?.fatherName ?? '',
      fatherWork: this?.fatherWork,
      fatherPhone: this?.fatherPhone,
      motherName: this?.motherName,
      motherPhone: this?.motherPhone,
      homePhone: this?.homePhone,
      address: this?.address,
      notes: this?.notes,
      isActive: this?.isActive ?? false,
      studentsCount: this?.studentsCount ?? 0,
    );
  }
}

extension TeacherItemModelMapper on TeacherItemModel? {
  TeacherItem toDomain() {
    return TeacherItem(
      id: this?.id ?? 0,
      firstName: this?.firstName ?? '',
      lastName: this?.lastName ?? '',
      phone: this?.phone ?? '',
      status: this?.status ?? '',
      isHelping: this?.isHelping ?? false,
      hiredAt: this?.hiredAt,
      notes: this?.notes,
      jobTitle: this?.jobTitle,
      teacherJobTitleId: this?.teacherJobTitleId,
      courseId: this?.courseId,
      courseName: this?.courseName,
      assignedGroupsCount: this?.assignedGroupsCount ?? 0,
      assistedGroupsCount: this?.assistedGroupsCount ?? 0,
    );
  }
}

extension CourseItemModelMapper on CourseItemModel? {
  CourseItem toDomain() {
    return CourseItem(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      academicYear: this?.academicYear,
      academicYearId: this?.academicYearId,
      startsOn: this?.startsOn,
      endsOn: this?.endsOn,
      description: this?.description,
      awardsPoints: this?.awardsPoints ?? false,
      isActive: this?.isActive ?? false,
      isDefault: this?.isDefault ?? false,
      finishedAt: this?.finishedAt,
      groupsCount: this?.groupsCount ?? 0,
      enrollmentsCount: this?.enrollmentsCount ?? 0,
    );
  }
}

extension GroupScheduleSlotModelMapper on GroupScheduleSlotModel? {
  GroupScheduleSlot toDomain() {
    return GroupScheduleSlot(
      id: this?.id ?? 0,
      dayOfWeek: this?.dayOfWeek ?? 0,
      timeSlot: this?.timeSlot ?? '',
      timeSlotLabel: this?.timeSlotLabel ?? '',
      startsAt: this?.startsAt ?? '',
      endsAt: this?.endsAt ?? '',
      isActive: this?.isActive ?? false,
    );
  }
}

extension RefItemModelMapper on RefItemModel? {
  RefItem toDomain() {
    return RefItem(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      code: this?.code,
      isActive: this?.isActive ?? false,
      isCurrent: this?.isCurrent ?? false,
    );
  }
}
