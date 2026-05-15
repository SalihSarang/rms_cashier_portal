import 'package:cashier_portal/features/profile/presentation/widgets/muted_text.dart';
import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BillingQueueTimeLabel extends StatelessWidget {
  final String label;

  const BillingQueueTimeLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time, color: TextColors.muted, size: 12),
        const SizedBox(width: 4),
        MutedText(label, fontSize: 11),
      ],
    );
  }
}
