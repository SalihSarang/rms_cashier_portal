import 'package:cashier_portal/features/billing/presentation/widgets/billing_summary_row/billing_summary_row.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/final_payable_amount.dart';
import 'package:flutter/material.dart';

class PaymentTotalsSummary extends StatelessWidget {
  final double subtotal;
  final double tax;
  final double serviceCharge;
  final double finalAmount;

  const PaymentTotalsSummary({
    super.key,
    required this.subtotal,
    required this.tax,
    required this.serviceCharge,
    required this.finalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BillingSummaryRow(
          label: 'Subtotal',
          value: '\$${subtotal.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 16),
        BillingSummaryRow(
          label: 'Tax (8%)',
          value: '\$${tax.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 16),
        BillingSummaryRow(
          label: 'Service Charge (0%)',
          value: '\$${serviceCharge.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 40),
        FinalPayableAmount(amount: finalAmount),
      ],
    );
  }
}
