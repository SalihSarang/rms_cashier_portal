import 'package:cashier_portal/features/billing/presentation/widgets/billing_summary_row/row_label.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_summary_row/row_value.dart';
import 'package:flutter/material.dart';

class BillingSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const BillingSummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RowLabel(text: label, style: labelStyle),
        RowValue(text: value, style: valueStyle),
      ],
    );
  }
}
