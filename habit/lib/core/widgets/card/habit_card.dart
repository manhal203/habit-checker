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
      color: const Color.fromARGB(255, 38, 122, 192),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 20, color: Colors.black),),
          Text(description, style: TextStyle(fontSize: 16, color: const Color.fromARGB(161, 0, 0, 0)),),
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              onChanged(!isCompleted);
            },
          ),
        ],
      ),
    );
  }
}
