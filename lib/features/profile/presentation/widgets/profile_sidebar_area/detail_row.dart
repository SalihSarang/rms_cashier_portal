import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../primary_text.dart';
import '../muted_text.dart';

/// A labelled icon row used in the profile contact/details sidebar.
class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double topPadding;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.topPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding + 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: TextColors.muted, size: 16),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MutedText.label(label),
                const SizedBox(height: 2),
                PrimaryText.body(value, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
