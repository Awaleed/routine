// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'class_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ClassModel _$ClassModelFromJson(Map<String, dynamic> json) {
  return _ClassModel.fromJson(json);
}

class _$ClassModelTearOff {
  const _$ClassModelTearOff();

  _ClassModel call(
      {@required String id,
      @required String name,
      @required int color,
      @required String info,
      @required List<ClassTimeModel> times}) {
    return _ClassModel(
      id: id,
      name: name,
      color: color,
      info: info,
      times: times,
    );
  }
}

// ignore: unused_element
const $ClassModel = _$ClassModelTearOff();

mixin _$ClassModel {
  String get id;
  String get name;
  int get color;
  String get info;
  List<ClassTimeModel> get times;

  Map<String, dynamic> toJson();
  $ClassModelCopyWith<ClassModel> get copyWith;
}

abstract class $ClassModelCopyWith<$Res> {
  factory $ClassModelCopyWith(
          ClassModel value, $Res Function(ClassModel) then) =
      _$ClassModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      int color,
      String info,
      List<ClassTimeModel> times});
}

class _$ClassModelCopyWithImpl<$Res> implements $ClassModelCopyWith<$Res> {
  _$ClassModelCopyWithImpl(this._value, this._then);

  final ClassModel _value;
  // ignore: unused_field
  final $Res Function(ClassModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object color = freezed,
    Object info = freezed,
    Object times = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      color: color == freezed ? _value.color : color as int,
      info: info == freezed ? _value.info : info as String,
      times: times == freezed ? _value.times : times as List<ClassTimeModel>,
    ));
  }
}

abstract class _$ClassModelCopyWith<$Res> implements $ClassModelCopyWith<$Res> {
  factory _$ClassModelCopyWith(
          _ClassModel value, $Res Function(_ClassModel) then) =
      __$ClassModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      int color,
      String info,
      List<ClassTimeModel> times});
}

