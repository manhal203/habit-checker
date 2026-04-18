import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({
    super.key,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.onChanged,
  });
  final String title;
  final String description;
  final bool isCompleted;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: Colors.blue,
      
      child: Column(
        children: [
          Text(title),
          Text(description),
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              onChanged(value!);
            },
          ),
        ],
      ),
    );
  }
}
