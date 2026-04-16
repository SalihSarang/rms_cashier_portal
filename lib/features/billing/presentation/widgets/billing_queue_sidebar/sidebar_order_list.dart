import 'package:cashier_portal/features/billing/presentation/widgets/billing_queue_item/billing_queue_item.dart';
import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

class SidebarOrderList extends StatelessWidget {
  final List<OrderModel> orders;
  final String? selectedOrderId;

  const SidebarOrderList({
    super.key,
    required this.orders,
    required this.selectedOrderId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final order = orders[index];
        final isSelected = order.id == selectedOrderId;
        return BillingQueueItem(order: order, isSelected: isSelected);
      },
    );
  }
}
