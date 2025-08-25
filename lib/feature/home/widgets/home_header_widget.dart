import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/constants/app_assets.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${(LocalHelper.getData(LocalHelper.kName) as String).split(" ")[0]}",
                style: Textstyles.getTitle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text("Have A Nice Day", style: Textstyles.getBody()),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 35,
          child: CircleAvatar(
            radius: 33,
            backgroundImage: LocalHelper.getData(LocalHelper.kImage) != null
                ? FileImage(File(LocalHelper.getData(LocalHelper.kImage)))
                : AssetImage(AppAssets.user),
          ),
        ),
      ],
    );
  }
}
