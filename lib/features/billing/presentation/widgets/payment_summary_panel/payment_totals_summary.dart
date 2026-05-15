import 'package:cashier_portal/features/billing/presentation/widgets/billing_summary_row/billing_summary_row.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/final_payable_amount.dart';
import 'package:flutter/material.dart';

import 'package:rms_shared_package/rms_shared_package.dart';

class PaymentTotalsSummary extends StatelessWidget {
  final BillModel bill;
  final double? amountTendered;

  const PaymentTotalsSummary({
    super.key,
    required this.bill,
    this.amountTendered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BillingSummaryRow(
          label: 'Subtotal',
          value: '₹${bill.subTotal.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 16),
        BillingSummaryRow(
          label: 'CGST (${bill.restaurantInfo.cgstRate}%)',
          value: '₹${bill.cgst.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 16),
        BillingSummaryRow(
          label: 'SGST (${bill.restaurantInfo.sgstRate}%)',
          value: '₹${bill.sgst.toStringAsFixed(2)}',
        ),
        if (bill.serviceCharge > 0) ...[
          const SizedBox(height: 16),
          BillingSummaryRow(
            label: 'Service Charge',
            value: '₹${bill.serviceCharge.toStringAsFixed(2)}',
          ),
        ],
        if (bill.discount > 0) ...[
          const SizedBox(height: 16),
          BillingSummaryRow(
            label: 'Discount',
            value: '- ₹${bill.discount.toStringAsFixed(2)}',
          ),
        ],
        const SizedBox(height: 40),
        FinalPayableAmount(amount: bill.grandTotal),
        if (amountTendered != null) ...[
          const SizedBox(height: 16),
          BillingSummaryRow(
            label: 'Change Due',
            value: '₹${(amountTendered! - bill.grandTotal).toStringAsFixed(2)}',
          ),
        ],
      ],
    );
  }
}
