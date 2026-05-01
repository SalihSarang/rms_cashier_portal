import 'package:cashier_portal/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'process_payment_label.dart';

class ProcessPaymentButton extends StatelessWidget {
  const ProcessPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final billingBloc = context.read<BillingBloc>();
        RmsAlertDialog.show(
          context,
          title: 'Confirm Payment',
          message: 'Are you sure you want to complete this payment and close the order?',
          type: RmsAlertDialogType.confirm,
          confirmText: 'Confirm',
          accentColor: PrimaryColors.brandGreen,
          backgroundColor: NeutralColors.darkSurface,
          onConfirm: () {
            billingBloc.add(ProcessPaymentEvent());
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: PrimaryColors.brandGreen,
        foregroundColor: NeutralColors.shadow,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const ProcessPaymentLabel(),
    );
  }
}
