// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClassModel _$_$_ClassModelFromJson(Map<String, dynamic> json) {
  return _$_ClassModel(
    id: json['id'] as String,
    name: json['name'] as String,
    color: json['color'] as int,
    info: json['info'] as String,
    times: (json['times'] as List)
        ?.map((e) => e == null
            ? null
            : ClassTimeModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ClassModelToJson(_$_ClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'info': instance.info,
      'times': instance.times?.map((e) => e?.toJson())?.toList(),
    };

_$_ClassTimeModel _$_$_ClassTimeModelFromJson(Map<String, dynamic> json) {
  return _$_ClassTimeModel(
    days: (json['days'] as List)?.map((e) => e as int)?.toList(),
    startHour: json['startHour'] as int,
    startMinute: json['startMinute'] as int,
    endHour: json['endHour'] as int,
    endMinute: json['endMinute'] as int,
  );
}

Map<String, dynamic> _$_$_ClassTimeModelToJson(_$_ClassTimeModel instance) =>
    <String, dynamic>{
      'days': instance.days,
      'startHour': instance.startHour,
      'startMinute': instance.startMinute,
      'endHour': instance.endHour,
      'endMinute': instance.endMinute,
    };
