import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ItemsListHeader extends StatelessWidget {
  const ItemsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 20, 24, 16),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              'No',
              style: TextStyle(
                color: TextColors.secondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Item Details',
              style: TextStyle(
                color: TextColors.secondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'QTY',
              style: TextStyle(
                color: TextColors.secondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Price',
                style: TextStyle(
                  color: TextColors.secondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
