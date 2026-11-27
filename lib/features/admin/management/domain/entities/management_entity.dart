/// نماذج الأولياء والمعلمين والكورسات والجداول — مطابقة لاستجابات الـ API.
library;

class ParentItem {
  final int id;
  final String parentNumber;
  final String fatherName;
  final String? fatherWork;
  final String? fatherPhone;
  final String? motherName;
  final String? motherPhone;
  final String? homePhone;
  final String? address;
  final String? notes;
  final bool isActive;
  final int studentsCount;

  const ParentItem({
    required this.id,
    required this.parentNumber,
    required this.fatherName,
    required this.fatherWork,
    required this.fatherPhone,
    required this.motherName,
    required this.motherPhone,
    required this.homePhone,
    required this.address,
    required this.notes,
    required this.isActive,
    required this.studentsCount,
  });
}

class TeacherItem {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String status;
  final bool isHelping;
  final String? hiredAt;
  final String? notes;
  final String? jobTitle;
  final int? teacherJobTitleId;
  final int? courseId;
  final String? courseName;
  final int assignedGroupsCount;
  final int assistedGroupsCount;

  const TeacherItem({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.status,
    required this.isHelping,
    required this.hiredAt,
    required this.notes,
    required this.jobTitle,
    required this.teacherJobTitleId,
    required this.courseId,
    required this.courseName,
    required this.assignedGroupsCount,
    required this.assistedGroupsCount,
  });

  String get fullName => '$firstName $lastName'.trim();

  bool get isActive => status == 'active';
}

class CourseItem {
  final int id;
  final String name;
  final String? academicYear;
  final int? academicYearId;
  final String? startsOn;
  final String? endsOn;
  final String? description;
  final bool awardsPoints;
  final bool isActive;
  final bool isDefault;
  final String? finishedAt;
  final int groupsCount;
  final int enrollmentsCount;

  const CourseItem({
    required this.id,
    required this.name,
    required this.academicYear,
    required this.academicYearId,
    required this.startsOn,
    required this.endsOn,
    required this.description,
    required this.awardsPoints,
    required this.isActive,
    required this.isDefault,
    required this.finishedAt,
    required this.groupsCount,
    required this.enrollmentsCount,
  });

  /// الكورس المنتهي للقراءة فقط في الـ API.
  bool get isFinished => !isActive;
}

class GroupScheduleSlot {
  final int id;
  final int dayOfWeek;
  final String timeSlot;
  final String timeSlotLabel;
  final String startsAt;
  final String endsAt;
  final bool isActive;

  const GroupScheduleSlot({
    required this.id,
    required this.dayOfWeek,
    required this.timeSlot,
    required this.timeSlotLabel,
    required this.startsAt,
    required this.endsAt,
    required this.isActive,
  });
}

/// عنصر من كتالوج مرجعي (السنوات الدراسية، مسميات المعلمين...).
class RefItem {
  final int id;
  final String name;
  final String? code;
  final bool isActive;
  final bool isCurrent;

  const RefItem({
    required this.id,
    required this.name,
    required this.code,
    required this.isActive,
    required this.isCurrent,
  });
}
