import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

import '../../bloc/billing_bloc.dart';
import '../../bloc/billing_event.dart';
import '../../utils/billing_queue_utils.dart';
import 'billing_queue_item_body.dart';

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
        decoration: BillingQueueUtils.getItemDecoration(isSelected),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: BillingQueueItemBody(
            order: order,
            table: table,
            timeAgo: timeAgo,
          ),
        ),
      ),
    );
  }
}
