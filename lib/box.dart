import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({
    @required this.color,
    @required this.text,
    @required this.fontSize,
  });

  final Color color;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 3, color: Colors.black54),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
