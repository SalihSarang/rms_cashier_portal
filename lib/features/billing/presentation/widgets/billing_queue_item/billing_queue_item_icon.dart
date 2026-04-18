import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BillingQueueItemIcon extends StatelessWidget {
  final IconData icon;
  final double rightPadding;

  const BillingQueueItemIcon({
    super.key,
    required this.icon,
    this.rightPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: NeutralColors.surfaceLighter,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: TextColors.secondary, size: 20),
      ),
    );
  }
}
