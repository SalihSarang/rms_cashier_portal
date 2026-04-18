import 'package:cashier_portal/features/profile/presentation/widgets/primary_text.dart';
import 'package:flutter/material.dart';

class ItemQuantityLabel extends StatelessWidget {
  final int quantity;

  const ItemQuantityLabel({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: PrimaryText(
        quantity.toString(),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
