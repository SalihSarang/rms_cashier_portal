import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: PrimaryColors.brandGreen,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(Icons.receipt_long, color: NeutralColors.shadow, size: 20),
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          'Billing Dashboard',
          style: TextStyle(
            color: TextColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
