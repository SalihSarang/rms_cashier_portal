import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ToggleLabel extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ToggleLabel({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: isSelected ? Colors.black : TextColors.muted,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        fontSize: 15,
      ),
    );
  }
}
