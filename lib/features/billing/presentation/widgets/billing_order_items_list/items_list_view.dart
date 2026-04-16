import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_items_list/item_row.dart';
import 'package:flutter/material.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

class ItemsListView extends StatelessWidget {
  final List<CartItemModel> items;

  const ItemsListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          return ItemRow(index: index + 1, item: items[index]);
        },
      ),
    );
  }
}
