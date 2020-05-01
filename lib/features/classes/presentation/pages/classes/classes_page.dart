import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:routine/core/routes/router.gr.dart';

import '../../../../../injunction.dart';
import '../../../../classes/domain/entities/class_entity.dart';
import '../../../../classes/presentation/mobx/classes_store.dart';
import '../../helpers.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage();

  static final ClassesStore _classesStore = getIt<ClassesStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete), onPressed: () => _classesStore.deleteAll())
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _classesStore.classes.length,
            itemBuilder: (_, int index) {
              final ClassEntity mClass = _classesStore.classes[index];
              return Card(
                child: ListTile(
                  onTap: () => Helpers.onShowClassDetails(mClass),
                  title: Text('${mClass.name}'),
                  trailing: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(mClass.color),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Helpers.onShowClassDialog();
        },
      ),
    );
  }
}
