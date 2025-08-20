import 'package:flutter/widgets.dart';
import 'package:taskati/core/utils/AppColors.dart';

class Textstyles {
  static TextStyle getHeadLine({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? AppColors.blackColor,
    );
  }

  static TextStyle getBody({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.blackColor,
    );
  }

  static TextStyle getSmall({
    double fontSize = 14,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.blackColor,
    );
  }
}
