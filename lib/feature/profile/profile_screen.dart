import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/uplaodimageBottomSheet.dart';
import 'package:taskati/feature/uplaod/widgets/profile_image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? path;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.dark_mode_rounded,
              size: 30,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileImagePicker(
              path: path,
              onTap: () => uplaodimageBottomSheet(context, uplaodImage),
            ),
            Gap(50),
            Divider(indent: 30, endIndent: 30, thickness: 2),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("marina Adel Younan", style: Textstyles.getTitle()),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