class __$ClassModelCopyWithImpl<$Res> extends _$ClassModelCopyWithImpl<$Res>
    implements _$ClassModelCopyWith<$Res> {
  __$ClassModelCopyWithImpl(
      _ClassModel _value, $Res Function(_ClassModel) _then)
      : super(_value, (v) => _then(v as _ClassModel));

  @override
  _ClassModel get _value => super._value as _ClassModel;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object color = freezed,
    Object info = freezed,
    Object times = freezed,
  }) {
    return _then(_ClassModel(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      color: color == freezed ? _value.color : color as int,
      info: info == freezed ? _value.info : info as String,
      times: times == freezed ? _value.times : times as List<ClassTimeModel>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_ClassModel with DiagnosticableTreeMixin implements _ClassModel {
  _$_ClassModel(
      {@required this.id,
      @required this.name,
      @required this.color,
      @required this.info,
      @required this.times})
      : assert(id != null),
        assert(name != null),
        assert(color != null),
        assert(info != null),
        assert(times != null);

  factory _$_ClassModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ClassModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int color;
  @override
  final String info;
  @override
  final List<ClassTimeModel> times;

  bool _didentity = false;
  ClassEntity _entity;

  @override
  ClassEntity get entity {
    if (_didentity == false) {
      _didentity = true;
      _entity = ClassEntity(
        id: id,
        name: name,
        color: color,
        info: info,
        times: times.map((ClassTimeModel e) => e.entity).toList(),
      );
    }
    return _entity;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClassModel(id: $id, name: $name, color: $color, info: $info, times: $times, entity: $entity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClassModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('times', times))
      ..add(DiagnosticsProperty('entity', entity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClassModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)) &&
            (identical(other.times, times) ||
                const DeepCollectionEquality().equals(other.times, times)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(info) ^
      const DeepCollectionEquality().hash(times);

  @override
  _$ClassModelCopyWith<_ClassModel> get copyWith =>
      __$ClassModelCopyWithImpl<_ClassModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClassModelToJson(this);
  }
}

abstract class _ClassModel implements ClassModel {
  factory _ClassModel(
      {@required String id,
      @required String name,
      @required int color,
      @required String info,
      @required List<ClassTimeModel> times}) = _$_ClassModel;

  factory _ClassModel.fromJson(Map<String, dynamic> json) =
      _$_ClassModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get color;
  @override
  String get info;
  @override
  List<ClassTimeModel> get times;
  @override
  _$ClassModelCopyWith<_ClassModel> get copyWith;
}

ClassTimeModel _$ClassTimeModelFromJson(Map<String, dynamic> json) {
  return _ClassTimeModel.fromJson(json);
}

class _$ClassTimeModelTearOff {
  const _$ClassTimeModelTearOff();

  _ClassTimeModel call(
      {@required List<int> days,
      @required int startHour,
      @required int startMinute,
      @required int endHour,
      @required int endMinute}) {
    return _ClassTimeModel(
      days: days,
      startHour: startHour,
      startMinute: startMinute,
      endHour: endHour,
      endMinute: endMinute,
    );
  }
}

// ignore: unused_element
const $ClassTimeModel = _$ClassTimeModelTearOff();

mixin _$ClassTimeModel {
  List<int> get days;
  int get startHour;
  int get startMinute;
  int get endHour;
  int get endMinute;

  Map<String, dynamic> toJson();
  $ClassTimeModelCopyWith<ClassTimeModel> get copyWith;
}

abstract class $ClassTimeModelCopyWith<$Res> {
  factory $ClassTimeModelCopyWith(
          ClassTimeModel value, $Res Function(ClassTimeModel) then) =
      _$ClassTimeModelCopyWithImpl<$Res>;
  $Res call(
      {List<int> days,
      int startHour,
      int startMinute,
      int endHour,
      int endMinute});
}

class _$ClassTimeModelCopyWithImpl<$Res>
    implements $ClassTimeModelCopyWith<$Res> {
  _$ClassTimeModelCopyWithImpl(this._value, this._then);

  final ClassTimeModel _value;
  // ignore: unused_field
  final $Res Function(ClassTimeModel) _then;

  @override
  $Res call({
    Object days = freezed,
    Object startHour = freezed,
    Object startMinute = freezed,
    Object endHour = freezed,
    Object endMinute = freezed,
  }) {
    return _then(_value.copyWith(
      days: days == freezed ? _value.days : days as List<int>,
      startHour: startHour == freezed ? _value.startHour : startHour as int,
      startMinute:
          startMinute == freezed ? _value.startMinute : startMinute as int,
      endHour: endHour == freezed ? _value.endHour : endHour as int,
      endMinute: endMinute == freezed ? _value.endMinute : endMinute as int,
    ));
  }
}

abstract class _$ClassTimeModelCopyWith<$Res>
    implements $ClassTimeModelCopyWith<$Res> {
  factory _$ClassTimeModelCopyWith(
          _ClassTimeModel value, $Res Function(_ClassTimeModel) then) =
      __$ClassTimeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<int> days,
      int startHour,
      int startMinute,
      int endHour,
      int endMinute});
}

class __$ClassTimeModelCopyWithImpl<$Res>
    extends _$ClassTimeModelCopyWithImpl<$Res>
    implements _$ClassTimeModelCopyWith<$Res> {
  __$ClassTimeModelCopyWithImpl(
      _ClassTimeModel _value, $Res Function(_ClassTimeModel) _then)
      : super(_value, (v) => _then(v as _ClassTimeModel));

  @override
  _ClassTimeModel get _value => super._value as _ClassTimeModel;

  @override
  $Res call({
    Object days = freezed,
    Object startHour = freezed,
    Object startMinute = freezed,
    Object endHour = freezed,
    Object endMinute = freezed,
  }) {
    return _then(_ClassTimeModel(
      days: days == freezed ? _value.days : days as List<int>,
      startHour: startHour == freezed ? _value.startHour : startHour as int,
      startMinute:
          startMinute == freezed ? _value.startMinute : startMinute as int,
      endHour: endHour == freezed ? _value.endHour : endHour as int,
      endMinute: endMinute == freezed ? _value.endMinute : endMinute as int,
    ));
  }
}

@JsonSerializable()
class _$_ClassTimeModel
    with DiagnosticableTreeMixin
    implements _ClassTimeModel {
  _$_ClassTimeModel(
      {@required this.days,
      @required this.startHour,
      @required this.startMinute,
      @required this.endHour,
      @required this.endMinute})
      : assert(days != null),
        assert(startHour != null),
        assert(startMinute != null),
        assert(endHour != null),
        assert(endMinute != null);

  factory _$_ClassTimeModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ClassTimeModelFromJson(json);

  @override
  final List<int> days;
  @override
  final int startHour;
  @override
  final int startMinute;
  @override
  final int endHour;
  @override
  final int endMinute;

  bool _didentity = false;
  ClassTime _entity;

  @override
  ClassTime get entity {
    if (_didentity == false) {
      _didentity = true;
      _entity = ClassTime(
        days: days,
        startTime: TimeOfDay(hour: startHour, minute: startMinute),
        endTime: TimeOfDay(hour: endHour, minute: endMinute),
      );
    }
    return _entity;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClassTimeModel(days: $days, startHour: $startHour, startMinute: $startMinute, endHour: $endHour, endMinute: $endMinute, entity: $entity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClassTimeModel'))
      ..add(DiagnosticsProperty('days', days))
      ..add(DiagnosticsProperty('startHour', startHour))
      ..add(DiagnosticsProperty('startMinute', startMinute))
      ..add(DiagnosticsProperty('endHour', endHour))
      ..add(DiagnosticsProperty('endMinute', endMinute))
      ..add(DiagnosticsProperty('entity', entity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClassTimeModel &&
            (identical(other.days, days) ||
                const DeepCollectionEquality().equals(other.days, days)) &&
            (identical(other.startHour, startHour) ||
                const DeepCollectionEquality()
                    .equals(other.startHour, startHour)) &&
            (identical(other.startMinute, startMinute) ||
                const DeepCollectionEquality()
                    .equals(other.startMinute, startMinute)) &&
            (identical(other.endHour, endHour) ||
                const DeepCollectionEquality()
                    .equals(other.endHour, endHour)) &&
            (identical(other.endMinute, endMinute) ||
                const DeepCollectionEquality()
                    .equals(other.endMinute, endMinute)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(days) ^
      const DeepCollectionEquality().hash(startHour) ^
      const DeepCollectionEquality().hash(startMinute) ^
      const DeepCollectionEquality().hash(endHour) ^
      const DeepCollectionEquality().hash(endMinute);

  @override
  _$ClassTimeModelCopyWith<_ClassTimeModel> get copyWith =>
      __$ClassTimeModelCopyWithImpl<_ClassTimeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClassTimeModelToJson(this);
  }
}

abstract class _ClassTimeModel implements ClassTimeModel {
  factory _ClassTimeModel(
      {@required List<int> days,
      @required int startHour,
      @required int startMinute,
      @required int endHour,
      @required int endMinute}) = _$_ClassTimeModel;

  factory _ClassTimeModel.fromJson(Map<String, dynamic> json) =
      _$_ClassTimeModel.fromJson;

  @override
  List<int> get days;
  @override
  int get startHour;
  @override
  int get startMinute;
  @override
  int get endHour;
  @override
  int get endMinute;
  @override
  _$ClassTimeModelCopyWith<_ClassTimeModel> get copyWith;
}
