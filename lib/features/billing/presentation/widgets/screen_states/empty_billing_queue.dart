import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class EmptyBillingQueue extends StatelessWidget {
  const EmptyBillingQueue({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.receipt_long,
            size: 80,
            color: NeutralColors.darkSurface,
          ),
          const SizedBox(height: 24),
          Text(
            'Queue is Empty',
            style: TextStyle(
              color: TextColors.secondary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No orders are currently waiting for billing.',
            style: TextStyle(color: TextColors.muted, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
