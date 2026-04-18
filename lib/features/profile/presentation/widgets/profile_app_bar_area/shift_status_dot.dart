import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A small coloured dot + label indicating the current shift state.
///
/// Green dot + "Active" when a shift is running; muted dot + "Not Started" otherwise.
class ShiftStatusDot extends StatelessWidget {
  final bool isActive;

  const ShiftStatusDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final color = isActive ? PrimaryColors.brandGreen : TextColors.muted;
    final label = isActive ? 'Active' : 'Not Started';

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
