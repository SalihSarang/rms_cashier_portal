import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/order_model.dart';

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
            Text(
              'Order #${order.id}',
              style: const TextStyle(
                color: TextColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: NeutralColors.darkSurface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Dine-In',
                style: TextStyle(color: TextColors.secondary, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Table ${order.tableNumber} • Waiter: ${order.staffName} • Opened ${order.createdAt.hour}:${order.createdAt.minute.toString().padLeft(2, '0')} ${order.createdAt.hour >= 12 ? 'PM' : 'AM'}',
          style: const TextStyle(color: TextColors.muted, fontSize: 13),
        ),
      ],
    );
  }
}
