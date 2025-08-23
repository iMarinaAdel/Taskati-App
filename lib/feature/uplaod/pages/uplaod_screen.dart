import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/widgets/uplaodimageBottomSheet.dart';
import 'package:taskati/feature/uplaod/widgets/done_button.dart';
import 'package:taskati/feature/uplaod/widgets/name_text_field.dart';
import 'package:taskati/feature/uplaod/widgets/profile_image_picker.dart';

class UplaodScreen extends StatefulWidget {
  const UplaodScreen({super.key});

  @override
  State<UplaodScreen> createState() => _UplaodScreenState();
}

class _UplaodScreenState extends State<UplaodScreen> {
  String? path;
  var nameController = TextEditingController();

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
        actions: [
          DoneButton(
            path: path,
            nameController: nameController,
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
            Gap(30),
            NameTextField(controller: nameController),
          ],
        ),
      ),
    );
  }
}
