import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BillingQueueItemIcon extends StatelessWidget {
  final IconData icon;

  const BillingQueueItemIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: NeutralColors.surfaceLighter,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, color: TextColors.secondary, size: 20),
    );
  }
}
