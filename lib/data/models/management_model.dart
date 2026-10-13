import 'json_helpers.dart';

/// نماذج الأولياء والمعلمين والكورسات والجداول — مطابقة لاستجابات الـ API.

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

  factory ParentItem.fromJson(Map<String, dynamic> json) {
    return ParentItem(
      id: jsonInt(json['id']),
      parentNumber: jsonString(json['parent_number']),
      fatherName: jsonString(json['father_name']),
      fatherWork: jsonStringOrNull(json['father_work']),
      fatherPhone: jsonStringOrNull(json['father_phone']),
      motherName: jsonStringOrNull(json['mother_name']),
      motherPhone: jsonStringOrNull(json['mother_phone']),
      homePhone: jsonStringOrNull(json['home_phone']),
      address: jsonStringOrNull(json['address']),
      notes: jsonStringOrNull(json['notes']),
      isActive: jsonBool(json['is_active']),
      studentsCount: jsonInt(json['students_count']),
    );
  }
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

  factory TeacherItem.fromJson(Map<String, dynamic> json) {
    final course = jsonMap(json['course']);
    return TeacherItem(
      id: jsonInt(json['id']),
      firstName: jsonString(json['first_name']),
      lastName: jsonString(json['last_name']),
      phone: jsonString(json['phone']),
      status: jsonString(json['status']),
      isHelping: jsonBool(json['is_helping']),
      hiredAt: jsonStringOrNull(json['hired_at']),
      notes: jsonStringOrNull(json['notes']),
      jobTitle: jsonStringOrNull(json['job_title']),
      teacherJobTitleId: jsonIntOrNull(json['teacher_job_title_id']),
      courseId: jsonIntOrNull(course?['id']),
      courseName: jsonStringOrNull(course?['name']),
      assignedGroupsCount: jsonInt(json['assigned_groups_count']),
      assistedGroupsCount: jsonInt(json['assisted_groups_count']),
    );
  }

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

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      academicYear: jsonStringOrNull(json['academic_year']),
      academicYearId: jsonIntOrNull(json['academic_year_id']),
      startsOn: jsonStringOrNull(json['starts_on']),
      endsOn: jsonStringOrNull(json['ends_on']),
      description: jsonStringOrNull(json['description']),
      awardsPoints: jsonBool(json['awards_points']),
      isActive: jsonBool(json['is_active']),
      isDefault: jsonBool(json['is_default']),
      finishedAt: jsonStringOrNull(json['finished_at']),
      groupsCount: jsonInt(json['groups_count']),
      enrollmentsCount: jsonInt(json['enrollments_count']),
    );
  }

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

  factory GroupScheduleSlot.fromJson(Map<String, dynamic> json) {
    final slot = jsonString(json['time_slot']);
    return GroupScheduleSlot(
      id: jsonInt(json['id']),
      dayOfWeek: jsonInt(json['day_of_week']),
      timeSlot: slot,
      timeSlotLabel: jsonStringOrNull(json['time_slot_label']) ?? slot,
      startsAt: jsonString(json['starts_at']),
      endsAt: jsonString(json['ends_at']),
      isActive: jsonBool(json['is_active']),
    );
  }
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

  factory RefItem.fromJson(Map<String, dynamic> json) {
    return RefItem(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      code: jsonStringOrNull(json['code']),
      isActive: json['is_active'] == null ? true : jsonBool(json['is_active']),
      isCurrent: jsonBool(json['is_current']),
    );
  }
}
