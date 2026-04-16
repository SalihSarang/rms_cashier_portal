import 'package:flutter/material.dart';

class ItemsListDivider extends StatelessWidget {
  const ItemsListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.white.withValues(alpha: 0.05),
    );
  }
}
