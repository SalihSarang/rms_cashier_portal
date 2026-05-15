import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class AmountLabel extends StatelessWidget {
  final String label;
  final double bottomPadding;

  const AmountLabel(this.label, {super.key, this.bottomPadding = 8});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        label,
        style: const TextStyle(
          color: PrimaryColors.brandGreen,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
