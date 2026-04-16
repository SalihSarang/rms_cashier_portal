import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'billing_queue_status_badge.dart';

class BillingQueueItemHeader extends StatelessWidget {
  final String tableName;
  final String tableArea;
  final OrderStatus status;

  const BillingQueueItemHeader({
    super.key,
    required this.tableName,
    required this.tableArea,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              tableName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            if (tableArea.isNotEmpty) ...[
              const SizedBox(width: 6),
              Text(
                tableArea,
                style: const TextStyle(color: TextColors.muted, fontSize: 12),
              ),
            ],
          ],
        ),
        BillingQueueStatusBadge(status: status),
      ],
    );
  }
}
