import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: Textstyles.getTitle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              DateFormat.EEEE().format(DateTime.now()),
              style: Textstyles.getTitle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
