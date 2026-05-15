import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ItemIndexLabel extends StatelessWidget {
  final int index;

  const ItemIndexLabel({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Text(
        index.toString(),
        style: const TextStyle(
          color: PrimaryColors.brandGreen,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
