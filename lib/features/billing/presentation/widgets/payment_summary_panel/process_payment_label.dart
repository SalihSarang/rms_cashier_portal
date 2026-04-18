import 'package:flutter/material.dart';

class ProcessPaymentLabel extends StatelessWidget {
  const ProcessPaymentLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check_circle_outline, size: 20),
        SizedBox(width: 8),
        Text(
          'PROCESS PAYMENT & CLOSE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
