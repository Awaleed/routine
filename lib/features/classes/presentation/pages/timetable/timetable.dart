import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timetable/timetable.dart';

import '../../../../../injunction.dart';
import '../../../domain/entities/class_entity.dart';
import '../../mobx/classes_store.dart';

class TimetableExample extends StatefulWidget {
  @override
  _TimetableExampleState createState() => _TimetableExampleState();
}

class _TimetableExampleState extends State<TimetableExample> {
  TimetableController<BasicEvent> _controller;
  static final ClassesStore _classesStore = getIt<ClassesStore>();

  @override
  void initState() {
    super.initState();
    _controller = TimetableController<BasicEvent>(
      // A basic EventProvider containing a single event.
      // eventProvider: EventProvider<BasicEvent>.stream(
      //   eventGetter: (DateInterval dates) {
      //   },
      // ),

      // For a demo of overlapping events, use this one instead:
      // eventProvider: positioningDemoEventProvider,

      // Or even this short example using a Stream:
      eventProvider: EventProvider<BasicEvent>.stream(
        eventGetter: (DateInterval range) {
          // print('-------------------');
          // for (var i = 0; i < 7; i++) {
          //   print((dayIndex + i) % 7);
          // }

          final List<BasicEvent> events = <BasicEvent>[];

          for (final ClassEntity item in _classesStore.classes) {
            for (final ClassTime time in item.times) {
              for (final int day in time.days) {
                final int dayIndex = range.start.dayOfWeek.value;
                final LocalDate dayOfEvent = range.start.addDays(((day - dayIndex) + 7) % 7);

                events.add(
                  BasicEvent(
                    id: time.hashCode,
                    title: '${item.name}',
                    color: Color(item.color),
                    start: dayOfEvent.at(LocalTime(time.startTime.hour, time.startTime.minute, 0)),
                    end: dayOfEvent.at(LocalTime(time.endTime.hour, time.endTime.minute, 0)),
                  ),
                );

                if (day == dayIndex) {
                  events.add(
                    BasicEvent(
                      id: time.hashCode,
                      title: '${item.name}',
                      color: Color(item.color),
                      start: dayOfEvent.addDays(7).at(LocalTime(time.startTime.hour, time.startTime.minute, 0)),
                      end: dayOfEvent.addDays(7).at(LocalTime(time.endTime.hour, time.endTime.minute, 0)),
                    ),
                  );
                }
              }
            }
          }
          return Stream<List<BasicEvent>>.value(events);
        },
      ),

      // Other (optional) parameters:
      initialDate: LocalDate.today(),
      visibleRange: const VisibleRange.days(7),
      firstDayOfWeek: DayOfWeek.saturday,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.today),
            onPressed: () => _controller.animateToToday(),
            tooltip: 'Jump to today',
          ),
        ],
      ),
      body: Timetable<BasicEvent>(
        controller: _controller,
        eventBuilder: (BasicEvent event) {
          return BasicEventWidget(event);
        },
      ),
    );
  }
}

class WeeklyEvent extends Event {}
