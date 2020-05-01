// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassesStore on ClassesBase, Store {
  Computed<List<ClassEntity>> _$classEventsComputed;

  @override
  List<ClassEntity> get classEvents => (_$classEventsComputed ??=
          Computed<List<ClassEntity>>(() => super.classEvents))
      .value;

  final _$classesAtom = Atom(name: 'ClassesBase.classes');

  @override
  ObservableList<ClassEntity> get classes {
    _$classesAtom.context.enforceReadPolicy(_$classesAtom);
    _$classesAtom.reportObserved();
    return super.classes;
  }

  @override
  set classes(ObservableList<ClassEntity> value) {
    _$classesAtom.context.conditionallyRunInAction(() {
      super.classes = value;
      _$classesAtom.reportChanged();
    }, _$classesAtom, name: '${_$classesAtom.name}_set');
  }

  final _$daysAheadAtom = Atom(name: 'ClassesBase.daysAhead');

  @override
  int get daysAhead {
    _$daysAheadAtom.context.enforceReadPolicy(_$daysAheadAtom);
    _$daysAheadAtom.reportObserved();
    return super.daysAhead;
  }

  @override
  set daysAhead(int value) {
    _$daysAheadAtom.context.conditionallyRunInAction(() {
      super.daysAhead = value;
      _$daysAheadAtom.reportChanged();
    }, _$daysAheadAtom, name: '${_$daysAheadAtom.name}_set');
  }

  final _$getClassesAsyncAction = AsyncAction('getClasses');

  @override
  Future<void> getClasses() {
    return _$getClassesAsyncAction.run(() => super.getClasses());
  }

  final _$addClassAsyncAction = AsyncAction('addClass');

  @override
  Future<void> addClass(ClassEntity mClass) {
    return _$addClassAsyncAction.run(() => super.addClass(mClass));
  }

  final _$deleteAllAsyncAction = AsyncAction('deleteAll');

  @override
  Future<void> deleteAll() {
    return _$deleteAllAsyncAction.run(() => super.deleteAll());
  }

  @override
  String toString() {
    final string =
        'classes: ${classes.toString()},daysAhead: ${daysAhead.toString()},classEvents: ${classEvents.toString()}';
    return '{$string}';
  }
}
