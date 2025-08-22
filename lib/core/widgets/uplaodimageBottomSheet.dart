import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/core/Components/buttons/main_button_app.dart';

Future<dynamic> uplaodimageBottomSheet(
    BuildContext context, Function(bool isCamera) onPick) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainButtonApp(
              text: 'Upload From Camera',
              onPreased: () {
                Navigator.pop(context); 
                onPick(true); 
              },
            ),
            Gap(15),
            MainButtonApp(
              text: "Upload From Gallery",
              onPreased: () {
                Navigator.pop(context); 
                onPick(false); 
              },
            ),
            Gap(5),
          ],
        ),
      );
    },
  );
}
