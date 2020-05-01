import 'package:flutter/material.dart';
import 'package:routine/core/enums/enums.dart';
import 'package:routine/features/classes/domain/entities/class_entity.dart';
import 'package:time_machine/time_machine.dart';

class ClassDetails extends StatelessWidget {
  const ClassDetails({
    Key key,
    @required this.entity,
  }) : super(key: key);

  final ClassEntity entity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${entity.name}')),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 6),
                  color: Colors.black12,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.more),
                      const SizedBox(width: 10),
                      Text(
                        'Info',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          for (int i = 0; i < 4; i++)
                            Flexible(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Icon(Icons.ac_unit),
                                        ),
                                        const Text('Resource'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 6),
                  color: Colors.black12,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      const SizedBox(width: 10),
                      Text(
                        'Weekly schedule',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      for (int i = 1; i <= daysNames.length; i++)
                        Flexible(
                          child: ChoiceChip(
                            label: Text('${daysNames[i - 1]}'),
                            selected: _checkSelected(i),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 6),
                  color: Colors.black12,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.event),
                      const SizedBox(width: 10),
                      Text(
                        'Events',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      ...() {
                        final List<Widget> list = <Widget>[];
                        for (int i = 0; i < 3; i++) {
                          list.add(
                            const ListTile(
                              title: Text('Event '),
                              subtitle: Text('Type'),
                            ),
                          );
                          list.add(const Divider());
                        }
                        list.removeLast();
                        return list;
                      }()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _checkSelected(int i) {
    for (final ClassTime time in entity.times) {
      if (time.days.contains(i)) return true;
    }
    return false;
  }
}
