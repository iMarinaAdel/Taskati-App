import 'package:flutter/material.dart';
import 'package:taskati/core/extentions/app_navigation.dart';
import 'package:taskati/core/healper/showErrorMessage.dart';
import 'package:taskati/core/services/local_helper.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/main_screen.dart/main_screen.dart';

class DoneButton extends StatelessWidget {
  final String? path;
  final TextEditingController nameController;

  const DoneButton({
    super.key,
    required this.path,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (path != null && nameController.text.isNotEmpty) {
          LocalHelper.cacheData(LocalHelper.kIsUpload, true);
          LocalHelper.cacheData(LocalHelper.kName, nameController.text);
          LocalHelper.cacheData(LocalHelper.kImage, path);
          AppNavigation.pushRecplementTo(context, MainScreen());
        } else if (path == null && nameController.text.isNotEmpty) {
          LocalHelper.cacheData(LocalHelper.kIsUpload, true);
          LocalHelper.cacheData(LocalHelper.kName, nameController.text);
          AppNavigation.pushRecplementTo(context, MainScreen());
        } else {
          showErrorMessage(context, "Please Enter Your Name");
        }
      },
      child: Text("Done", style: Textstyles.getTitle()),
    );
  }
}
