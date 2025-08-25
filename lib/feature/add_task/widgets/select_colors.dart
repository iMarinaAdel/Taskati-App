import 'package:flutter/material.dart';
import 'package:taskati/constants/task_colors.dart';

class SelectColorsWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onColorSelected;

  const SelectColorsWidget({
    super.key,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: List.generate(TaskColors.taskColors.length, (index) {
        return GestureDetector(
          onTap: () => onColorSelected(index),
          child: CircleAvatar(
            backgroundColor: TaskColors.taskColors[index],
            radius: 22,
            child: (selectedIndex == index)
                ? const Icon(Icons.check, color: Colors.white)
                : null,
          ),
        );
      }),
    );
  }
}
