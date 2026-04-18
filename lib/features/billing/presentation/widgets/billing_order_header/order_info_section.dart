import 'package:cashier_portal/features/billing/presentation/utils/billing_utils.dart';
import 'package:cashier_portal/features/profile/presentation/widgets/muted_text.dart';
import 'package:cashier_portal/features/profile/presentation/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';
import 'order_type_badge.dart';

class OrderInfoSection extends StatelessWidget {
  final OrderModel order;

  const OrderInfoSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            PrimaryText(
              'Order #${order.id}',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            const OrderTypeBadge(label: 'Dine-In', leftPadding: 16),
          ],
        ),
        MutedText(
          'Table ${order.tableNumber} • Waiter: ${order.staffName} • Opened ${BillingUtils.formatTime(order.createdAt)}',
          fontSize: 13,
          topPadding: 8,
        ),
      ],
    );
  }
}
