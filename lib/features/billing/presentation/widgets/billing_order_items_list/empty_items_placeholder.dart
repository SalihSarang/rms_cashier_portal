import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class EmptyItemsPlaceholder extends StatelessWidget {
  const EmptyItemsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Text(
          'No items in this order.',
          style: TextStyle(color: TextColors.muted),
        ),
      ),
    );
  }
}
