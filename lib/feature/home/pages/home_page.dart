import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/feature/home/widgets/date_picker_widget.dart';
import 'package:taskati/feature/home/widgets/home_header_widget.dart';
import 'package:taskati/feature/home/widgets/task_builder_widget.dart';
import 'package:taskati/feature/home/widgets/today_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              HomeHeaderWidget(),
              Gap(8),
              TodayHeaderWidget(),
              DatePickerWidget(
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),

              TaskBuilderWidget(selectedDate: selectedDate),
            ],
          ),
        ),
      ),
    );
  }
}
