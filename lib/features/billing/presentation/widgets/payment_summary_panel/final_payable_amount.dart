import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'amount_label.dart';

class FinalPayableAmount extends StatelessWidget {
  final double amount;

  const FinalPayableAmount({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const AmountLabel('Final Payable Amount'),

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
