import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class FinalPayableAmount extends StatelessWidget {
  final double amount;

  const FinalPayableAmount({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Final Payable Amount',
              style: TextStyle(
                color: PrimaryColors.brandGreen,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${amount.toStringAsFixed(2)}',
              style: const TextStyle(
                color: TextColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
