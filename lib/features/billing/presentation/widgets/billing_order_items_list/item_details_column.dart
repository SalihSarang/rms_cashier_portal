import 'package:cashier_portal/features/profile/presentation/widgets/muted_text.dart';
import 'package:cashier_portal/features/profile/presentation/widgets/primary_text.dart';
import 'package:flutter/material.dart';

class ItemDetailsColumn extends StatelessWidget {
  final String name;
  final String modifiers;

  const ItemDetailsColumn({
    super.key,
    required this.name,
    required this.modifiers,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            name,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          MutedText(
            modifiers,
            fontSize: 12,
            topPadding: 6,
          ),
        ],
      ),
    );
  }
}
