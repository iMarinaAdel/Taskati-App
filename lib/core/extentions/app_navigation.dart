import 'package:flutter/material.dart';

class AppNavigation {
  static void pushTo(BuildContext context, Widget newPage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => newPage));
  }

 static void pushRecplementTo(BuildContext context, Widget newPage) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }

  static void pushRemoveUntil(BuildContext context, Widget newPage) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => newPage),
      (route) => false,
    );
  }
}
