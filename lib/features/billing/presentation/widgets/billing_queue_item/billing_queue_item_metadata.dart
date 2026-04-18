import 'package:cashier_portal/features/profile/presentation/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'billing_queue_time_label.dart';

class BillingQueueItemMetadata extends StatelessWidget {
  final String timeAgo;
  final double totalAmount;

  const BillingQueueItemMetadata({
    super.key,
    required this.timeAgo,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BillingQueueTimeLabel(label: timeAgo),
        PrimaryText(
          '\$${totalAmount.toStringAsFixed(2)}',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
