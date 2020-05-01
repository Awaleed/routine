import '../../../core/routes/router.gr.dart';
import '../../../injunction.dart';
import '../../classes/domain/entities/class_entity.dart';
import 'mobx/classes_store.dart';

abstract class Helpers {
  static ClassesStore store = getIt<ClassesStore>();

  static ClassEntity _class() => const ClassEntity(
        name: '',
        color: 0,
        info: '',
        times: <ClassTime>[],
      );

  static Future<void> onShowClassDialog({ClassEntity classEntity}) async {
    final ClassEntity mClass = await Router.navigator.pushNamed<ClassEntity>(
      Routes.classDialog,
      arguments: ClassDialogArguments(classEntity: classEntity ?? _class()),
    );
    if (mClass != null) {
      await store.addClass(mClass);
    }
  }

  static onShowClassDetails(ClassEntity mClass) {
    Router.navigator.pushNamed(
      Routes.classDetails,
      arguments: ClassDetailsArguments(entity: mClass),
    );
  }

  // static int mapColor(Color value) => Colors.primaries.indexOf(value as MaterialColor);

  // static void onDeleteCourse(Course course) {
  //   store.deleteCourse(course);
  //   Router.navigator.pop();
  // }

  // static Future<void> onDeleteTask({Task task, Task sub}) async {
  //   if (sub.isSubTask) {
  //     task.subtasks.removeWhere((st) => st == sub);
  //     await store.updateTask(task);
  //   } else {
  //     await store.deleteTask(sub);
  //   }
  //   Router.navigator.pop();
  // }

  // static void onShowTaskDetails({Task parent, Task task}) {
  //   Router.navigator.pushNamed(
  //     Routes.taskDetails,
  //     arguments: TaskDetailsArguments(parent: parent, task: task),
  //   );
  // }

  // static String mapTaskType({TaskType type, LocaleBase loc}) {
  //   switch (type) {
  //     case TaskType.homework:
  //       return '${loc.tasks.homework}';
  //       break;
  //     case TaskType.project:
  //       return '${loc.tasks.project}';
  //       break;
  //     case TaskType.quiz:
  //       return '${loc.tasks.quiz}';
  //       break;
  //     case TaskType.test:
  //       return '${loc.tasks.test}';
  //       break;
  //     default:
  //       return 'Type not found...';
  //   }
  // }
}
