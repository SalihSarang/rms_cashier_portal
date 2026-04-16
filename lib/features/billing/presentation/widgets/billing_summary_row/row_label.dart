import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class RowLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const RowLabel({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(color: TextColors.muted, fontSize: 13),
    );
  }
}
