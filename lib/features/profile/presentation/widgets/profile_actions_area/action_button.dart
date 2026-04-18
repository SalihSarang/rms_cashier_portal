import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'action_button_content.dart';

/// Visual style variants for [ActionButton].
enum ActionButtonStyle {
  solidGreen,
  solidWarning,
  outlineGreen,
  outlineWarning,
  outlineRed,
}

/// A compact labelled icon button used in the profile shift controls panel.
///
/// Size is intrinsic (grows with label), never stretches full-width.
class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ActionButtonStyle style;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.style,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color fg;
    final Color? bg;
    final Color border;

    switch (style) {
      case ActionButtonStyle.solidGreen:
        fg = NeutralColors.shadow;
        bg = PrimaryColors.brandGreen;
        border = PrimaryColors.brandGreen;
        break;
      case ActionButtonStyle.solidWarning:
        fg = TextColors.primary;
        bg = SemanticColors.warning;
        border = SemanticColors.warning;
        break;
      case ActionButtonStyle.outlineGreen:
        fg = PrimaryColors.brandGreen;
        bg = PrimaryColors.brandGreen.withValues(alpha: 0.08);
        border = PrimaryColors.brandGreen;
        break;
      case ActionButtonStyle.outlineWarning:
        fg = SemanticColors.warning;
        bg = SemanticColors.warning.withValues(alpha: 0.08);
        border = SemanticColors.warning;
        break;
      case ActionButtonStyle.outlineRed:
        fg = SemanticColors.error;
        bg = SemanticColors.error.withValues(alpha: 0.08);
        border = SemanticColors.error;
        break;
    }

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border),
        ),
        child: ActionButtonContent(label: label, icon: icon, color: fg),
      ),
    );
  }
}
