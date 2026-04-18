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
    return Directionality(
      textDirection: TextDirection.ltr,

      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color.fromARGB(255, 141, 183, 212),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      description,
                      style: TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  value: isCompleted,
                  activeColor: Colors.white,
                  checkColor: Color.fromARGB(255, 170, 210, 125),
                  side: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                  onChanged: (value) {
                    onChanged(value!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
