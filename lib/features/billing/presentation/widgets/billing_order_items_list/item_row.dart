import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

/// A single row representing a cart item in the order details table.
///
/// Displays item index, name, modifiers, quantity, and total price.
class ItemRow extends StatelessWidget {
  final int index;
  final CartItemModel item;

  const ItemRow({super.key, required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    // Extract modifier text from the model or provide a default fallback
    final String modifierText = item.specialInstructions ?? 'No modifiers';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Sequence Number
          SizedBox(
            width: 40,
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: PrimaryColors.brandGreen,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          // Item Details: Name and Modifiers
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: TextColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  modifierText,
                  style: const TextStyle(color: TextColors.muted, fontSize: 12),
                ),
              ],
            ),
          ),

          // Quantity Column
          Expanded(
            flex: 1,
            child: Text(
              item.quantity.toString(),
              style: const TextStyle(
                color: TextColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),

          // Price Column (Right-aligned)
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$ ${item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: TextColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
