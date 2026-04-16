import 'package:flutter/material.dart';
import 'package:rms_shared_package/enums/enums.dart';

class ToggleIcon extends StatelessWidget {
  final PaymentMethod method;
  final IconData defaultIcon;

  const ToggleIcon({
    super.key,
    required this.method,
    required this.defaultIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      method == PaymentMethod.card ? Icons.credit_card_sharp : defaultIcon,
      color: Colors.black,
      size: 20,
    );
  }
}
