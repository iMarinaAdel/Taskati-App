import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:taskati/feature/home/widgets/date_picker_widget.dart';
import 'package:taskati/feature/home/widgets/home_header_widget.dart';
import 'package:taskati/feature/home/widgets/today_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              HomeHeaderWidget(),
              Gap(16),
              TodayHeaderWidget(),
              DatePickerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
