import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/enums/enums.dart';
import '../../../../../core/routes/router.gr.dart';
import '../../../domain/entities/class_entity.dart';
import '../../widgets/color_picker.dart';
import '../../widgets/flutter_datetime_formfield.dart';

@immutable
class ClassDialog extends StatefulWidget {
  const ClassDialog({Key key, @required this.classEntity}) : super(key: key);

  final ClassEntity classEntity;

  @override
  _ClassDialogState createState() => _ClassDialogState();
}

class _ClassDialogState extends State<ClassDialog> {
  List<Function> disposers = <Function>[];

  GlobalKey<FormState> formKey;
  bool autovalidate = false;

  TextEditingController nameController;
  int color;
  TextEditingController infoController;
  List<ClassTime> times;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();

    nameController = TextEditingController(text: widget.classEntity.name);
    color = widget.classEntity.color;
    infoController = TextEditingController(text: widget.classEntity.info);
    times = List<ClassTime>.from(widget.classEntity.times);

    disposers.addAll(<Function>[
      nameController.dispose,
      infoController.dispose,
    ]);
  }

  @override
  void dispose() {
    for (final Function disposer in disposers) {
      disposer();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.classEntity.name.isEmpty ? 'New Class' : 'Editing: ${widget.classEntity.name}'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          onWillPop: () => onWillPop(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(flex: 5, child: _buildNameField()),
                    const SizedBox(width: 5),
                    Flexible(child: _buildColorDropdown()),
                  ],
                ),
                const SizedBox(height: 20),
                _buildInfoField(),
                const SizedBox(height: 20),
                _buildTimesSection(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => onSaveClass(),
        label: const Text('Save'),
        icon: Icon(Icons.save),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: nameController,
      autovalidate: autovalidate,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Class name can\'t be empty';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
    );
  }

  // Widget _buildColorPicker() {
  //   return ColorPickerFormField(
  //     decoration: const InputDecoration(
  //       labelText: 'Pic a color',
  //       border: OutlineInputBorder(),
  //     ),
  //     color: Color(color),
  //     valueChanged: (Color value) {
  //       setState(() {
  //         color = value.value;
  //       });
  //     },
  //     autovalidate: autovalidate,
  //     validator: (Color value) {
  //       if (value.value == 0) {
  //         return 'Please choose color';
  //       }
  //       return null;
  //     },
  //   );
  // }

  Widget _buildColorDropdown() {
    return TextFormField(
      initialValue: ' ',
      readOnly: true,
      autovalidate: autovalidate,
      onTap: () => showColorPicker(),
      validator: (_) {
        if (color == 0) {
          return 'Please choose color';
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Color(color),
      ),
    );
  }

  Widget _buildInfoField() {
    return TextFormField(
      controller: infoController,
      minLines: 5,
      maxLines: 15,
      decoration: const InputDecoration(
        labelText: 'Info',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildTimesSection() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Class Times',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            OutlineButton.icon(
                icon: Icon(Icons.add),
                label: const Text('Add time'),
                onPressed: () {
                  setState(() {
                    times.add(
                      ClassTime(
                        days: <int>[],
                        startTime: const TimeOfDay(hour: 6, minute: 30),
                        endTime: const TimeOfDay(hour: 8, minute: 30),
                      ),
                    );
                  });
                })
          ],
        ),
        ..._mapTimes(),
      ],
    );
  }

  ClassEntity get _getEntity => ClassEntity(
        name: nameController.value.text,
        color: color,
        info: infoController.value.text,
        times: times,
      );

  void onSaveClass() {
    setState(() {
      autovalidate = true;
    });
    if (formKey.currentState.validate()) {
      Router.navigator.pop(_getEntity);
    }
  }

  Future<bool> onWillPop(BuildContext context) async {
    bool pop = false;
    if (_getEntity == widget.classEntity) {
      Router.navigator.pop();
      pop = true;
    } else {
      await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Discard changes?'),
            content: const Text(
              'The data you have entered hasn\'t been saved yet, Are you sure?',
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Router.navigator.pop();
                  pop = true;
                },
                child: const Text('DISCARD'),
              ),
              FlatButton(
                onPressed: () => Router.navigator.pop(),
                child: const Text('KEEP EDITING'),
              )
            ],
          );
        },
      );
    }
    return pop;
  }

  Future<void> showColorPicker() async {
    await showDialog(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 108),
          child: Card(
            child: ColorPicker(
              color: Color(color),
              valueChanged: (Color value) {
                setState(() {
                  color = value.value;
                });
                Router.navigator.pop();
              },
            ),
          ),
        );
      },
    );
  }

  List<Widget> _mapTimes() {
    final List<Widget> list = <Widget>[];
    for (final ClassTime item in times) {
      list.add(ClassTimeTile(time: item, onDelete: () => times.remove(item)));
      list.add(const SizedBox(height: 10));
    }
    return list;
  }
}

class ClassTimeTile extends StatefulWidget {
  const ClassTimeTile({
    Key key,
    @required this.time,
    @required this.onDelete,
  }) : super(key: key);

  final ClassTime time;
  final VoidCallback onDelete;

  @override
  _ClassTimeTileState createState() => _ClassTimeTileState();
}

class _ClassTimeTileState extends State<ClassTimeTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(widget.time),
      background: Container(
        color: Theme.of(context).errorColor,
      ),
      onDismissed: (_) => widget.onDelete(),
      child: InputDecorator(
        decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.all(10)),
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                for (var i = 1; i <= daysNames.length; i++)
                  ChoiceChip(
                    label: Text('${daysNames[i - 1]}'),
                    selected: widget.time.days.contains(i),
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          widget.time.days.add(i);
                        } else {
                          widget.time.days.remove(i);
                        }
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: <Widget>[
                Flexible(
                  child: DateTimeFormField(
                    initialValue: DateTime(0, 0, 0, widget.time.startTime.hour, widget.time.startTime.minute),
                    onlyTime: true,
                    decoration: const InputDecoration(labelText: 'Start Time', border: OutlineInputBorder(), isDense: true),
                    onChanged: (DateTime newValue) {
                      setState(() {
                        widget.time.startTime = TimeOfDay.fromDateTime(newValue);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: DateTimeFormField(
                    initialValue: DateTime(0, 0, 0, widget.time.endTime.hour, widget.time.endTime.minute),
                    onlyTime: true,
                    decoration: const InputDecoration(labelText: 'End Time', border: OutlineInputBorder(), isDense: true),
                    onChanged: (DateTime newValue) {
                      setState(() {
                        widget.time.endTime = TimeOfDay.fromDateTime(newValue);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
