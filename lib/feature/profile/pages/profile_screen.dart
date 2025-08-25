import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/services/local_helper.dart';
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
  late TextEditingController nameController;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    path = LocalHelper.getData(LocalHelper.kImage);
    nameController = TextEditingController(
      text: LocalHelper.getData(LocalHelper.kName),
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
      LocalHelper.cacheData(LocalHelper.kImage, pickedImage.path);
    }
  }

  void saveName() {
    if (nameController.text.isNotEmpty) {
      LocalHelper.cacheData(LocalHelper.kName, nameController.text);
      setState(() {
        isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50,
            children: [
              ProfileImagePicker(
                path: path,
                onTap: () => uplaodimageBottomSheet(context, uplaodImage),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: isEditing
                        ? TextField(
                            controller: nameController,
                            autofocus: true,
                            style: Textstyles.getTitle(),
                            onSubmitted: (_) => saveName(),
                          )
                        : Text(
                            LocalHelper.getData(LocalHelper.kName) ?? "",
                            style: Textstyles.getTitle(),
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isEditing) {
                        saveName();
                      } else {
                        setState(() {
                          isEditing = true;
                        });
                      }
                    },
                    icon: Icon(
                      isEditing ? Icons.check : Icons.edit,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
