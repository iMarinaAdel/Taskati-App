import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: DatePicker(
        width: 70,
        height: 90,
         DateTime.now().subtract(Duration(days: 30)),
        initialSelectedDate: DateTime.now(),
        selectionColor: AppColors.primaryColor,
        selectedTextColor: AppColors.primaryLightColor,
        daysCount: 60,
        onDateChange: (date) {},
      ),
    );
  }
}
