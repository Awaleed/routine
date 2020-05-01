import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ClassEntity extends Equatable {
  const ClassEntity({
    this.id = '',
    @required this.name,
    @required this.color,
    @required this.info,
    @required this.times,
  });

  final String id;
  final String name;
  final int color;
  final String info;
  final List<ClassTime> times;
  // TODO: Add list of tasks...
  // final List<Task> tasks;

  @override
  List<Object> get props => <dynamic>[
        id,
        name,
        color,
        info,
        times,
      ];
}

class ClassTime {
  ClassTime({
    @required this.days,
    @required this.startTime,
    @required this.endTime,
  });

  List<int> days;
  TimeOfDay startTime;
  TimeOfDay endTime;
}
