import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/core/di/injector.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_event.dart';
import 'package:cashier_portal/features/billing/presentation/bloc/billing_state.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_app_bar_area/billing_app_bar.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_details_view.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_queue_sidebar/billing_queue_sidebar.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/screen_states/billing_error_view.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/screen_states/billing_loading_view.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/screen_states/empty_billing_queue.dart';

/// The main entry point for the Billing Dashboard feature.
///
/// This page acts as a high-level orchestrator that handles:
/// 1. Bloc provision via GetIt injector.
/// 2. Top-level layout structural definition (Scaffold, AppBar).
/// 3. Global screen state routing (Loading, Error, Success).
/// 4. Dashboard Table of Contents (Sidebar, Divider, Content/Empty Placeholder).
class BillingDashboardPage extends StatelessWidget {
  const BillingDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BillingBloc>()..add(LoadBillingQueue()),
      child: Scaffold(
        backgroundColor: NeutralColors.darkBackground,

        // Custom App Bar with desk actions and profile
        appBar: const BillingAppBar(),

        body: BlocBuilder<BillingBloc, BillingState>(
          builder: (context, state) {
            // 1. Handle Initial/Loading States
            if (state is BillingLoading || state is BillingInitial) {
              return const BillingLoadingView();
            }

            // 2. Handle Error State
            if (state is BillingError) {
              return BillingErrorView(message: state.message);
            }

            // 3. Render Main Layout (formerly BillingDashboardView)
            final bool hasSelectedOrder =
                state is BillingLoaded && state.selectedOrder != null;

            return Row(
              children: [
                // 1. Interactive Queue Management Sidebar
                const BillingQueueSidebar(),

                // 2. Vertical Boundary
                const VerticalDivider(width: 1, color: NeutralColors.divider),

                // 3. Contextual Order Details or Empty Queue Placeholder
                Expanded(
                  child: hasSelectedOrder
                      ? const BillingDetailsView()
                      : const EmptyBillingQueue(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
