import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ShiftBannerUtils {
  /// Returns the decoration for the shift warning banner.
  static BoxDecoration getBannerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          SemanticColors.warning.withValues(alpha: 0.15),
          SemanticColors.warning.withValues(alpha: 0.05),
        ],
      ),
      border: Border(
        bottom: BorderSide(
          color: SemanticColors.warning.withValues(alpha: 0.2),
        ),
      ),
    );
  }
}
