import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_items_list/empty_items_placeholder.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_items_list/items_list_container.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_items_list/items_list_divider.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_items_list/items_list_header.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_order_items_list/items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/billing_bloc.dart';
import '../../bloc/billing_state.dart';

/// The central scrollable table of all menu items in a selected order.
///
/// It utilizes a clean orchestrator pattern to manage the List Container,
/// Table Headers, and the dynamic ListView of [ItemRow] components.
class BillingOrderItemsList extends StatelessWidget {
  const BillingOrderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingBloc, BillingState>(
      builder: (context, state) {
        if (state is! BillingLoaded || state.selectedOrder == null) {
          return const SizedBox.shrink();
        }

        final items = state.selectedOrder!.orderedMenu;

        // Handle Empty List Scenario
        if (items.isEmpty) {
          return const Expanded(child: EmptyItemsPlaceholder());
        }

        // Main List Composition
        return ItemsListContainer(
          child: Column(
            children: [
              // Static Table Header (No, Item, Qty, Price)
              const ItemsListHeader(),

              // Subtle separation line
              const ItemsListDivider(),

              // Scrollable area for Cart Items
              ItemsListView(items: items),
            ],
          ),
        );
      },
    );
  }
}
