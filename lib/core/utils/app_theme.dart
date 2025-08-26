import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      todayForegroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
    ),
    timePickerTheme: TimePickerThemeData(
      dialHandColor: AppColors.primaryColor,
      entryModeIconColor: AppColors.primaryColor,
    ),
    fontFamily: "Poppins",
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  static final ThemeData dartTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      onSurface: AppColors.whiteColor,
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      todayForegroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
    ),
    timePickerTheme: TimePickerThemeData(
      dialHandColor: AppColors.primaryColor,
      entryModeIconColor: AppColors.primaryColor,
    ),
    fontFamily: "Poppins",
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyles.getTitle(color: AppColors.primaryColor),
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.getSmall(color: AppColors.darkGrayColor),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.redColor, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
