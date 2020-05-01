import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/class_entity.dart';
import '../../domain/repositories/i_classes_repo.dart';
import '../datasources/i_local_datasourse.dart';
import '../models/class_model.dart';

@RegisterAs(IClassesRepo)
@singleton
class ClassesRepoImpl implements IClassesRepo {
  const ClassesRepoImpl(this.localDataSource);

  final ILocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<ClassEntity>>> getClasses() async {
    try {
      final List<ClassModel> classesModelList = await localDataSource.getClasses();
      final List<ClassEntity> classesEntityList = classesModelList.map((ClassModel e) => e.entity).toList(growable: false);
      return right(classesEntityList);
    } catch (e) {
      return left(LocalStorageFailure('Exception on getting classes, details:\n $e'));
    }
  }

  @override
  Future<Either<Failure, ClassEntity>> getClassById(String id) async {
    final ClassModel classesModel = await localDataSource.getClassById(id);
    final ClassEntity classesEntity = classesModel.entity;
    return right(classesEntity);
  }

  @override
  Future<Either<Failure, String>> addClass(ClassEntity mClass) async {
    final ClassModel model = ClassModel.fromEntity(mClass);
    try {
      final String res = await localDataSource.addClass(model);
      return right(res);
    } catch (e) {
      return left(LocalStorageFailure('Exception on saving ${model.toJson()}, details:\n $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateClass(ClassEntity mClass) {
    //TODO: Implement This... updateClass(ClassEntity)
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteClass(ClassEntity mClass) {
    //TODO: Implement This... deleteClass(ClassEntity)
    throw UnimplementedError();
  }
}
