import 'package:cashier_portal/features/billing/presentation/widgets/payment_method_toggle/toggle_icon.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_method_toggle/toggle_label.dart';
import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class PaymentMethodToggle extends StatelessWidget {
  final PaymentMethod method;
  final String label;
  final IconData iconData;
  final bool isSelected;
  final Function(PaymentMethod) onSelected;

  const PaymentMethodToggle({
    super.key,
    required this.method,
    required this.label,
    required this.iconData,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onSelected(method),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? PrimaryColors.brandGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected) ...[
                ToggleIcon(method: method, defaultIcon: iconData),
                const SizedBox(width: 10),
              ],
              ToggleLabel(label: label, isSelected: isSelected),
            ],
          ),
        ),
      ),
    );
  }
}
