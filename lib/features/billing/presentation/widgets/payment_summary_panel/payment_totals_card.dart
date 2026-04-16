import 'package:cashier_portal/features/billing/presentation/widgets/billing_summary_row/billing_summary_row.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/final_payable_amount.dart';
import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

class PaymentTotalsCard extends StatelessWidget {
  final OrderModel order;

  const PaymentTotalsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final subtotal = order.totalAmount;
    final tax = subtotal * 0.08;
    final serviceCharge = 0.0;
    final finalAmount = subtotal + tax + serviceCharge;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: NeutralColors.darkSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
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
      ),
    );
  }
}
