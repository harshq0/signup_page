import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  final imagePath;
  const MySquare({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)),
      child: Image.asset(
        imagePath,
        height: 50,
      ),
    );
  }
}
