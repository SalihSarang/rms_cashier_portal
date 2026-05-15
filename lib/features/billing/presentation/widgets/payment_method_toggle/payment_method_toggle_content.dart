import 'package:flutter/material.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'toggle_icon.dart';
import 'toggle_label.dart';

class PaymentMethodToggleContent extends StatelessWidget {
  final PaymentMethod method;
  final String label;
  final IconData iconData;
  final bool isSelected;

  const PaymentMethodToggleContent({
    super.key,
    required this.method,
    required this.label,
    required this.iconData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isSelected) ...[
          ToggleIcon(method: method, defaultIcon: iconData),
          const SizedBox(width: 10),
        ],
        ToggleLabel(label: label, isSelected: isSelected),
      ],
    );
  }
}
