import 'package:flutter/material.dart';

class RowValue extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const RowValue({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style ??
          const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
    );
  }
}
