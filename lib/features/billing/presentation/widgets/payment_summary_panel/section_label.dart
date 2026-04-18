import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class SectionLabel extends StatelessWidget {
  final String label;
  final double bottomPadding;

  const SectionLabel(this.label, {super.key, this.bottomPadding = 12});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        label,
        style: const TextStyle(
          color: TextColors.secondary,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
