import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
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
        onPressed: () {},
        child: Text("Add Task", style: Textstyles.getTitle()),
      ),
    );
  }
}
