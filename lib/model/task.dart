import 'package:flutter/material.dart';
import 'package:todobooks/utils.dart';

class Task {
  final int id;
  final int userId;
  final Category category;
  final String task;
  final DateTime dueDate;
  final DateTime? doneDate;
  final TaskStatus status;
  final TaskPriority priority;

  Task({
    required this.id,
    required this.userId,
    required this.category,
    required this.task,
    required this.dueDate,
    required this.doneDate,
    required this.status,
    required this.priority,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] ?? '',
        userId: json['user_id'] ?? '',
        category: Category.fromJson(json['category'] ?? {}),
        task: json['task'] ?? '-',
        dueDate: TimeParser(json['due_date']).fromMillisec,
        doneDate: TimeParser(json['done_date']).fromMillisecNull,
        status: EnumParser(json['status']).toEnum(
          values: TaskStatus.values,
          error: TaskStatus.rm,
        ),
        priority: EnumParser(json['priority']).toEnum(
          values: TaskPriority.values,
          error: TaskPriority.mi,
        ),
      );
}

class Category {
  final int id;
  final Color color;
  final String name;

  Category({
    required this.id,
    required this.color,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] ?? '',
        color: HexColor.fromHex(json['color'] ?? '#000000'),
        name: json['name'] ?? 'base',
      );
}

enum TaskStatus { ct, cp, rm }

extension TaskStatusExtention on TaskStatus {
  String get iconPath {
    switch (this) {
      case TaskStatus.ct:
        return 'assets/check.svg';
      default:
        return 'assets/check_active.svg';
    }
  }
}

enum TaskPriority { vh, hi, mi, lo, vl }
