import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';

class ItemsListContainer extends StatelessWidget {
  final Widget child;

  const ItemsListContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: NeutralColors.darkSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
