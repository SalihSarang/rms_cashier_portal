import 'package:cashier_portal/features/profile/presentation/widgets/primary_text.dart';
import 'package:flutter/material.dart';

class ItemPriceLabel extends StatelessWidget {
  final double price;

  const ItemPriceLabel({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: PrimaryText(
          '\$ ${price.toStringAsFixed(2)}',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
