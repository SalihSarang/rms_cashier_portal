import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'payment_options_row.dart';
import 'section_label.dart';

class PaymentMethodSelector extends StatelessWidget {
  final PaymentMethod selectedMethod;

  const PaymentMethodSelector({super.key, required this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('Payment Method'),
        Container(
          height: 56,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: NeutralColors.darkSurface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: PaymentOptionsRow(selectedMethod: selectedMethod),
        ),
      ],
    );
  }
}
