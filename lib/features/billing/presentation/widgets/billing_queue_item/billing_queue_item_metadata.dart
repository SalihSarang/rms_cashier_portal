import 'package:flutter/material.dart';

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
        Row(
          children: [
            const Icon(Icons.access_time, color: Color(0xFF888888), size: 12),
            const SizedBox(width: 4),
            Text(
              timeAgo,
              style: const TextStyle(color: Color(0xFF888888), fontSize: 11),
            ),
          ],
        ),
        Text(
          '\$${totalAmount.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
