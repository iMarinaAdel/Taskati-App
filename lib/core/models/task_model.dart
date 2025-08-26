import 'package:hive/hive.dart';

part "task_model.g.dart";

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String date;
  @HiveField(5)
  final String startTime;
  @HiveField(6)
  final String endTime;
  @HiveField(7)
  final int color;
  @HiveField(8)
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.isCompleted,
  });

  copyWith({
    String? id,
    String? title,
    String? decribtion,
    String? date,
    String? startTime,
    String? endTime,
    int? color,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: decribtion ?? description,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
