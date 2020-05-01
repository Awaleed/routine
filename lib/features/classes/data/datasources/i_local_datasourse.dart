import 'package:dartz/dartz.dart';

import '../models/class_model.dart';

abstract class ILocalDataSource {
  const ILocalDataSource();
  Future<List<ClassModel>> getClasses();
  Future<ClassModel> getClassById(String id);
  Future<String> addClass(ClassModel mClass);
  Future<Unit> updateClass(ClassModel mClass);
  Future<Unit> deleteClass(ClassModel mClass);
}
