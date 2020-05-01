import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/class_entity.dart';

abstract class IClassesRepo {
  const IClassesRepo();
  Future<Either<Failure, List<ClassEntity>>> getClasses();
  Future<Either<Failure, ClassEntity>> getClassById(String id);
  Future<Either<Failure, String>> addClass(ClassEntity mClass);
  Future<Either<Failure, Unit>> updateClass(ClassEntity mClass);
  Future<Either<Failure, Unit>> deleteClass(ClassEntity mClass);
}
