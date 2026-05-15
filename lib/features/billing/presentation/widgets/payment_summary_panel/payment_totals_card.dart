import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'payment_totals_summary.dart';

class PaymentTotalsCard extends StatelessWidget {
  final BillModel bill;
  final double? amountTendered;

  const PaymentTotalsCard({
    super.key,
    required this.bill,
    this.amountTendered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: NeutralColors.darkSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: PaymentTotalsSummary(
        bill: bill,
        amountTendered: amountTendered,
      ),
    );
  }
}
