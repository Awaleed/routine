import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../models/class_model.dart';
import 'i_local_datasourse.dart';

// ignore: constant_identifier_names
const String CLASSES_STORE = 'classes';
// ignore: constant_identifier_names
const String CLASSES_BOX_DEV = 'classes_dev';

@singleton
@RegisterAs(ILocalDataSource)
class LocalDataSource implements ILocalDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final StoreRef<String, Map<String, dynamic>> _classesStore = stringMapStoreFactory.store(CLASSES_STORE);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => AppDatabase.instance.database;
  Future<void> deleteAll() async {
    await _classesStore.drop(await _db);
  }

  @override
  Future<String> addClass(ClassModel mClass) async {
    return _classesStore.add(await _db, mClass.toJson());
  }

  @override
  Future<Unit> deleteClass(ClassModel mClass) {
    // TODO: implement deleteClass
    throw UnimplementedError();
  }

  @override
  Future<ClassModel> getClassById(String id) {
    // TODO: implement getClassById
    throw UnimplementedError();
  }

  @override
  Future<List<ClassModel>> getClasses() async {
    final List<RecordSnapshot<String, Map<String, dynamic>>> recordsSnapshot = await _classesStore.find(await _db);
    final List<ClassModel> modelList = <ClassModel>[];

    for (final RecordSnapshot<String, Map<String, dynamic>> item in recordsSnapshot) {
      final String id = item.key;
      final Map<String, dynamic> value = <String, dynamic>{
        ...item.value
      };
      value['id'] = id;

      modelList.add(ClassModel.fromJson(value));
    }

    return modelList;
  }

  @override
  Future<Unit> updateClass(ClassModel mClass) {
    // TODO: implement updateClass
    throw UnimplementedError();
  }
}

class AppDatabase {
  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  AppDatabase._();

  // Singleton instance
  static final AppDatabase _singleton = AppDatabase._();

  // Singleton accessor
  static AppDatabase get instance => _singleton;

  // Completer is used for transforming synchronous code into asynchronous code.
  Completer<Database> _dbOpenCompleter;

  /// Database object accessor
  Future<Database> get database async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer<Database>();
      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }
    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter.future;
  }

  Future<void> _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final Directory appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

    // Path with the form: /platform-specific-directory/demo.db
    final String dbPath = join(appDocumentDir.path, 'demo.db');

    final Database database = await databaseFactoryIo.openDatabase(dbPath);
    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter.complete(database);
  }
}
