import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'payment_totals_summary.dart';

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
      child: PaymentTotalsSummary(
        subtotal: subtotal,
        tax: tax,
        serviceCharge: serviceCharge,
        finalAmount: finalAmount,
      ),
    );
  }
}
