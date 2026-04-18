import 'package:flutter/material.dart';
import 'order_header_button.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderHeaderButton(
          onPressed: () {},
          icon: Icons.print,
          label: 'Print Bill',
        ),
      ],
    );
  }
}


