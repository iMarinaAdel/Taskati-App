import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(String) onDateSelected;

  const DatePickerWidget({super.key, required this.onDateSelected});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  String selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 70,
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColors.primaryColor,
        selectedTextColor: AppColors.whiteColor,
        dayTextStyle: TextStyles.getSmall(),
        monthTextStyle: TextStyles.getSmall(),
        dateTextStyle: TextStyles.getBody(fontWeight: FontWeight.w600),
        onDateChange: (date) {
          setState(() {
            selectedDate = DateFormat("yyyy-MM-dd").format(date);
            widget.onDateSelected(selectedDate);
          });
        },
      ),
    );
  }
}
