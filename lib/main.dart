import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/app_theme.dart';
import 'package:taskati/feature/splash/splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await LocalHelper.init();
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationCurve: Curves.fastOutSlowIn,
      themeAnimationDuration: Duration(seconds: 2),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
