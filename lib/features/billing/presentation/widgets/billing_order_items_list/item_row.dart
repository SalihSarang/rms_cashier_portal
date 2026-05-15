import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';
import 'item_index_label.dart';
import 'item_details_column.dart';
import 'item_quantity_label.dart';
import 'item_price_label.dart';

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
          ItemIndexLabel(index: index),

          ItemDetailsColumn(name: item.name, modifiers: modifierText),

          ItemQuantityLabel(quantity: item.quantity),

          ItemPriceLabel(price: item.price),
        ],
      ),
    );
  }
}
