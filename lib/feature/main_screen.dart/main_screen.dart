import 'package:flutter/material.dart';
import 'package:taskati/core/extentions/app_navigation.dart';
import 'package:taskati/core/utils/AppColors.dart';
import 'package:taskati/feature/add_task/pages/add_task_screen.dart';
import 'package:taskati/feature/home/pages/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [HomePage(), Center(child: Text("Profile Screen"))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      floatingActionButton: FloatingActionButton(
        elevation: 8,
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          AppNavigation.pushTo(context, AddTaskScreen());
        },
        child: Icon(Icons.add, size: 32, color: AppColors.primaryLightColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        height: 50,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: AppColors.primaryLightColor,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? AppColors.primaryColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: Icon(
                Icons.person,
                color: currentIndex == 1 ? AppColors.primaryColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
