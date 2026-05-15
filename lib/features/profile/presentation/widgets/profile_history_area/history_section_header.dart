import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Header row for the Shift History Section.
class HistorySectionHeader extends StatelessWidget {
  final int historyCount;

  const HistorySectionHeader({super.key, required this.historyCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'RECENT SHIFTS',
          style: TextStyle(
            color: TextColors.muted,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
        Text(
          'Last ${historyCount > 5 ? 5 : historyCount} sessions',
          style: const TextStyle(color: TextColors.muted, fontSize: 11),
        ),
      ],
    );
  }
}
