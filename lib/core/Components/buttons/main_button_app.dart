import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class MainButtonApp extends StatelessWidget {
  const MainButtonApp({
    super.key,
    required this.text,
    this.hight,
    this.width,
    this.textSize,
    required this.onPreased,
  });
  final String text;
  final double? hight;
  final double? width;
  final double? textSize;
  final Function() onPreased;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: hight ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: onPreased,
        child: Text(
          text,
          style: TextStyles.getBody(
            color: AppColors.whiteColor,
            fontSize: textSize ?? 16,
          ),
        ),
      ),
    );
  }
}
