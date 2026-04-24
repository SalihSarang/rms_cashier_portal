import 'package:cashier_portal/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TenderedAmountInput extends StatelessWidget {
  const TenderedAmountInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amount Tendered',
          style: TextStyle(
            color: TextColors.muted,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: NeutralColors.darkSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: NeutralColors.divider),
          ),
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            onChanged: (value) {
              final amount = double.tryParse(value) ?? 0.0;
              context.read<BillingBloc>().add(UpdateAmountTendered(amount));
            },
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              prefixText: '\$ ',
              prefixStyle: TextStyle(
                color: TextColors.muted,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              hintText: '0.00',
              hintStyle: TextStyle(
                color: TextColors.muted,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
