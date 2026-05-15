import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/billing_bloc.dart';
import '../bloc/billing_state.dart';
import 'billing_details_view.dart';
import 'screen_states/billing_error_view.dart';
import 'screen_states/billing_loading_view.dart';
import 'screen_states/empty_billing_queue.dart';

/// Contextual orchestrator for the main billing content area.
///
/// It handles state-specific rendering:
/// - Loading/Initial: [BillingLoadingView]
/// - Error: [BillingErrorView]
/// - Success with Selection: [BillingDetailsView]
/// - Success without Selection: [EmptyBillingQueue]
class BillingDetailsArea extends StatelessWidget {
  const BillingDetailsArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        // Handle Initial/Loading States
        if (state is BillingLoading || state is BillingInitial) {
          return const BillingLoadingView();
        }

        // Handle Error State
        if (state is BillingError) {
          return BillingErrorView(message: state.message);
        }

        //Render Content or Empty Placeholder
        final bool hasSelectedOrder =
            state is BillingLoaded && state.selectedOrder != null;

        if (hasSelectedOrder) {
          return const BillingDetailsView();
        }

        return const EmptyBillingQueue();
      },
    );
  }
}
