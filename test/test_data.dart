import 'package:flutter/material.dart';
import 'package:routine/classes/domain/entities/class_entity.dart';
import 'package:routine/core/enums/enums.dart';

const String tClassId = '0x0';
const ClassEntity tClass = ClassEntity(
  id: '0x1',
  name: 'Class No. 1',
  color: 0xffd45d6,
  info: 'This is the first Class',
  times: <ClassTime>[
    ClassTime(
      days: <Days>[
        Days.saturday,
        Days.thursday,
      ],
      startTime: TimeOfDay(hour: 6, minute: 30),
      endTime: TimeOfDay(hour: 8, minute: 30),
    ),
  ],
);
const List<ClassEntity> tClassList = <ClassEntity>[
  ClassEntity(
    id: '0x0',
    name: 'Class No. 1',
    color: 0xffd45d6,
    info: 'This is the first Class',
    times: <ClassTime>[
      ClassTime(
        days: <Days>[
          Days.saturday,
          Days.thursday,
        ],
        startTime: TimeOfDay(hour: 6, minute: 30),
        endTime: TimeOfDay(hour: 8, minute: 30),
      ),
    ],
  ),
  ClassEntity(
    id: '0x1',
    name: 'Class No. 2',
    color: 0xffd45d6,
    info: 'This is the second Class',
    times: <ClassTime>[
      ClassTime(
        days: <Days>[
          Days.sunday,
        ],
        startTime: TimeOfDay(hour: 6, minute: 30),
        endTime: TimeOfDay(hour: 8, minute: 30),
      ),
      ClassTime(
        days: <Days>[
          Days.thursday,
        ],
        startTime: TimeOfDay(hour: 10, minute: 30),
        endTime: TimeOfDay(hour: 13, minute: 30),
      ),
    ],
  ),
  ClassEntity(
    id: '0x2',
    name: 'Class No. 3',
    color: 0xffd45d6,
    info: 'This is the third Class',
    times: <ClassTime>[
      ClassTime(
        days: <Days>[
          Days.tuesday,
        ],
        startTime: TimeOfDay(hour: 8, minute: 30),
        endTime: TimeOfDay(hour: 10, minute: 30),
      ),
    ],
  ),
];
