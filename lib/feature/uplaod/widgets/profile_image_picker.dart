import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/constants/app_assets.dart';
import 'package:taskati/core/utils/AppColors.dart';

class ProfileImagePicker extends StatelessWidget {
  final String? path;
  final VoidCallback onTap;

  const ProfileImagePicker({
    super.key,
    required this.path,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: path != null
          ? CircleAvatar(
              radius: 105,
              backgroundImage: FileImage(File(path??"")),
            )
          : Stack(
              children: [
                CircleAvatar(
                  radius: 105,
                  backgroundColor: AppColors.whiteColor,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.primaryColor,
                    child: Image.asset(
                      AppAssets.user,
                      color: AppColors.transpColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    width: 35,
                    height: 35,
                    child: Icon(
                      Icons.add,
                      color: AppColors.transpColor,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

