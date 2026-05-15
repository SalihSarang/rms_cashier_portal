import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ItemsListDivider extends StatelessWidget {
  const ItemsListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      color: TextColors.primary.withValues(alpha: 0.05),
    );
  }
}
