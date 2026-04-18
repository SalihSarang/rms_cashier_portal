import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../primary_text.dart';
import '../muted_text.dart';
import 'stat_icon.dart';

/// A simple card used to display a single shift statistic.
class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: NeutralColors.darkSurface,
        border: Border.all(color: NeutralColors.divider),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatIcon(icon: icon),
          MutedText.label(label, bottomPadding: 6),
          PrimaryText(
            value,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: valueColor,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
