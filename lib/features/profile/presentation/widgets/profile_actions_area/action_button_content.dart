import 'package:flutter/material.dart';

/// The internal layout (icon + label) of an ActionButton.
class ActionButtonContent extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const ActionButtonContent({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}
