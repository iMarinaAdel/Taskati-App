import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final List<Color> taskColors = const [
    AppColors.primaryColor,
    AppColors.blueColor,
    AppColors.yellowColor,
    AppColors.pinkwColor,
  ];
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: Textstyles.getTitle(),
              textAlign: TextAlign.start,
            ),
            Gap(6),
            TextFormField(decoration: InputDecoration(hintText: "Enter Title")),
            Gap(15),
            Text(
              "Describtion",
              style: Textstyles.getTitle(),
              textAlign: TextAlign.start,
            ),
            Gap(6),
            TextFormField(
              decoration: InputDecoration(hintText: "Enter description ..."),
              maxLines: 3,
            ),
            Gap(15),
            Text(
              "Date",
              style: Textstyles.getTitle(),
              textAlign: TextAlign.start,
            ),
            Gap(6),
            TextFormField(
              decoration: InputDecoration(hintText: "Enter Date ..."),
            ),
            Gap(15),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start Date", textAlign: TextAlign.start),
                      Gap(6),
                      TextFormField(),
                    ],
                  ),
                ),
                Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("End Date", textAlign: TextAlign.start),
                      Gap(6),
                      TextFormField(),
                    ],
                  ),
                ),
              ],
            ),
            Gap(20),
            Row(
              spacing: 5,
              children: List.generate(taskColors.length, (index) {
                return GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: taskColors[index],
                    child: (selectColor == index)
                        ? Icon(Icons.check, color: AppColors.whiteColor)
                        : null,
                  ),
                  onTap: () {
                    setState(() {
                      selectColor = index;
                    });
                  },
                );
              }),
            ),
            Gap(30),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: AppColors.primaryLightColor,
                  backgroundColor: AppColors.primaryLightColor,
                ),
                onPressed: () {},
                child: Text("Add Task", style: Textstyles.getTitle()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
