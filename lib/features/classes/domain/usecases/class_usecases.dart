import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/class_entity.dart';
import '../repositories/i_classes_repo.dart';

@singleton
class ClassUseCases {
  const ClassUseCases(this.repo);

  final IClassesRepo repo;

  Future<Either<Failure, List<ClassEntity>>> getClasses() {
    final Future<Either<Failure, List<ClassEntity>>> classesList = repo.getClasses();
    return classesList;
  }

  Future<Either<Failure, ClassEntity>> getClassById(String id) {
    final Future<Either<Failure, ClassEntity>> foundClass = repo.getClassById(id);
    return foundClass;
  }

  Future<Either<Failure, String>> addClass(ClassEntity mClass) {
    return repo.addClass(mClass);
  }

  Future<Either<Failure, Unit>> updateClass(ClassEntity mClass) {
    return repo.updateClass(mClass);
  }

  Future<Either<Failure, Unit>> deleteClass(ClassEntity mClass) {
    return repo.deleteClass(mClass);
  }
}
