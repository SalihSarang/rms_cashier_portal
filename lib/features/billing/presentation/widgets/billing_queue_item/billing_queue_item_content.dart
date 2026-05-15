import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'billing_queue_item_details.dart';
import 'billing_queue_item_header.dart';
import 'billing_queue_item_metadata.dart';

class BillingQueueItemContent extends StatelessWidget {
  final OrderModel order;
  final ({String name, String area}) table;
  final String timeAgo;

  const BillingQueueItemContent({
    super.key,
    required this.order,
    required this.table,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BillingQueueItemHeader(
            tableName: table.name,
            tableArea: table.area,
            status: order.orderStatus,
          ),
          const SizedBox(height: 4),
          BillingQueueItemDetails(
            orderId: order.id,
            staffName: order.staffName,
          ),
          const SizedBox(height: 12),
          BillingQueueItemMetadata(
            timeAgo: timeAgo,
            totalAmount: order.totalAmount,
          ),
        ],
      ),
    );
  }
}
