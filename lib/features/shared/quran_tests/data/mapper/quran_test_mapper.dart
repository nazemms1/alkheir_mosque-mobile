import 'package:alkheir_mosque/features/shared/quran_tests/data/models/quran_test_model.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart';

extension QuranJuzModelMapper on QuranJuzModel? {
  QuranJuz toDomain() {
    return QuranJuz(
      id: this?.id ?? 0,
      juzNumber: this?.juzNumber ?? 0,
      fromPage: this?.fromPage ?? 0,
      toPage: this?.toPage ?? 0,
    );
  }
}

extension QuranTestGroupModelMapper on QuranTestGroupModel? {
  QuranTestGroup? toDomain() {
    if (this == null) return null;
    return QuranTestGroup(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      courseName: this?.courseName,
    );
  }
}

extension NamedRefModelMapper on NamedRefModel? {
  NamedRef? toDomain() {
    if (this == null) return null;
    return NamedRef(
      id: this?.id ?? 0,
      name: this?.name ?? '',
    );
  }
}

extension QuranPartialAttemptModelMapper on QuranPartialAttemptModel? {
  QuranPartialAttempt toDomain() {
    return QuranPartialAttempt(
      id: this?.id ?? 0,
      attemptNo: this?.attemptNo ?? 0,
      mistakeCount: this?.mistakeCount ?? 0,
      status: this?.status ?? '',
      testedOn: this?.testedOn,
      notes: this?.notes,
      teacher: (this?.teacher).toDomain(),
    );
  }
}

extension QuranPartialPartModelMapper on QuranPartialPartModel? {
  QuranPartialPart toDomain() {
    return QuranPartialPart(
      id: this?.id ?? 0,
      partNumber: this?.partNumber ?? 0,
      status: this?.status ?? '',
      passedOn: this?.passedOn,
      attempts: [
        for (final e in this?.attempts ?? const <QuranPartialAttemptModel>[])
          e.toDomain()
      ],
    );
  }
}

extension QuranPartialCycleModelMapper on QuranPartialCycleModel? {
  QuranPartialCycle toDomain() {
    return QuranPartialCycle(
      id: this?.id ?? 0,
      enrollmentId: this?.enrollmentId,
      status: this?.status ?? '',
      passedOn: this?.passedOn,
      juz: this?.juz?.toDomain(),
      student: (this?.student).toDomain(),
      group: (this?.group).toDomain(),
      parts: [
        for (final e in this?.parts ?? const <QuranPartialPartModel>[])
          e.toDomain()
      ],
    );
  }
}

extension QuranFinalAttemptModelMapper on QuranFinalAttemptModel? {
  QuranFinalAttempt toDomain() {
    return QuranFinalAttempt(
      id: this?.id ?? 0,
      attemptNo: this?.attemptNo ?? 0,
      score: this?.score ?? 0.0,
      status: this?.status ?? '',
      testedOn: this?.testedOn,
      notes: this?.notes,
      teacher: (this?.teacher).toDomain(),
    );
  }
}

extension QuranFinalCycleModelMapper on QuranFinalCycleModel? {
  QuranFinalCycle toDomain() {
    return QuranFinalCycle(
      id: this?.id ?? 0,
      enrollmentId: this?.enrollmentId,
      status: this?.status ?? '',
      passedOn: this?.passedOn,
      juz: this?.juz?.toDomain(),
      student: (this?.student).toDomain(),
      group: (this?.group).toDomain(),
      attempts: [
        for (final e in this?.attempts ?? const <QuranFinalAttemptModel>[])
          e.toDomain()
      ],
    );
  }
}
