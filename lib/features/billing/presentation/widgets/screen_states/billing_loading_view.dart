import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class BillingLoadingView extends StatelessWidget {
  const BillingLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: PrimaryColors.brandGreen),
    );
  }
}
