import 'package:flutter/material.dart';

class CountCardWidget extends StatelessWidget {
  const CountCardWidget({
    super.key,
    required this.color,
    required this.title,
    required this.count,
  });
  final Color color;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 90,
      child: Card(
        elevation: 4,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: .spaceAround,
            children: [
              Text(title, style: TextStyle(fontWeight: .bold, fontSize: 20),textAlign: .center,),
              Text("$count", style: TextStyle(fontWeight: .bold, fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
