import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/core/constants/task_colors.dart';
import 'package:taskati/core/extentions/app_navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/add_task/pages/add_task_screen.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.task,
    required this.onComplete,
    required this.onDelete,
  });
  final TaskModel task;
  final Function() onComplete;
  final Function() onDelete;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onComplete();
        } else {
          onDelete();
        }
      },
      background: Container(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.check, color: AppColors.greenColor, size: 30),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        child: Icon(Icons.delete_rounded, color: AppColors.redColor, size: 30),
      ),
      child: GestureDetector(
        onTap: () {
          AppNavigation.pushTo(context, AddTaskScreen(taskModel: task));
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: task.isCompleted
                ? AppColors.greenColor
                : TaskColors.taskColors[task.color],
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.getTitle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.primaryLightColor,
                          size: 19,
                        ),
                        Gap(12),

                        Text(
                          '${task.startTime} : ${task.endTime}',
                          style: TextStyles.getSmall(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    if (task.description.isNotEmpty == true)
                      Text(
                        task.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.getBody(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              Gap(8),
              Container(height: 60, width: 1.5, color: AppColors.whiteColor),
              Gap(5),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  task.isCompleted ? "COMPLETED" : "TODO",
                  style: TextStyles.getSmall(
                    fontSize: 12,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
