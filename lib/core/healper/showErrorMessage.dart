import 'package:flutter/material.dart';
void showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Center(child: Text(message)),
      backgroundColor: const Color.fromARGB(255, 232, 79, 68).withValues(alpha: .8),
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    ),
  );
}
