import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_header/order_action_buttons.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_header/order_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/billing_bloc.dart';
import '../../bloc/billing_state.dart';

/// The top section of the Order Detail area.
///
/// Reactively displays order metadata (Table, Waiter, Time) and
/// utility actions (Print/Void) by listening to the [BillingBloc].
class BillingOrderHeader extends StatelessWidget {
  const BillingOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        // Only render if an order is selected
        if (state is! BillingLoaded || state.selectedOrder == null) {
          return const SizedBox.shrink();
        }

        final order = state.selectedOrder!;

        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Specific Order Metadata
              OrderInfoSection(order: order),

              // Right: Contextual Utility Buttons
              const OrderActionButtons(),
            ],
          ),
        );
      },
    );
  }
}
