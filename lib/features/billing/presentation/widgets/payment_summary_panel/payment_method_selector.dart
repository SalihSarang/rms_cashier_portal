import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/method_option.dart';
import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/enums/enums.dart';

class PaymentMethodSelector extends StatelessWidget {
  final PaymentMethod selectedMethod;

  const PaymentMethodSelector({super.key, required this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(
            color: TextColors.secondary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 56,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: NeutralColors.darkSurface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MethodOption(
                method: PaymentMethod.cash,
                label: 'Cash',
                icon: Icons.money,
                isSelected: selectedMethod == PaymentMethod.cash,
              ),
              MethodOption(
                method: PaymentMethod.card,
                label: 'Card',
                icon: Icons.credit_card,
                isSelected: selectedMethod == PaymentMethod.card,
              ),
              MethodOption(
                method: PaymentMethod.upi,
                label: 'UPI',
                icon: Icons.qr_code_2,
                isSelected: selectedMethod == PaymentMethod.upi,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
