import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:routine/core/routes/router.gr.dart';
import 'package:routine/features/classes/presentation/mobx/classes_store.dart';

import '../../../../../injunction.dart';

// BEGIN LandingPage

class LandingPage extends StatefulWidget {
  const LandingPage();

  @override
  State createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static final ClassesStore _classesStore = getIt<ClassesStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('GalleryLocalizations.of(context).demoBottomAppBarTitle'),
      ),
      body: Observer(builder: (_) {
        return Center(
          child: Text.rich(TextSpan(
            text: 'Days ahead: ${_classesStore.daysAhead}\n',
            children: <TextSpan>[
              TextSpan(text: 'Happing today ${_classesStore.classEvents}'),
            ],
          )),
        );
      }),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: '__landing_page__fab__',
            onPressed: () => _classesStore.daysAhead--,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () => _classesStore.daysAhead++,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const _DemoBottomAppBar(),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // shape: const NotchedShape(),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Router.navigator.pushNamed(Routes.classesPage);
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Router.navigator.pushNamed(Routes.timetable);

                print('Search button pressed');
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                print('Favorite button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// END
