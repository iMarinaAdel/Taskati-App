import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/feature/add_task/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/widgets/select_colors.dart';
import 'package:taskati/feature/add_task/widgets/text_feilds.dart';
import 'package:taskati/feature/add_task/widgets/time_fielsd_row.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.taskModel});
  final TaskModel? taskModel;
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
  int selectedColor = 0;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.taskModel?.title ?? '';
    descriptionController.text = widget.taskModel?.description ?? '';
    dateController.text =
        widget.taskModel?.date ??
        DateFormat("yyyy-MM-dd").format(DateTime.now());
    startTimeController.text =
        widget.taskModel?.startTime ??
        DateFormat("hh:mm a").format(DateTime.now());
    endTimeController.text =
        widget.taskModel?.endTime ??
        DateFormat("hh:mm a").format(DateTime.now());
    selectedColor = widget.taskModel?.color ?? 0;
  }

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
          child: Form(
            key: formKey,
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
                  selectedIndex: selectedColor,
                  onColorSelected: (index) {
                    setState(() {
                      selectedColor = index;
                    });
                  },
                ),
                Gap(50),
                CustomButton(
                  taskModel: widget.taskModel,
                  formKey: formKey,
                  titleController: titleController,
                  descriptionController: descriptionController,
                  dateController: dateController,
                  startTimeController: startTimeController,
                  selectColor: selectedColor,
                  endTimeController: endTimeController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
