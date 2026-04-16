import 'package:flutter/material.dart';

class BillingErrorView extends StatelessWidget {
  final String message;

  const BillingErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: const TextStyle(color: Colors.red)),
    );
  }
}
