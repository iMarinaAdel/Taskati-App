import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/feature/add_task/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/widgets/select_colors.dart';
import 'package:taskati/feature/add_task/widgets/text_feilds.dart';
import 'package:taskati/feature/add_task/widgets/time_fielsd_row.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  var startTimeController = TextEditingController(
    text: DateFormat("hh-mm a").format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    text: DateFormat("hh-mm a").format(DateTime.now()),
  );
  int selectColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLightColor,
        elevation: 15,
        shadowColor: AppColors.primaryLightColor,
        centerTitle: true,
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 15,
          top: 50,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFeilds(
                titleController: titleController,
                descriptionController: descriptionController,
                dateController: dateController,
              ),
              Gap(20),
              TimeFielsdRow(
                dateController: dateController,
                startTimeController: startTimeController,
                endTimeController: endTimeController,
              ),
              Gap(20),
              SelectColorsWidget(
                selectedIndex: selectColor,
                onColorSelected: (index) {
                  setState(() {
                    selectColor = index;
                  });
                },
              ),
              Gap(50),
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}
