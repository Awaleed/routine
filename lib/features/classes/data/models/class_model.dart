import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/enums.dart';
import '../../domain/entities/class_entity.dart';

part 'class_model.freezed.dart';
part 'class_model.g.dart';

@freezed
abstract class ClassModel implements _$ClassModel {
  @JsonSerializable(explicitToJson: true)
  factory ClassModel({
    @required String id,
    @required String name,
    @required int color,
    @required String info,
    @required List<ClassTimeModel> times,
    //TODO: add tasks list...
  }) = _ClassModel;

  factory ClassModel.fromEntity(ClassEntity entity) => ClassModel(
        id: entity.id,
        name: entity.name,
        color: entity.color,
        info: entity.info,
        times: entity.times.map((ClassTime e) => ClassTimeModel.fromEntity(e)).toList(),
      );

  factory ClassModel.fromJson(Map<String, dynamic> json) => _$ClassModelFromJson(json);

  @late
  ClassEntity get entity => ClassEntity(
        id: id,
        name: name,
        color: color,
        info: info,
        times: times.map((ClassTimeModel e) => e.entity).toList(),
      );
}

@freezed
abstract class ClassTimeModel implements _$ClassTimeModel {
  factory ClassTimeModel({
    @required List<int> days,
    @required int startHour,
    @required int startMinute,
    @required int endHour,
    @required int endMinute,
  }) = _ClassTimeModel;

  factory ClassTimeModel.fromEntity(ClassTime entity) => ClassTimeModel(
        days: entity.days,
        startHour: entity.startTime.hour,
        startMinute: entity.startTime.minute,
        endHour: entity.endTime.hour,
        endMinute: entity.endTime.minute,
      );

  factory ClassTimeModel.fromJson(Map<String, dynamic> json) => _$ClassTimeModelFromJson(json);

  @late
  ClassTime get entity => ClassTime(
        days: days,
        startTime: TimeOfDay(hour: startHour, minute: startMinute),
        endTime: TimeOfDay(hour: endHour, minute: endMinute),
      );
}
