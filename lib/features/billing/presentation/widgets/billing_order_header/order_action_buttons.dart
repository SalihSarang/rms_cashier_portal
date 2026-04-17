import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Print Bill Button
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.print, size: 16, color: TextColors.primary),
          label: const Text('Print Bill'),
          style: ElevatedButton.styleFrom(
            backgroundColor: NeutralColors.darkSurface,
            foregroundColor: TextColors.primary,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
