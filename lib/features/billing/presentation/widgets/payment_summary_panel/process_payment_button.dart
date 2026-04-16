import 'package:cashier_portal/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ProcessPaymentButton extends StatelessWidget {
  const ProcessPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<BillingBloc>().add(ProcessPaymentEvent());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: PrimaryColors.brandGreen,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 20),
          SizedBox(width: 8),
          Text(
            'PROCESS PAYMENT & CLOSE',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
