import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/constants/app_assets.dart';
import 'package:taskati/core/extentions/app_navigation.dart';
import 'package:taskati/core/healper/showErrorMessage.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/uplaodimageBottomSheet.dart';

class UplaodScreen extends StatefulWidget {
  const UplaodScreen({super.key});

  @override
  State<UplaodScreen> createState() => _UplaodScreenState();
}

class _UplaodScreenState extends State<UplaodScreen> {
  String? path;
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path != null && nameController.text.isNotEmpty) {
                // AppNavigation.pushTo(context, )
              } else if (path == null && nameController.text.isNotEmpty) {
                // AppNavigation.pushTo(context, newPage);
              } else if (path == null && nameController.text.isEmpty) {
                showErrorMessage(context, "plaese Enter Your Name");
              } else if (path != null && nameController.text.isEmpty) {
                showErrorMessage(context, "plaese Enter Your Name");
              }
            },
            child: Text("Done", style: Textstyles.getTitle()),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                uplaodimageBottomSheet(context, uplaodImage);
              },
              child: path != null
                  ? CircleAvatar(
                      radius: 105,
                      backgroundImage: FileImage(File(path ?? "")),
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
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "your name"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uplaodImage(bool isCamera) async {
    var picker = ImagePicker();
    var pickedImage = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
    AppNavigation.pop(context);
  }
}
