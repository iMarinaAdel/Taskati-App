import 'package:flutter/widgets.dart';
import 'package:taskati/core/utils/AppColors.dart';

class TextStyles {
  static TextStyle getHeadLine({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? AppColors.primaryColor,
    );
  }

  static TextStyle getTitle({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.primaryColor,
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
    );
  }
}
