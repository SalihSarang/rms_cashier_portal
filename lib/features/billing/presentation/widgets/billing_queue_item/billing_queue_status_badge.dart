import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class BillingQueueStatusBadge extends StatelessWidget {
  final OrderStatus status;

  const BillingQueueStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final bool isRequested = status == OrderStatus.served;
    final bool isReady = status == OrderStatus.ready;

    String text;
    Color bgColor, textColor;

    if (isRequested) {
      text = 'BILL REQUESTED';
      bgColor = StatusColors.pendingBg;
      textColor = StatusColors.pendingText;
    } else if (isReady) {
      text = 'READY';
      bgColor = StatusColors.preparingBg;
      textColor = StatusColors.preparingText;
    } else {
      text = status.name.toUpperCase();
      bgColor = StatusColors.completedBg;
      textColor = StatusColors.completedText;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
