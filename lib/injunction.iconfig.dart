// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:routine/features/classes/data/datasources/local_datasourse.dart';
import 'package:routine/features/classes/data/datasources/i_local_datasourse.dart';
import 'package:routine/features/classes/data/repositories/classes_repo_impl.dart';
import 'package:routine/features/classes/domain/repositories/i_classes_repo.dart';
import 'package:routine/features/classes/domain/usecases/class_usecases.dart';
import 'package:routine/features/classes/presentation/mobx/classes_store.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  //Eager singletons must be registered in the right order
  g.registerSingleton<ILocalDataSource>(LocalDataSource());
  g.registerSingleton<IClassesRepo>(ClassesRepoImpl(g<ILocalDataSource>()));
  g.registerSingleton<ClassUseCases>(ClassUseCases(g<IClassesRepo>()));
  g.registerSingleton<ClassesStore>(ClassesStore(g<ClassUseCases>()));
}
