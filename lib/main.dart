import 'package:flutter/material.dart';

void main() {
  runApp(const Taskati());
}

class Taskati extends StatelessWidget {
  const Taskati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold());
  }
}
