import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class TextFeilds extends StatelessWidget {
  const TextFeilds({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.dateController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Title", style: TextStyles.getTitle(), textAlign: TextAlign.start),
        Gap(6),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Task Title";
            }
            return null;
          },
          decoration: InputDecoration(hintText: "Enter Title"),
          controller: titleController,
        ),
        Gap(15),
        Text(
          "Describtion",
          style: TextStyles.getTitle(),
          textAlign: TextAlign.start,
        ),
        Gap(6),
        TextFormField(
          decoration: InputDecoration(hintText: "Enter description ..."),
          maxLines: 3,
          controller: descriptionController,
        ),
        Gap(15),
        Text("Date", style: TextStyles.getTitle(), textAlign: TextAlign.start),
        Gap(6),
        TextFormField(
          onTap: () async {
            var selectedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now().subtract(Duration(days: 30)),
              lastDate: DateTime.now().add(Duration(days: 365 * 3)),
            );

            if (selectedDate != null) {
              dateController.text = DateFormat(
                "yyyy-MM-dd",
              ).format(selectedDate);
            }
          },
          readOnly: true,
          controller: dateController,
          decoration: InputDecoration(
            hintText: "Enter Date ...",
            suffixIcon: Icon(
              Icons.calendar_month,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
