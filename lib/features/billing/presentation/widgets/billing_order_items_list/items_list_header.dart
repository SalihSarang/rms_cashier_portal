import 'package:flutter/material.dart';
import 'items_list_header_label.dart';

class ItemsListHeader extends StatelessWidget {
  const ItemsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          ItemsListHeaderLabel('No', width: 40),
          ItemsListHeaderLabel('Item Details', flex: 4),
          ItemsListHeaderLabel('QTY', flex: 1),
          ItemsListHeaderLabel(
            'Price',
            flex: 2,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
