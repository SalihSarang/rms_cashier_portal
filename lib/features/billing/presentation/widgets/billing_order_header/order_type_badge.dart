import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderTypeBadge extends StatelessWidget {
  final String label;
  final double leftPadding;

  const OrderTypeBadge({super.key, required this.label, this.leftPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: NeutralColors.darkSurface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: const TextStyle(color: TextColors.secondary, fontSize: 12),
        ),
      ),
    );
  }
}
