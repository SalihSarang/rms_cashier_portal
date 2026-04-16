import 'package:cashier_portal/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_method_toggle/payment_method_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/enums/enums.dart';

class MethodOption extends StatelessWidget {
  final PaymentMethod method;
  final String label;
  final IconData icon;
  final bool isSelected;

  const MethodOption({
    super.key,
    required this.method,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentMethodToggle(
      method: method,
      label: label,
      iconData: icon,
      isSelected: isSelected,
      onSelected: (method) {
        context.read<BillingBloc>().add(SelectPaymentMethodEvent(method));
      },
    );
  }
}
