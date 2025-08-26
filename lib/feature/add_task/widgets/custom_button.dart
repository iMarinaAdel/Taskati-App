import 'package:flutter/material.dart';
import 'package:taskati/core/extentions/app_navigation.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  final TaskModel? taskModel;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final int selectColor;
  final TextEditingController endTimeController;
  final GlobalKey<FormState> formKey;

  const CustomButton({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.dateController,
    required this.startTimeController,
    required this.selectColor,
    required this.endTimeController,
    required this.formKey,
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shadowColor: AppColors.primaryLightColor,
          backgroundColor: AppColors.primaryLightColor,
        ),
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            String id = "";
            if (taskModel != null) {
              id = taskModel!.id;
            } else {
              id = DateTime.now().millisecond.toString();
            }

            LocalHelper.cacheTask(
              id,
              TaskModel(
                id: id,
                title: titleController.text,
                description: descriptionController.text,
                date: dateController.text,
                startTime: startTimeController.text,
                endTime: endTimeController.text,
                color: selectColor,
                isCompleted: false,
              ),
            );
            AppNavigation.pop(context);
          }
        },
        child: Text(
          taskModel != null ? "Update Task" : "Add Task",
          style: TextStyles.getTitle(),
        ),
      ),
    );
  }
}
