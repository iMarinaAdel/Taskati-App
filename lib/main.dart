import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_theme.dart';
import 'package:taskati/feature/splash/splash_screen.dart';

void main() {
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
 