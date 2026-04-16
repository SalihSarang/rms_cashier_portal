import 'package:flutter/material.dart';
import 'billing_order_header/billing_order_header.dart';
import 'billing_order_items_list/billing_order_items_list.dart';
import 'payment_summary_panel/payment_summary_panel.dart';

/// The central content area displaying specific details of a selected customer order.
///
/// This widget orchestrates three major sections:
/// 1. [BillingOrderHeader]: Order metadata and primary actions (Print/Void).
/// 2. [BillingOrderItemsList]: Scrollable table of ordered items and modifiers.
/// 3. [PaymentSummaryPanel]: Totals, Tax, Bill adjustment, and Payment processing.
class BillingDetailsView extends StatelessWidget {
  const BillingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          // Section 1: Order Metadata & Print/Action Header
          BillingOrderHeader(),

          // Section 2: Line Items Table (Fills remaining space)
          BillingOrderItemsList(),

          // Section 3: Totals & Payment Method Orchestrator
          PaymentSummaryPanel(),
        ],
      ),
    );
  }
}
