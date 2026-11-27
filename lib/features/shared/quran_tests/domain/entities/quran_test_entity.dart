/// نماذج اختبارات القرآن (الجزئي والنهائي) — مطابقة لـ `AdvancedQuranController`.
library;

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
}

class QuranTestGroup {
  final int id;
  final String name;
  final String? courseName;

  const QuranTestGroup({required this.id, required this.name, this.courseName});
}

class NamedRef {
  final int id;
  final String name;

  const NamedRef({required this.id, required this.name});
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

  bool get isPassed => status == 'passed';
}
