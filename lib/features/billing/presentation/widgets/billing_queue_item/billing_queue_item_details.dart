import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BillingQueueItemDetails extends StatelessWidget {
  final String orderId;
  final String staffName;

  const BillingQueueItemDetails({
    super.key,
    required this.orderId,
    required this.staffName,
  });

  @override
  Widget build(BuildContext context) {
    // Format order ID to show last 4 digits
    final String displayId = orderId.length > 4
        ? orderId.substring(orderId.length - 4)
        : orderId;

    return Text(
      'Order # $displayId • $staffName',
      style: const TextStyle(color: TextColors.muted, fontSize: 11),
    );
  }
}
