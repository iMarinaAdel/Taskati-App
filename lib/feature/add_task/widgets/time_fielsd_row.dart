import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/services/showErrorMessage.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class TimeFielsdRow extends StatelessWidget {
  const TimeFielsdRow({
    super.key,
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
  });

  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start Date",
                textAlign: TextAlign.start,
                style: TextStyles.getTitle(),
              ),
              Gap(6),
              TextFormField(
                onTap: () async {
                  var selectedStartTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedStartTime != null) {
                    DateTime now = DateTime.now();
                    DateTime selectedDate = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      selectedStartTime.hour,
                      selectedStartTime.minute,
                    );

                    if (dateController.text ==
                            DateFormat("yyyy-MM-dd").format(now) &&
                        selectedDate.isBefore(now)) {
                      showErrorMessage(
                        context,
                        "You cannot select a past time",
                      );
                      return;
                    }

                    startTimeController.text = selectedStartTime.format(
                      context,
                    );
                  }
                },

                readOnly: true,
                controller: startTimeController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "End Date",
                textAlign: TextAlign.start,
                style: TextStyles.getTitle(),
              ),
              Gap(6),
              TextFormField(
                onTap: () async {
                  var selectedEndTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedEndTime != null) {
                    DateTime now = DateTime.now();
                    DateTime selectedDate = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      selectedEndTime.hour,
                      selectedEndTime.minute,
                    );

                    if (dateController.text ==
                            DateFormat("yyyy-MM-dd").format(now) &&
                        selectedDate.isBefore(now)) {
                      showErrorMessage(
                        context,
                        "You cannot select a past time",
                      );
                      return;
                    }

                    if (startTimeController.text.isNotEmpty) {
                      final parts = startTimeController.text.split(":");
                      int hour = int.parse(parts[0]);
                      int minute = int.parse(parts[1].split(" ")[0]);

                      TimeOfDay startTime = TimeOfDay(
                        hour: hour,
                        minute: minute,
                      );

                      DateTime startDate = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        startTime.hour,
                        startTime.minute,
                      );

                      if (selectedDate.isBefore(startDate)) {
                        showErrorMessage(
                          context,
                          "End Time must be after Start Time",
                        );
                        return;
                      }
                    }

                    endTimeController.text = selectedEndTime.format(context);
                  }
                },

                readOnly: true,
                controller: endTimeController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
