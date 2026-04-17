import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
