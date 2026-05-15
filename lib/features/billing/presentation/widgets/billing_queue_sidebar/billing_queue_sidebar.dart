import 'package:cashier_portal/features/billing/presentation/widgets/billing_queue_sidebar/sidebar_header.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_queue_sidebar/sidebar_order_list.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_queue_sidebar/sidebar_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import '../../bloc/billing_bloc.dart';
import '../../bloc/billing_state.dart';

/// The navigation sidebar containing the list of active orders waiting for billing.
///
/// It provides:
/// 1. A search interface to filter tables or order numbers.
/// 2. A scrollable list of [BillingQueueItem]s representing active orders.
/// 3. Selective highlighting for the currently active order in view.
class BillingQueueSidebar extends StatelessWidget {
  const BillingQueueSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        // Return a fixed-width empty container if data hasn't loaded
        if (state is! BillingLoaded) return const SizedBox(width: 320);

        return Container(
          width: 320,
          color: NeutralColors.darkBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sidebar Category Label
              const SidebarHeader(),

              // Interactive Search Bar
              const SidebarSearchField(),

              const SizedBox(height: 16),

              // Scrollable Order List
              Expanded(
                child: SidebarOrderList(
                  orders: state.filteredOrders,
                  selectedOrderId: state.selectedOrderId,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
