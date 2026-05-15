import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BillingQueueUtils {
  static String getTimeAgo(DateTime createdAt) {
    final Duration diff = DateTime.now().difference(createdAt);
    return '${diff.inMinutes}m ago';
  }

  static ({String name, String area}) getTableDetails(String tableNumber) {
    String name = 'Table $tableNumber';
    String area = '';

    if (tableNumber.contains('(')) {
      final parts = tableNumber.split(' (');
      name = 'Table ${parts[0]}';
      area = '(${parts[1]}';
    }

    return (name: name, area: area);
  }

  static BoxDecoration getItemDecoration(bool isSelected) {
    return BoxDecoration(
      color: isSelected ? NeutralColors.surfaceSelected : Colors.transparent,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      border: Border(
        left: BorderSide(
          color: isSelected ? PrimaryColors.brandGreen : Colors.transparent,
          width: 4,
        ),
      ),
    );
  }
}
