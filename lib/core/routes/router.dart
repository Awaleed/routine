import 'package:auto_route/auto_route_annotations.dart';

import '../../features/classes/domain/entities/class_entity.dart';
import '../../features/classes/presentation/pages/classes/class_details.dart';
import '../../features/classes/presentation/pages/classes/class_dialog.dart';
import '../../features/classes/presentation/pages/classes/classes_page.dart';
import '../../features/classes/presentation/pages/landing/landing_page.dart';
import '../../features/classes/presentation/pages/timetable/timetable.dart';

@MaterialAutoRouter()
class $Router {
  // use @initial or @CupertinoRoute(initial: true) to annotate your initial route.
  @initial
  LandingPage landingPage;
  ClassesPage classesPage; // your desired route name
  ClassDetails classDetails;
  TimetableExample timetable;

  @MaterialRoute(fullscreenDialog: true, returnType: ClassEntity)
  ClassDialog classDialog;

  // //optional route Customization
  // @CupertinoRoute(fullscreenDialog: true)
  // LoginScreen loginScreenRoute;
}
