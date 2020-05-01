// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:routine/features/classes/presentation/pages/landing/landing_page.dart';
import 'package:routine/features/classes/presentation/pages/classes/classes_page.dart';
import 'package:routine/features/classes/presentation/pages/classes/class_details.dart';
import 'package:routine/features/classes/domain/entities/class_entity.dart';
import 'package:routine/features/classes/presentation/pages/timetable/timetable.dart';
import 'package:routine/features/classes/presentation/pages/classes/class_dialog.dart';

abstract class Routes {
  static const landingPage = '/';
  static const classesPage = '/classes-page';
  static const classDetails = '/class-details';
  static const timetable = '/timetable';
  static const classDialog = '/class-dialog';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.landingPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LandingPage(),
          settings: settings,
        );
      case Routes.classesPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ClassesPage(),
          settings: settings,
        );
      case Routes.classDetails:
        if (hasInvalidArgs<ClassDetailsArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ClassDetailsArguments>(args);
        }
        final typedArgs = args as ClassDetailsArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              ClassDetails(key: typedArgs.key, entity: typedArgs.entity),
          settings: settings,
        );
      case Routes.timetable:
        return MaterialPageRoute<dynamic>(
          builder: (context) => TimetableExample(),
          settings: settings,
        );
      case Routes.classDialog:
        if (hasInvalidArgs<ClassDialogArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<ClassDialogArguments>(args);
        }
        final typedArgs = args as ClassDialogArguments;
        return MaterialPageRoute<ClassEntity>(
          builder: (context) => ClassDialog(
              key: typedArgs.key, classEntity: typedArgs.classEntity),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//ClassDetails arguments holder class
class ClassDetailsArguments {
  final Key key;
  final ClassEntity entity;
  ClassDetailsArguments({this.key, @required this.entity});
}

//ClassDialog arguments holder class
class ClassDialogArguments {
  final Key key;
  final ClassEntity classEntity;
  ClassDialogArguments({this.key, @required this.classEntity});
}
