import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import './injunction.dart' as dep_injection;
import 'core/routes/router.gr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep_injection.configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator<Router>(router: Router()),
      theme: ThemeData(primarySwatch: Colors.cyan),
      title: 'Material App',
    );
  }
}
