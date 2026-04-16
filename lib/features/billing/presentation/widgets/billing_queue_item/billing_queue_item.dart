import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import '../../bloc/billing_bloc.dart';
import '../../bloc/billing_event.dart';
import '../../utils/billing_queue_utils.dart';
import 'billing_queue_item_details.dart';
import 'billing_queue_item_header.dart';
import 'billing_queue_item_icon.dart';
import 'billing_queue_item_metadata.dart';

class BillingQueueItem extends StatelessWidget {
  final OrderModel order;
  final bool isSelected;

  const BillingQueueItem({
    super.key,
    required this.order,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Data Extraction via Utils
    final String timeAgo = BillingQueueUtils.getTimeAgo(order.createdAt);
    final table = BillingQueueUtils.getTableDetails(order.tableNumber);

    return GestureDetector(
      onTap: () {
        context.read<BillingBloc>().add(SelectOrderEvent(order.id));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? NeutralColors.surfaceSelected
              : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          border: isSelected
              ? const Border(
                  left: BorderSide(color: PrimaryColors.brandGreen, width: 4),
                )
              : const Border(
                  left: BorderSide(color: Colors.transparent, width: 4),
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lead Component
              const BillingQueueItemIcon(icon: Icons.restaurant),

              const SizedBox(width: 14),

              // Content Composition
              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
