import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routine/classes/domain/entities/class_entity.dart';
import 'package:routine/classes/domain/repositories/i_classes_repo.dart';
import 'package:routine/classes/domain/usecases/class_usecases.dart';
import 'package:routine/core/enums/enums.dart';
import 'package:routine/core/error/failures.dart';

import '../../../test_data.dart';

class MockClassesRepo extends Mock implements IClassesRepo {}

void main() {
  ClassUseCases classUseCases;
  MockClassesRepo mockRepo;

  setUp(() {
    mockRepo = MockClassesRepo();
    classUseCases = ClassUseCases(mockRepo);
  });

  group('test getClasses() use case', () {
    const List<ClassEntity> expectedResponse = <ClassEntity>[
      ClassEntity(
        id: '0x0',
        name: 'Class No. 1',
        color: 0xffd45d6,
        info: 'This is the first Class',
        times: <ClassTime>[
          ClassTime(
            days: <Days>[
              Days.saturday,
              Days.thursday,
            ],
            startTime: TimeOfDay(hour: 6, minute: 30),
            endTime: TimeOfDay(hour: 8, minute: 30),
          ),
        ],
      ),
      ClassEntity(
        id: '0x1',
        name: 'Class No. 2',
        color: 0xffd45d6,
        info: 'This is the second Class',
        times: <ClassTime>[
          ClassTime(
            days: <Days>[
              Days.sunday,
            ],
            startTime: TimeOfDay(hour: 6, minute: 30),
            endTime: TimeOfDay(hour: 8, minute: 30),
          ),
          ClassTime(
            days: <Days>[
              Days.thursday,
            ],
            startTime: TimeOfDay(hour: 10, minute: 30),
            endTime: TimeOfDay(hour: 13, minute: 30),
          ),
        ],
      ),
      ClassEntity(
        id: '0x2',
        name: 'Class No. 3',
        color: 0xffd45d6,
        info: 'This is the third Class',
        times: <ClassTime>[
          ClassTime(
            days: <Days>[
              Days.tuesday,
            ],
            startTime: TimeOfDay(hour: 8, minute: 30),
            endTime: TimeOfDay(hour: 10, minute: 30),
          ),
        ],
      ),
    ];

    test('should get list of ClassEntity() from repository', () async {
      when(mockRepo.getClasses()).thenAnswer((_) async => right<Failure, List<ClassEntity>>(tClassList));

      final Either<Failure, List<ClassEntity>> result = await classUseCases.getClasses();

      expect(result.fold(id, id), expectedResponse);
      verify(mockRepo.getClasses());
      verifyNoMoreInteractions(mockRepo);
    });
    test('should get LocalStorageFailure() failure from repository', () async {
      const Failure tLocalStorageFailure = LocalStorageFailure('Error on getting classes ');
      when(mockRepo.getClasses()).thenAnswer((_) async => left<Failure, List<ClassEntity>>(tLocalStorageFailure));

      final Either<Failure, List<ClassEntity>> result = await classUseCases.getClasses();

      expect(result.fold(id, id), isA<Failure>());
      verify(mockRepo.getClasses());
      verifyNoMoreInteractions(mockRepo);
    });
  });

  group('test getClassById(String) use case', () {
    const ClassEntity expectedResponse = ClassEntity(
      id: '0x0',
      name: 'Class No. 1',
      color: 0xffd45d6,
      info: 'This is the first Class',
      times: <ClassTime>[
        ClassTime(
          days: <Days>[
            Days.saturday,
            Days.thursday,
          ],
          startTime: TimeOfDay(hour: 6, minute: 30),
          endTime: TimeOfDay(hour: 8, minute: 30),
        ),
      ],
    );

    test('should get ClassEntity() from repository when passed an id', () async {
      when(mockRepo.getClassById(any)).thenAnswer((_) async => right<Failure, ClassEntity>(tClass));

      final Either<Failure, ClassEntity> result = await classUseCases.getClassById(tClassId);

      expect(result.fold(id, id), expectedResponse);
      verify(mockRepo.getClassById(tClassId));
      verifyNoMoreInteractions(mockRepo);
    });
    test('should get LocalStorageFailure() failure from repository', () async {
      const Failure tLocalStorageFailure = LocalStorageFailure('Error on getting class');
      when(mockRepo.getClassById(any)).thenAnswer((_) async => left<Failure, ClassEntity>(tLocalStorageFailure));

      final Either<Failure, ClassEntity> result = await classUseCases.getClassById(tClassId);

      expect(result.fold(id, id), isA<Failure>());
      verify(mockRepo.getClassById(tClassId));
      verifyNoMoreInteractions(mockRepo);
    });
  });
}
