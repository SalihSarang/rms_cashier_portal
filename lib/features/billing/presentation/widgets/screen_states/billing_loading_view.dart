import 'package:flutter/material.dart';

class BillingLoadingView extends StatelessWidget {
  const BillingLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFF34D368)),
    );
  }
}
