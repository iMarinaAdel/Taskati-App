import 'package:flutter/material.dart';
import 'package:taskati/core/utils/AppColors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
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
}
