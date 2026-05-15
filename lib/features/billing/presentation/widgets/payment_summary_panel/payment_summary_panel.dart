import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/tendered_amount_input.dart';
import 'package:rms_shared_package/enums/enums.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/payment_method_selector.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/payment_totals_card.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/payment_summary_panel/process_payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/billing_bloc.dart';
import '../../bloc/billing_state.dart';

/// The bottom utility panel for finalizing a bill and processing payments.
///
/// It splits into two main functional areas:
/// 1. [PaymentMethodSelector]: Allows selecting between Cash, Card, or Online methods.
/// 2. [PaymentTotalsCard] & [ProcessPaymentButton]: Summarizes the financial
///    breakdown and provides the main CTA for closing the order.
class PaymentSummaryPanel extends StatelessWidget {
  const PaymentSummaryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        // Validation check for loaded state
        if (state is! BillingLoaded ||
            state.selectedOrder == null ||
            state.selectedBill == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Payment Strategy Interactive Selector
              Expanded(
                flex: 1,
                child: PaymentMethodSelector(
                  selectedMethod: state.selectedPaymentMethod,
                ),
              ),

              const SizedBox(width: 32),

              // Right: Order Totals Summary & Checkout Execution
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.selectedPaymentMethod == PaymentMethod.cash) ...[
                      const TenderedAmountInput(),
                      const SizedBox(height: 16),
                    ],

                    // Detailed Totals calculation card
                    PaymentTotalsCard(
                      bill: state.selectedBill!,
                      amountTendered: state.amountTendered,
                    ),

                    const SizedBox(height: 16),

                    // Primary Checkout/Finalize Call to Action
                    const ProcessPaymentButton(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
