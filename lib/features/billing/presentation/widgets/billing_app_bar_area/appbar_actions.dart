import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.search, color: TextColors.secondary, size: 24),
        const SizedBox(width: 24),
        // Bell icon with notification dot
        Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(
              Icons.notifications_none,
              color: TextColors.secondary,
              size: 24,
            ),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: SemanticColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
