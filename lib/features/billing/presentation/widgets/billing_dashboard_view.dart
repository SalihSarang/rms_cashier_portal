import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../bloc/billing_bloc.dart';
import '../bloc/billing_state.dart';
import 'billing_details_view.dart';
import 'billing_queue_sidebar/billing_queue_sidebar.dart';
import 'screen_states/empty_billing_queue.dart';

/// The primary layout container for the Billing Dashboard when in a success state.
///
/// It orchestrates the horizontal split between the Sidebar and the Details Area,
/// and manages the conditional logic for showing the Empty state vs Order Details.
class BillingDashboardView extends StatelessWidget {
  const BillingDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        // Determine if an order is currently selected to switch between views
        final bool hasSelectedOrder =
            state is BillingLoaded && state.selectedOrder != null;

        return Row(
          children: [
            // Left Column: Interactive Queue Management Sidebar
            const BillingQueueSidebar(),

            // Vertical Boundary: Separates Navigation/Queue from Content
            const VerticalDivider(width: 1, color: NeutralColors.divider),

            // Right Area: Contextual Order Details or Empty Queue Placeholder
            hasSelectedOrder
                ? const BillingDetailsView()
                : const EmptyBillingQueue(),
          ],
        );
      },
    );
  }
}
