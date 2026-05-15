import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'method_option.dart';

class PaymentOptionsRow extends StatelessWidget {
  final PaymentMethod selectedMethod;

  const PaymentOptionsRow({super.key, required this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
