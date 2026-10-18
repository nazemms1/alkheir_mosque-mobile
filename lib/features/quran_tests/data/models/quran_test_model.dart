import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

/// نماذج اختبارات القرآن (الجزئي والنهائي) — مطابقة لـ `AdvancedQuranController`.

class QuranJuz {
  final int id;
  final int juzNumber;
  final int fromPage;
  final int toPage;

  const QuranJuz({
    required this.id,
    required this.juzNumber,
    required this.fromPage,
    required this.toPage,
  });

  factory QuranJuz.fromJson(Map<String, dynamic> json) => QuranJuz(
        id: jsonInt(json['id']),
        juzNumber: jsonInt(json['juz_number']),
        fromPage: jsonInt(json['from_page']),
        toPage: jsonInt(json['to_page']),
      );
}

class QuranTestGroup {
  final int id;
  final String name;
  final String? courseName;

  const QuranTestGroup({required this.id, required this.name, this.courseName});

  static QuranTestGroup? fromJson(Object? json) {
    final map = jsonMap(json);
    if (map == null) return null;
    return QuranTestGroup(
      id: jsonInt(map['id']),
      name: jsonString(map['name']),
      courseName: jsonStringOrNull(map['course_name']),
    );
  }
}

class NamedRef {
  final int id;
  final String name;

  const NamedRef({required this.id, required this.name});

  static NamedRef? fromJson(Object? json) {
    final map = jsonMap(json);
    if (map == null) return null;
    return NamedRef(id: jsonInt(map['id']), name: jsonString(map['name']));
  }
}

class QuranPartialAttempt {
  final int id;
  final int attemptNo;
  final int mistakeCount;
  final String status;
  final String? testedOn;
  final String? notes;
  final NamedRef? teacher;

  const QuranPartialAttempt({
    required this.id,
    required this.attemptNo,
    required this.mistakeCount,
    required this.status,
    required this.testedOn,
    required this.notes,
    required this.teacher,
  });

  factory QuranPartialAttempt.fromJson(Map<String, dynamic> json) {
    return QuranPartialAttempt(
      id: jsonInt(json['id']),
      attemptNo: jsonInt(json['attempt_no']),
      mistakeCount: jsonInt(json['mistake_count']),
      status: jsonString(json['status']),
      testedOn: jsonStringOrNull(json['tested_on']),
      notes: jsonStringOrNull(json['notes']),
      teacher: NamedRef.fromJson(json['teacher']),
    );
  }
}

class QuranPartialPart {
  final int id;
  final int partNumber;
  final String status;
  final String? passedOn;
  final List<QuranPartialAttempt> attempts;

  const QuranPartialPart({
    required this.id,
    required this.partNumber,
    required this.status,
    required this.passedOn,
    required this.attempts,
  });

  factory QuranPartialPart.fromJson(Map<String, dynamic> json) {
    return QuranPartialPart(
      id: jsonInt(json['id']),
      partNumber: jsonInt(json['part_number']),
      status: jsonString(json['status']),
      passedOn: jsonStringOrNull(json['passed_on']),
      attempts: jsonList(json['attempts'], QuranPartialAttempt.fromJson),
    );
  }

  bool get isPassed => status == 'passed';
}

/// دورة اختبار جزئي (أربعة أجزاء). تنجح بعد نجاح الأجزاء الأربعة.
class QuranPartialCycle {
  final int id;
  final int? enrollmentId;
  final String status;
  final String? passedOn;
  final QuranJuz? juz;
  final NamedRef? student;
  final QuranTestGroup? group;
  final List<QuranPartialPart> parts;

  const QuranPartialCycle({
    required this.id,
    required this.enrollmentId,
    required this.status,
    required this.passedOn,
    required this.juz,
    required this.student,
    required this.group,
    required this.parts,
  });

  factory QuranPartialCycle.fromJson(Map<String, dynamic> json) {
    final juz = jsonMap(json['juz']);
    return QuranPartialCycle(
      id: jsonInt(json['id']),
      enrollmentId: jsonIntOrNull(json['enrollment_id']),
      status: jsonString(json['status']),
      passedOn: jsonStringOrNull(json['passed_on']),
      juz: juz == null ? null : QuranJuz.fromJson(juz),
      student: NamedRef.fromJson(json['student']),
      group: QuranTestGroup.fromJson(json['group']),
      parts: jsonList(json['parts'], QuranPartialPart.fromJson),
    );
  }

  bool get isPassed => status == 'passed';
}

class QuranFinalAttempt {
  final int id;
  final int attemptNo;
  final double score;
  final String status;
  final String? testedOn;
  final String? notes;
  final NamedRef? teacher;

  const QuranFinalAttempt({
    required this.id,
    required this.attemptNo,
    required this.score,
    required this.status,
    required this.testedOn,
    required this.notes,
    required this.teacher,
  });

  factory QuranFinalAttempt.fromJson(Map<String, dynamic> json) {
    return QuranFinalAttempt(
      id: jsonInt(json['id']),
      attemptNo: jsonInt(json['attempt_no']),
      score: jsonDouble(json['score']),
      status: jsonString(json['status']),
      testedOn: jsonStringOrNull(json['tested_on']),
      notes: jsonStringOrNull(json['notes']),
      teacher: NamedRef.fromJson(json['teacher']),
    );
  }
}

/// دورة اختبار نهائي — تنجح عند بلوغ محاولة نطاق النجاح.
class QuranFinalCycle {
  final int id;
  final int? enrollmentId;
  final String status;
  final String? passedOn;
  final QuranJuz? juz;
  final NamedRef? student;
  final QuranTestGroup? group;
  final List<QuranFinalAttempt> attempts;

  const QuranFinalCycle({
    required this.id,
    required this.enrollmentId,
    required this.status,
    required this.passedOn,
    required this.juz,
    required this.student,
    required this.group,
    required this.attempts,
  });

  factory QuranFinalCycle.fromJson(Map<String, dynamic> json) {
    final juz = jsonMap(json['juz']);
    return QuranFinalCycle(
      id: jsonInt(json['id']),
      enrollmentId: jsonIntOrNull(json['enrollment_id']),
      status: jsonString(json['status']),
      passedOn: jsonStringOrNull(json['passed_on']),
      juz: juz == null ? null : QuranJuz.fromJson(juz),
      student: NamedRef.fromJson(json['student']),
      group: QuranTestGroup.fromJson(json['group']),
      attempts: jsonList(json['attempts'], QuranFinalAttempt.fromJson),
    );
  }

  bool get isPassed => status == 'passed';
}
