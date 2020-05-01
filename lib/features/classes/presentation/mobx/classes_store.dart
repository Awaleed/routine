import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:routine/core/enums/enums.dart';
import 'package:time_machine/time_machine.dart';

import '../../../../core/error/failures.dart';
import '../../../classes/domain/entities/class_entity.dart';
import '../../../classes/domain/usecases/class_usecases.dart';
import '../../data/datasources/local_datasourse.dart';

part 'classes_store.g.dart';

@singleton
class ClassesStore extends ClassesBase with _$ClassesStore {
  ClassesStore(ClassUseCases useCases) : super(useCases);
}

abstract class ClassesBase with Store {
  ClassesBase(this.useCases) {
    init();
  }

  final ClassUseCases useCases;

  void init() {
    classes = ObservableList<ClassEntity>();
    getClasses();
  }

  @observable
  ObservableList<ClassEntity> classes;
  @observable
  int daysAhead = 1;

  @computed
  List<ClassEntity> get classEvents {
    final List<ClassEntity> list = <ClassEntity>[];
    final int todayIndex = LocalDate.today().dayOfWeek.value;
    for (final ClassEntity item in classes) {
      for (final ClassTime time in item.times) {
        for (int i = 0; i < daysAhead; i++) {
          final int dayIndex = (todayIndex + i) % 7;
          if (time.days.contains(dayIndex)) {
            list.add(item);
          }
        }
      }
    }
    return list;
  }

  @action
  Future<void> getClasses() async {
    final Either<Failure, List<ClassEntity>> res = await useCases.getClasses();
    res.fold((_) {}, (List<ClassEntity> val) {
      final int length = classes.length;
      classes.insertAll(length, val.sublist(length));
    });
  }

  // Future<Either<Failure, ClassEntity>> getClassById(String id) {
  //   final Future<Either<Failure, ClassEntity>> foundClass = repo.getClassById(id);
  //   return foundClass;
  // }
  @action
  Future<void> addClass(ClassEntity mClass) async {
    final Either<Failure, String> res = await useCases.addClass(mClass);
    res.fold((_) {}, (String val) {
      getClasses();
    });
  }

  @action
  Future<void> deleteAll() async {
    await LocalDataSource().deleteAll();
    classes.clear();
    await getClasses();
  }
}
