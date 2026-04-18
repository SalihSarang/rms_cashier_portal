import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class OrderHeaderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const OrderHeaderButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16, color: TextColors.primary),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: NeutralColors.darkSurface,
        foregroundColor: TextColors.primary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
