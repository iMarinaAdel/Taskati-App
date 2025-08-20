import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/constants/app_assets.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      //AppNavigation.pushRecplementTo(context, newPage)
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.slpashLogoL),
            Text("Taskati", style: Textstyles.getHeadLine(fontSize: 35)),
            Gap(15),
            Text(
              "It's Time To Get Organiezed",
              style: Textstyles.getBody(
                color: AppColors.darkGrayColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
