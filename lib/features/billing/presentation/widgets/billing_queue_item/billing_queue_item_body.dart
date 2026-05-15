import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'billing_queue_item_content.dart';
import 'billing_queue_item_icon.dart';

class BillingQueueItemBody extends StatelessWidget {
  final OrderModel order;
  final ({String name, String area}) table;
  final String timeAgo;

  const BillingQueueItemBody({
    super.key,
    required this.order,
    required this.table,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BillingQueueItemIcon(icon: Icons.restaurant, rightPadding: 14),
        BillingQueueItemContent(order: order, table: table, timeAgo: timeAgo),
      ],
    );
  }
}
