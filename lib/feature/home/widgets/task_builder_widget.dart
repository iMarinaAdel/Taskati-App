import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/feature/home/widgets/task_card_widget.dart';

class TaskBuilderWidget extends StatelessWidget {
  const TaskBuilderWidget({super.key, required this.selectedDate});
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: LocalHelper.taskBox.listenable(),
        builder: (context, box, child) {
          List<TaskModel> tasks = [];
          for (var model in box.values) {
            if (model.date == selectedDate) {
              tasks.add(model);
            }
          }
          if (tasks.isEmpty) {
            return Center(
              child: Lottie.asset(AppAssets.emptyTask, width: 800, height: 800),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return TaskCardWidget(
                task: tasks[index],
                onComplete: () {
                  box.put(
                    tasks[index].id,
                    tasks[index].copyWith(isCompleted: true),
                  );
                },
                onDelete: () {
                  box.delete(tasks[index].id);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Gap(10);
            },
            itemCount: tasks.length,
          );
        },
      ),
    );
  }
}
